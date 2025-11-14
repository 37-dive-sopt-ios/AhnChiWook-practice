//
//  FeedCollectionViewCellDelegate.swift
//  AhnChiWook_practice
//
//  Created by 안치욱 on 11/1/25.
//


import UIKit
import SnapKit
import Then

// MARK: - Delegate Protocol

protocol FeedCollectionViewCellDelegate: AnyObject {
    func didTapScrapButton(_ cell: FeedCollectionViewCell)
}

final class FeedCollectionViewCell: UICollectionViewCell {

    static let identifier: String = "FeedCollectionViewCell"

    // MARK: - Delegate

    weak var delegate: FeedCollectionViewCellDelegate?
    
    // MARK: - UI Components
    
    private let itemImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 8
        $0.backgroundColor = .systemGray6
    }
    
    private let nameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15)
        $0.textColor = .black
    }

    private let priceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.textColor = .orange
    }
    
    let scrapButton = UIButton().then {
        $0.setImage(.scrap, for: .normal)
        $0.setImage(.scrapFill, for: .normal)
    }


    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        setUI()
        setHierarchy()
        setLayout()
        setAddTarget()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI & Layout
    
    private func setUI() {
        contentView.backgroundColor = .white
    }
    
    private func setHierarchy() {
        contentView.addSubviews(
            itemImageView,
            nameLabel,
            priceLabel,
            scrapButton
        )
    }
    
    private func setLayout() {
        itemImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(9)
            $0.height.equalTo(itemImageView.snp.width)
        }
        
        scrapButton.snp.makeConstraints {
            $0.trailing.equalTo(itemImageView).inset(8)
            $0.bottom.equalTo(itemImageView).inset(8)
            $0.size.equalTo(24)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(itemImageView.snp.bottom).offset(3)
            $0.horizontalEdges.equalTo(itemImageView).inset(8)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(2)
            $0.horizontalEdges.equalTo(itemImageView).inset(8)
        }
    }
    
    private func setAddTarget() {
        scrapButton.addTarget(self, action: #selector(scrapButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc
    private func scrapButtonTapped() {
        delegate?.didTapScrapButton(self)
    }
    
    // MARK: - Configuration
    
    func configure(feed: FeedModel) {
        itemImageView.image = feed.itemImg
        nameLabel.text = feed.name
        priceLabel.text = feed.price
        scrapButton.isSelected = feed.isScrap
    }
}
