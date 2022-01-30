//
//  DocumentListConfigurator.swift
//  Qawafel-Challenge
//
//  Created by Mohamed Eltaweel on 30/01/2022.
//

import Foundation

protocol DocumentListConfigurating{
    func configure(with viewController: DocumentListViewController)->DocumentListViewController
}

struct DocumentListConfigurator: DocumentListConfigurating{
    func configure(with viewController: DocumentListViewController) -> DocumentListViewController {
        let reprository = DocumentListReprository()
        let interactor = DocumentListInteractor(reprository: reprository, presenter: nil)
        let router = DocumentListRouter(viewController: viewController)
        let presenter = DocumentListPresenter(interactor: interactor, router: router, view: viewController)
        interactor.setPresenter(with: presenter)
        viewController.setPresenter(presenter: presenter)
        return viewController
    }
}
