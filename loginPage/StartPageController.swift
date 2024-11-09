//
//  StartPage.swift
//  loginPage
//
//  Created by 점승현 on 11/9/24.
//

import UIKit
import SnapKit

class StartPageController: UIViewController {
    
    private let startButton: UIButton = {
        let button = UIButton()
        button.setTitle("시작하기", for: .normal)
        button.backgroundColor = .red
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
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
    
    private func setupView() {
        view.addSubview(startButton)
    }
    
    private func setupConstraints() {
        startButton.snp.makeConstraints { make in
            make.width.equalTo(160)
            make.height.equalTo(80)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    private func setupActions() {
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
    
    @objc private func startButtonTapped() {
        let alert = UIAlertController(title: "회원이신가요?", message: nil, preferredStyle: .alert)
        
        let memberAction = UIAlertAction(title: "회원", style: .default) { _ in
            let loginVC = LoginViewController()
            self.navigationController?.pushViewController(loginVC, animated: true)
            print("회원 선택됨")
        }
        
        let nonMemberAction = UIAlertAction(title: "비회원", style: .default) { _ in
            let signVC = SignViewController()
            self.navigationController?.pushViewController(signVC, animated: true)
            print("비회원 선택됨")
        }
        
        alert.addAction(memberAction)
        alert.addAction(nonMemberAction)
        
        present(alert, animated: true, completion: nil)
    }
}
