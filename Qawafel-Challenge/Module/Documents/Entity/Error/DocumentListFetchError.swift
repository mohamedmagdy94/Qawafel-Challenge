//
//  DocumentListFetchError.swift
//  Qawafel-Challenge
//
//  Created by Mohamed Eltaweel on 30/01/2022.
//

import Foundation

enum DocumentListFetchError: Error{
    case SERVER_ERROR
    case DOCUMENT_NOT_FOUND
    case WRONG_QUERY
    
    var localizedDescription: String{
        switch self {
        case .SERVER_ERROR:
            return "Server Error"
        case .DOCUMENT_NOT_FOUND:
            return "Please Try Again"
        case .WRONG_QUERY:
            return "Wrong Query"
        }
    }
}
