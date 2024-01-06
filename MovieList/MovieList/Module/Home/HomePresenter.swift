// 
//  HomePresenter.swift
//  MovieList
//
//  Created by Prizega on 06/01/24.
//

import Foundation
import UIKit

class HomePresenter: VTPHomeProtocol {
    var view: PTVHomeProtocol?
    var interactor: PTIHomeProtocol?
    var router: PTRHomeProtocol?
    var viewController : HomeView!
    
    init() {}
    
    init(viewController: HomeView ) {
        self.viewController = viewController
    }
    
    func startGetData() {
        interactor?.getNowPlaying()
        interactor?.getTopRated()
    }
    
    
}

    //MARK: - Extension HomePresenter
extension  HomePresenter : ITPHomeProtocol {
    func onSuccessGetNowPlaying(data: NowPlayingModel) {
        view?.successGetNowPlaying(data: data)
    }
    
    func onSuccessGetTopRated() {
        view?.successGetTopRated()
    }
    
    func onErrorGet(message: String) {
        view?.errorGet(message: message)
    }
    

}
