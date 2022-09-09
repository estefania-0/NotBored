//
//  ActivitiesTableViewCell.swift
//  NotBored
//
//  Created by Maria Estefania Sassone on 07/09/2022.
//

import UIKit

class ActivitiesTableViewCell: UITableViewCell {
    
    private let deviceImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.tintColor = .black
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
    }()
    
    private let deviceNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        
            contentView.backgroundColor = UIColor(red: 218/255, green: 244/255, blue: 254/255, alpha: 1.00)
            
            addSubview(deviceImageView)
            addSubview(deviceNameLabel)
            
            NSLayoutConstraint.activate([
                deviceNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                deviceNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
                deviceNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
                
                deviceImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
                deviceImageView.centerYAnchor.constraint(equalTo: deviceNameLabel.centerYAnchor)
            ])
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: Activities) {
            deviceImageView.image = UIImage(systemName: model.imageName)
            deviceNameLabel.text = model.title
    }


}
