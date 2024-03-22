// 
//  HomeMenuRouter.swift
//  MovieList
//
//  Created by Prizega on 21/03/24.
//

import UIKit

class HomeMenuRouter {
    

    //MARK: - Lifecycle HomeMenuRouter
    weak var viewController: UIViewController?
    
    
    //MARK: - Function HomeMenuRouter
    func createHomeMenuModule() -> HomeMenuView {
        
        let viewID = String(describing: HomeMenuView.self)
        let view = UIStoryboard(name: viewID, bundle: nil)
        guard let view = view.instantiateViewController(withIdentifier: viewID) as? HomeMenuView else {
            fatalError("Error loading Storyboard")
        }
        
        let interactor = HomeMenuInteractor()
        let router = HomeMenuRouter()
        router.viewController = view
        let presenter = HomeMenuPresenter(interactor: interactor, router: router)
        view.presenter = presenter
        return view
        
    }
    
}

    //MARK: - Extension HomeMenuRouter
