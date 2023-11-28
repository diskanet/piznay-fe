//
//  CreatePlaceVC.swift
//  Piznay
//
//  Created by Dima Kahanets on 15.11.2023.
//

import UIKit
import SnapKit
import MapKit
//import RxCocoa
//import RxSwift

class CreatePlaceGeoVC: BasicVC, MKMapViewDelegate {
    
    // MARK: UI
    private var mapView: MKMapView!
    private var mapScope: UIImageView!
    private var actionBar: SingleActionBarView!
    private var geoCardView: GeoCardView!
    
    // MARK: Properties
    private var geoData: [String: String] = [:]
    private var annotation: MKPointAnnotation? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupVC()
    }
    
    override func setupNavBar() {
        super.setupNavBar()
        
        self.title = "Geolocation"
        
        let closeButton = LeftNavButton()
        closeButton.setIcon(iconName: "xmark")
        closeButton.addTarget(target: self, action: #selector(closeButtonHandler))
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: closeButton)
        
        let nextButton = UIButton(type: .system)
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(UIColor(red: 0.239, green: 0.357, blue: 0.949, alpha: 1), for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonHandler), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: nextButton)
    }
    
    // MARK: Handler methods
    @objc
    private func closeButtonHandler() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc
    private func nextButtonHandler() {
        let nextVC = CreatePlaceCoverVC()
        nextVC.setGeoData(data: self.geoData)
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc
    private func actionButtonHandler() {
        let coordinates = mapView.getCoordinatesByCenterPoint(on: mapView)
        
        if annotation == nil {
            annotation = mapView.addAnnotation(to: mapView, at: coordinates)
            mapView.getGeolocationData(by: coordinates) { [weak self] geoData in
                guard let self = self else { return }
                self.geoData = geoData
        
                self.updateGeoCardData(with: geoData)
            }
            mapScope.isHidden = true
            
            let cardHeight = self.geoCardView.bounds.height
            self.geoCardView.animateGeoCardView(withTranslation: -(cardHeight + Sizes.s32 ))
            
            self.actionBar.setActionButtonSelected(true)
        } else {
            mapView.removeAnnotation(annotation, from: mapView)
            annotation = nil
            geoData = [:]
            mapScope.isHidden = false
            
            self.geoCardView.animateGeoCardView(withTranslation: 0)
            
            self.actionBar.setActionButtonSelected(false)
        }
    }
    
    @objc
    private func zoomInButtonHandler() {
        mapView.zoomIn(mapView: mapView)
    }
    
    @objc
    private func zoomOutButtonHandler() {
        mapView.zoomOut(mapView: mapView)
    }
    
    // MARK: Private methods
    private func updateGeoCardData(with geoData: [String: String]) {
        if let coordinates = geoData["coordinates"],
           let location = geoData["location"] {
            self.geoCardView.setCard(location: location, coordinates: coordinates)
        }
    }
}

extension CreatePlaceGeoVC {
    private func setupVC() {
        
        // MARK: Configure UI
        
        mapView = MKMapView()
        mapView.delegate = self
        mapView.showsScale = true
        self.view.addSubview(mapView)
        
        let config = UIImage.SymbolConfiguration(pointSize: 24, weight: .thin)
        mapScope = UIImageView()
        mapScope.image = UIImage(systemName: "plus", withConfiguration: config)
        mapScope.tintColor = Colors.Neutral._150
        mapView.addSubview(mapScope)
        
        let zoomInButton = ScaleButton()
        zoomInButton.setIcon(iconName: "plus-20pt", tintColor: Colors.Neutral._150)
        zoomInButton.addTarget(target: self, action: #selector(zoomInButtonHandler))
        
        let zoomOutButton = ScaleButton()
        zoomOutButton.setIcon(iconName: "minus-20pt", tintColor: Colors.Neutral._150)
        zoomOutButton.addTarget(target: self, action: #selector(zoomOutButtonHandler))
        
        let scaleControlsStackView = UIStackView(arrangedSubviews: [zoomInButton, zoomOutButton])
        scaleControlsStackView.configStackView(axis: .vertical, spacing: Sizes.s8, alignment: .center, distribution: .fillProportionally)
        mapView.addSubview(scaleControlsStackView)
        
        geoCardView = GeoCardView()
        mapView.addSubview(geoCardView)
        
        actionBar = SingleActionBarView()
        actionBar.addTargetForActionButton(target: self, action: #selector(actionButtonHandler))
        self.view.addSubview(actionBar)
        
        // MARK: Setup constraints
        
        mapView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(actionBar.snp.top)
        }
        
        mapScope.snp.makeConstraints { make in
            make.center.equalTo(mapView)
        }
        
        scaleControlsStackView.snp.makeConstraints { make in
            make.centerY.equalTo(mapView.snp.centerY)
            make.trailing.equalTo(mapView.snp.trailing).offset(-Sizes.s16)
        }
        
        geoCardView.snp.makeConstraints { make in
            make.top.equalTo(mapView.snp.bottom)
            make.horizontalEdges.equalTo(mapView).inset(Sizes.s16)
        }
        
        actionBar.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

