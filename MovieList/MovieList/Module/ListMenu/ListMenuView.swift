// 
//  ListMenuView.swift
//  MovieList
//
//  Created by MAYU on 15/01/24.
//

import UIKit
import Combine

class ListMenuView: BaseViewController {
    @IBOutlet weak var navigation: NavigationBar!
    @IBOutlet weak var vwCollectionList: UICollectionView!
    
    private var cancellables: Set<AnyCancellable> = []
    var presenter: ListMenuPresenter!
    
    
    
    //MARK: - Function ListMenuView
    override func setUpView() {
        navigation.setNavigationBar("OK")
        vwCollectionList.register(HomeRegulerCVC.nib(), forCellWithReuseIdentifier: HomeRegulerCVC.identifier)
        vwCollectionList.delegate = self
        
        vwCollectionList.dataSource = self
    }
    
    override func setUpData() {
        

    }
    
}

    //MARK: - Extension ListMenuView

extension ListMenuView: ListMenuViewProtocol {
    
}

extension ListMenuView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeRegulerCVC.identifier, for: indexPath) as! HomeRegulerCVC
        
        return cell
    }
    
    
}
