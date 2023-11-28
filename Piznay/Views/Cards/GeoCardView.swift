//
//  GeoCardView.swift
//  Piznay
//
//  Created by Dima Kahanets on 11.11.2023.
//

import Foundation
import UIKit
import SnapKit
import MapKit

class GeoCardView: UIView {
    
    private var locationLabel: UILabel!
    private var coordinatesLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        let imageSize: CGFloat = Sizes.s40
        
        // MARK: Configure
        
        self.backgroundColor = Colors.Base.white
        self.roundingCorners(radius: Sizes.s16, curve: .continuous, clip: true)
        
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.image = UIImage(named: "location18")?.withTintColor(Colors.Base.white)
        imageView.roundingCorners(radius: imageSize / 2, curve: .circular, clip: true)
        imageView.backgroundColor = Colors.Primary._600
        
        locationLabel = UILabel()
        locationLabel.font = Typography.subtitleBody2M.font
        locationLabel.textColor = Colors.Neutral._150
        locationLabel.numberOfLines = 1
        
        coordinatesLabel = UILabel()
        coordinatesLabel.font = Typography.footnoteSubtitle2R.font
        coordinatesLabel.textColor = Colors.Primary._600
        coordinatesLabel.numberOfLines = 1
        
        let geoStackView = UIStackView(arrangedSubviews: [locationLabel, coordinatesLabel])
        geoStackView.configStackView(axis: .vertical, spacing: Sizes.s8, alignment: .leading, distribution: .fillProportionally)
        
        let stackView = UIStackView(arrangedSubviews: [imageView, geoStackView])
        stackView.configStackView(axis: .horizontal, spacing: Sizes.s16, alignment: .center, distribution: .fill)
        stackView.layoutMargins = UIEdgeInsets(top: Sizes.s16, left: Sizes.s16, bottom: Sizes.s16, right: Sizes.s16)
        stackView.isLayoutMarginsRelativeArrangement = true
        self.addSubview(stackView)
        
        // MARK: Setup constraints
        
        imageView.snp.makeConstraints { make in
            make.size.equalTo(imageSize)
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setCard(location: String, coordinates: String) {
        locationLabel.text = location
        coordinatesLabel.text = coordinates
    }
    
    func setCard(location: String) {
        locationLabel.text = location
    }
}
