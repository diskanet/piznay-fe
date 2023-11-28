//
//  HorizontalSeparator.swift
//  Piznay
//
//  Created by Dima Kahanets on 29.10.2023.
//

import Foundation
import UIKit
import SnapKit

class HorizontalSeparator: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HorizontalSeparator {
    
    private func setupView() {
        
        let height: CGFloat = 0.5
        
        // MARK: Configure views
        
        let line = UIView()
        line.backgroundColor = Colors.Neutral._900
        
        // MARK: Adding views
        
        self.addSubview(line)
        
        // MARK: Setup constraints
        
        line.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(height)
        }
    }
    
    
}
