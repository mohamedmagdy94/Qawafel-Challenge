//
//  NetworkRoutering.swift
//  Qawafel-Challenge
//
//  Created by Mohamed Eltaweel on 30/01/2022.
//


import Foundation

protocol NetworkRoutering{
    func request() throws -> URLRequest
}
