// 
//  HomeInteractor.swift
//  MovieList
//
//  Created by Prizega on 06/01/24.
//

import Alamofire
import Foundation
import SwiftyJSON
import UIKit

class HomeInteractor: PTIHomeProtocol {
    
    var presenter: ITPHomeProtocol?
    
    func getNowPlaying() {
        let headers: HTTPHeaders = [
            "accept": "application/json",
            "Authorization": "Bearer \(apiKey)"
        ]
        
        AF.request(urlNowPlaying, method: .get, headers: headers).validate().responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    let dataJson = NowPlayingModel(json: json)
                    self.presenter?.onSuccessGetNowPlaying(data: dataJson)
                    
                case .failure(let error):
                    let stringError = AFErrorToString.convertToString(error)
                    self.presenter?.onErrorGet(message: stringError)
                }
            }
    }
    
    func getTopRated() {
        let headers: HTTPHeaders = [
            "accept": "application/json",
            "Authorization": "Bearer \(apiKey)"
        ]
        
        AF.request(urlTopRated, method: .get, headers: headers).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let dataJson = TopRatedModel(json: json)
            case .failure(let error):
                let stringError = AFErrorToString.convertToString(error)
                self.presenter?.onErrorGet(message: stringError)
            }
        }
    }
    
    func getPopular() {
        let headers: HTTPHeaders = [
            "accept": "application/json",
            "Authorization": "Bearer \(apiKey)"
        ]
        
        AF.request(urlPopular, method: .get, headers: headers).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let dataJson = PopularModel(json: json)
            case .failure(let error):
                let stringError = AFErrorToString.convertToString(error)
                self.presenter?.onErrorGet(message: stringError)
            }
        }
    }
    
}

   
