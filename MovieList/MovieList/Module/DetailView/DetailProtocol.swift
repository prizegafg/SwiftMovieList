// 
//  DetailProtocol.swift
//  MovieList
//
//  Created by MAYU on 10/01/24.
//

import UIKit

protocol VTPDetailProtocol: AnyObject {
    var view: PTVDetailProtocol? { get set }
    var interactor: PTIDetailProtocol? { get set }
    var router: PTRDetailProtocol? { get set }
    
    func startFetchDetail(id: Int)
    
}

protocol PTIDetailProtocol: AnyObject {
    var presenter: ITPDetailProtocol? { get set }
    func fetchMovieDetail(id: Int)

}

protocol ITPDetailProtocol: AnyObject {
    func onSuccessDetail(data: MovieDetailModel)
    func onErrorGet(message: String)
}

protocol PTVDetailProtocol: AnyObject {
    func successDetail(data: MovieDetailModel)
    func errorGet(message: String)
}

protocol PTRDetailProtocol: AnyObject {
    static func createDetailModule() -> DetailView
    
}
