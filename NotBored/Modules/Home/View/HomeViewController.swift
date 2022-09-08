//
//  HomeViewController.swift
//  NotBored
//
//  Created by Maria Estefania Sassone on 05/09/2022.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private lazy var titleLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.text = "Not Bored"
        aLabel.textColor = .systemBlue
        aLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        aLabel.textAlignment = .center
        return aLabel
    }()
    
    private lazy var participantsLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.text = "Participants"
        aLabel.textColor = .black
        aLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return aLabel
    }()
    
    private lazy var participantsTextField: UITextField = {
        let aTextField = UITextField()
        aTextField.translatesAutoresizingMaskIntoConstraints = false
        aTextField.font = UIFont.systemFont(ofSize: 15)
        aTextField.borderStyle = UITextField.BorderStyle.roundedRect
        return aTextField
    }()
    
    private lazy var startButton: UIButton = {
        let aButton = UIButton()
        aButton.translatesAutoresizingMaskIntoConstraints = false
        aButton.backgroundColor = UIColor .blue
        aButton.layer.cornerRadius = 12
        aButton.setTitle("Empezar", for: .normal)
        return aButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        
    }
    
    // MARK: View Build
    private func setupView(){
        
        // Agregar vistas a la vista principal del view controller
        self.view.addSubview(titleLabel)
        self.view.addSubview(participantsLabel)
        self.view.addSubview(participantsTextField)
        self.view.addSubview(startButton)
        
        // Estilos
        self.view.backgroundColor = UIColor(red: 218/255, green: 244/255, blue: 254/255, alpha: 1.00)
        
        //Funcion boton
        startButton.addTarget(self, action: #selector(buttonPressed), for: .touchDown)
        
    }
    
    @objc func buttonPressed () {
        
        let service = SuggestionService.shared
        service.setParticipants(participants: 1)
        
        let sc = ActivitiesViewController()
        self.navigationController?.pushViewController(sc, animated: true)
        self.navigationItem.backButtonTitle = ""
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Arial Bold", size: 30)!]
       
        //self.navigationController?.navigationBar.barTintColor = UIColor (red: 77/255, green: 152/255, blue: 247/255, alpha: 1.0)

    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            // Constraints de label principal
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:70),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -16),
            
            participantsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 60),
            participantsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  16),
            participantsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -16),
            
            participantsTextField.topAnchor.constraint(equalTo: participantsLabel.bottomAnchor, constant: 8),
            participantsTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  16),
            participantsTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -16),
            participantsTextField.heightAnchor.constraint(equalToConstant: 40),
            
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -26),
            startButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    
}
