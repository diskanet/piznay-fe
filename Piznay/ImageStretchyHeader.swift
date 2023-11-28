//
//  CoverStretchyHeader.swift
//  Piznay
//
//  Created by Dima Kahanets on 31.10.2023.
//

import UIKit
import SnapKit

class ImageStretchyHeader: UIView {
    
    var imageViewHeight: Constraint?
    var imageViewBottom: Constraint?
    var containerViewHeight: Constraint?
    
    var containerView: UIView!
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        containerViewHeight?.update(offset: scrollView.contentInset.top)
        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
        containerView.clipsToBounds = offsetY <= 0
        imageViewBottom?.update(offset: offsetY >= 0 ? 0 : -offsetY / 2)
        imageViewHeight?.update(offset: max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top))
    }
}

extension ImageStretchyHeader {
    
    private func setupView() {
        
        // MARK: Configure
        
        containerView = UIView()
        
        imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.backgroundColor = .yellow
        imageView.contentMode = .scaleAspectFill
        
        // MARK: Add subviews
        
        self.addSubview(containerView)
        
        containerView.addSubview(imageView)
        
        // MARK: Setup constraints
        
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(self)
            self.containerViewHeight = make.height.equalTo(self).constraint
        }
        
        imageView.snp.makeConstraints { make in
            make.width.equalTo(containerView)
            make.centerX.equalTo(containerView)
            self.imageViewBottom = make.bottom.equalTo(containerView).constraint
            self.imageViewHeight = make.height.equalTo(containerView).constraint
        }
    }
}
