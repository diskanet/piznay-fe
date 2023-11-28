//
//  ExploreVC.swift
//  Piznay
//
//  Created by Dima Kahanets on 15.11.2023.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class ExploreVC: BasicVC {

    private var tableView: UITableView!
    
    private var places: [PlaceFirebase] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PlaceViewModel.getPlaces { [weak self] (places, error) in
            guard let self = self else { return }
            
            if let error = error {
                // Обробити помилку отримання даних, якщо вона є
                print("Error fetching places: \(error.localizedDescription)")
                self.showAlertMessage(title: "Failed", message: "Cant get places. Error: \(error.localizedDescription)")
                return
            }
            
            if let places = places {
                print("Received places: \(places)")
                self.showAlertMessage(title: "Success", message: "Get all \(places.count) places")
                self.places = places
                self.reloadTableView()
            }
        }
        
        
        setupVC()
    }
    
    override func setupNavBar() {
        super.setupNavBar()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let buttonSize: CGFloat = Sizes.s32
        
        let addPlaceButton = UIButton(frame: CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize))
        addPlaceButton.setImage(UIImage(named: "plus-20pt")?.withTintColor(Colors.Neutral._150), for: .normal)
        addPlaceButton.addTarget(self, action: #selector(presentCreatePlaceVC), for: .touchUpInside)
        
        let bottomSheetButton = UIButton(frame: CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize))
        bottomSheetButton.setImage(UIImage(named: "plus-20pt")?.withTintColor(Colors.Neutral._150), for: .normal)
        bottomSheetButton.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        
        let addPlaceButtonItem = UIBarButtonItem(customView: addPlaceButton)
        let bottomSheetButtonItem = UIBarButtonItem(customView: bottomSheetButton)
        navigationItem.rightBarButtonItems = [addPlaceButtonItem, bottomSheetButtonItem]
    }
    
    
    @objc
    private func handleButtonTap() {
            let vc = OriginBottomSheetVC()
            presentBottomSheet(viewController: vc)
        }
    
    @objc
    private func presentCreatePlaceVC() {
        let nextVC = CreatePlaceGeoVC()
        let navVC = UINavigationController(rootViewController: nextVC)
        navVC.modalPresentationStyle = .fullScreen
        
        present(navVC, animated: true)
    }
}

extension ExploreVC: UITableViewDelegate, UITableViewDataSource {

    func registerCells() {
        tableView.register(PlaceCardTVC.self, forCellReuseIdentifier: PlaceCardTVC.reuseIdentifier)
    }

    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        //        return viewModel.numberOfSections()
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PlaceCardTVC = tableView.dequeueReusableCell(for: indexPath)
           
           let place = places[indexPath.row]
           
           // Отримання URL для зображення з Firebase Storage
           let imageURLString = place.imageURL
           
           if !imageURLString.isEmpty {
               if let url = URL(string: imageURLString) {
                   cell.setupCell(title: place.title, location: place.locality, rating: place.rating.description, count: place.reviewsCount.description, url: url)
               }
           }
           
           return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

extension ExploreVC {
    private func setupVC() {
        // MARK: Configure UI
        
        tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInsetAdjustmentBehavior = .never
        self.view.addSubview(tableView)

        tableView.delegate = self
        tableView.dataSource = self
        
        registerCells()
        
         // MARK: Setup constraints
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
