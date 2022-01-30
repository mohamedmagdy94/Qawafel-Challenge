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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(with viewModel: DocumentCellViewModel){
        titleLabel.text = viewModel.title
        authorLabel.text = viewModel.author
    }
    
}
