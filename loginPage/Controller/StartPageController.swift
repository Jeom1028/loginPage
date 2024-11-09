//
//  StartPage.swift
//  loginPage
//
//  Created by 점승현 on 11/9/24.
//

import UIKit

class StartPageController: UIViewController {
    
    private var startPageView: StartPageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startPageView = StartPageView(frame: view.bounds)
        view = startPageView
        
        setupActions()
    }
    
    private func setupActions() {
        startPageView.startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
    
    @objc private func startButtonTapped() {
        let alert = UIAlertController(title: "회원이신가요?", message: nil, preferredStyle: .alert)
        
        let memberAction = UIAlertAction(title: "회원", style: .default) { _ in
            let loginVC = LoginViewController()
            if let window = UIApplication.shared.windows.first {
                window.rootViewController = loginVC
                window.makeKeyAndVisible()
                print("회원 선택됨")
            }

        }
        
        let nonMemberAction = UIAlertAction(title: "비회원", style: .default) { _ in
            let signVC = SignViewController()
            if let window = UIApplication.shared.windows.first {
                window.rootViewController = signVC
                window.makeKeyAndVisible()
                print("비회원 선택됨")
            }
        }
        
        alert.addAction(memberAction)
        alert.addAction(nonMemberAction)
        
        present(alert, animated: true, completion: nil)
    }
}
