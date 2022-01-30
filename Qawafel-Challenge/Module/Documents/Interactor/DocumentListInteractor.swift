//
//  MovieListInteractor.swift
//  Qawafel-Challenge
//
//  Created by Mohamed Eltaweel on 30/01/2022.
//

import Foundation

protocol DocumentListInteractorContract{
    func getDocuemntList(from query: String)
}

class DocumentListInteractor: DocumentListInteractorContract{

    private var reprository: DocumentListReprositoryContract
    private var presenter: DocumentListPresenterOutputContract
    
    init(reprository: DocumentListReprositoryContract, presenter: DocumentListPresenterOutputContract) {
        self.reprository = reprository
        self.presenter = presenter
    }
    
    func getDocuemntList(from query: String) {
        reprository.getMovies(query: query,completion: handleResponse(result:))
    }
    
    private func handleResponse(result: Result<DocumentListResponse,HTTPHelper.NetworkError>){
        switch result{
        case .success(let response):
            presenter.onMovieListFetched(with: .success(response))
        case .failure:
            presenter.onMovieListFetched(with: .failure(.SERVER_ERROR))
        }
    }
    
}


