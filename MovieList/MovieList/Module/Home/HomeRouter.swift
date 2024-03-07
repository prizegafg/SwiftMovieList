// 
//  HomeRouter.swift
//  MovieList
//
//  Created by Prizega on 06/01/24.
//

import UIKit


class HomeRouter: PTRHomeProtocol {
    //MARK: - Function HomeRouter
    static func createHomeModule() -> HomeView {
        let view =  HomeView()
        let presenter =  HomePresenter()
        let interactor : PTIHomeProtocol =  HomeInteractor()
        let router : PTRHomeProtocol =  HomeRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
    
    func navToListView(data: MovieModel, nav: UINavigationController) {
        let vw = ListMenuRouter.createListMenuModule()
        nav.pushViewController(vw, animated: true)
        
    }
    
    func navToDetail(id: Int, nav: UINavigationController) {
        let vw = DetailRouter.createDetailModule()
        vw.movieId = id
        nav.pushViewController(vw, animated: true)
    }
    
    
}

   
