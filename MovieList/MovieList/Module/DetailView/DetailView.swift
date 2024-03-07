// 
//  DetailView.swift
//  MovieList
//
//  Created by MAYU on 10/01/24.
//

import UIKit
import WebKit
import Kingfisher

class DetailView: BaseViewController {
    @IBOutlet weak var navigationBar: NavigationBar!
    @IBOutlet weak var lblGenre: UILabel!
    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var webViewTrailer: WKWebView!
    
    
    var presenter: VTPDetailProtocol?
    var movieId: Int?
    var detailData: MovieDetailModel?

    
    override func setUpView() {
        
    }
    
    override func setUpData() {
        presenter?.startFetchDetail(id: movieId ?? 0)
    }
    
    func setUpVW(){
        navigationBar.setNavigationBar(detailData?.title ?? "")
        var genreTitle = ""
        if let dataDetail = detailData?.genres{
            for i in dataDetail{
                if genreTitle == ""{
                    genreTitle = i.name
                } else {
                    genreTitle = genreTitle + ", \(i.name)"
                }
            }
        }
        lblGenre.text = genreTitle
        print("BACKDROP PATH : \(detailData?.backdropPath ?? "")")
        imgMovie.kf.setImage(with: URL(string: "\(DefaultImageURL)\(detailData?.backdropPath ?? "")" ))
        lblDetail.text = detailData?.overview
        webViewTrailer.url = URL(string: "\()")
        
        
    }
}

    //MARK: - Extension DetailView

extension DetailView: PTVDetailProtocol {
    func successDetail(data: MovieDetailModel) {
        detailData = data
        setUpVW()
    }
    
    func errorGet(message: String) {
        Alert.showGeneralAlert(title: "Error", message: message, viewController: self)
    }

}
