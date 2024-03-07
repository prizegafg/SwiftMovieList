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
    
    
    func startLoadData() {
//        interactor.fetchMovieList(url: urlNowPlaying, page: 1)
//        interactor.fetchMovieList(url: urlPopular, page: 2)
//        interactor.fetchMovieList(url: urlTopRated, page: 3)
//        interactor.fetchMovieList(url: urlUpcoming, page: 4)
        interactor.fetchNowPlaying()
        interactor.fetchPopular()
        interactor.fetchTopRated()
        interactor.fetchUpcoming()
        interactor.fetchGenre()
    }
    
    func goToDetail(id: Int, nav: UINavigationController) {
        router.navToDetail(id: id, nav: nav)
    }
    
}

    //MARK: - Extension HomePresenter
extension  HomePresenter : ITPHomeProtocol {
    func onSuccessGetMovie(data: MovieModel, page: Int) {
        view?.successGetMovie(data: data, page: page)
    }
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
