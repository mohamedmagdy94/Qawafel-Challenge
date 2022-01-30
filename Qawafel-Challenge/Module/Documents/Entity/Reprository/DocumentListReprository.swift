//
//  DocumentListReprository.swift
//  Qawafel-Challenge
//
//  Created by Mohamed Eltaweel on 30/01/2022.
//

import Foundation

protocol DocumentListReprositoryContract{
    func getDocuments(query: String,completion: @escaping(Result<DocumentListResponse,HTTPHelper.NetworkError>)->())
    func getDocuments(name: String,completion: @escaping(Result<DocumentListResponse,HTTPHelper.NetworkError>)->())
    func getDocuments(author: String,completion: @escaping(Result<DocumentListResponse,HTTPHelper.NetworkError>)->())
}

struct DocumentListReprository: DocumentListReprositoryContract{
        
    func getDocuments(query: String,completion: @escaping (Result<DocumentListResponse, HTTPHelper.NetworkError>) -> ()) {
        let requestBody = DocumentListRequest(query: query)
        getDocuments(requestBody: requestBody, completion: completion)
    }
    
    func getDocuments(name: String,completion: @escaping (Result<DocumentListResponse, HTTPHelper.NetworkError>) -> ()) {
        let requestBody = DocumentListRequest(title: name)
        getDocuments(requestBody: requestBody, completion: completion)
    }
    
    func getDocuments(author: String,completion: @escaping (Result<DocumentListResponse, HTTPHelper.NetworkError>) -> ()) {
        let requestBody = DocumentListRequest(author: author)
        getDocuments(requestBody: requestBody, completion: completion)
    }
    
    private func getDocuments(requestBody: DocumentListRequest,completion: @escaping (Result<DocumentListResponse, HTTPHelper.NetworkError>) -> ()){
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
