//
//  SignView.swift
//  loginPage
//
//  Created by 점승현 on 11/9/24.
//

import UIKit
import SnapKit

class SignUpView: UIView {
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이메일을 입력하세요"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        return textField
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름을 입력하세요"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        return textField
    }()
    
    let idLabel: UILabel = {
        let label = UILabel()
        label.text = "아이디"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디를 입력하세요"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        return textField
    }()
    
    let passWordLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let passWordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호를 입력하세요"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        return textField
    }()
    
    let signButton: UIButton = {
        let button = UIButton()
        button.setTitle("회원가입", for: .normal)
        button.backgroundColor = .red
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.layer.cornerRadius = 10
        return button
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
        [emailLabel, emailTextField, idLabel, idTextField, nameLabel, nameTextField, passWordLabel, passWordTextField, signButton].forEach { addSubview($0) }
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
        
        nameLabel.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(idTextField.snp.bottom).offset(16)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
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
}

