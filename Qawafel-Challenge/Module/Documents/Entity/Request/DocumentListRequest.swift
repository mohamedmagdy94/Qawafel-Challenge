//
//  DocumentListRequest.swift
//  Qawafel-Challenge
//
//  Created by Mohamed Eltaweel on 30/01/2022.
//

import Foundation

struct DocumentListRequest: Codable{
    var query: String
    enum CodingKeys: String, CodingKey {
        case query = "q"
    }
}
