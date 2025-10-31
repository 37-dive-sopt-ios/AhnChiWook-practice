//
//  ScrollViewController.swift
//  AhnChiWook_practice
//
//  Created by 안치욱 on 10/18/25.
//

import UIKit

import SnapKit
import Then

final class ScrollViewController: UIViewController {
    
    
    // MARK: - Properties
    
    private var scrollView = UIScrollView()
    private var contentView = UIView().then {
        $0.backgroundColor = .black
    }
    
    private var redView = UIView().then {
        $0.backgroundColor = .systemRed
    }
    
    private var orangeView = UIView().then {
        $0.backgroundColor = .systemOrange
    }
    
    private var yellowView = UIView().then {
        $0.backgroundColor = .systemYellow
    }
    
    private var greenView = UIView().then {
        $0.backgroundColor = .systemGreen
    }
    
    private var blueView = UIView().then {
        $0.backgroundColor = .systemBlue
    }
    
    private var purpleView = UIView().then {
        $0.backgroundColor = .systemPurple
    }
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setUI()
    }
    
    
    // MARK: - Setting Method
    
    private func setLayout() {
        view.addSubviews(scrollView)
        scrollView.addSubviews(contentView)
        contentView.addSubviews(
            redView,
            orangeView,
            yellowView,
            greenView,
            blueView,
            purpleView
        )
    }
    
    private func setUI() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView)
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        
        redView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.trailing.equalTo(contentView.snp.centerX)
            $0.height.equalTo(550)
        }
        
        orangeView.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.leading.equalTo(redView.snp.trailing)
            $0.height.equalTo(550)
        }
        
        yellowView.snp.makeConstraints {
            $0.top.equalTo(redView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(contentView.snp.centerX)
            $0.height.equalTo(550)
        }
        
        greenView.snp.makeConstraints {
            $0.top.equalTo(orangeView.snp.bottom)
            $0.trailing.equalToSuperview()
            $0.leading.equalTo(yellowView.snp.trailing)
            $0.height.equalTo(550)
        }
        
        blueView.snp.makeConstraints {
            $0.top.equalTo(yellowView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(contentView.snp.centerX)
            $0.height.equalTo(550)
            $0.bottom.equalToSuperview()
        }
        
        purpleView.snp.makeConstraints {
            $0.top.equalTo(greenView.snp.bottom)
            $0.leading.equalTo(blueView.snp.trailing)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(550)
            $0.bottom.equalToSuperview()
        }
        
    }
    
}

