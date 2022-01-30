//
//  DocumentListViewController.swift
//  Qawafel-Challenge
//
//  Created by Mohamed Eltaweel on 30/01/2022.
//

import UIKit

protocol DocumentListViewContract{
    func toggleLoading(state: Bool)
    func showErrorMessage(message: String)
    func refreshList()
}

class DocumentListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
