//
//  NewMockDataService_Tests.swift
//  SwiftfulThinkingAdvancedTests
//
//  Created by Bilol Sanatillayev on 29/12/23.
//

import XCTest
@testable import SwiftfulThinkingAdvanced
import Combine

final class NewMockDataService_Tests: XCTestCase {

    var cancellables = Set<AnyCancellable>()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        cancellables.removeAll()
        
    }

    func test_NewMockDataService_init_doesSetValuesCorrectly() {
        // Given
        let items: [String]? = nil
        let items2: [String]? = []
        let items3: [String]? = [UUID().uuidString, UUID().uuidString]

        
        // When
        let dataService = NewMockDataService(items: items)
        let dataService2 = NewMockDataService(items: items2)
        let dataService3 = NewMockDataService(items: items3)

        // Then
        XCTAssertFalse(dataService.items.isEmpty)
        XCTAssertEqual(dataService.items.count, 3)
        XCTAssertTrue(dataService2.items.isEmpty)
        XCTAssertEqual(dataService3.items.count, items3?.count)
    }

    func test_NewMockDataService_downloadItemsWithEscaping_doesReturnValues() {
        // Given
        let dataService = NewMockDataService(items: nil)

        // When
        var items: [String] = []
        let expectation = XCTestExpectation()
        
        dataService.downloadItemsWithEscaping { returnedItems in
            items = returnedItems
            expectation.fulfill()
        }

         // Then
        wait(for: [expectation], timeout: 4)
        XCTAssertEqual(items.count, dataService.items.count)
    }
    
    func test_NewMockDataService_downloadItemsWithCombine_doesReturnValues() {
        // Given
        let dataService = NewMockDataService(items: nil)

        // When
        var items: [String] = []
        let expectation = XCTestExpectation()
        
        dataService.downloadItemsWithCombine()
            .sink { completion in
                switch completion {
                case .finished:
                    expectation.fulfill() // if it'll finish successfully expectation will fulfill
                case .failure:
                    XCTFail()
                }
            } receiveValue: { returnedItems in
                items = returnedItems
            }
            .store(in: &cancellables)
        
         // Then
        wait(for: [expectation], timeout: 4)
        XCTAssertEqual(items.count, dataService.items.count)
    }
    
    
    func test_NewMockDataService_downloadItemsWithCombine_doesFail() {
        // Given
        let dataService = NewMockDataService(items: []) // when items is empty it must throw error

        // When
        var items: [String] = []
        let expectation = XCTestExpectation(description: "Does throw an error")
        let expectation2 = XCTestExpectation(description: "Does throw URLError. badServerResponse")
        
        dataService.downloadItemsWithCombine()
            .sink { completion in
                switch completion {
                case .finished:
                    XCTFail() // now we are testing our combines error throwing
                case .failure(let error):
                    expectation.fulfill() // if it'll throw error, then our expectation will fulfill
                    
                    let urlError = error as? URLError
                    XCTAssertEqual(urlError, URLError(.badServerResponse))
                    if urlError == URLError(.badServerResponse) {
                        expectation2.fulfill()
                    }
                }
            } receiveValue: { returnedItems in
                items = returnedItems
            }
            .store(in: &cancellables)
        
         // Then
        wait(for: [expectation, expectation2 ], timeout: 4)
        XCTAssertEqual(items.count, dataService.items.count)
    }
}
