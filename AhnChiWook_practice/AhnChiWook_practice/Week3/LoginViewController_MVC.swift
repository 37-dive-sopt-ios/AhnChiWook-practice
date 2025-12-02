//
//  LoginViewController.swift
//  AhnChiWook_practice
//
//  Created by 안치욱 on 11/1/25.
//


import UIKit

import SnapKit

final class LoginViewController_MVC: UIViewController {
    
    private let rootView = LoginView()
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    @objc
    private func updateLoginButtonState() {
        let isIdValid = (rootView.idTextField.text?.isEmpty == false)
        let isPasswordValid = (rootView.passwordTextField.text?.isEmpty == false)
        let canLogin = isIdValid && isPasswordValid
        
        rootView.loginButton.isEnabled = canLogin
        
        rootView.loginButton.backgroundColor = canLogin ? .dangGeun : .gray200
    }
    
    @objc
    private func darkThemeButtonDidTap() {
        rootView.darkThemeButton.isSelected.toggle()
        let isDarkMode = rootView.darkThemeButton.isSelected
        
        rootView.backgroundColor = isDarkMode ? .black : .white
        rootView.titleLabel.textColor = isDarkMode ? .white : .black

        rootView.darkThemeButton.setTitle(isDarkMode ? "라이트 모드" : "다크 모드", for: .normal)
        rootView.darkThemeButton.backgroundColor = isDarkMode ? .white : .black
        rootView.darkThemeButton.setTitleColor(isDarkMode ? .black : .white, for: .normal)
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.endEditing(true)
//    }
    
    
}


#Preview { LoginViewController_MVC() }
