//
//  DangGeunWelcomeViewController_Delegate.swift
//  AhnChiWook_practice
//
//  Created by 안치욱 on 10/18/25.
//

import UIKit

import SnapKit
import Then


final class DangGeunWelcomeViewController_Closure: UIViewController {
    
    
    // MARK: - Properties
    
    var name: String?
    
    var completionHandler: ((String) -> Void)?
    
    private let logoImageView = UIImageView().then {
        $0.image = .dgDefault
        $0.contentMode = .scaleAspectFit
    }
    
    private let welcomeLabel = UILabel().then {
        $0.text = "???님 \n반가워요!"
        $0.font = .pretendard(.extraBold, size: 25)
        $0.textAlignment = .center
        $0.numberOfLines = 2
    }
    
    private lazy var goMainButton = UIButton().then {
        $0.backgroundColor = .dangGeun
        $0.setTitle("메인으로", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .pretendard(.bold, size: 18)
        $0.layer.cornerRadius = 6
        $0.addTarget(self, action: #selector(goMainButtonDidTap), for: .touchUpInside)
    }
    
    private lazy var backToLoginButton = UIButton().then {
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
        setUI()
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
    
    private func setUI() {
        logoImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.top).offset(87)
            $0.width.height.equalTo(150)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logoImageView.snp.bottom).offset(58)
        }
        
        goMainButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(71)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(57)
        }
        
        backToLoginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(goMainButton.snp.bottom).offset(6)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(57)
        }
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
        guard let name else { return }
        completionHandler?("\(name)님이\n다시 로그인 버튼을 눌렀어요!")
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
