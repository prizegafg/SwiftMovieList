// 
//  DetailProtocol.swift
//  MovieList
//
//  Created by MAYU on 10/01/24.
//

import UIKit

protocol VTPDetailProtocol: AnyObject {
    var view: PTVDetailProtocol? { get set }
    var interactor: PTIDetailProtocol? { get set }
    var router: PTRDetailProtocol? { get set }
    
}

protocol PTVDetailProtocol: AnyObject {
    
}

protocol PTIDetailProtocol: AnyObject {
    var presenter: ITPDetailProtocol? { get set }

}

protocol ITPDetailProtocol: AnyObject {
    
}

protocol PTRDetailProtocol: AnyObject {
    static func createDetailModule() -> DetailView
    
}
