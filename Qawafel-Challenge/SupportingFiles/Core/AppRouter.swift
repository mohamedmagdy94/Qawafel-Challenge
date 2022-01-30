//
//  AppRouter.swift
//  Qawafel-Challenge
//
//  Created by Mohamed Eltaweel on 30/01/2022.
//

import Foundation
import UIKit

class AppRouter{
    var window: UIWindow?
    
    init(window: UIWindow?){
        self.window = window
    }
    
    func start(){
        let firstView = DocumentListRouter.createModule()
        let navigationController = UINavigationController(rootViewController: firstView)
        window?.rootViewController = navigationController
    }
    
}
