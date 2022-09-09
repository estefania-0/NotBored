//
//  SuggestionViewController.swift
//  NotBored
//
//  Created by Alejandro Bruno Vola on 07/09/2022.
//

import UIKit

protocol SuggestionDelegate{
    func setActivity(_ activity: ActivityDto)
    func setTitle(title: String, hiddenType: Bool)
}

class SuggestionViewController: UIViewController {

    private var viewModel: SuggestionModel?

    private var activity: String? {
        didSet {
            activityLabel.text = activity
        }
    }
    
    private var participants: Int? {
        didSet {
            countParticipantsLabel.text = "\(participants!)"
        }
    }
    
    private var price: String? {
        didSet {
            valuePriceLabel.text = price
        }
    }
    
    private var type: String? {
        didSet {
            typeLabel.text = type
        }
    }
    
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
    
    private lazy var activityLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.text = "Loading..."
        aLabel.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        aLabel.textAlignment = .center
        aLabel.numberOfLines = 0
        return aLabel
    }()
    
    private lazy var participantsLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.text = "Participants"
        aLabel.font = UIFont.systemFont(ofSize: 25)
        aLabel.textAlignment = .left
        return aLabel
    }()
    
    private lazy var countParticipantsLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.text = ".."
        aLabel.font = UIFont.systemFont(ofSize: 25)
        aLabel.textAlignment = .right
        return aLabel
    }()
    
    private lazy var priceLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.text = "Price"
        aLabel.font = UIFont.systemFont(ofSize: 25)
        aLabel.textAlignment = .left
        return aLabel
    }()
    
    private lazy var valuePriceLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.text = ".."
        aLabel.font = UIFont.systemFont(ofSize: 25)
        aLabel.textAlignment = .right
        return aLabel
    }()
    
    private lazy var typeLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.text = "Loading"
        aLabel.font = UIFont.systemFont(ofSize: 25)
        aLabel.textAlignment = .left
        return aLabel
    }()
    
    private lazy var tryAnotherButton: UIButton = {
        let aButton = UIButton()
        aButton.translatesAutoresizingMaskIntoConstraints = false
        aButton.backgroundColor = UIColor .blue
        aButton.layer.cornerRadius = 12
        aButton.setTitle("Try another", for: .normal)
        return aButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        
        let service = SuggestionService.shared
        
        self.viewModel = SuggestionModel(service: service, delegate: self)
        self.viewModel?.setNewActivity()
        
        //Acctions
        tryAnotherButton.addTarget(self, action: #selector(buttonPressed), for: .touchDown)
    }
    

    private func setupView(){
        // Agregar vistas a la vista principal del view controller
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(activityLabel)
        
        contentView.addSubview(participantsLabel)
        contentView.addSubview(countParticipantsLabel)
        
        contentView.addSubview(priceLabel)
        contentView.addSubview(valuePriceLabel)
        
        contentView.addSubview(typeLabel)
        
        contentView.addSubview(tryAnotherButton)

        self.view.backgroundColor = UIColor(red: 218/255, green: 244/255, blue: 254/255, alpha: 1.00)

    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            // ScrollView
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            //ContentView
            contentView.heightAnchor.constraint(equalToConstant: 600),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            
            // Title
            activityLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:70),
            activityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  16),
            activityLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -16),
            
            //participantsLabel
            participantsLabel.topAnchor.constraint(equalTo: activityLabel.bottomAnchor, constant: 40),
            participantsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 30),
            
            //countParticipantsLabel
            countParticipantsLabel.topAnchor.constraint(equalTo: participantsLabel.topAnchor),
            countParticipantsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -30),
            
            //priceLabel
            priceLabel.topAnchor.constraint(equalTo: participantsLabel.bottomAnchor,constant: 16),
            priceLabel.leadingAnchor.constraint(equalTo: participantsLabel.leadingAnchor),
            
            //priceLabel
            valuePriceLabel.topAnchor.constraint(equalTo: priceLabel.topAnchor),
            valuePriceLabel.trailingAnchor.constraint(equalTo: countParticipantsLabel.trailingAnchor),

            //categoryLabel
            typeLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor,constant: 16),
            typeLabel.leadingAnchor.constraint(equalTo: participantsLabel.leadingAnchor),
            
            //butoon
            tryAnotherButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            tryAnotherButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            tryAnotherButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            tryAnotherButton.heightAnchor.constraint(equalToConstant: 48),
            
            
        ])
    }
    
    @objc func buttonPressed () {
        self.viewModel?.setNewActivity()
    }

}

extension SuggestionViewController : SuggestionDelegate{
    func setActivity(_ activity: ActivityDto) {
        self.activity = activity.activity
        self.price = activity.price.toString()
        self.participants = activity.participants
        self.type = activity.type
    }
    
    func setTitle(title: String, hiddenType: Bool) {
        navigationItem.title = title
        self.typeLabel.isHidden = !hiddenType
    }
}
