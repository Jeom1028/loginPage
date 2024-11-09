//
//  MainView.swift
//  loginPage
//
//  Created by 점승현 on 11/9/24.
//

import UIKit
import SnapKit

class StartPageView: UIView {
    
    let startButton: UIButton = {
        let button = UIButton()
        button.setTitle("시작하기", for: .normal)
        button.backgroundColor = .red
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
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
        addSubview(startButton)
    }
    
    private func setupConstraints() {
        startButton.snp.makeConstraints { make in
            make.width.equalTo(160)
            make.height.equalTo(80)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}

