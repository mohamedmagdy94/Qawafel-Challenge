//
//  DocumentListReprository.swift
//  Qawafel-Challenge
//
//  Created by Mohamed Eltaweel on 30/01/2022.
//

import Foundation

protocol DocumentListReprositoryContract{
    func getMovies(query: String,completion: @escaping(Result<DocumentListResponse,HTTPHelper.NetworkError>)->())
}

struct DocumentListReprository: DocumentListReprositoryContract{
        
    func getMovies(query: String,completion: @escaping (Result<DocumentListResponse, HTTPHelper.NetworkError>) -> ()) {
        let requestBody = DocumentListRequest(query: query)
        let request = DocumentListNetworkRouter.getDocuments(request: requestBody)
        NetworkManager.shared.request(router: request) {(result: HTTPHelper.Result<DocumentListResponse>) in
            switch result{
            case .success(let response):
                completion(.success(response))
            case .failure:
                completion(.failure(.serverError))
            }
        }
    }
    
    
}
