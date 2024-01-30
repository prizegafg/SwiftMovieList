// 
//  HomePresenter.swift
//  MovieList
//
//  Created by Prizega on 06/01/24.
//

import Foundation
import UIKit

class HomePresenter: VTPHomeProtocol {
    
    var view: PTVHomeProtocol!
    var interactor: PTIHomeProtocol!
    var router: PTRHomeProtocol!
    var viewController : HomeView!

    init() {}
    
    init(viewController: HomeView ) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController.setUpView()
    }
    
    
    func startLoadData() {
        interactor.fetchNowPlaying()
        interactor.fetchPopular()
        interactor.fetchTopRated()
        interactor.fetchUpcoming()
    }
    
    
}

    //MARK: - Extension HomePresenter
extension  HomePresenter : ITPHomeProtocol {
    func onSuccessGetNowPlaying(data: MovieModel) {
        view.successGetNowPlaying(data: data)
    }
    
    func onSuccessGetPopular(data: MovieModel) {
        view?.successGetPopular(data: data)
    }
    
    func onSuccessGetTopRated(data: MovieModel) {
        view?.successGetTopRated(data: data)
    }
    
    func onSuccessGetUpcoming(data: MovieModel) {
        view?.successGetUpcoming(data: data)
    }
    
    func onErrorGet(message: String) {
        view.errorGet(message: message)
    }
    

}
