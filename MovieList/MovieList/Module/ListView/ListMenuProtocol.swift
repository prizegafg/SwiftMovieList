// 
//  ListMenuProtocol.swift
//  MovieList
//
//  Created by MAYU on 10/01/24.
//

import UIKit

protocol VTPListMenuProtocol: AnyObject {
    var view: PTVListMenuProtocol? { get set }
    var interactor: PTIListMenuProtocol? { get set }
    var router: PTRListMenuProtocol? { get set }
    
}

protocol PTVListMenuProtocol: AnyObject {
    
}

protocol PTIListMenuProtocol: AnyObject {
    var presenter: ITPListMenuProtocol? { get set }

}

protocol ITPListMenuProtocol: AnyObject {
    
}

protocol PTRListMenuProtocol: AnyObject {
    static func createListMenuModule() -> ListMenuView
    
}
