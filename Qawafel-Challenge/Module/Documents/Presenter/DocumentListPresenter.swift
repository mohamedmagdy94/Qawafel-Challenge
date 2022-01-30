//
//  DocumentListPresenter.swift
//  Qawafel-Challenge
//
//  Created by Mohamed Eltaweel on 30/01/2022.
//

import Foundation

protocol DocumentListPresenterOutputContract{
    func onMovieListFetched(with result: Result<DocumentListResponse,DocumentListFetchError>)
}
