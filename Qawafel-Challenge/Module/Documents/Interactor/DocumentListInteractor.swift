//
//  MovieListInteractor.swift
//  Qawafel-Challenge
//
//  Created by Mohamed Eltaweel on 30/01/2022.
//

import Foundation

protocol DocumentListInteractorContract{
    func getDocuemntList(from query: String)
    func getDocument(from index: Int)->Result<Doc,DocumentListFetchError>
    func setPresenter(with presenter: DocumentListPresenterOutputContract)
}

class DocumentListInteractor: DocumentListInteractorContract{

    private var reprository: DocumentListReprositoryContract
    private var presenter: DocumentListPresenterOutputContract?
    private var response: DocumentListResponse?
    
    init(reprository: DocumentListReprositoryContract, presenter: DocumentListPresenterOutputContract?) {
        self.reprository = reprository
        self.presenter = presenter
    }
    
    func setPresenter(with presenter: DocumentListPresenterOutputContract) {
        self.presenter = presenter
    }
    
    func getDocuemntList(from query: String) {
        let queryValidationResult = validateQuery(query: query)
        if queryValidationResult{
            reprository.getMovies(query: query,completion: handleResponse(result:))
        }else{
            presenter?.onDocumentListFetched(with: .failure(.WRONG_QUERY))
        }
    }
    
    private func validateQuery(query: String)->Bool{
        return !query.isEmpty
    }
    
    private func handleResponse(result: Result<DocumentListResponse,HTTPHelper.NetworkError>){
        switch result{
        case .success(let response):
            self.response = response
            presenter?.onDocumentListFetched(with: .success(response))
        case .failure:
            presenter?.onDocumentListFetched(with: .failure(.SERVER_ERROR))
        }
    }
    
    func getDocument(from index: Int) -> Result<Doc, DocumentListFetchError> {
        guard let document = response?.docs?[index] else{
            return Result.failure(DocumentListFetchError.DOCUMENT_NOT_FOUND)
        }
        return Result.success(document)
    }
    
}


