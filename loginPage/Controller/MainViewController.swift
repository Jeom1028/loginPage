//
//  MainViewController.swift
//  loginPage
//
//  Created by 점승현 on 11/9/24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private var mainView: MainView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView = MainView(frame: view.bounds)
        view = mainView
        
        setupActions()
    }
    
    private func setupActions() {
        mainView.logOutButton.addTarget(self, action: #selector(logOutButtonTapped), for: .touchUpInside)
        mainView.userDeleteButton.addTarget(self, action: #selector(userDeleteButtonTapped), for: .touchUpInside)
    }
    
    @objc private func logOutButtonTapped() {
        let alert = UIAlertController(title: "로그아웃", message: "로그아웃하시겠습니까?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "예", style: .default, handler: { _ in
        }))
        
        alert.addAction(UIAlertAction(title: "아니오", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func userDeleteButtonTapped() {
        let alert = UIAlertController(title: "회원탈퇴", message: "정말로 회원탈퇴하시겠습니까?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "예", style: .destructive, handler: { _ in
            self.deleteUserAndNavigateToStartPage()
        }))
        
        alert.addAction(UIAlertAction(title: "아니오", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    private func deleteUserAndNavigateToStartPage() {
        let users = CoreDataManager.shared.fetchUsers()
        
        if let currentUser = users.first {
            CoreDataManager.shared.deleteUser(user: currentUser)
            
            navigateToStartPageController()
        }
    }
    
    private func navigateToStartPageController() {
        let startPageVC = StartPageController()
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = startPageVC
            window.makeKeyAndVisible()
        }
    }
    
    private func navigateToLoginViewController() {
        let loginVC = LoginViewController()
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = loginVC
            window.makeKeyAndVisible()
        }
    }
}
