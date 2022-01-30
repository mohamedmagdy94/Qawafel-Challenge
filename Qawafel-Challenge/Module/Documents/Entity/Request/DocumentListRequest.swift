//
//  DocumentListRequest.swift
//  Qawafel-Challenge
//
//  Created by Mohamed Eltaweel on 30/01/2022.
//

import Foundation

struct DocumentListRequest: Codable{
    var query: String?
    var title: String?
    var author: String?
    enum CodingKeys: String, CodingKey {
        case query = "q"
        case title = "title"
        case author = "author"
    }
}
