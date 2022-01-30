//
//  DocumentTableViewCell.swift
//  Qawafel-Challenge
//
//  Created by Mohamed Eltaweel on 30/01/2022.
//

import UIKit

class DocumentTableViewCell: UITableViewCell {

    static var IDENTIFIER = "DocumentTableViewCell"
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var rootView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(with viewModel: DocumentCellViewModel){
        rootView.layer.borderWidth = 0.5
        rootView.layer.borderColor = UIColor.lightGray.cgColor
        rootView.layer.cornerRadius = 8.0
        titleLabel.text = viewModel.title
        authorLabel.text = viewModel.author
    }
    
}
