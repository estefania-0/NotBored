//
//  ActivitiesTableViewController.swift
//  NotBored
//
//  Created by Maria Estefania Sassone on 06/09/2022.
//
import Foundation
import UIKit

let activitiesList = [
    Activities(title: "Education", imageName: "chevron.right"),
    Activities(title: "Recreational", imageName: "chevron.right"),
    Activities(title: "Social", imageName: "chevron.right"),
    Activities(title: "Diy", imageName: "chevron.right"),
    Activities(title: "Charity", imageName: "chevron.right"),
    Activities(title: "Cooking", imageName: "chevron.right"),
    Activities(title: "Relaxation", imageName: "chevron.right"),
    Activities(title: "Music", imageName: "chevron.right"),
    Activities(title: "Busywork", imageName: "chevron.right")
]

class ActivitiesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Nav Bar
    override func viewWillLayoutSubviews() {
        self.navigationItem.title = "Activities"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 20/255, green: 156/255, blue: 248/255, alpha: 1.00) //Agregar
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 20/255, green: 156/255, blue: 248/255, alpha: 1.00) //agregar
        self.navigationItem.rightBarButtonItem = UIBarButtonItem( image: UIImage(systemName: "shuffle"), style: .done, target: self, action: #selector(onRightButtonBeenTaped))
        self.navigationItem.backButtonTitle = ""
    }
    
    @objc private func onRightButtonBeenTaped(){
        let service = SuggestionService.shared
        service.setCategory(category: nil)
        let sc = SuggestionViewController()
        self.navigationController?.pushViewController(sc, animated: true)
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
                                        
    
    // MARK: Metodos TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        activitiesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivitiesTableViewCell", for: indexPath) as! ActivitiesTableViewCell
        
        let model = activitiesList[indexPath.row]
        cell.configure(model: model)
        
        return cell
    }
    
    // MARK: Metodo Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = activitiesList[indexPath.row]
        print("CELL: \(model.title)")
        
        let service = SuggestionService.shared
        service.setCategory(category: "\(model.title)")
        let sc = SuggestionViewController()
        self.navigationController?.pushViewController(sc, animated: true)
    }
}
