// 
//  HomeProtocol.swift
//  MovieList
//
//  Created by Prizega on 06/01/24.
//

import UIKit

protocol VTPHomeProtocol: AnyObject {
    var view: PTVHomeProtocol? { get set }
    var interactor: PTIHomeProtocol? { get set }
    var router: PTRHomeProtocol? { get set }
    
    func startGetData()
    
}

protocol PTIHomeProtocol: AnyObject {
    var presenter: ITPHomeProtocol? { get set }
    func getNowPlaying()
    func getTopRated()
    func getPopular()

}

protocol ITPHomeProtocol: AnyObject {
    func onSuccessGetNowPlaying(data: NowPlayingModel)
    func onSuccessGetTopRated()
    func onErrorGet(message: String)
    
}

protocol PTVHomeProtocol: AnyObject {
    func successGetNowPlaying(data: NowPlayingModel)
    func successGetTopRated()
    func errorGet(message: String)
}

protocol PTRHomeProtocol: AnyObject {
    static func createHomeModule() -> HomeView
    
}
