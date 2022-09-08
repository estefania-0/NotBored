//
//  ActivitiesTableViewController.swift
//  NotBored
//
//  Created by Maria Estefania Sassone on 06/09/2022.
//
import Foundation
import UIKit

struct Device {
    let title: String
    let imageName: String
}

let house = [
    Device(title: "Education", imageName: "chevron.right"),
    Device(title: "Recreational", imageName: "chevron.right"),
    Device(title: "Social", imageName: "chevron.right"),
    Device(title: "Diy", imageName: "chevron.right"),
    Device(title: "Charity", imageName: "chevron.right"),
    Device(title: "Cooking", imageName: "chevron.right"),
    Device(title: "Relaxation", imageName: "chevron.right"),
    Device(title: "Music", imageName: "chevron.right"),
    Device(title: "Busywork", imageName: "chevron.right")
]

class ActivitiesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Nav Bar
    
    override func viewWillLayoutSubviews() {
         
        self.navigationItem.title =  "Activities"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Random", style: .done, target: self, action: #selector(onRightButtonBeenTaped))
    }
    

    private let devicesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        devicesTableView.backgroundColor = UIColor(red: 218/255, green: 244/255, blue: 254/255, alpha: 1.00)
       
        devicesTableView.separatorColor = UIColor.black
        devicesTableView.dataSource = self
        devicesTableView.delegate = self
        devicesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "ActivitiesCell")
        devicesTableView.register(ActivitiesTableViewCell.self, forCellReuseIdentifier: "ActivitiesTableViewCell")
        view.addSubview(devicesTableView)
        
        //Constraints
        NSLayoutConstraint.activate([
            devicesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            devicesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            devicesTableView.topAnchor.constraint(equalTo: view.topAnchor),

            devicesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
                                        
                        
    @objc func selectorX() {}
    
    @objc private func onRightButtonBeenTaped(){
        print("Been tapped!")
    }
    
    // MARK: Metodos TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        house.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivitiesTableViewCell", for: indexPath) as! ActivitiesTableViewCell
        
        let model = house[indexPath.row]
        cell.configure(model: model)
        
        return cell
    }
    
    // MARK: Metodo Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = house[indexPath.row]
        print("CELL: \(model.title)")
    }
}
