//
//  DangGeunWelcomeViewController.swift
//  AhnChiWook_practice
//
//  Created by 안치욱 on 10/11/25.
//

import UIKit

import Then

final class DangGeunWelcomeViewController: UIViewController {
    
    
    // MARK: - Properties
    
    var name: String?
    
    private let logoImageView = UIImageView().then {
        $0.frame = CGRect(x: 130, y: 87, width: 150, height: 150)
        $0.image = .dgDefault
        $0.contentMode = .scaleAspectFit
    }
    
    private let welcomeLabel = UILabel().then {
        $0.frame = CGRect(x: 100, y: 295, width: 200, height: 60)
        $0.text = "???님 \n반가워요!"
        $0.font = .pretendard(.extraBold, size: 25)
        $0.textAlignment = .center
        $0.numberOfLines = 2
    }
    
    private lazy var goMainButton = UIButton().then {
        $0.frame = CGRect(x: 30, y: 426, width: 335, height: 58)
        $0.backgroundColor = .dangGeun
        $0.setTitle("메인으로", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .pretendard(.bold, size: 18)
        $0.layer.cornerRadius = 6
        $0.addTarget(self, action: #selector(goMainButtonDidTap), for: .touchUpInside)
    }
    
    private lazy var backToLoginButton = UIButton().then {
        $0.frame = CGRect(x: 30, y: 498, width: 335, height: 58)
        $0.backgroundColor = .gray200
        $0.setTitle("다시 로그인", for: .normal)
        $0.setTitleColor(.gray300, for: .normal)
        $0.titleLabel?.font = .pretendard(.bold, size: 18)
        $0.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        $0.layer.cornerRadius = 6
    }
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setLayout()
        bindID()
    }
    
    // MARK: - Setting Method
    
    private func setLayout() {
        self.view.addSubviews(
            logoImageView,
            welcomeLabel,
            goMainButton,
            backToLoginButton
        )
    }
    
    // MARK: - Method
    
    private func bindID() {
        guard let name else { return }
        self.welcomeLabel.text = "\(name)님 \n반가워요!"
    }
    
    @objc
    private func goMainButtonDidTap() {
        self.logoImageView.image = .dgSmile
        let mainButtonAlert = UIAlertController(title: "메인으로", message: "메인이 아직 준비중입니다.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { _ in
            self.logoImageView.image = .dgDefault
        }
        mainButtonAlert.addAction(okAction)
        present(mainButtonAlert, animated: true)
    }
    
    @objc
    private func backToLoginButtonDidTap() {
        self.logoImageView.image = .dgCry
        let logoutAlert = UIAlertController(title: "로그아웃", message: "다시 로그인 하시겠습니까?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { _ in
            if self.navigationController == nil {
                self.dismiss(animated: true)
            } else {
                self.navigationController?.popViewController(animated: true)
            }
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel) { _ in
            self.logoImageView.image = .dgDefault
        }
        logoutAlert.addAction(okAction)
        logoutAlert.addAction(cancelAction)
        present(logoutAlert, animated: true)
    }
}
