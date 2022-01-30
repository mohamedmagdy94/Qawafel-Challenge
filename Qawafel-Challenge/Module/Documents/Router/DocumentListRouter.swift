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

//struct DocumentListRouter: DocumentListRouterContract{
//    
//    var navigationController: UINavigationController?
//    
//    init(navigationController: UINavigationController?){
//        self.navigationController = navigationController
//    }
//    
//    func showDocumentDetails(from document: Doc) {
//        
//    }
//    
//}
