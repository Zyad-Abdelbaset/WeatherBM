//
//  HomeViewController.swift
//  weatherBM
//
//  Created by zyad Baset on 08/01/2025.
//

import UIKit
import Combine
//MARK: View Combonent
class HomeViewController: UIViewController, UITableViewDelegate {
    var weatherViewModel:HomeViewModelProtocol!
    private var subscriptions: Set<AnyCancellable>!
    private var weatherView:WeatherView!
    //MARK: ViewDidLoad

    init(weatherViewModel: HomeViewModelProtocol, subscriptions: Set<AnyCancellable> = Set<AnyCancellable>(), weatherView: WeatherView = WeatherView()) {
        self.weatherViewModel = weatherViewModel
        self.subscriptions = subscriptions
        self.weatherView = weatherView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherView.tableView.dataSource = self
        weatherViewModel.showError = { val in
            self.presentAlert(message: val)
        }
        bindData()
        weatherViewModel.loadDate()
        
    }
    override func loadView() {
        super.loadView()
        weatherView.putData()
        self.view.addSubview(weatherView)
        weatherView.translatesAutoresizingMaskIntoConstraints = false
        weatherView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        weatherView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        weatherView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        weatherView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
//MARK: TVDataSourse
extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherViewModel.foreCastItems.count
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastCell") as! ForecastCell
        cell.viewModel = ForecastCellViewModel(forecastDay: weatherViewModel.foreCastItems[indexPath.row])
        cell.putData()
        return cell
    }
}



//MARK: Bind Data
extension HomeViewController{
    private func bindData(){
        weatherViewModel.weatherPublisher.receive(on: DispatchQueue.main).sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                print("Finished")
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }, receiveValue: {data in
            self.weatherView.backgroundView.image = UIImage(named: data.current.isDay == 1 ? "day" : "day")
            
            self.weatherView.infoStackView.addArrangedSubview(self.weatherView.makeLabel(text: data.location.country ?? "", fontSize: 20) )
            
            self.weatherView.infoStackView.addArrangedSubview(self.weatherView.makeLabel(text: data.location.localtime ?? "", fontSize: 20))
            
            self.weatherView.infoStackView.addArrangedSubview(self.weatherView.makeLabel(text: "\(data.current.tempratureInC)", fontSize: 20))
            
            self.weatherView.infoStackView.addArrangedSubview(self.weatherView.makeLabel(text: data.current.condition.text, fontSize: 20))
            
            self.weatherView.infoHStackView.addArrangedSubview(self.weatherView.makeLabel(text: "H:\(data.forecastDayItems.first?.day.maxTempratureInC ?? 0)", fontSize: 20))
            
            self.weatherView.infoHStackView.addArrangedSubview(self.weatherView.makeLabel(text: "L:\(data.forecastDayItems.first?.day.minTempratureInC ?? 0)", fontSize: 20))
            
            self.weatherView.infoStackView.addArrangedSubview(self.weatherView.infoHStackView)
            
            self.weatherView.details1Stack.addArrangedSubview(self.weatherView.detailsFrame(des: "VISIBILITY", val: "\(data.current.visKM)", measure: "KM"))
            
            self.weatherView.details1Stack.addArrangedSubview(self.weatherView.detailsFrame(des: "FEELS LIKE", val: "\(data.current.feelslikeC)", measure: "°"))
            
            self.weatherView.details2Stack.addArrangedSubview(self.weatherView.detailsFrame(des: "HUMIDITY", val: "\(data.current.humidity)", measure: "%"))
            
            self.weatherView.details2Stack.addArrangedSubview(self.weatherView.detailsFrame(des: "PRESSURE", val: "\(data.current.pressureMB)", measure: "mb"))
            
            self.weatherView.tableView.reloadData()
            
        }).store(in: &subscriptions)
    }
}

#Preview{
    HomeViewController(weatherViewModel: HomeViewModel())
    
}

//data.forecast.forecastday.first?.day.maxTempratureInC
