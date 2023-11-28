//
//  BottomSheetVC.swift
//  Piznay
//
//  Created by Dima Kahanets on 21.11.2023.
//

import UIKit
import SnapKit

class BasicBottomSheetVC: UIViewController {
    
    // MARK: UI

    private var dimmedView: UIView!
    private var mainContainerView: UIView!
    private var topBarView: UIView!
    private var barLineView: UIView!
    private var contentView: UIView!
    
    // MARK: Properties
    
    private let maxDimmedAlpha: CGFloat = 0.8
    private let minDismissiblePanHeight: CGFloat = 20
    private var minTopSpacing: CGFloat = 80
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupVC()
        setupGestures()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animatePresent()
    }
    
    // MARK: Methods
    
    // 2
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapDimmedView))
        dimmedView.addGestureRecognizer(tapGesture)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        panGesture.delaysTouchesBegan = false
        panGesture.delaysTouchesEnded = false
        topBarView.addGestureRecognizer(panGesture)
        mainContainerView.addGestureRecognizer(panGesture)
    }
    
    // 3
    @objc private func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        // get drag direction
        let isDraggingDown = translation.y > 0
        guard isDraggingDown else { return }
        
        let pannedHeight = translation.y
        let currentY = self.view.frame.height - self.mainContainerView.frame.height
        // handle gesture state
        switch gesture.state {
        case .changed:
            // This state will occur when user is dragging
            self.mainContainerView.frame.origin.y = currentY + pannedHeight
        case .ended:
            // When user stop dragging
            // if fulfil the condition dismiss it, else move to original position
            if pannedHeight >= minDismissiblePanHeight {
                dismissBottomSheet()
            } else {
                self.mainContainerView.frame.origin.y = currentY
            }
        default:
            break
        }
    }
    
    // 4
    @objc private func handleTapDimmedView() {
        dismissBottomSheet()
    }
    
    // 5
    private func animatePresent() {
        dimmedView.alpha = 0
        mainContainerView.transform = CGAffineTransform(translationX: 0, y: view.frame.height)
        UIView.animate(withDuration: 0.2) { [weak self] in
            self?.mainContainerView.transform = .identity
        }
        // add more animation duration for smoothness
        UIView.animate(withDuration: 0.4) { [weak self] in
            guard let self = self else { return }
            self.dimmedView.alpha = self.maxDimmedAlpha
        }
    }
    
    // 6
    func dismissBottomSheet() {
        UIView.animate(withDuration: 0.2, animations: {  [weak self] in
            guard let self = self else { return }
            self.dimmedView.alpha = self.maxDimmedAlpha
            self.mainContainerView.frame.origin.y = self.view.frame.height
        }, completion: {  [weak self] _ in
            self?.dismiss(animated: false)
        })
    }
    
    // 7
    // sub-view controller will call this function to set content
    func setContent(content: UIView) {
        contentView.addSubview(content)
        
        content.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        view.layoutIfNeeded()
    }
}


extension BasicBottomSheetVC {
    private func setupVC() {
        
        // MARK: Configure
        
        self.view.backgroundColor = UIColor.clear
        
        dimmedView = UIView()
        dimmedView.backgroundColor = Colors.Base.black
        dimmedView.alpha = 0
        view.addSubview(dimmedView)
        
        mainContainerView = UIView()
        mainContainerView.backgroundColor = Colors.Base.white
        view.addSubview(mainContainerView)
        
        topBarView = UIView()
        topBarView.backgroundColor = Colors.Neutral._950
        mainContainerView.addSubview(topBarView)
        
        barLineView = UIView()
        barLineView.layer.cornerRadius = Sizes.s2
        barLineView.backgroundColor = Colors.Neutral._750
        topBarView.addSubview(barLineView)
        
        contentView = UIView()
        mainContainerView.addSubview(contentView)
        
        // MARK: Setup constraints
        
        dimmedView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        mainContainerView.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(view.snp.top).offset(minTopSpacing)
            make.bottom.horizontalEdges.equalToSuperview()
        }
        
        topBarView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(mainContainerView)
            make.height.equalTo(Sizes.s52)
        }
        
        barLineView.snp.makeConstraints { make in
            make.center.equalTo(topBarView)
            make.width.equalTo(Sizes.s40)
            make.height.equalTo(Sizes.s4)
        }
        
        contentView.snp.makeConstraints { make in
            make.top.equalTo(topBarView.snp.bottom)
            make.horizontalEdges.equalTo(mainContainerView)
            make.bottom.equalTo(mainContainerView.snp.bottom).offset(-34)
        }
    }
}
