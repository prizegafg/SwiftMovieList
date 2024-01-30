// 
//  ListMenuView.swift
//  MovieList
//
//  Created by MAYU on 10/01/24.
//

import UIKit

class ListMenuView: UIViewController {
    
    var presenter: VTPListMenuProtocol?

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

    //MARK: - Extension ListMenuView

extension ListMenuView: PTVListMenuProtocol {

}
