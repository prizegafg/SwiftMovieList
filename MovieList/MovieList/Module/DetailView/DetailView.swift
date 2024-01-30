// 
//  DetailView.swift
//  MovieList
//
//  Created by MAYU on 10/01/24.
//

import UIKit

class DetailView: UIViewController {
    
    var presenter: VTPDetailProtocol?

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

    //MARK: - Extension DetailView

extension DetailView: PTVDetailProtocol {

}
