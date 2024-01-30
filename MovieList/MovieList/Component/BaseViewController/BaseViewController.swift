//
//  BaseViewController.swift
//  MovieList
//
//  Created by MAYU on 16/01/24.
//

import Foundation
import UIKit

class BaseViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDefault()
        setUpView()
        setUpData()
    }
    
    func setUpView(){}
    func setUpData(){}
    
    final private func setUpDefault(){
        navigationItem.hidesBackButton = true
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    
}
