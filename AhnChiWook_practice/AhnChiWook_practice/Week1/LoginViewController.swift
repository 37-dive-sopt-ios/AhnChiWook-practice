//
//  LoginViewController.swift
//  AhnChiWook_practice
//
//  Created by 안치욱 on 10/11/25.
//


import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties

    // 배달의민족 주조색 (하늘색 계열)
    let baeminSkyBlue = UIColor(red: 35/255, green: 200/255, blue: 195/255, alpha: 1.0)
    // 텍스트 필드 배경색 (약간 연한 회색)
    let textFieldBackgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
    // 텍스트 필드 테두리 색상 (더 연한 회색)
    let textFieldBorderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
    
    // MARK: - UI Components
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 120, width: self.view.bounds.width - 40, height: 40))
        label.text = "배달의민족"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 165, width: self.view.bounds.width - 40, height: 20))
        label.text = "지금 맛있는 여정을 시작해보세요!"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 220, width: self.view.bounds.width - 40, height: 45))
        textField.placeholder = "이메일 아이디"
        textField.borderStyle = .none // 기본 borderStyle 제거
        textField.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0) // 연한 회색 배경
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0).cgColor // 더 연한 테두리
        // 텍스트 필드 좌우 패딩 추가
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.rightViewMode = .always
        textField.autocapitalizationType = .none
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 275, width: self.view.bounds.width - 40, height: 45))
        textField.placeholder = "비밀번호"
        textField.borderStyle = .none // 기본 borderStyle 제거
        textField.isSecureTextEntry = true
        textField.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0) // 연한 회색 배경
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0).cgColor // 더 연한 테두리
        // 텍스트 필드 좌우 패딩 추가
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.rightViewMode = .always
        textField.autocapitalizationType = .none
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 340, width: self.view.bounds.width - 40, height: 50))
        button.setTitle("로그인", for: .normal)
        button.backgroundColor = UIColor(red: 35/255, green: 200/255, blue: 195/255, alpha: 1.0) // 배민 스카이 블루
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    
    lazy var socialLoginLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 460, width: self.view.bounds.width - 40, height: 20))
        label.text = "또는"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }()
    
    lazy var naverLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: self.view.bounds.width / 2 - 120, y: 440, width: 100, height: 50))
        button.setTitle(" 네이버", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setImage(UIImage(systemName: "n.square.fill"), for: .normal)
        button.tintColor = .systemGreen
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        return button
    }()
    
    lazy var kakaoLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: self.view.bounds.width / 2 + 20, y: 440, width: 100, height: 50))
        button.setTitle(" 카카오", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setImage(UIImage(systemName: "k.square.fill"), for: .normal)
        button.tintColor = .systemYellow
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        return button
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setHierarchy()
        //setLayout()
    }
    
    // MARK: - UI & Layout
    
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setHierarchy() {
        let components = [
            titleLabel,
            subtitleLabel,
            emailTextField,
            passwordTextField,
            loginButton,
            socialLoginLabel,
            naverLoginButton,
            kakaoLoginButton
        ]
        
        components.forEach { view.addSubview($0) }
    }
    
}
