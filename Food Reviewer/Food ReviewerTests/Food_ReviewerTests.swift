//
//  Food_ReviewerTests.swift
//  Food ReviewerTests
//
//  Created by Dev Jhaveri on 1/8/19.
//  Copyright © 2019 Dartmouth College. All rights reserved.
//

import XCTest
@testable import Food_Reviewer

class Food_ReviewerTests: XCTestCase {
    
    //MARK: Meal Class Tests
    
    //Confirm that the meal initializes correctly
    func testMealInitializationSucceeds() {
        // Zero Rating
        let zeroRatingMeal = Meal.init(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        // 5-star Rating
        let fiveRatingMeal = Meal.init(name: "Five", photo: nil, rating: 5)
        XCTAssertNotNil(fiveRatingMeal)
    }
    
    // Confirm that the Meal initialier returns nil when passed a negative rating or an empty name.
    func testMealInitializationFails() {
        // Negative Rating
        let negativeRatingMeal = Meal.init(name: "Negative", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingMeal)
        
        // Rating exceeds maximum
        let largeRatingMeal = Meal.init(name: "Large", photo: nil, rating: 6)
        XCTAssertNil(largeRatingMeal)
        
        // Empty String
        let emptyStringMeal = Meal.init(name: "", photo: nil, rating: 0)
        XCTAssertNil(emptyStringMeal)
    }
}

