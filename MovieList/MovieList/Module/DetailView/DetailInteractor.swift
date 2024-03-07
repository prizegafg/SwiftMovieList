// 
//  DetailInteractor.swift
//  MovieList
//
//  Created by MAYU on 10/01/24.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class DetailInteractor: PTIDetailProtocol {
    
    
    
    var presenter: ITPDetailProtocol?
    
    func fetchMovieDetail(id: Int){
        let headers: HTTPHeaders = [
            "accept": "application/json",
            "Authorization": apiKey
        ]
        
        AF.request("\(urlDetail)\(id)?language=en-US", method: .get, headers: headers).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let dataJson = MovieDetailModel(json: json)
                print("Success Now Playing")
                print(dataJson)
                self.presenter?.onSuccessDetail(data: dataJson)
                
            case .failure(let error):
                let stringError = AFErrorToString.convertToString(error)
                self.presenter?.onErrorGet(message: stringError)
            }
        }
    }
    
    
    
    
}

   
