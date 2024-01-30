// 
//  ListMenuProtocol.swift
//  MovieList
//
//  Created by MAYU on 15/01/24.
//

import UIKit
import Combine

protocol ListMenuViewProtocol: AnyObject {
    
}

protocol ListMenuPresenterProtocol: AnyObject {
    var view: ListMenuViewProtocol!{ get set }
    var interactor: ListMenuInteractorProtocol! { get set }
    var router: ListMenuRouterProtocol! { get set }
    
    func loadData()
}

protocol ListMenuInteractorProtocol: AnyObject {
    var presenter: ListMenuPresenterProtocol! { get set }
}

protocol ListMenuRouterProtocol: AnyObject {
    static func createListMenuModule() -> ListMenuView
    
}

