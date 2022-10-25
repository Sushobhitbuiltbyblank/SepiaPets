//
//  RestrictedErrorViewTests.swift
//  SepiaPetsTests
//
//  Created by Sushobhit Jain on 26/10/22.
//

import XCTest
@testable import SepiaPets

class RestrictedErrorViewTests: XCTestCase {
  var sut: RestrictedErrorViewController?
    override func setUpWithError() throws {
      sut = RestrictedErrorViewController.instantiate(from: .sepiaPets)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

  func testInit_ErrorScreen() {
    XCTAssertNotNil(sut)
  }

}
