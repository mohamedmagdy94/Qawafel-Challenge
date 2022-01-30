//
//  MovieListInteractor.swift
//  Qawafel-Challenge
//
//  Created by Mohamed Eltaweel on 30/01/2022.
//

import Foundation

protocol MovieListInteractorContract{
    func getMovieList()
}

class MovieListInteractor: MovieListInteractorContract{

    private var reprository: MovieListReprositoryContract
    private var presenter: MovieListPresenterOutputContract
    
    init(reprository: MovieListReprositoryContract, presenter: MovieListPresenterOutputContract) {
        self.reprository = reprository
        self.presenter = presenter
    }
    
    func getMovieList() {
        reprository.getMovies(completion: handleResponse(result:))
    }
    
    private func handleResponse(result: Result<MovieListResponse,HTTPHelper.NetworkError>){
        switch result{
        case .success(let response):
            presenter.onMovieListFetched(with: .success(response))
        case .failure:
            presenter.onMovieListFetched(with: .failure(.SERVER_ERROR))
        }
    }
    
}


