//
//  ViewController.swift
//  login Page
//
//  Created by 점승현 on 11/9/24.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    private let userLabel: UILabel = {
        let label = UILabel()
        label.text = "로그인 해주세요"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        return label
    }()

    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디를 입력하세요"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        return textField
    }()
    
    private let passWordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호를 입력하세요"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.hidesBackButton = true
    }

    private func setupView() {
        [userLabel, idTextField, passWordTextField, loginButton].forEach { view.addSubview($0) }
    }
    
    private func setupConstraints() {
        userLabel.snp.makeConstraints {make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(200)
        }
        
        idTextField.snp.makeConstraints {make in
            make.height.equalTo(40)
            make.leading.trailing.equalTo(view).inset(24)
            make.top.equalTo(userLabel.snp.bottom).offset(64)
        }
        
        passWordTextField.snp.makeConstraints {make in
            make.height.equalTo(40)
            make.leading.trailing.equalTo(view).inset(24)
            make.top.equalTo(idTextField.snp.bottom).offset(16)
        }
        
        loginButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.trailing.equalTo(view).inset(24)
            make.top.equalTo(passWordTextField.snp.bottom).offset(24)
        }
        
    }
    
}

