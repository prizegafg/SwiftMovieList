// 
//  HomeView.swift
//  MovieList
//
//  Created by Prizega on 06/01/24.
//

import UIKit
import Kingfisher
import SkeletonView


class HomeView: BaseViewController {
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var vwTableHome: UITableView!
    
    var presenter: VTPHomeProtocol!
    var timer: Timer!
    var imgNowPlaying: [String] = []
    var currentIndex = 0
    
    var nowPlaying: MovieModel?
    var popular: MovieModel?
    var topRated: MovieModel?
    var upcoming: MovieModel?
    
    override func setUpView() {
        lblUserName.text = "Hello, Anonymous"
        vwTableHome.register(HomeMenuTVC.nib(), forCellReuseIdentifier: HomeMenuTVC.identifier)
        vwTableHome.delegate = self
        vwTableHome.dataSource = self
    }
    
    override func setUpData() {
        presenter.startLoadData()
    }
    
    
    
}

//MARK: PTV HomeView

extension HomeView: PTVHomeProtocol {
    
    
    func successGetNowPlaying(data: MovieModel) {
        nowPlaying = data
        vwTableHome.reloadData()
    }
    
    func successGetPopular(data: MovieModel) {
        popular = data
        vwTableHome.reloadData()
    }
    
    func successGetTopRated(data: MovieModel) {
        topRated = data
        vwTableHome.reloadData()
    }
    
    func successGetUpcoming(data: MovieModel) {
        upcoming = data
        vwTableHome.reloadData()
    }
    
    
    func errorGet(message: String) {
        Alert.showGeneralAlert(title: "Error", message: message, viewController: self)
    }
}

extension HomeView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeMenuTVC.identifier, for: indexPath) as! HomeMenuTVC
        switch indexPath.row {
        case 0:
            var title: [String] = []
            var rating: [String] = []
            var image: [String] = []
            var id: [Int] = []
            
            if let dataNow = nowPlaying?.movies{
                for data in dataNow {
                    title.append(data.title)
                    rating.append(String(data.voteAverage))
                    image.append(data.posterPath)
                    id.append(data.id)
                }
            }
            
            
            let model = HomeRegulerModel(
                title: title,
                rating: rating, 
                image: image,
                id: id)
           
            cell.setUpTableCell(title: "Now Playing", data: model)
            
        case 1:
            var title: [String] = []
            var rating: [String] = []
            var image: [String] = []
            var id: [Int] = []
            
            if let dataNow = popular?.movies{
                for data in dataNow {
                    title.append(data.title)
                    rating.append(String(data.voteAverage))
                    image.append(data.posterPath)
                    id.append(data.id)
                }
            }
            
            let model = HomeRegulerModel(
                title: title,
                rating: rating,
                image: image,
                id: id)
            cell.setUpTableCell(title: "Popular", data: model)
            
        case 2:
            var title: [String] = []
            var rating: [String] = []
            var image: [String] = []
            var id: [Int] = []
            
            if let dataNow = topRated?.movies{
                for data in dataNow {
                    title.append(data.title)
                    rating.append(String(data.voteAverage))
                    image.append(data.posterPath)
                    id.append(data.id)
                }
            }
            
            let model = HomeRegulerModel(
                title: title,
                rating: rating,
                image: image,
                id: id)
            cell.setUpTableCell(title: "Top Rated", data: model)
            
        case 3:
            var title: [String] = []
            var rating: [String] = []
            var image: [String] = []
            var id: [Int] = []
            
            if let dataNow = upcoming?.movies{
                for data in dataNow {
                    title.append(data.title)
                    rating.append(String(data.voteAverage))
                    image.append(data.posterPath)
                    id.append(data.id)
                }
            }
            
            let model = HomeRegulerModel(
                title: title,
                rating: rating,
                image: image,
                id: id)
            cell.setUpTableCell(title: "Upcoming", data: model)
        default: break
        }
        
        return cell
    }
    
    
}

