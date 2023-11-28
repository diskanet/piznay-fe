//
//  SingleActionBarView.swift
//  Piznay
//
//  Created by Dima Kahanets on 10.11.2023.
//

import UIKit
import SnapKit

class SingleActionBarView: UIView {
    
    private var actionButton: BasicButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SingleActionBarView {
    private func setupView() {
        
        // MARK: Configure
        
        self.backgroundColor = Colors.Base.white
        
        actionButton = BasicButton(style: .filled)
        actionButton.setTitle("Set marker", for: .normal)
        actionButton.isEnabled = true
        
        let separator = HorizontalSeparator()
        self.addSubview(separator)
        
        let stackView = UIStackView(arrangedSubviews: [actionButton])
        stackView.layoutMargins = UIEdgeInsets(top: Sizes.s8, left: Sizes.s16, bottom: Sizes.s8, right: Sizes.s16)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.configStackView(axis: .vertical, spacing: Sizes.s16, alignment: .fill, distribution: .fillProportionally)
        self.addSubview(stackView)
        
        // MARK: Setup constraints
        
        separator.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func addTargetForActionButton(target: Any?, action: Selector) {
        actionButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func setActionButtonTitle(title: String) {
        actionButton.setTitle(title, for: .normal)
    }
    
    func setActionButtonSelected(_ selected: Bool) {
        actionButton.isSelected = selected
        updateActionButtonStyle()
    }
    
    private func updateActionButtonStyle() {

        if self.actionButton.isSelected {
            self.actionButton.setButtonStyle(to: .tinted)
            self.actionButton.setTitle("Remove marker", for: .normal)
        } else {
            self.actionButton.setButtonStyle(to: .filled)
            self.actionButton.setTitle("Set marker", for: .normal)
        }
    }
}
