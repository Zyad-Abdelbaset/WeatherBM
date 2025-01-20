//
//  ForecastCell.swift
//  weatherBM
//
//  Created by zyad baset on 10/01/2025.
//

import UIKit
import Combine
class ForecastCell: UITableViewCell {

    var viewModel: ForecastdayProtocol!
    var subscription = Set<AnyCancellable>()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var lblImageView: UIImageView!
    @IBOutlet weak var lblDay: UILabel!
    
    //Functions
    func putData() {
        backgroundView = UIView()
        backgroundView?.backgroundColor = .systemBackground
        lblDay.text = viewModel.forecastDay.date
        lblTemp.text = "H: \(viewModel.forecastDay.day.maxTempratureInC) / L: \(viewModel.forecastDay.day.minTempratureInC)"
        lblImageView.fetchImage(link: viewModel.forecastDay.day.condition.icon, cancel: &subscription)

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
