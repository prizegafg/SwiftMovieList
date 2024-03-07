//
//  HomeRegulerCVC.swift
//  MovieList
//
//  Created by MAYU on 12/01/24.
//

import UIKit
import Kingfisher
import SkeletonView

class HomeRegulerCVC: UICollectionViewCell {
    @IBOutlet weak var vwCollection: UIView!
    @IBOutlet weak var imgCollection: UIImageView!
    @IBOutlet weak var vwBackgroundTitle: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    
    static let identifier = "HomeRegulerCVC"
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        vwCollection.layer.cornerRadius = 40
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        lblTitle.text = ""
        lblRating.text = "Rating : "
        imgCollection.image = UIImage(named: "")
        vwCollection.layer.cornerRadius = 40
    }
    
    func setUpCell(title: String, rating: String, image: String){
        if title != nil || title != ""{
            lblTitle.text = title
            lblRating.text = "Rating : \(rating)"
            imgCollection.kf.setImage(with: URL(string: "\(DefaultImageURL)\(image)"))
            vwCollection.layer.cornerRadius = 40
            hideSkeleton()
        } else {
            let gradient = SkeletonGradient(baseColor: UIColor.clouds)
            lblTitle.showAnimatedGradientSkeleton(usingGradient: gradient)
            lblRating.showAnimatedGradientSkeleton(usingGradient: gradient)
            imgCollection.showAnimatedGradientSkeleton(usingGradient: gradient)
            
        }
    }
    

}
