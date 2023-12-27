//
//  UnitTesting.swift
//  SwiftfulThinkingAdvancedTests
//
//  Created by Bilol Sanatillayev on 25/12/23.
//

import XCTest
@testable import SwiftfulThinkingAdvanced

final class UnitTestingViewModel_Test: XCTestCase {

    var viewModel: UnitTestingViewModel?
    override func setUpWithError() throws {
        viewModel = UnitTestingViewModel(isPremium: Bool.random())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil // will reset viewModel after each test
    }

    func test_UnitTestingBootcampViewMode1_isPremium_shouldBeTrue(){
        // given
        let userIsPremium: Bool = true
        
        // when
        let viewModel = UnitTestingViewModel(isPremium: userIsPremium)
        
        // then
        XCTAssertTrue(viewModel.isPremium)
    }
    
    
    func test_UnitTestingBootcampViewModel_isPremium_shouldBeFalse() {
        // given
        let userIsPremium: Bool = false
        
        // when
        let viewModel = UnitTestingViewModel(isPremium: userIsPremium)
        
        // then
        XCTAssertFalse(viewModel.isPremium)
    }

    func test_UnitTestingBootcampViewModel_isPremium_shouldBeInjectedValue() {
        // given
        let userIsPremium: Bool = Bool.random()
        
        // when
        let viewModel = UnitTestingViewModel(isPremium: userIsPremium)
        
        // then
        XCTAssertEqual(viewModel.isPremium, userIsPremium)
    }
    
    func test_UnitTestingBootcampViewMode1_isPremium_shouldBeInjectedValue_stress() {
        for _ in 0..<100 {
            // Given
            let userIsPremium: Bool = Bool.random()
            // When
            let vm = UnitTestingViewModel(isPremium: userIsPremium)
            // Then
            XCTAssertEqual(vm.isPremium, userIsPremium)
        }
    }
    
//    30:10 minute to continue code writing
    
    func test_UnitTestingBootcamp_dataArray_shouldBeEmpty() {
        // given
        let userIsPremium: Bool = Bool.random()
        
        // when
        let vm = UnitTestingViewModel(isPremium: userIsPremium)
        
        // then
        XCTAssertTrue(vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, 0)
    }
    
    func test_UnitTestingBootcamp_dataArray_shouldAddItems() {
        // given
        let vm = UnitTestingViewModel(isPremium: Bool.random())

        // when
        
        let loopCount: Int = Int.random(in: 1..<100)
        for _ in  0..<loopCount {
            vm.addItem(item: UUID().uuidString)
        }
        
        // Then
        XCTAssertTrue(!vm.dataArray.isEmpty)
        XCTAssertFalse(vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, loopCount)
        XCTAssertNotEqual(vm.dataArray.count, 0)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
        
        // XCTAssertGreaterThanOrEqual
        // XCTAssertLessThan
        // XCTAssertLessThanOrEqual
    }
    // MARK: Note
    /*
         We are using UUID().uuidString for this video. This is better than a specific String, but UUID0 always produces a String with
    36 characters. A better approach is to create a custom "random string" function that returns Strings with 0...X characters. You can
    find this on StackOverflow or challenge yourself to make one!
    */
    
    func test_UnitTestingBootcampViewModel_dataArray_shouldNotAddBlankString() {
        // given
        let vm = UnitTestingViewModel(isPremium: Bool.random())

        // when
        vm.addItem(item: "")
        
        // Then
        XCTAssertTrue(vm.dataArray.isEmpty)
        
    }
    
    func test_UnitTestingBootcampViewModel_dataArray_shouldNotAddBlankString2() {
        // given
        guard let vm = viewModel else {
            XCTFail()
            return
        }

        // when
        vm.addItem(item: "")
        
        // Then
        XCTAssertTrue(vm.dataArray.isEmpty)
        
    }
    
    func test_UnitTestingViewModel_selectedItem_shouldStartAsNil() {
        // given

        // when
        let vm = UnitTestingViewModel(isPremium: Bool.random())

        // Then
        XCTAssertNil(vm.selectedItem)
        XCTAssertTrue(vm.selectedItem == nil)
    }
    
    func test_UnitTestingViewModel_selectedItem_shouldBeNilWhenSelectingInvalidItem() {
        // given
        let vm = UnitTestingViewModel(isPremium: Bool.random())

        // when
        // select valid item
        let item = UUID().uuidString
        vm.addItem(item: item)
        vm.selectItem(item: item)
        
        // select invalid item
        vm.selectItem(item: UUID().uuidString)

        // Then
        XCTAssertNil(vm.selectedItem)
        XCTAssertTrue(vm.selectedItem == nil)
    }
    
    func test_UnitTestingViewModel_selectedItem_shouldBeSelected() {
        // given
        let vm = UnitTestingViewModel(isPremium: Bool.random())

        // when
        let item = UUID().uuidString
        vm.addItem(item: item)
        vm.selectItem(item: item)

        // Then
        XCTAssertEqual(vm.selectedItem, item)
        XCTAssertNotNil(vm.selectedItem)
    }
    
    func test_UnitTestingViewModel_selectedItem_shouldBeSelected_stress() {
        // given
        let vm = UnitTestingViewModel(isPremium: Bool.random())

        // when
        let loopCount: Int = Int.random(in: 1..<100)
        var itemsArray: [String] = []
        
        for _ in 0..<loopCount {
            let newItem = UUID().uuidString
            vm.addItem(item: newItem)
            itemsArray.append(newItem)
        }
        
        let randomItem = itemsArray.randomElement() ?? ""
        vm.selectItem(item: randomItem)
        
        XCTAssertFalse(randomItem.isEmpty)
        // Then
        XCTAssertNotNil(vm.selectedItem)
        XCTAssertEqual(vm.selectedItem, randomItem)
    }
    
    func test_UnitTestingViewModel_saveItem_shouldThrowError_itemNotFound() {
        // given
        let vm = UnitTestingViewModel(isPremium: Bool.random())

        // when
        let loopCount: Int = Int.random(in: 1..<100)
        for _ in 0..<loopCount {
            vm.addItem(item: UUID().uuidString)
        }
        
        // Then
        XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString))

        XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString), "Should throw error item not found!") { error in
            let returnedError = error as? UnitTestingViewModel.DataError
            let itemNotFound = UnitTestingViewModel.DataError.itemNotFound
            XCTAssertEqual(returnedError, itemNotFound)
        }
    }
    
    func test_UnitTestingViewModel_saveItem_shouldThrowError_noData() {
        // given
        let vm = UnitTestingViewModel(isPremium: Bool.random())

        // when
        let loopCount: Int = Int.random(in: 1..<100)
        for _ in 0..<loopCount {
            vm.addItem(item: UUID().uuidString)
        }
        
        // Then
        
        do {
            try vm.saveItem(item: "")
        } catch let error {
            let returnedError = error as! UnitTestingViewModel.DataError
            XCTAssertEqual(returnedError, UnitTestingViewModel.DataError.noData)
        }
    }
    
    func test_UnitTestingViewModel_saveItem_shouldSaveItem() {
        // given
        let vm = UnitTestingViewModel(isPremium: Bool.random())

        // when
        let loopCount: Int = Int.random(in: 1..<100)
        var itemsArray: [String] = []
        
        for _ in 0..<loopCount {
            let newItem = UUID().uuidString
            vm.addItem(item: newItem)
            itemsArray.append(newItem)
        }
        let randomItem = itemsArray.randomElement() ?? ""
        
        XCTAssertFalse(randomItem.isEmpty)
        // Then
        XCTAssertNoThrow(try vm.saveItem(item: randomItem))
        
        do {
            try vm.saveItem(item: randomItem)
        } catch {
            XCTFail()
        }
    }


}
