//
//  SwipeRecognizerTests.swift
//  SwipeRecognizerTests
//
//  Created by Michael Miles on 12/11/19.
//  Copyright © 2019 Michael Miles. All rights reserved.
//

import XCTest
@testable import SwipeRecognizer

class SwipeRecognizerTests: XCTestCase {
    var systemUnderTest: ViewController?

    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        systemUnderTest = storyboard.instantiateViewController(identifier: "ViewController")
        systemUnderTest?.loadView()
        
        systemUnderTest?.swipeView.gestureRecognizers?.removeAll()
    }

    override func tearDown() {
        systemUnderTest = nil
        super.tearDown()
    }
    
    func testUpSwipe() {
        //1. Given
        systemUnderTest?.upCount = 0
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(systemUnderTest?.respondToSwipeGesture))
        upSwipe.direction = .up
        
        //2. When
        systemUnderTest?.respondToSwipeGesture(gesture: upSwipe)
        
        //3. Then
        XCTAssertEqual(systemUnderTest?.upCount, 1, "Up swipe test failed")
    }
    
    func testDownSwipe() {
        systemUnderTest?.downCount = 0
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(systemUnderTest?.respondToSwipeGesture))
        downSwipe.direction = .down
        
        systemUnderTest?.respondToSwipeGesture(gesture: downSwipe)
        
        XCTAssertEqual(systemUnderTest?.downCount, 1, "Down swipe test failed")
    }
    
    func testRightSwipe() {
        systemUnderTest?.rightCount = 0
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(systemUnderTest?.respondToSwipeGesture))
        rightSwipe.direction = .right
        
        systemUnderTest?.respondToSwipeGesture(gesture: rightSwipe)
        
        XCTAssertEqual(systemUnderTest?.rightCount, 1, "Right swipe test failed")
    }
    
    func testLeftSwipe() {
        systemUnderTest?.leftCount = 0
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(systemUnderTest?.respondToSwipeGesture))
        leftSwipe.direction = .left
        
        systemUnderTest?.respondToSwipeGesture(gesture: leftSwipe)
        
        XCTAssertEqual(systemUnderTest?.leftCount, 1, "Left swipe test failed")
    }
    

}
