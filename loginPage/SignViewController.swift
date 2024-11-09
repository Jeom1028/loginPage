//
//  SignViewController.swift
//  loginPage
//
//  Created by 점승현 on 11/9/24.
//

import UIKit
import SnapKit

class SignViewController: UIViewController {
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이메일을 입력하세요"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        return textField
    }()
    
    private let namelLabel: UILabel = {
        let label = UILabel()
        label.text = "이름"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름을 입력하세요"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        return textField
    }()
    
    private let idLabel: UILabel = {
        let label = UILabel()
        label.text = "아이디"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디를 입력하세요"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        return textField
    }()
    
    private let passWordLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let passWordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호를 입력하세요"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        return textField
    }()
    
    private let signButton: UIButton = {
        let button = UIButton()
        button.setTitle("회원가입", for: .normal)
        button.backgroundColor = .red
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupView()
        setupConstraints()
        setupActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.hidesBackButton = true
    }
    
    private func setupView() {
        [emailLabel, emailTextField, idLabel, idTextField, namelLabel, nameTextField, passWordLabel, passWordTextField, signButton].forEach { view.addSubview($0) }
    }
    
    private func setupConstraints() {
        emailLabel.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalToSuperview().offset(80)
        }
        emailTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(emailLabel.snp.bottom).offset(8)
        }
        
        idLabel.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(emailTextField.snp.bottom).offset(16)
        }
        idTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(idLabel.snp.bottom).offset(8)
        }
        
        namelLabel.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(idTextField.snp.bottom).offset(16)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(namelLabel.snp.bottom).offset(8)
        }
        
        passWordLabel.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(nameTextField.snp.bottom).offset(16)
        }
        
        passWordTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(passWordLabel.snp.bottom).offset(8)
        }
        
        signButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(passWordTextField.snp.bottom).offset(60)
        }
    }
    
    private func setupActions() {
        signButton.addTarget(self, action: #selector(signButtonTapped), for: .touchUpInside)
    }
    
    @objc private func signButtonTapped() {
        guard let email = emailTextField.text, !email.isEmpty,
              let id = idTextField.text, !id.isEmpty,
              let name = nameTextField.text, !name.isEmpty,
              let password = passWordTextField.text, !password.isEmpty else {
            showAlert(message: "모든 필드를 입력하세요.")
            return
        }
        
        // Save user using CoreDataManager
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
        navigationController?.pushViewController(loginViewController, animated: true)
    }
}
