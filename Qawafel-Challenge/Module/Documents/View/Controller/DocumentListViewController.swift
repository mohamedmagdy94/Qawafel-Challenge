//
//  DocumentListViewController.swift
//  Qawafel-Challenge
//
//  Created by Mohamed Eltaweel on 30/01/2022.
//

import UIKit

protocol DocumentListViewContract: AnyObject{
    func toggleLoading(state: Bool)
    func showErrorMessage(message: String)
    func refreshList()
}

class DocumentListViewController: UIViewController {
    
    @IBOutlet private weak var documentsTableView: UITableView!
    @IBOutlet private weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var searchBar: UISearchBar!
    private var presenter: DocumentListPresenterInputContract?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        loadingIndicator.isHidden = true
        documentsTableView.register(UINib(nibName: DocumentTableViewCell.IDENTIFIER, bundle: nil), forCellReuseIdentifier: DocumentTableViewCell.IDENTIFIER)
        documentsTableView.delegate = self
        documentsTableView.dataSource = self
    }
    
    func setPresenter(presenter: DocumentListPresenterInputContract){
        self.presenter = presenter
    }
    
    @IBAction func onSearchButtonPressed(_ sender: Any) {
        presenter?.onQuerySearchRequested(query: searchBar.text ?? "")
    }
    
}

extension DocumentListViewController: DocumentListViewContract{
    
    func toggleLoading(state: Bool) {
        loadingIndicator.isHidden = !state
    }
    
    func showErrorMessage(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func refreshList() {
        documentsTableView.reloadData()
    }
    
}

extension DocumentListViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.cells.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let presenter = presenter,let cell = tableView.dequeueReusableCell(withIdentifier: DocumentTableViewCell.IDENTIFIER, for: indexPath) as? DocumentTableViewCell else{ return DocumentTableViewCell() }
        let viewModel = presenter.cells[indexPath.item]
        cell.setup(with: viewModel)
        cell.onAuthorPressed = {[weak self] in self?.presenter?.onAuthorSearchRequested(authorIndex: indexPath)
        }
        cell.onTitlePressed = {[weak self] in
            self?.presenter?.onTitleSearchRequested(titleIndex: indexPath)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.onDocumentSelected(with: indexPath)
    }
    
}

