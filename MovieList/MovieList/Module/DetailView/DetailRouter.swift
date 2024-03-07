// 
//  DetailRouter.swift
//  MovieList
//
//  Created by MAYU on 10/01/24.
//

import UIKit

class DetailRouter: PTRDetailProtocol {
    
    //MARK: - Function DetailRouter
    static func createDetailModule() -> DetailView {
        let view =  DetailView()
        let presenter =  DetailPresenter()
        let interactor : PTIDetailProtocol =  DetailInteractor()
        let router : PTRDetailProtocol =  DetailRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
    
}

    //MARK: - Extension DetailRouter
