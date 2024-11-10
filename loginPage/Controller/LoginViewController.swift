//
//  LoginViewController.swift
//  loginPage
//
//  Created by 점승현 on 11/9/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var loginView: LoginView!
    private var failedLoginAttempts = 0 // Track failed login attempts
    
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

        // Fetch the user with the given ID
        if let user = CoreDataManager.shared.fetchUser(byID: id), user.password == password {
            failedLoginAttempts = 0
            navigateToHomeViewController(withUserID: user.id ?? "")
        } else {
            failedLoginAttempts += 1
            if failedLoginAttempts >= 3 {
                showFailedLoginAlert()
            } else {
                showAlert(message: "아이디 또는 비밀번호가 잘못되었습니다.")
            }
        }
    }
    

    private func showAlert(message: String) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func showFailedLoginAlert() {
        let alert = UIAlertController(title: "로그인 실패", message: "아이디 또는 비밀번호가 잘못되었습니다. 3회 로그인 실패시 회원이 아니십니까?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "예", style: .default, handler: { _ in
            self.navigateToSignUpViewController()
        }))
        
        alert.addAction(UIAlertAction(title: "아니오", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    private func navigateToSignUpViewController() {
         let signUpVC = SignViewController()
         if let window = UIApplication.shared.windows.first {
             window.rootViewController = signUpVC
             window.makeKeyAndVisible()
         }
     }
    
    private func navigateToHomeViewController(withUserID userID: String) {
        let homeViewController = MainViewController(loggedInUserID: userID)
        
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = homeViewController
            window.makeKeyAndVisible()
        }
    }
}
