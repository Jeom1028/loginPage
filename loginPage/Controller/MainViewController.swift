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
    var loggedInUserID: String? // ID of the logged-in user
    
    // Initialize with userID
    init(loggedInUserID: String?) {
        self.loggedInUserID = loggedInUserID
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fetch user by ID to get name
        if let userID = loggedInUserID {
            let user = CoreDataManager.shared.fetchUser(byID: userID)
            let userName = user?.name ?? "사용자"
            mainView = MainView(frame: view.bounds, userName: userName)
        } else {
            mainView = MainView(frame: view.bounds, userName: "사용자")
        }
        
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
            self.navigateToLoginViewController()
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
        guard let userID = loggedInUserID else { return }
        CoreDataManager.shared.deleteUser(withID: userID)
        navigateToStartPageController()
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
