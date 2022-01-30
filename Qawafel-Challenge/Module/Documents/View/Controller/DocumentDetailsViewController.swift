//
//  DocumentDetailsViewController.swift
//  Qawafel-Challenge
//
//  Created by Mohamed Eltaweel on 30/01/2022.
//

import UIKit

class DocumentDetailsViewController: UIViewController {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var isbnsValue: UILabel!
    var data: Doc?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
        // Do any additional setup after loading the view.
    }
    
    static func create(with doc: Doc)->UIViewController{
        let storyboard = UIStoryboard.init(name: StoryboardName.Document.rawValue, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: ViewControllerID.DocumentDetailsViewController.rawValue) as? DocumentDetailsViewController else{ return UIViewController() }
        viewController.data = doc
        return viewController
    }
    
    private func bindData(){
        guard let data = data else{ return }
        titleLabel.text = data.title ?? ""
        authorLabel.text = data.author_name?[0] ?? ""
        let isbns = createISBNsString()
        isbnsValue.text = isbns
    }

    private func createISBNsString()->String{
        guard let data = data , let isbns = data.isbn else{ return "" }
        let isbnsSeperated = isbns.joined(separator: "\r\n")
        return isbnsSeperated
    }
    
}
