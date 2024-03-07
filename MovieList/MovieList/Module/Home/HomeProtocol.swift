// 
//  HomeProtocol.swift
//  MovieList
//
//  Created by Prizega on 06/01/24.
//

import UIKit

protocol VTPHomeProtocol: AnyObject {
    var view: PTVHomeProtocol! { get set }
    var interactor: PTIHomeProtocol! { get set }
    var router: PTRHomeProtocol! { get set }
    func startLoadData()
    func goToDetail(id: Int, nav: UINavigationController)
    
}

protocol PTIHomeProtocol: AnyObject {
    var presenter: ITPHomeProtocol? { get set }
    func fetchMovieList(url: String, page: Int)
    func fetchNowPlaying()
    func fetchTopRated()
    func fetchPopular()
    func fetchUpcoming()
    func fetchGenre()

}

protocol ITPHomeProtocol: AnyObject {
    func onSuccessGetMovie(data: MovieModel, page: Int)
    func onSuccessGetNowPlaying(data: MovieModel)
    func onSuccessGetPopular(data: MovieModel)
    func onSuccessGetTopRated(data: MovieModel)
    func onSuccessGetUpcoming(data: MovieModel)
    func onErrorGet(message: String)
    
}

protocol PTVHomeProtocol: AnyObject {
    func successGetMovie(data: MovieModel, page: Int)
    
    func successGetNowPlaying(data: MovieModel)
    func successGetPopular(data: MovieModel)
    func successGetTopRated(data: MovieModel)
    func successGetUpcoming(data: MovieModel)
    func errorGet(message: String)
}

protocol PTRHomeProtocol: AnyObject {
    static func createHomeModule() -> HomeView
    func navToListView(data: MovieModel, nav: UINavigationController)
    func navToDetail(id: Int, nav: UINavigationController)
    
}





