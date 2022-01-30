//
//  DocumentListNetworkRouter.swift
//  Qawafel-Challenge
//
//  Created by Mohamed Eltaweel on 30/01/2022.
//

import Foundation

enum DocumentListNetworkRouter: NetworkRoutering {
    case getDocuments(request: DocumentListRequest)
    
    private var method: HTTPHelper.HTTPMethod {
        switch self {
        case .getDocuments: return .get
        }
    }
    
    private var encoding: HTTPHelper.HTTPEncoding{
        switch self {
        case .getDocuments:
            return .query
        }
    }
    
    
    private var path: String {
        switch self {
        case .getDocuments:
            return "search.json"
        }
    }
    
    private var headers: [String: Any]{
        return [:]
    }
    
    func request() throws -> URLRequest {
        let urlString = "\(APIConstant.BASE_URL.rawValue)\(path)"
        
        var url: URL?
        
        switch encoding {
        case .body:
            guard let constructedURL = URL(string: urlString) else{  throw HTTPHelper.NetworkError.parseUrlFail }
            url = constructedURL
        case .query:
            guard let constructedURL = buildURLFromQueryItems() else{  throw HTTPHelper.NetworkError.parseUrlFail }
            url = constructedURL
            
        }
        guard let url = url else{  throw HTTPHelper.NetworkError.parseUrlFail }
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 10)
        request.httpMethod = method.value
        headers.forEach{ request.addValue("\($0.value)", forHTTPHeaderField: "\($0.key)") }
        
        switch self {
        case .getDocuments:
            return request
        
        }
    }
    
    private func buildURLFromQueryItems()->URL?{
        switch self {
        case .getDocuments(let request):
            let urlString = "\(APIConstant.BASE_URL.rawValue)\(path)"
            var urlComponents = URLComponents(string: urlString)
            guard let items = request.dictionary else{ return urlComponents?.url }
            let queryItems = items.map{ URLQueryItem(name: $0.key, value: "\($0.value)") }
            urlComponents?.queryItems = queryItems
            return urlComponents?.url
        }
    }
    
}
