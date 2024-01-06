// 
//  HomeRouter.swift
//  MovieList
//
//  Created by Prizega on 06/01/24.
//

import UIKit

class HomeRouter: PTRHomeProtocol {
    
    //MARK: - Property HomeRouter
    

    //MARK: - Lifecycle HomeRouter
    
    
    //MARK: - Function HomeRouter
    static func createHomeModule() -> HomeView {
        let view =  HomeView()
        let presenter =  HomePresenter(viewController: view)
        let interactor : PTIHomeProtocol =  HomeInteractor()
        let router : PTRHomeProtocol =  HomeRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
    
}

    //MARK: - Extension HomeRouter