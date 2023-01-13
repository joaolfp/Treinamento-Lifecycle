//
//  ViewController.swift
//  Lifecycle
//
//  Created by joao.lucas.f.pereira on 11/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    let otherButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Outra Tela", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemOrange
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(otherTap), for: .touchUpInside)
        return button
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.masksToBounds = true
        return textField
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name: Nothing"
        label.textColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        debugPrint("viewDidLoad - Este método é carregado uma vez no ciclo de vida do controlador de visualização.")
        print("-----------------------")
        
        view.backgroundColor = .white
        
        view.addSubview(nameTextField)
        view.addSubview(otherButton)
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.widthAnchor.constraint(equalToConstant: 200),
            nameTextField.heightAnchor.constraint(equalToConstant: 30),
            
            otherButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 35),
            otherButton.leadingAnchor.constraint(equalTo: nameTextField.trailingAnchor, constant: 20),
            otherButton.widthAnchor.constraint(equalToConstant: 100),
            otherButton.heightAnchor.constraint(equalToConstant: 40),
            
            nameLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        load()
    }
    
    override func loadView() {
        super.loadView()
        print("loadView - Este método é usado quando o controlador de exibição cria a partir do código.")
        print("-----------------------")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("viewWillAppear - Este método é chamado toda vez antes de a exibição ficar visível e antes de qualquer animação ser configurada.")
        print("-----------------------")

        load()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("viewDidAppear - Este método é chamado após a view presente na tela.")
        print("-----------------------")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("viewWillLayoutSubviews -  O controlador de visualização pode substituir esse método para fazer alterações antes que a visualização apresente suas subvisualizações.")
        print("-----------------------")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewDidLayoutSubviews - Este método é chamado depois que o viewController foi ajustado para sua subvisão após uma alteração em seu limite.")
        print("-----------------------")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("viewWillDisappear - Esse método é chamado antes da exibição ser removida da hierarquia de exibição. ")
        print("-----------------------")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("viewDidDisappear - Esse método é chamado após a exibição do VC ter sido removida da hierarquia de exibição.")
        print("-----------------------")
    }
    
    func load() {
        let getName = UserDefaults.standard.string(forKey: "myname")
        let result = getName ?? "vazio"
        nameLabel.text = "Name: \(result)"
        
        nameTextField.text = ""
    }
    
    @objc
    func otherTap() {
        guard let name = nameTextField.text else { return }
        
        UserDefaults.standard.setValue(name, forKey: "myname")
        
        let controller = DeleteViewController()
        
        guard let navigationController = self.navigationController else { return }
        navigationController.pushViewController(controller, animated: true)
    }

}

