//
//  OriginBottomSheetVC.swift
//  Piznay
//
//  Created by Dima Kahanets on 21.11.2023.
//

import UIKit
import SnapKit

class OriginBottomSheetVC: BasicBottomSheetVC {
    
    // MARK: UI
    
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupVC()
    }
}

extension OriginBottomSheetVC: UITableViewDelegate, UITableViewDataSource {
    func registerCells() {
        tableView.register(RowDefaultTVC.self, forCellReuseIdentifier: RowDefaultTVC.reuseIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ObjectType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RowDefaultTVC = tableView.dequeueReusableCell(for: indexPath)
        
        let originType = ObjectType.allCases[indexPath.row]
            cell.configure(leftLabelText: originType.rawValue, rightLabelText: originType.rawValue)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedType = ObjectType.allCases[indexPath.row]
           print("Selected item: \(selectedType.rawValue)")
    }
}

extension OriginBottomSheetVC {
    private func setupVC() {
        
        // MARK: Configure UI
        
        tableView = UITableView()
//        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .red
        
        tableView.delegate = self
        tableView.dataSource = self
        
        registerCells()
        setContent(content: tableView)
        
        tableView.snp.makeConstraints { make in
            make.height.equalTo(ObjectType.allCases.count * 44)
        }
    }
}
