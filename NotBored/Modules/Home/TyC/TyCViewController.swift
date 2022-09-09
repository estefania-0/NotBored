//
//  TyCViewController.swift
//  NotBored
//
//  Created by Camila Evelyn Blanc Fick on 09/09/2022.
//

import UIKit

class TyCViewController: UIViewController {

    private lazy var mainView: TyCView = {
        let modalView = TyCView()
        modalView.translatesAutoresizingMaskIntoConstraints = false
        return modalView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }

    // MARK: View Build
    private func setupView(){
        self.view.backgroundColor = .white
        self.view.addSubview(mainView)
        mainView.closeButton.addTarget(self, action: #selector(closePressed), for: .touchDown)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        ])
    }
    
    @objc func closePressed () {
        self.dismiss(animated: true)
    }

}
