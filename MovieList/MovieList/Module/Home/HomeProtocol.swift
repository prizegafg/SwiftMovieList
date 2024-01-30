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
    
}

protocol PTIHomeProtocol: AnyObject {
    var presenter: ITPHomeProtocol? { get set }
    func fetchNowPlaying()
    func fetchTopRated()
    func fetchPopular()
    func fetchUpcoming()

}

protocol ITPHomeProtocol: AnyObject {
    func onSuccessGetNowPlaying(data: MovieModel)
    func onSuccessGetPopular(data: MovieModel)
    func onSuccessGetTopRated(data: MovieModel)
    func onSuccessGetUpcoming(data: MovieModel)
    func onErrorGet(message: String)
    
}

protocol PTVHomeProtocol: AnyObject {
    
    func successGetNowPlaying(data: MovieModel)
    func successGetPopular(data: MovieModel)
    func successGetTopRated(data: MovieModel)
    func successGetUpcoming(data: MovieModel)
    func errorGet(message: String)
}

protocol PTRHomeProtocol: AnyObject {
    static func createHomeModule() -> HomeView
    func navToListView(nav: UINavigationController)
    func navToDetail(nav: UINavigationController)
    
}





