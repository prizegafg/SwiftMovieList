// 
//  ListMenuRouter.swift
//  MovieList
//
//  Created by MAYU on 10/01/24.
//

import UIKit

class ListMenuRouter: PTRListMenuProtocol {
    
    //MARK: - Property ListMenuRouter
    

    //MARK: - Lifecycle ListMenuRouter
    
    
    //MARK: - Function ListMenuRouter
    static func createListMenuModule() -> ListMenuView {
        let view =  ListMenuView()
        let presenter =  ListMenuPresenter(viewController: view)
        let interactor : PTIListMenuProtocol =  ListMenuInteractor()
        let router : PTRListMenuProtocol =  ListMenuRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
    
}

    //MARK: - Extension ListMenuRouter
