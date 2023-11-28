//
//  CreatePlaceCoverVC.swift
//  Piznay
//
//  Created by Dima Kahanets on 19.11.2023.
//

import UIKit
import SnapKit

class CreatePlaceCoverVC: BasicVC {
    
    // MARK: UI
    private var segmentedControl: UISegmentedControl!
    private var cropView: UIView!
    private var imageView: UIImageView!
    private var actionBar: SingleActionBarView!
    private var nextButton: UIButton!
    
    // MARK: Properties
    private var geoData: [String: String] = [:]
    private var selectedAspectRatio: CGFloat = 1.0
    private var selectedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupVC()
        setupNextButton(enabled: false)
    }
    
    override func setupNavBar() {
        super.setupNavBar()
        
        self.title = "Cover"
        
        let backButton = LeftNavButton()
        backButton.addTarget(target: self, action: #selector(backButtonHandler))
        backButton.setIcon(iconName: "chevron.backward")
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
        nextButton = UIButton(type: .system)
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(Colors.Neutral._150, for: .normal)
        nextButton.setTitleColor(Colors.Neutral._400, for: .disabled)
        nextButton.addTarget(self, action: #selector(nextButtonHandler), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: nextButton)
    }
    
    // MARK: Handler methods
    @objc
    private func backButtonHandler() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func nextButtonHandler() {
        let nextVC = CreatePlaceDetailsVC()
        nextVC.setImage(image: self.selectedImage)
        nextVC.setGeoData(data: self.geoData)
        nextVC.setAspectRatio(aspectRatio: selectedAspectRatio)
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc private func segmentedControlHandler(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            selectedAspectRatio = 2.0 / 3.0
        case 1:
            selectedAspectRatio = 1.0
        case 2:
            selectedAspectRatio = 3.0 / 2.0
        default:
            break
        }
        updateImageViewAspectRatio(selectedAspectRatio)
    }
    
    @objc func actionButtonTapped() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    // MARK: Private methods
    private func setupNextButton(enabled: Bool) {
        if let nextButton = navigationItem.rightBarButtonItem?.customView as? UIButton {
            nextButton.isEnabled = enabled
        }
    }
    
    // MARK: Other methods
    func setGeoData(data: [String: String]) {
        self.geoData = data
    }
}

extension CreatePlaceCoverVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            imageView.image = image
            self.selectedImage = image
            
            setupNextButton(enabled: true)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

extension CreatePlaceCoverVC {
    private func setupVC() {
        
        // MARK: Configure UI
        segmentedControl = UISegmentedControl(items: ["2:3", "1:1", "3:2"])
        segmentedControl.addTarget(self, action: #selector(segmentedControlHandler(_:)), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 1
        self.view.addSubview(segmentedControl)
        
        let contentView = UIView()
        self.view.addSubview(contentView)
        
        cropView = UIView()
        cropView.clipsToBounds = true
        contentView.addSubview(cropView)
        
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = Colors.Neutral._900
        cropView.addSubview(imageView)
        
        actionBar = SingleActionBarView()
        actionBar.addTargetForActionButton(target: self, action: #selector(actionButtonTapped))
        actionBar.setActionButtonTitle(title: "Upload cover")
        self.view.addSubview(actionBar)
        
        // MARK: Setup constraints
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.horizontalEdges.equalToSuperview().inset(Sizes.s16)
            make.height.equalTo(Sizes.s32)
        }
        
        contentView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(actionBar.snp.top)
        }
        
        imageView.snp.makeConstraints { make in
            make.center.size.equalTo(cropView)
        }
        
        cropView.snp.makeConstraints { make in
            make.center.horizontalEdges.equalTo(contentView)
            make.height.equalTo(cropView.snp.width).multipliedBy(selectedAspectRatio)
        }
        
        actionBar.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    // MARK: Configure methods
    func updateImageViewAspectRatio(_ aspectRatio: CGFloat) {
        UIView.animate(withDuration: 0.4) {
            self.cropView.snp.remakeConstraints { make in
                make.center.horizontalEdges.equalToSuperview()
                make.height.equalTo(self.cropView.snp.width).multipliedBy(self.selectedAspectRatio)
            }
            self.view.layoutIfNeeded()
        }
    }
}
