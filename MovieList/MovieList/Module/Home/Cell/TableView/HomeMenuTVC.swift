//
//  HomeMenuTVC.swift
//  MovieList
//
//  Created by MAYU on 13/01/24.
//

import UIKit

class HomeMenuTVC: UITableViewCell {
    @IBOutlet weak var vwCollection: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var vwCollectionCard: UICollectionView!
    
    var dataMain: HomeRegulerModel?
    weak var presenter: VTPHomeProtocol?
    var navigationController: UINavigationController?
    
    static let identifier = "HomeMenuTVC"
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        lblTitle.text = ""
    }
    
    func setUpView(){
        vwCollection.layer.cornerRadius = 20
        vwCollectionCard.delegate = self
        vwCollectionCard.dataSource = self
        vwCollectionCard.register(HomeRegulerCVC.nib(), forCellWithReuseIdentifier: HomeRegulerCVC.identifier)
    }
    
    func setUpTableCell(title: String, data: HomeRegulerModel){
        lblTitle.text = title
        dataMain = data
        vwCollectionCard.reloadData()
        
    }
    
}

extension HomeMenuTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let titleCount = dataMain?.title.count ?? 10
        return titleCount
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected item at indexPath: \(indexPath)")
        if let navController = navigationController {
            presenter?.goToDetail(id: dataMain?.id[indexPath.item] ?? 0, nav: navController)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeRegulerCVC.identifier, for: indexPath) as! HomeRegulerCVC
        let title = dataMain?.title == [""] ? "Fetching" : dataMain?.title[indexPath.item] ?? "NA"
        let rating = dataMain?.rating == [""] ? "Fetching" : dataMain?.rating[indexPath.item] ?? "NA"
        let image = dataMain?.image == [""] ? "" : dataMain?.image[indexPath.item] ?? ""
        
        cell.setUpCell(title: title, rating: rating, image: image)
        cell.vwCollection.layer.cornerRadius = 60
        cell.showAnimatedGradientSkeleton()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 220)
//        Int(UIScreen.main.bounds.width)
    }
    
    
}
