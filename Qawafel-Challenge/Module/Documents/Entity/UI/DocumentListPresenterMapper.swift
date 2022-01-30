//
//  DocumentListPresenterMapper.swift
//  Qawafel-Challenge
//
//  Created by Mohamed Eltaweel on 30/01/2022.
//

import Foundation

protocol DocumentListPresenterMapperContract{
    func mapEntitiesToViewModels(data: [Doc])->[DocumentCellViewModel]
}


