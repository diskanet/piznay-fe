//
//  RowDefaultTVC.swift
//  Piznay
//
//  Created by Dima Kahanets on 30.10.2023.
//

import Foundation
import UIKit
import SnapKit

class RowDefaultTVC: UITableViewCell {
    
    static var reuseIdentifier = "RowDefaultTVC"
    
    private var leftLabel: UILabel!
    private var rightLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RowDefaultTVC {
    
    func setupView() {
        
        // MARK: Configure views
        
        
        leftLabel = UILabel()
        leftLabel.font = Typography.subtitleBody2R.font
        leftLabel.textColor = Colors.Neutral._500
        leftLabel.numberOfLines = 1
        leftLabel.textAlignment = .left
        
        rightLabel = UILabel()
        rightLabel.font = Typography.subtitleBody2R.font
        rightLabel.textColor = Colors.Neutral._150
        rightLabel.numberOfLines = 1
        rightLabel.textAlignment = .right
        
        let rowView = UIView()
        
        // MARK: Adding views
        
        self.contentView.addSubview(rowView)
        
        rowView.addSubview(leftLabel)
        rowView.addSubview(rightLabel)
        
        // MARK: Setup constraints
        
        rowView.snp.makeConstraints { make in
            make.verticalEdges.equalTo(contentView)
            make.horizontalEdges.equalTo(contentView).inset(Sizes.s16)
            make.height.equalTo(Sizes.s44)
        }
        
        leftLabel.snp.makeConstraints { make in
            make.leading.equalTo(rowView.snp.leading)
            make.centerY.equalTo(rowView.snp.centerY)
        }
        
        rightLabel.snp.makeConstraints { make in
            make.trailing.equalTo(rowView.snp.trailing)
            make.centerY.equalTo(rowView.snp.centerY)
        }
    }
    
    func configure(leftLabelText: String, rightLabelText: String) {
        leftLabel.text = leftLabelText
        rightLabel.text = rightLabelText
    }
}
