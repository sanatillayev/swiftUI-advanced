//
//  UITestingView_UITests.swift
//  SwiftfulThinkingAdvancedUITests
//
//  Created by Bilol Sanatillayev on 29/12/23.
//

import XCTest

// Naming Structure: test_UnitofWork_StateUnderTest_ExpectedBehavior
// Naming Structure: test_[struct]_[ui component]_[expected result]
// Testing Structure: Given, When, Then

final class UITestingView_UITests: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
//        app.launchArguments = ["-UITest_startSignedIn"]
//        app.launchEnvironment = ["-UITest_startSignedIn2" : "true"]
        app.launch()
    }

    override func tearDownWithError() throws {
    }
    
    func test_UITestingView_signUpButton_shouldNotSignIn() {
        // Given
        signUpAndSignIn(shouldTypeOnKeyboard: false)

        // When
        let navbar = app.navigationBars["Welcome"]
          
        // Then
        XCTAssertFalse(navbar.exists)
    }
    
    func test_UITestingView_signUpButton_shouldSignIn() {
        // Given
        signUpAndSignIn(shouldTypeOnKeyboard: true)
        
        // When
        let navbar = app.navigationBars["Welcome"]
          
        // Then
        XCTAssertTrue(navbar.exists)
    }
    
    func test_SignedInHomeView_showAlertButton_shouldDisplayAlert() {
        // Given
        signUpAndSignIn(shouldTypeOnKeyboard: true)
        
        // When
        tapAlertButton(shouldDismissAlert: false)

        // Then
        XCTAssertTrue(app.alerts.firstMatch.exists)
    }
    
    func test_SignedInHomeView_showAlertButton_shouldDisplayAndDismissAlert() {
        
        // Given
        signUpAndSignIn(shouldTypeOnKeyboard: true)
        
        // When
        tapAlertButton(shouldDismissAlert: true)
    
        // Then
        let alertExists = app.alerts.firstMatch.waitForExistence(timeout: 5)
        XCTAssertFalse(alertExists)
    }
    
    func test_SignedInHomeView_navigationLinkToDestination_shouldNavigateToDestination() {
        // Given
        signUpAndSignIn(shouldTypeOnKeyboard: true)
        
        // When
        tapNavigationLink(shouldDismissDestination: false)
        
        // Then
        let destinationText = app.staticTexts["Destination"]
        XCTAssertTrue(destinationText.exists)
    }
    
    func test_SignedInHomeView_navigationLinkToDestination_shouldNavigateToDestinationAndGoBack() {
        
        // Given
        signUpAndSignIn(shouldTypeOnKeyboard: true)
        
        // When
        tapNavigationLink(shouldDismissDestination: true)
        
        // Then
        let navbar = app.navigationBars["Welcome"]
        XCTAssertTrue(navbar.exists)
    }
    
    /// test for signed in user flow
//    func test_SignedInHomeView_navigationLinkToDestination_shouldNavigateToDestinationAndGoBack2() {
//        // Given
//        
//        // When
//        tapNavigationLink(shouldDismissDestination: true)
//        
//        // Then
//        let navbar = app.navigationBars["Welcome"]
//        XCTAssertTrue(navbar.exists)
//    }

}

extension UITestingView_UITests {
    
    func signUpAndSignIn(shouldTypeOnKeyboard: Bool) {
        let textfield = app.textFields["SignUpTextField"]

        // When
        textfield.tap()
        
        if shouldTypeOnKeyboard {
            let keyA = app.keys["A"]
            keyA.tap()
            let keya = app.keys["a"]

            keya.tap()
            keya.tap()
        }
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        
        let signUpButton = app.buttons["SignUpButton"]
        signUpButton.tap()
    }
    
    func tapAlertButton(shouldDismissAlert: Bool) {
        let showAlertButton = app.buttons["ShowAlertButton"]
        showAlertButton.tap()
        
        if shouldDismissAlert {
            let alertOkButton = app.alerts.firstMatch.buttons["OK"]
            let exists = alertOkButton.waitForExistence(timeout: 5)
            
            XCTAssertTrue(exists)
            alertOkButton.tap()
        }
    }
    
    func tapNavigationLink(shouldDismissDestination: Bool) {
        let navigationLink = app.buttons["NavigationLinkToDestination"]
        navigationLink.tap()

        if shouldDismissDestination {
            let backButton = app.navigationBars.buttons["Welcome"]
            backButton.tap()
        }
    }
    
    
}
