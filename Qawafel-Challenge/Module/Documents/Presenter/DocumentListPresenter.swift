//
//  DocumentListPresenter.swift
//  Qawafel-Challenge
//
//  Created by Mohamed Eltaweel on 30/01/2022.
//

import Foundation

protocol DocumentListPresenterOutputContract: AnyObject{
    func onDocumentListFetched(with result: Result<DocumentListResponse,DocumentListFetchError>)
}

protocol DocumentListPresenterInputContract: AnyObject{
    var cells: [DocumentCellViewModel]{get}
    func onSearchRequested(query: String)
    func onDocumentSelected(with index: IndexPath)
}

typealias DocumentListPresenterContract = DocumentListPresenterOutputContract & DocumentListPresenterInputContract
 
class DocumentListPresenter: DocumentListPresenterContract{
    
    var interactor: DocumentListInteractorContract?
    weak var view: DocumentListViewContract?
    var router: DocumentListRouterContract?
    var cells: [DocumentCellViewModel]
    
    init(interactor: DocumentListInteractorContract?,router: DocumentListRouterContract?,view: DocumentListViewContract?){
        self.interactor = interactor
        self.router = router
        self.view = view
        cells = []
    }
    
    func onDocumentListFetched(with result: Result<DocumentListResponse, DocumentListFetchError>) {
        view?.toggleLoading(state: false)
        switch result{
        case .success(let result):
            handleDocuments(with: result)
        case .failure(let error):
            view?.showErrorMessage(message: error.localizedDescription)
        }
    }
    
    private func handleDocuments(with documents: DocumentListResponse){
        guard let docs = documents.docs else{
            view?.showErrorMessage(message: DocumentListFetchError.SERVER_ERROR.localizedDescription)
            return
        }
        cells = docs.map{ DocumentCellViewModel(title: $0.title ?? "", author: $0.author_name?[0] ?? "") }
        view?.refreshList()
    }
    
    func onSearchRequested(query: String) {
        view?.toggleLoading(state: true)
        interactor?.getDocuemntList(from: query)
    }
    
    func onDocumentSelected(with index: IndexPath) {
        let fetchDocument = interactor?.getDocument(from: index.item)
        switch fetchDocument{
        case .success(let doc):
            router?.showDocumentDetails(from: doc)
        default:
            view?.showErrorMessage(message: DocumentListFetchError.DOCUMENT_NOT_FOUND.localizedDescription)
        }
    }
    
    
}
