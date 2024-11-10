//
//  SignViewController.swift
//  loginPage
//
//  Created by 점승현 on 11/9/24.
//

import UIKit

class SignViewController: UIViewController {
    
    private var signUpView: SignUpView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpView = SignUpView(frame: view.bounds)
        view = signUpView
        
        setupActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.hidesBackButton = true
    }
    
    private func setupActions() {
        signUpView.signButton.addTarget(self, action: #selector(signButtonTapped), for: .touchUpInside)
    }
    
    @objc private func signButtonTapped() {
        guard let email = signUpView.emailTextField.text, !email.isEmpty,
              let id = signUpView.idTextField.text, !id.isEmpty,
              let name = signUpView.nameTextField.text, !name.isEmpty,
              let password = signUpView.passWordTextField.text, !password.isEmpty else {
            showAlert(message: "모든 필드를 입력하세요.")
            return
        }
        
        let newUser = CoreDataManager.shared.createUser(id: id, email: email, password: password, name: name)
        
        if newUser != nil {
            showAlert(message: "회원가입이 완료되었습니다") { [weak self] in
                self?.navigateToLoginViewController()
            }
        } else {
            showAlert(message: "회원가입 실패. 다시 시도해 주세요.")
        }
    }
    
    private func showAlert(message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default) { _ in
            completion?()
        })
        present(alert, animated: true, completion: nil)
    }
    
    private func navigateToLoginViewController() {
        let loginViewController = LoginViewController()
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.rootViewController = loginViewController
            window.makeKeyAndVisible()
        }
    }

}
