// 
//  DetailPresenter.swift
//  MovieList
//
//  Created by MAYU on 10/01/24.
//

import Foundation
import UIKit

class DetailPresenter: VTPDetailProtocol {
    var view: PTVDetailProtocol?
    var interactor: PTIDetailProtocol?
    var router: PTRDetailProtocol?
    
    func startFetchDetail(id: Int) {
        interactor?.fetchMovieDetail(id: id)
    }
    
    
    
    
}

extension  DetailPresenter : ITPDetailProtocol {
    func onSuccessDetail(data: MovieDetailModel) {
        view?.successDetail(data: data)
    }
    
    func onErrorGet(message: String) {
        view?.errorGet(message: message)
    }
    

}
