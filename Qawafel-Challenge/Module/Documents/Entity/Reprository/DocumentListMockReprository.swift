//
//  DocumentListMockReprository.swift
//  Qawafel-Challenge
//
//  Created by Mohamed Eltaweel on 30/01/2022.
//

import Foundation

struct DocumentListMockReprository: DocumentListReprositoryContract{
    func getMovies(query: String, completion: @escaping (Result<DocumentListResponse, HTTPHelper.NetworkError>) -> ()) {
        guard let path = Bundle.main.path(forResource: "MockDocumentListResponse", ofType: "json") else{
            completion(.failure(.serverError))
            return
        }
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else{
            completion(.failure(.serverError))
            return
        }
        let jsonDecoder = JSONDecoder()
        guard let jsonModel = try? jsonDecoder.decode(DocumentListResponse.self, from: data) else{
            completion(.failure(.serverError))
            return
        }
        completion(.success(jsonModel))
    }
}
