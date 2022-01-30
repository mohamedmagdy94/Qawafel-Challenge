//
//  DocumentListRouter.swift
//  Qawafel-Challenge
//
//  Created by Mohamed Eltaweel on 30/01/2022.
//

import Foundation
import UIKit

protocol DocumentListRouterContract{
    func showDocumentDetails(from document: Doc)
}

struct DocumentListRouter: DocumentListRouterContract{
    
    var viewController: UIViewController?
    
    init(viewController: UIViewController?){
        self.viewController = viewController
    }
    
    func showDocumentDetails(from document: Doc) {
        let nextView = DocumentDetailsViewController.create(with: document)
        viewController?.navigationController?.pushViewController(nextView, animated: true)
    }
    
    static func createModule()->UIViewController{
        let storyboard = UIStoryboard.init(name: StoryboardName.Document.rawValue, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: ViewControllerID.DocumentListViewController.rawValue) as? DocumentListViewController else{ return UIViewController() }
        let configurator = DocumentListConfigurator()
        let configuredView = configurator.configure(with: viewController)
        return configuredView
    }
    
}
