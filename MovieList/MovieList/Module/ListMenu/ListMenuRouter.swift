// 
//  ListMenuRouter.swift
//  MovieList
//
//  Created by MAYU on 15/01/24.
//

import UIKit
import Combine

class ListMenuRouter: ListMenuRouterProtocol {
    
    
    //MARK: - Function ListMenuRouter
    static func createListMenuModule() -> ListMenuView {
        let view = ListMenuView()
        let interactor = ListMenuInteractor()
        let router = ListMenuRouter()
        let presenter = ListMenuPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
        return view
    }
    
}

    
