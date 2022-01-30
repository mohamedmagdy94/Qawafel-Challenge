//
//  DocumentTableViewCell.swift
//  Qawafel-Challenge
//
//  Created by Mohamed Eltaweel on 30/01/2022.
//

import UIKit

class DocumentTableViewCell: UITableViewCell {

    static var IDENTIFIER = "DocumentTableViewCell"
    @IBOutlet weak var titleButton: UIButton!
    @IBOutlet weak var authorButton: UIButton!
    @IBOutlet weak var rootView: UIView!
    var onTitlePressed: (()->())?
    var onAuthorPressed: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(with viewModel: DocumentCellViewModel){
        rootView.layer.borderWidth = 0.5
        rootView.layer.borderColor = UIColor.lightGray.cgColor
        rootView.layer.cornerRadius = 8.0
        titleButton.setTitle(viewModel.title, for: .normal)
        authorButton.setTitle(viewModel.author, for: .normal)
    }
    
    @IBAction func onTitleButtonPressed(_ sender: Any) {
        onTitlePressed?()
    }
    
    @IBAction func onAuthorButtonPressed(_ sender: Any) {
        onAuthorPressed?()
    }
    
    
}
