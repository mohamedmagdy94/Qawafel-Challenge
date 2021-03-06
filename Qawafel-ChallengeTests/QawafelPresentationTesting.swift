//
//  QawafelPresentationTesting.swift
//  Qawafel-ChallengeTests
//
//  Created by Mohamed Eltaweel on 30/01/2022.
//

import XCTest
@testable import Qawafel_Challenge

class QawafelPresentationTesting: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchingMovies(){
        let reprository = DocumentListMockReprository()
        let interactor = DocumentListInteractor(reprository: reprository, presenter: nil)
        let presenter = DocumentListPresenter(interactor: interactor, router: nil, view: nil)
        interactor.setPresenter(with: presenter)
        presenter.onQuerySearchRequested(query: "the lord of the rings")
        print("Cells Count : \(presenter.cells)")
        XCTAssertTrue(presenter.cells.count > 0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
