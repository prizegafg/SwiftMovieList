// 
//  DetailPresenter.swift
//  MovieList
//
//  Created by MAYU on 10/01/24.
//

import Foundation
import UIKit

class DetailPresenter: VTPDetailProtocol {
    
    var view: PTVDetailProtocol?
    var interactor: PTIDetailProtocol?
    var router: PTRDetailProtocol?
    var viewController : DetailView!

    init() {}
    
    init(viewController: DetailView ) {
        self.viewController = viewController
    }
    
    
    
}

extension  DetailPresenter : ITPDetailProtocol {

}
