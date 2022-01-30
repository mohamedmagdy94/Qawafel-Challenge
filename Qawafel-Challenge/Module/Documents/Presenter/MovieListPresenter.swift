//
//  MovieListPresenter.swift
//  Qawafel-Challenge
//
//  Created by Mohamed Eltaweel on 30/01/2022.
//

import Foundation

protocol MovieListPresenterOutputContract{
    func onMovieListFetched(with result: Result<MovieListResponse,MovieListFetchError>)
}
