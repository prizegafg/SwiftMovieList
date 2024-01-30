// 
//  ListMenuPresenter.swift
//  MovieList
//
//  Created by MAYU on 15/01/24.
//

import UIKit
import Combine

class ListMenuPresenter: ListMenuPresenterProtocol {
    //MARK: - Property ListMenuPresenter
    var view: ListMenuViewProtocol!
    var interactor: ListMenuInteractorProtocol!
    var router: ListMenuRouterProtocol!
    
    private var cancellables: Set<AnyCancellable> = []
//    @Published var getListData = PassthroughSubject<Void, Never>()
//        var fetchListData: AnyPublisher<Void, Never> {
//            presenter.fetchDataSubject.eraseToAnyPublisher()
//        }
    
    
    init(view: ListMenuViewProtocol, interactor: ListMenuInteractorProtocol, router: ListMenuRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
//        setupDataSubscription()
    }
    
    @Published var cellNumb: Int = 1
    
    //MARK: - Function ListMenuPresenter
    
    
    
    func loadData() {
//        view?.fetchDataPublisher
//            .sink { [weak self] _ in
//                // Fetch data from a service or other source
//                self?.fetchData()
//            }
//            .store(in: &cancellables)

        
        
        
    }
    
}

