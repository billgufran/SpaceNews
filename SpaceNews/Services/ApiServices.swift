//
//  ApiServices.swift
//  SpaceNews
//
//  Created by Muhammad Fikri Bill Gufran on 7/5/23.
//

import Foundation
import Alamofire

class ApiService {
    static let shared: ApiService = ApiService()
    private init() { }
    
    private let BASE_URL = "https://api.spaceflightnewsapi.net/v3"
    private let NEWS_ENDPOINT = "/articles"
    
    func loadNews(completion: @escaping (Result<[News], Error>) -> Void) {
        let urlString = "\(BASE_URL)\(NEWS_ENDPOINT)"
        
        AF.request(urlString)
            .validate()
            .responseDecodable(of: [News].self) { response in
                switch response.result {
                case .success(let newsResponse):
//                    debugPrint(newsResponse)
                    completion(.success(newsResponse))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
//            .response { response in
//                switch response.result {
//                case .success(let newsResponse):
//                    completion(.success(newsResponse))
//                case .failure(let error):
//                    completion(.failure(error))
//                }
//            }
    }
}

