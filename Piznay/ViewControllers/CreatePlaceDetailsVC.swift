//
//  CreatePlaceDetailsVC.swift
//  Piznay
//
//  Created by Dima Kahanets on 16.11.2023.
//

import UIKit
import SnapKit
import FirebaseStorage
import FirebaseDatabase

class CreatePlaceDetailsVC: BasicVC {
    
    // MARK: UI
    private var tableView: UITableView!
    private var headerView: ImageStretchyHeader!
    
    
    // MARK: Properties
    private var geoData: [String: String] = [:]
    private var aspectRatio: CGFloat!
    private var selectedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupVC()
        hideKeyboard()
    }
    
    override func setupNavBar() {
        super.setupNavBar()
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor.clear
        
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.standardAppearance = appearance
        
        let backButton = LeftNavButton()
        backButton.addTarget(target: self, action: #selector(backButtonHandler))
        backButton.setIcon(iconName: "chevron.backward")
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
        let createButton = UIButton(type: .system)
        createButton.setTitle("Create", for: .normal)
        createButton.setTitleColor(UIColor(red: 0.239, green: 0.357, blue: 0.949, alpha: 1), for: .normal)
        createButton.addTarget(self, action: #selector(createButtonHandler), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: createButton)
    }
    
    // MARK: Handler methods
    @objc
    private func backButtonHandler() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func createButtonHandler() {
        //        guard let title = titleTF.text,
        //              let locality = geoData["locality"],
        //              let country = geoData["country"],
        //              let latitude = geoData["latitude"],
        //              let longitude = geoData["longitude"],
        //              let origin = originTF.text,
        //              let object = objectTF.text,
        //              let imageData = imageView.image?.jpegData(compressionQuality: 1.0),
        //              let imageRatio = self.aspectRatio
        //        else {
        //            self.showAlertMessage(title: "Input error", message: "Check if all fields are filled")
        //            return
        //        }
        //
        //        FirebaseService.shared.saveImageData(imageData: imageData) { [weak self] result in
        //            guard let self = self else { return }
        //
        //            switch result {
        //            case .success(let imageURLString):
        //                let newPlace = PlaceFirebase(imageURL: imageURLString, imageRatio: imageRatio, title: title, locality: locality, country: country, latitude: latitude, longitude: longitude, originType: origin, objectType: object, phone: title, website: title, address: title)
        //
        //                PlaceViewModel.createPlace(place: newPlace)
        //
        //                DispatchQueue.main.async {
        //                    self.showAlertMessage(title: "Success", message: "Place added to Firebase") {
        //                        self.dismiss(animated: true, completion: nil)
        //                    }
        //                }
        //            case .failure(let error):
        //                self.showAlertMessage(title: "Failed", message: "Error saving image or location data: \(error)")
        //            }
        //        }
    }
    
    // MARK: Other methods
    func setGeoData(data: [String: String]) {
        self.geoData = data
    }
    
    func setAspectRatio(aspectRatio: CGFloat) {
        self.aspectRatio = aspectRatio
    }
    
    func setImage(image: UIImage) {
        self.selectedImage = image
    }
}

extension CreatePlaceDetailsVC: UITableViewDelegate, UITableViewDataSource {
    func registerCells() {
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        headerView = self.tableView.tableHeaderView as? ImageStretchyHeader
        headerView.scrollViewDidScroll(scrollView: scrollView)
    }
}

extension CreatePlaceDetailsVC {
    private func setupVC() {
        
        // MARK: Configure UI
        
        let navBarHeight = navigationController?.navigationBar.frame.height ?? 0
        var statusBarHeight: CGFloat = 0
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
            statusBarHeight = window?.safeAreaInsets.top ?? 0
        } else {
            statusBarHeight = UIApplication.shared.statusBarFrame.height
        }
        let headerWidth = self.view.bounds.width
        let headerHeight = headerWidth * self.aspectRatio - (navBarHeight + statusBarHeight)
        headerView = ImageStretchyHeader(frame: CGRect(x: 0, y: 0, width: headerWidth, height: headerHeight))
        headerView.imageView.image = selectedImage
        
        tableView = UITableView()
        tableView.tableHeaderView = headerView
        tableView.separatorColor = UIColor.clear
        self.view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        registerCells()
        
        // MARK: Setup constraints
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
}
