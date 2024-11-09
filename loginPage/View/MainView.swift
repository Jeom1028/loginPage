//
//  MainView.swift
//  loginPage
//
//  Created by 점승현 on 11/9/24.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = .white
        return label
    }()
    
    let logOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그아웃", for: .normal)
        button.backgroundColor = .lightGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let userDeleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("회원탈퇴", for: .normal)
        button.backgroundColor = .red
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.layer.cornerRadius = 10
        return button
    }()
    
    init(frame: CGRect, userName: String) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
        mainLabel.text = "\(userName)님 환영합니다"  // Set the user's name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        [mainLabel, logOutButton, userDeleteButton].forEach { self.addSubview($0)}
    }
    
    private func setupConstraints() {
        
        mainLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(200)
        }
        
        logOutButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(mainLabel.snp.bottom).offset(160)
        }
        
        userDeleteButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(logOutButton.snp.bottom).offset(16)
        }
    }
}
