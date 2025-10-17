//
//  DangGeunLoginViewController.swift
//  AhnChiWook_practice
//
//  Created by 안치욱 on 10/11/25.
//

import UIKit

import Then

class DangGeunLoginViewController: UIViewController {
    
    private let titleLabel = UILabel().then {
        $0.frame = CGRect(x: 80, y: 161, width: 236, height: 44)
        $0.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        $0.textColor = .black
        $0.textAlignment = .center
        $0.numberOfLines = 2
        $0.font = .pretendard(.bold, size: 18)
    }
    
    private lazy var idTextField = UITextField().then {
        $0.frame = CGRect(x: 30, y: 276, width: 335, height: 52)
        $0.placeholder = "아이디를 입력해주세요"
        $0.setPlaceholderColor(.gray300)
        $0.font = .pretendard(.semiBold, size: 14)
        $0.backgroundColor = .gray200
        $0.clearButtonMode = .whileEditing
        $0.addLeftPadding(15)
        $0.autocapitalizationType = .none
        $0.layer.cornerRadius = 3
        $0.addTarget(self, action: #selector(updateLoginButtonState), for: .allEditingEvents)
    }
    
    private lazy var passwordTextField = UITextField().then {
        $0.frame = CGRect(x: 30, y: 335, width: 335, height: 52)
        $0.placeholder = "비밀번호를 입력해주세요"
        $0.setPlaceholderColor(.gray300)
        $0.font = .pretendard(.semiBold, size: 14)
        $0.backgroundColor = .gray200
        $0.addLeftPadding(15)
        $0.clearButtonMode = .whileEditing
        $0.autocapitalizationType = .none
        $0.layer.cornerRadius = 3
        $0.isSecureTextEntry = true
        $0.addTarget(self, action: #selector(updateLoginButtonState), for: .allEditingEvents)
    }
    
    private lazy var loginButton = UIButton().then {
        $0.frame = CGRect(x: 30, y: 422, width: 332, height: 58)
        $0.titleLabel?.font = .pretendard(.bold, size: 18)
        $0.setTitle("로그인하기", for: .normal)
        $0.setTitleColor(.gray300, for: .disabled)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .gray200
        $0.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        $0.layer.cornerRadius = 6
        $0.isEnabled = false
    }
    
    private lazy var darkThemeButton = UIButton().then {
        $0.frame = CGRect(x: 30, y: 490, width: 332, height: 58)
        $0.titleLabel?.font = .pretendard(.bold, size: 18)
        $0.setTitle("다크 모드", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 6
        $0.isSelected = true
        $0.addTarget(self, action: #selector(darkThemeButtonDidTap), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
    }
    
    private func setLayout() {
        self.view.addSubviews(
            titleLabel,
            idTextField,
            passwordTextField,
            loginButton,
            darkThemeButton
        )
    }
    
    private func presentToWelcomeVC() {
        let vc = DangGeunWelcomeViewController()
        self.present(vc, animated: true)
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = DangGeunWelcomeViewController()
        welcomeViewController.name = idTextField.text
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    @objc
    private func loginButtonDidTap() {
        //presentToWelcomeVC()
        pushToWelcomeVC()
    }
    
    @objc
    private func updateLoginButtonState() {
        let isIdValid = (idTextField.text?.isEmpty == false)
        let isPasswordValid = (passwordTextField.text?.isEmpty == false)
        let canLogin = isIdValid && isPasswordValid
        
        loginButton.isEnabled = canLogin
        
        loginButton.backgroundColor = canLogin ? .dangGeun : .gray200
    }
    
    @objc
    private func darkThemeButtonDidTap() {
        if darkThemeButton.isSelected {
            self.view.backgroundColor = .black
            self.titleLabel.textColor = .white
            darkThemeButton.setTitle("라이트 모드", for: .normal)
            darkThemeButton.backgroundColor = .white
            darkThemeButton.setTitleColor(.black, for: .normal)
            darkThemeButton.isSelected = false
        }
        else {
            self.view.backgroundColor = .white
            self.titleLabel.textColor = .black
            darkThemeButton.setTitle("다크 모드", for: .normal)
            darkThemeButton.backgroundColor = .black
            darkThemeButton.setTitleColor(.white, for: .normal)
            darkThemeButton.isSelected = true
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}


//extension DangGeunLoginViewController: UITextFieldDelegate {
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        updateLoginButtonState()
//    }
//    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        updateLoginButtonState()
//    }
//}
