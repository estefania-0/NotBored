//
//  TyCView.swift
//  NotBored
//
//  Created by Camila Evelyn Blanc Fick on 09/09/2022.
//

import UIKit

class TyCView: UIView {

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
    
    lazy var closeButton: UIButton = {
        let aButton = UIButton()
        aButton.translatesAutoresizingMaskIntoConstraints = false
        aButton.setImage(UIImage(named: "close"), for: .normal)
        return aButton
    }()
    
    private lazy var titleLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.text = "Terms and Conditions"
        aLabel.textColor = .black
        aLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        aLabel.textAlignment = .center
        aLabel.numberOfLines = 0
        return aLabel
    }()
    
    private lazy var notBoredLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.text = "Not Bored"
        aLabel.textColor = .systemBlue
        aLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        aLabel.textAlignment = .center
        return aLabel
    }()
    
    private lazy var tycLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.numberOfLines = 0
        aLabel.text = """
        Lorem ipsum dolor sit amet consectetur adipiscing elit inceptos
        ridiculus iaculis, nullam ligula elementum duis tellus maecenas nec
        fermentum sed dictum laoreet, taciti donec habitant quam purus
        ultricies porta posuere sociis. Cubilia senectus netus integer tempor
        dignissim viverra nostra tellus scelerisque aliquet, semper penatibus
        tempus sociosqu class sociis bibendum justo etiam, rutrum aenean et
        eget pretium volutpat eu dictum dictumst.

        Dignissim faucibus auctor in vitae porttitor tellus nascetur tempor
        sociosqu, elementum dis ultricies eu tempus tincidunt lectus posuere,
        et ac interdum commodo montes convallis curae facilisis. Vitae diam
        phasellus litora ad aenean himenaeos, magnis malesuada nec metus
        faucibus, turpis mollis hac lacinia lacus. Condimentum dis in sed vel
        molestie integer, gravida eget volutpat interdum bibendum
        scelerisque magnis, penatibus non sollicitudin convallis egestas.
        Aptent mi ligula conubia justo habitant cubilia tellus curabitur, a nisi
        integer non eget vivamus cursus hac, lacus rutrum ridiculus tempor
        litora nostra dis.
        
        Nisl pulvinar taciti tellus diam quam dictum cursus potenti euismod
        natoque feugiat mattis ornare tortor, aliquam orci dapibus inceptos id
        egestas ante viverra donec aptent suscipit nulla. Eget nisl fringilla cras
        felis maecenas nisi ridiculus id conubia hac primis sem ullamcorper
        porttitor, rutrum ac sodales ultrices vestibulum cum leo semper fusce
        porta eu fermentum. Proin nisi suspendisse class facilisi curabitur
        quisque, fusce vulputate semper a nulla velit, duis in orci faucibus
        turpis. Risus metus magnis aliquam accumsan laoreet congue per,
        tempus purus et odio senectus sodales vulputate, ligula malesuada
        dis habitasse nullam pellentesque.
        """
        aLabel.textAlignment = .center
        return aLabel
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(notBoredLabel)
        self.contentView.addSubview(closeButton)
        self.contentView.addSubview(tycLabel)

        self.backgroundColor = .white
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([

            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            
            closeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            closeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            closeButton.widthAnchor.constraint(equalToConstant: 16),
            closeButton.heightAnchor.constraint(equalToConstant: 16),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant:  16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -16),
            
            notBoredLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant:70),
            notBoredLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            notBoredLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant:  16),
            notBoredLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -16),
            
            tycLabel.topAnchor.constraint(equalTo: notBoredLabel.bottomAnchor, constant: 32),
            tycLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant:  16),
            tycLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -16),
            tycLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
            
        ])
    }

}
