// 
//  ListMenuPresenter.swift
//  MovieList
//
//  Created by MAYU on 10/01/24.
//

import Foundation
import UIKit

class ListMenuPresenter: VTPListMenuProtocol {
    
    var view: PTVListMenuProtocol?
    var interactor: PTIListMenuProtocol?
    var router: PTRListMenuProtocol?
    var viewController : ListMenuView!

    init() {}
    
    init(viewController: ListMenuView ) {
        self.viewController = viewController
    }
    
    
    
}

extension  ListMenuPresenter : ITPListMenuProtocol {

}
