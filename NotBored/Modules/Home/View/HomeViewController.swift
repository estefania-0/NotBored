//
//  HomeViewController.swift
//  NotBored
//
//  Created by Maria Estefania Sassone on 05/09/2022.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let aScrollView = UIScrollView()
        aScrollView.translatesAutoresizingMaskIntoConstraints = false
        return aScrollView
    }()
    
    private lazy var contentView: UIView = {
        let aView = UIView()
        aView.translatesAutoresizingMaskIntoConstraints = false
        return aView
    }()
    
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
        aTextField.placeholder = "How many participants?"
        aTextField.keyboardType = .numberPad
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
    
    private lazy var tycButton: UIButton = {
        let aButton = UIButton()
        aButton.translatesAutoresizingMaskIntoConstraints = false
        aButton.setTitle("Terms and Conditions", for: .normal)
        aButton.setTitleColor(UIColor .black, for: .normal)

        let attributedString = NSAttributedString(string: NSLocalizedString("Terms and Conditions", comment: ""), attributes:[
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20.0),
            NSAttributedString.Key.foregroundColor : UIColor.black,
            NSAttributedString.Key.underlineStyle:1.0
        ])
        aButton.setAttributedTitle(attributedString, for: .normal)
        
        return aButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        
    }
    
    // MARK: View Build
    private func setupView(){
        
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(participantsLabel)
        self.contentView.addSubview(participantsTextField)
        self.contentView.addSubview(startButton)
        self.contentView.addSubview(tycButton)
        
        self.view.backgroundColor = UIColor(red: 218/255, green: 244/255, blue: 254/255, alpha: 1.00)
        
        startButton.addTarget(self, action: #selector(buttonPressed), for: .touchDown)

        tycButton.addTarget(self, action: #selector(tycPressed), for: .touchDown)
        
    }
    
    @objc func buttonPressed () {
        
        let service = SuggestionService.shared
        guard let number = Int(participantsTextField.text!) else { return }
        service.setParticipants(participants: number)
        
        let sc = ActivitiesViewController()
        self.navigationController?.pushViewController(sc, animated: true)
        self.navigationItem.backButtonTitle = ""
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Arial Bold", size: 30)!]

    }
    
    @objc func tycPressed () {
        let tycc = TyCViewController()
        tycc.modalPresentationStyle = .fullScreen
        self.present(tycc, animated: true)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            contentView.heightAnchor.constraint(equalToConstant: 600),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),

            titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant:70),
            titleLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant:  16),
            titleLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant:  -16),

            participantsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 60),
            participantsLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant:  16),
            participantsLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant:  -16),

            participantsTextField.topAnchor.constraint(equalTo: participantsLabel.bottomAnchor, constant: 8),
            participantsTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant:  16),
            participantsTextField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant:  -16),
            participantsTextField.heightAnchor.constraint(equalToConstant: 40),

            startButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 16),
            startButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            startButton.topAnchor.constraint(equalTo: participantsTextField.bottomAnchor, constant: 26),
            startButton.heightAnchor.constraint(equalToConstant: 48),
            
            tycButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 16),
            tycButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            tycButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 36),
            tycButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
}
