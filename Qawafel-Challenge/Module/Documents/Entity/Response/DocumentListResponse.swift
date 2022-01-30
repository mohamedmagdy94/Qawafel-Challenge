//
//  DocumentListResponse.swift
//  Qawafel-Challenge
//
//  Created by Mohamed Eltaweel on 30/01/2022.
//

import Foundation

struct DocumentListResponse: Codable {
    let numFound, start: Int?
    let numFoundExact: Bool?
    let docs: [Doc]?
    let documentListResponseNumFound: Int?
    let q: String?
}

// MARK: - Doc
struct Doc: Codable {
    let key: String?
    let seed: [String]?
    let title, titleSuggest: String?
    let hasFulltext: Bool?
    let editionCount: Int?
    let editionKey, publishDate: [String]?
    let publishYear: [Int]?
    let firstPublishYear, numberOfPagesMedian: Int?
    let lccn, publishPlace, oclc, contributor: [String]?
    let lcc, ddc, isbn: [String]?
    let lastModifiedI, ebookCountI: Int?
    let ia: [String]?
    let publicScanB: Bool?
    let iaCollectionS, lendingEditionS, lendingIdentifierS, printdisabledS: String?
    let coverEditionKey: String?
    let coverI: Int?
    let publisher, language, authorKey, author_name: [String]?
    let authorAlternativeName, person, place, subject: [String]?
    let time, idAlibrisID, idAmazon, idCanadianNationalLibraryArchive: [String]?
    let idDepósitoLegal, idGoodreads, idGoogle, idLibrarything: [String]?
    let idOverdrive, idPaperbackSwap, idWikidata, iaLoadedID: [String]?
    let iaBoxID, publisherFacet, personKey, placeKey: [String]?
    let timeFacet, personFacet, subjectFacet: [String]?
    let version: Double?
    let placeFacet: [String]?
    let lccSort: String?
    let authorFacet, subjectKey: [String]?
    let ddcSort: String?
    let timeKey, firstSentence, idAmazonCAAsin, idAmazonCoUkAsin: [String]?
    let idAmazonDeAsin, idAmazonItAsin, idBcid, idBritishNationalBibliography: [String]?
    let idNla: [String]?
    let subtitle: String?
}
