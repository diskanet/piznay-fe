//
//  PlaceCardTVC.swift
//  Piznay
//
//  Created by Dima Kahanets on 02.11.2023.
//

import Foundation
import UIKit
import SnapKit
import SDWebImage

class PlaceCardTVC: UITableViewCell {
    
    public static var reuseIdentifier = "PlaceCardTVC"
    
    var coverImageView: UIImageView!
    var addToFavoriteButton: UIButton!
    var headerView: PlaceCardHeader!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PlaceCardTVC {
    
    private func setupView() {
        
        let radius: CGFloat = Sizes.s16
        
        
        // MARK: Configure
        
        coverImageView = UIImageView()
        coverImageView.contentMode = .scaleAspectFill
        coverImageView.backgroundColor = Colors.Neutral._600
        
        addToFavoriteButton = UIButton(type: .system)
        addToFavoriteButton.backgroundColor = UIColor.clear
        addToFavoriteButton.roundingCorners(radius: 22, curve: .circular, clip: true)
        
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = addToFavoriteButton.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        headerView = PlaceCardHeader()
        
        let wrapperStackView = UIStackView(arrangedSubviews: [coverImageView, headerView])
        wrapperStackView.axis = .vertical
        wrapperStackView.roundingCorners(radius: radius, curve: .continuous, clip: true)
        wrapperStackView.backgroundColor = UIColor.clear
        
        let shadowView = UIView()
        shadowView.addCardShadow()
        
        // MARK: Add subviews
        
        self.contentView.addSubview(shadowView)
        
        shadowView.addSubview(wrapperStackView)
        
        coverImageView.addSubview(addToFavoriteButton)
        
        addToFavoriteButton.addSubview(blurEffectView)
        addToFavoriteButton.sendSubviewToBack(blurEffectView)
        
        // MARK: Setup constraints
        
        shadowView.snp.makeConstraints { make in
            make.verticalEdges.equalTo(contentView).inset(8)
            make.horizontalEdges.equalTo(contentView).inset(16)
        }
          
        wrapperStackView.snp.makeConstraints { make in
            make.edges.equalTo(shadowView)
        }
        
        coverImageView.snp.makeConstraints { make in
            make.size.equalTo(wrapperStackView.snp.width)
        }
        
        addToFavoriteButton.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(coverImageView).inset(16)
            make.size.equalTo(44)
        }
    }
    
    // MARK: Setup cell
    
    func setupCell(viewModel: PlaceCardTVCViewModel) {
        self.headerView.titleLabel.text = viewModel.title
        self.headerView.subtitleLabel.text = viewModel.location
        self.headerView.ratingLabel.text = viewModel.rating.description
        self.headerView.reviewsLabel.text = viewModel.reviewsCount.description
        self.coverImageView.sd_setImage(with: viewModel.imageURL)
    }
    
    func setupCell(title: String, location: String, rating: String, count: String, url: URL) {
        self.headerView.titleLabel.text = title
        self.headerView.subtitleLabel.text = location
        self.headerView.ratingLabel.text = rating
        self.headerView.reviewsLabel.text = count
        self.coverImageView.sd_setImage(with: url)
    }
}
