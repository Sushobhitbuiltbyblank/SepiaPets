//
//  PetListViewModelTests.swift
//  SepiaPetsTests
//
//  Created by Sushobhit Jain on 26/10/22.
//

import XCTest
@testable import SepiaPets

class PetListViewModelTests: XCTestCase {
  var sut:PetsListViewModel?

    override func setUpWithError() throws {
      sut = PetsListViewModel(dataProvider: LocalJsonPetsListProvider())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

  func testInit_PetListModel() {
    XCTAssertNotNil(sut!)
  }

  func test_noOfRowInSection() {
    sut?.viewdidload()
    XCTAssertEqual(sut!.numberOfRowsInSection(section: 0), 10)
  }

  func test_petForRow() {
    sut?.viewdidload()
    let emptyPet = sut?.petForRow(indexPath: IndexPath(row: 11, section: 1))
    XCTAssertNil(emptyPet)
    let NotEmptyPet = sut?.petForRow(indexPath: IndexPath(row: 09, section: 0))
    XCTAssertNotNil(NotEmptyPet)
  }
}
