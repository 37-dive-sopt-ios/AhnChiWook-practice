//
//  ChatssTableViewCell.swift
//  AhnChiWook_practice
//
//  Created by 안치욱 on 11/1/25.
//

import UIKit

import SnapKit
import Then


class ChatssTableViewCell: UITableViewCell {
    
    static let identifier: String = "ChatssTableViewCell"
    
    private let profileImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
        $0.backgroundColor = .systemGray5
    }
    
    private let nameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.textColor = .black
    }
    
    private let locationLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .systemGray
    }
    
    private let messageLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .black
        $0.numberOfLines = 1
    }
    
    private let thumbnailImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 4
        $0.backgroundColor = .systemGray6
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        selectionStyle = .none
        backgroundColor = .white
    }
    
    private func setHierarchy() {
        contentView.addSubviews(
            profileImageView,
            nameLabel,
            locationLabel,
            messageLabel,
            thumbnailImageView
        )
    }
    
    private func setLayout() {
        profileImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(40)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.top).offset(0.5)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
        }
        
        locationLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.trailing).offset(4)
            $0.centerY.equalTo(nameLabel)
        }
        
        messageLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(6)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
            $0.trailing.equalTo(thumbnailImageView.snp.leading).offset(-8)
        }
        
        thumbnailImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(40)
        }
    }
    
    func configuress(with chatssRoom: ChatssRoomModel) {
        profileImageView.image = chatssRoom.profileImage
        nameLabel.text = chatssRoom.name
        locationLabel.text = chatssRoom.location
        messageLabel.text = chatssRoom.lastMessage
        thumbnailImageView.image = chatssRoom.thumbnail
    }
}
