// 
//  HomeView.swift
//  MovieList
//
//  Created by Prizega on 06/01/24.
//

import UIKit
import Kingfisher

class HomeView: UIViewController {
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var vwScrollNowPlaying: UIScrollView!
    @IBOutlet weak var pcNowPlaying: UIPageControl!
    
    
    var presenter: VTPHomeProtocol?
    var timer: Timer!
    var imgNowPlaying: [String] = []
    var currentIndex = 0
    
    
    override func viewDidLoad() {
        setUpView()
        setUpData()
    }
    
    func setUpView(){
        vwScrollNowPlaying.isPagingEnabled = true
        vwScrollNowPlaying.delegate = self
        vwScrollNowPlaying.contentSize = CGSize(width: vwScrollNowPlaying.frame.width * CGFloat(imgNowPlaying.count), height: vwScrollNowPlaying.frame.height)
    }
    
    func setUpData(){
        presenter?.startGetData()
        
    }
    
    @objc func scrollToNextPage() {
        currentIndex = (currentIndex + 1) % imgNowPlaying.count
        let x = CGFloat(currentIndex) * vwScrollNowPlaying.frame.size.width
        vwScrollNowPlaying.setContentOffset(CGPoint(x: x, y: 0), animated: true)
    }
    
    
    
}

//MARK: PTV HomeView

extension HomeView: PTVHomeProtocol {
    func successGetNowPlaying(data: NowPlayingModel) {
        for movies in data.movies {
            imgNowPlaying.append(movies.posterPath)
        }
        
        setupScrollView()
        setupPageControl()
    }
    
    func successGetTopRated() {
        
    }
    
    
    func errorGet(message: String) {
        Alert.showGeneralAlert(title: "Error", message: message, viewController: self)
    }
}

extension HomeView: UIScrollViewDelegate{
    func setupScrollView() {
        for i in 0..<imgNowPlaying.count {
            let imageView = UIImageView(frame: CGRect(x: CGFloat(i) * vwScrollNowPlaying.frame.width, y: 0, width: vwScrollNowPlaying.frame.width, height: vwScrollNowPlaying.frame.height))
            imageView.contentMode = .scaleToFill
            imageView.kf.setImage(with: URL(string: "\(DefaultImageURL)\(imgNowPlaying[i])"))
            vwScrollNowPlaying.addSubview(imageView)
        }
    }
    
    func setupPageControl() {
        pcNowPlaying.numberOfPages = imgNowPlaying.count
        pcNowPlaying.currentPage = 0
        pcNowPlaying.tintColor = UIColor.red
        pcNowPlaying.pageIndicatorTintColor = UIColor.gray
        pcNowPlaying.currentPageIndicatorTintColor = UIColor.black
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(scrollToNextPage), userInfo: nil, repeats: true)
    }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pcNowPlaying.currentPage = Int(pageIndex)
        currentIndex = Int(pageIndex)
    }
}
