//
//  BullseyeUITests.swift
//  BullseyeUITests
//
//  Created by 郑建城 on 2025/1/28.
//

import XCTest

final class BullseyeUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //@MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
                
        
        app.sliders["50"]/*@START_MENU_TOKEN@*/.press(forDuration: 1.0);/*[[".tap()",".press(forDuration: 1.0);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        let hitMeButton = app.buttons["HIT ME"]
        hitMeButton.tap()
        
        let startNewRoundButton = app.buttons["Start New Round"]
        startNewRoundButton.tap()
        app.sliders["51.842"]/*@START_MENU_TOKEN@*/.press(forDuration: 0.8);/*[[".tap()",".press(forDuration: 0.8);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        hitMeButton.tap()
        startNewRoundButton.tap()
        app.sliders["47.592"].swipeLeft()
        hitMeButton.tap()
        startNewRoundButton.tap()
        app.buttons["arrow.counterclockwise"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["list.dash"]/*[[".buttons[\"List\"]",".buttons[\"list.dash\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["xmark"]/*[[".buttons[\"Close\"]",".buttons[\"xmark\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    @MainActor
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
}
