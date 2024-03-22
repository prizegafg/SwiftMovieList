//
//  BaseViewController.swift
//  MovieList
//
//  Created by Prizega on 21/03/24.
//

import Foundation
import UIKit

class BaseViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDefault()
        didLoad()
    }
    
    // MARK: Rename dengan did load, did appear, dst
    func didLoad(){}
    
    final private func setUpDefault(){
        navigationItem.hidesBackButton = true
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func showError(message: String) {
        Alert.showGeneralAlert(title: "Error", message: message, viewController: self)
    }
    
    
}
