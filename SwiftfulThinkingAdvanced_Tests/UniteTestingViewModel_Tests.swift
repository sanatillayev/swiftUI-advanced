//
//  UniteTestingViewModel_Tests.swift
//  SwiftfulThinkingAdvanced_Tests
//
//  Created by Bilol Sanatillayev on 18/12/23.
//

// Naming Structure: test_UnitofWork_StateUnderTest_ExpectedBehavior
// Naming Structure: test_[struct or class]_[variabIе or function]_[expected result]
// Testing Structure: Given, When, Then


import XCTest
@testable import SwiftfulThinkingAdvanced

final class UniteTestingViewModel_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_UnitTestingBootcampViewMode1_isPremium_shouldBeTrue(){
        // given
        let userIsPremium: Bool = true
        
        // when
        let viewModel = UnitTestingBootcampViewModel(isPremium: userIsPremium)
        
        // then
        XCTAssertTrue(viewModel.isPremium)
    }
    
    
    func test_UnitTestingBootcampViewModel_isPremium_shouldBeFalse() {
        // given
        let userIsPremium: Bool = false
        
        // when
        let viewModel = UnitTestingBootcampViewModel(isPremium: userIsPremium)
        
        // then
        XCTAssertFalse(viewModel.isPremium)
    }

    func test_UnitTestingBootcampViewModel_isPremium_shouldBeInjectedValue() {
        // given
        let userIsPremium: Bool = Bool.random()
        
        // when
        let viewModel = UnitTestingBootcampViewModel(isPremium: userIsPremium)
        
        // then
        XCTAssertEqual(viewModel.isPremium, userIsPremium)
    }
    
    func test_UnitTestingBootcampViewMode1_isPremium_shouldBeInjectedValue_stress() {
        for _ in 0..<100 {
            // Given
            let userIsPremium: Bool = Bool.random()
            // When
            let vm = UnitTestingBootcampViewModel(isPremium: userIsPremium)
            // Then
            XCTAssertEqual(vm.isPremium, userIsPremium)
        }
    }
    
//    30:10 minute to continue code writing
    
    func test_UnitTestingBootcamp_dataArray_shouldBeEmpty() {
        // given
        let userIsPremium: Bool = Bool.random()
        
        // when
        let vm = UnitTestingBootcampViewModel(isPremium: userIsPremium)
        
        // then
        XCTAssertTrue(vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, 0)
    }
    
    func test_UnitTestingBootcamp_dataArray_shouldAddItems() {
        // given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())

        // when
        
        let loopCount: Int = Int.random(in: 1..<100)
        for _ in  0..<loopCount {
            vm.addItems(item: UUID().uuidString)
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
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())

        // when
        vm.addItems(item: "")
        
        // Then
        XCTAssertTrue(vm.dataArray.isEmpty)
        
    }

}
