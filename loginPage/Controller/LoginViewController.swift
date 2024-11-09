//
//  ViewController.swift
//  login Page
//
//  Created by 점승현 on 11/9/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var loginView: LoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView = LoginView(frame: view.bounds)
        view = loginView
        
        setupActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.hidesBackButton = true
    }
    
    private func setupActions() {
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc private func loginButtonTapped() {
        guard let id = loginView.idTextField.text, !id.isEmpty,
              let password = loginView.passWordTextField.text, !password.isEmpty else {
            showAlert(message: "아이디와 비밀번호를 입력하세요.")
            return
        }

        let users = CoreDataManager.shared.fetchUsers()
        
        if let user = users.first(where: { $0.id == id && $0.password == password }) {
            if let mainVC = navigationController?.viewControllers.first(where: { $0 is MainViewController }) as? MainViewController {
                mainVC.setLoggedInUserName(user.name ?? "사용자") // Set the logged-in user's name
            }
            
            navigateToHomeViewController()
        } else {
            showAlert(message: "아이디 또는 비밀번호가 잘못되었습니다.")
        }
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func navigateToHomeViewController() {
        let homeViewController = MainViewController()
        
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = MainViewController()
            window.makeKeyAndVisible()
        }
    }
}
