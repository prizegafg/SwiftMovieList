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

class HomeInteractor: PTIHomeProtocol{
    var presenter: ITPHomeProtocol?
    
    func fetchNowPlaying() {
        let headers: HTTPHeaders = [
            "accept": "application/json",
            "Authorization": apiKey
        ]
        
        AF.request(urlNowPlaying, method: .get, headers: headers).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let dataJson = MovieModel(json: json)
                print("Success Now Playing")
                print(dataJson)
                self.presenter?.onSuccessGetNowPlaying(data: dataJson)
                
            case .failure(let error):
                let stringError = AFErrorToString.convertToString(error)
                self.presenter?.onErrorGet(message: stringError)
            }
        }
    }
    
    func fetchTopRated() {
        let headers: HTTPHeaders = [
            "accept": "application/json",
            "Authorization": apiKey
        ]
        
        AF.request(urlTopRated, method: .get, headers: headers).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let dataJson = MovieModel(json: json)
                self.presenter?.onSuccessGetTopRated(data: dataJson)
            case .failure(let error):
                let stringError = AFErrorToString.convertToString(error)
                self.presenter?.onErrorGet(message: stringError)
            }
        }
       
    }
    
    func fetchPopular() {
        let headers: HTTPHeaders = [
            "accept": "application/json",
            "Authorization": apiKey
        ]
        
        AF.request(urlPopular, method: .get, headers: headers).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let dataJson = MovieModel(json: json)
                self.presenter?.onSuccessGetPopular(data: dataJson)
            case .failure(let error):
                let stringError = AFErrorToString.convertToString(error)
                self.presenter?.onErrorGet(message: stringError)
            }
        }
    }
    
    func fetchUpcoming() {
        let headers: HTTPHeaders = [
            "accept": "application/json",
            "Authorization": apiKey
        ]
        
        AF.request(urlUpcoming, method: .get, headers: headers).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let dataJson = MovieModel(json: json)
                self.presenter?.onSuccessGetUpcoming(data: dataJson)
            case .failure(let error):
                let stringError = AFErrorToString.convertToString(error)
                self.presenter?.onErrorGet(message: stringError)
            }
        }
    }

    
}

   
