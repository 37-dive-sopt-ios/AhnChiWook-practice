//
//  LoginView.swift
//  AhnChiWook_practice
//
//  Created by 안치욱 on 11/1/25.
//

import UIKit

import SnapKit
import Then

final class LoginView: UIView {
    
    let titleLabel = UILabel().then {
        $0.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        $0.textColor = .black
        $0.textAlignment = .center
        $0.numberOfLines = 2
        $0.font = .pretendard(.bold, size: 18)
    }
    
    lazy var idTextField = UITextField().then {
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
    
    lazy var passwordTextField = UITextField().then {
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
    
    lazy var loginButton = UIButton().then {
        $0.titleLabel?.font = .pretendard(.bold, size: 18)
        $0.setTitle("로그인하기", for: .normal)
        $0.setTitleColor(.gray300, for: .disabled)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .gray200
        $0.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        $0.layer.cornerRadius = 6
        $0.isEnabled = false
    }
    
    lazy var darkThemeButton = UIButton().then {
        $0.titleLabel?.font = .pretendard(.bold, size: 18)
        $0.setTitle("다크 모드", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 6
        $0.isSelected = true
        $0.addTarget(self, action: #selector(darkThemeButtonDidTap), for: .touchUpInside)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setHierachy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
//    private func presentToWelcomeVC() {
//        let vc = DangGeunWelcomeViewController_Delegate()
//        self.present(vc, animated: true)
//    }
    
//    private func pushToWelcomeVC() {
//        let welcomeViewController = DangGeunWelcomeViewController_Closure()
//        welcomeViewController.name = idTextField.text
//        welcomeViewController.completionHandler = { [weak self] message
//            in
//            self?.handleCompletion(message: message)
//        }
//        self.navigationController?.pushViewController(welcomeViewController, animated: true)
//    }
    
    private func setHierachy() {
        self.addSubviews(
            titleLabel,
            idTextField,
            passwordTextField,
            loginButton,
            darkThemeButton
        )
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.snp.top).offset(163)
        }
        
        idTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(72)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(idTextField.snp.bottom).offset(6)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(passwordTextField.snp.bottom).offset(35)
            $0.width.equalTo(335)
            $0.height.equalTo(57)
        }
        
        darkThemeButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(loginButton.snp.bottom).offset(6)
            $0.width.equalTo(335)
            $0.height.equalTo(57)
        }
    }
    
    @objc
    private func loginButtonDidTap() {
        //presentToWelcomeVC()
        //pushToWelcomeVC()
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
        darkThemeButton.isSelected.toggle()
        let isDarkMode = darkThemeButton.isSelected

        self.backgroundColor = isDarkMode ? .black : .white
        titleLabel.textColor = isDarkMode ? .white : .black

        darkThemeButton.setTitle(isDarkMode ? "라이트 모드" : "다크 모드", for: .normal)
        darkThemeButton.backgroundColor = isDarkMode ? .white : .black
        darkThemeButton.setTitleColor(isDarkMode ? .black : .white, for: .normal)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }

    private func handleCompletion(message: String) {
        titleLabel.text = message
        idTextField.text = ""
        passwordTextField.text = ""
        loginButton.setTitle("다시 로그인하기", for: .normal)
    }
}
