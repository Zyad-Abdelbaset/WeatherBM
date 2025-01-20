//
//  WeatherView.swift
//  weatherBM
//
//  Created by zyad baset on 13/01/2025.
//

import Foundation
import UIKit
class WeatherView:UIView{
    var backgroundView:UIImageView = {
        var imgView = UIImageView()
        imgView.image = UIImage(named:"day")
        imgView.contentMode = .scaleAspectFill
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    //StackView
    var infoStackView:UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    //Horizontal StackView
     var infoHStackView:UIStackView = {
        var stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //TableView
    lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = .white
        tableView.rowHeight = 70
        tableView.layer.cornerRadius = 20
        tableView.heightAnchor.constraint(equalToConstant: 70*3+10).isActive = true
        let nib = UINib(nibName: "ForecastCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ForecastCell")
        return tableView
    }()
    
    lazy var details1Stack:UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return stack
    }()
    
    lazy var details2Stack:UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return stack
    }()
    //MARK: Helper Function
    //LBLFunction
    func makeLabel(text:String,fontSize:Int)->UILabel{
        let lbl = UILabel()
        lbl.text = text
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: CGFloat(fontSize))
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }
    // RectangleView
    func detailsFrame(des:String,val:String,measure:String)->UIView{
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 20
        view.widthAnchor.constraint(equalToConstant: 150).isActive = true
        view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        let lbl1 = UILabel()
        lbl1.translatesAutoresizingMaskIntoConstraints = false
        lbl1.text = des
        lbl1.font = .systemFont(ofSize: 25)
        lbl1.textColor = .black
        view.addSubview(lbl1)
        lbl1.topAnchor.constraint(equalTo: view.topAnchor,constant: 7).isActive = true
        lbl1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        let lbl2 = UILabel()
        lbl2.text = "\(val) \(measure)"
        lbl2.font = .systemFont(ofSize: 25,weight: .bold)
        lbl2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lbl2)
        lbl2.topAnchor.constraint(equalTo: lbl1.bottomAnchor,constant: 10).isActive = true
        lbl2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        return view
    }
    func putData(){
        putConstrains()
    }
    
}
//MARK: Combonent Constrains
extension WeatherView{
    private func putConstrains(){
        //Constrains for Background
        self.addSubview(backgroundView)
        configureBackground()
        
        //Constrains for infoStackView
        self.addSubview(infoStackView)
        configureInfoStack()
        // Constrains for TV
        self.addSubview(tableView)
        configureTableView()
        
        self.addSubview(details1Stack)
        configureDetails1Stack()
        
        self.addSubview(details2Stack)
        configureDetails2Stack()
    }
    
    
    //Constrains For Background
    func configureBackground(){
        backgroundView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        backgroundView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        backgroundView.widthAnchor.constraint(equalTo:self.widthAnchor).isActive = true
        backgroundView.heightAnchor.constraint(equalTo:self.heightAnchor).isActive = true
    }
    //Constrains For InfoStack
    func configureInfoStack() {
        infoStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        infoStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 60).isActive = true
        infoStackView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive=true
        infoStackView.heightAnchor.constraint(equalToConstant: 170).isActive=true
    }
    //Constrains for TableView
    func configureTableView() {
        tableView.topAnchor.constraint(equalTo: infoStackView.bottomAnchor,constant: 20).isActive = true
        tableView.widthAnchor.constraint(equalTo: self.widthAnchor,constant: -20).isActive=true
        tableView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    //Constrains for detailStackView1
    func configureDetails1Stack(){
        details1Stack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        details1Stack.topAnchor.constraint(equalTo: tableView.bottomAnchor,constant: 50).isActive = true
    }
    
    //constrains for detailsStackView2
    func configureDetails2Stack() {
        details2Stack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        details2Stack.topAnchor.constraint(equalTo: details1Stack.bottomAnchor,constant: 50).isActive = true
    }
}

