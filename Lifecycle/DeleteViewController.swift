//
//  DeleteViewController.swift
//  Lifecycle
//
//  Created by joao.lucas.f.pereira on 11/01/23.
//

import UIKit

class DeleteViewController: UIViewController {
    
    let deleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Deletar nome", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemOrange
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(deleteTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        view.addSubview(deleteButton)
        
        NSLayoutConstraint.activate([
            deleteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            deleteButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            deleteButton.widthAnchor.constraint(equalToConstant: 100),
            deleteButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    @objc
    func deleteTap() {
        UserDefaults.standard.removeObject(forKey: "myname")
        
        guard let navigationController = self.navigationController else { return }
        navigationController.popViewController(animated: true)
    }

}
