//
//  PlaceCardHeader.swift
//  Piznay
//
//  Created by Dima Kahanets on 01.11.2023.
//

import Foundation
import UIKit
import SnapKit


class PlaceCardHeader: UIView {
    
    var titleLabel: UILabel!
    var subtitleLabel: UILabel!
    var ratingLabel: UILabel!
    var reviewsLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension PlaceCardHeader {
    
    private func setupView() {
        
        let inset: CGFloat = Sizes.s16
        let spacing: CGFloat = Sizes.s4
        let ratingIconSize: CGFloat = Sizes.s20
        
        func setSimilarLabelProperties(for label: UILabel) {
            label.textAlignment = .left
            label.numberOfLines = 1
        }
        
        // MARK: Configure
        
        titleLabel = UILabel()
        titleLabel.font = Typography.title3.font
        titleLabel.attributedText = Typography.title3.attributedString()
        titleLabel.textColor = Colors.Neutral._150
        titleLabel.lineBreakMode = .byTruncatingTail
        setSimilarLabelProperties(for: titleLabel)
        
        subtitleLabel = UILabel()
        subtitleLabel.font = Typography.subtitleBody2R.font
        subtitleLabel.attributedText = Typography.subtitleBody2R.attributedString()
        subtitleLabel.textColor = Colors.Neutral._500
        subtitleLabel.lineBreakMode = .byTruncatingTail
        setSimilarLabelProperties(for: subtitleLabel)
        
        let ratingImageView = UIImageView()
        ratingImageView.image = UIImage(named: "rating")
        ratingImageView.contentMode = .center
        
        ratingLabel = UILabel()
        ratingLabel.font = Typography.subtitleBody2R.font
        ratingLabel.attributedText = Typography.subtitleBody2R.attributedString()
        ratingLabel.textColor = Colors.Neutral._150
        setSimilarLabelProperties(for: ratingLabel)
        
        reviewsLabel = UILabel()
        reviewsLabel.font = Typography.subtitleBody2R.font
        reviewsLabel.attributedText = Typography.subtitleBody2R.attributedString()
        reviewsLabel.textColor = Colors.Neutral._500
        setSimilarLabelProperties(for: reviewsLabel)
        
        let ratingStackView = UIStackView(arrangedSubviews: [ratingImageView, ratingLabel, reviewsLabel])
        ratingStackView.configStackView(axis: .horizontal, spacing: spacing, alignment: .fill, distribution: .fill)
        
        let headerStackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel, ratingStackView])
        headerStackView.configStackView(axis: .vertical, spacing: 0, alignment: .leading, distribution: .fill)
        headerStackView.setCustomSpacing(spacing, after: subtitleLabel)
        headerStackView.layoutMargins = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        headerStackView.isLayoutMarginsRelativeArrangement = true
        headerStackView.backgroundColor = Colors.Base.white
        
        // MARK: Add subviews
        
        self.addSubview(headerStackView)
        
        // MARK: Setup constraints
        
        headerStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
//            make.height.equalTo(headerHeight)
        }
        
        ratingImageView.snp.makeConstraints { make in
            make.size.equalTo(ratingIconSize)
        }
    }
}
