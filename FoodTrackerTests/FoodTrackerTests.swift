//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by 中川万莉奈 on 2018/02/03.
//  Copyright © 2018年 中川万莉奈. All rights reserved.
//

import XCTest
@testable import FoodTracker

//MARK: Meal Class Test
class FoodTrackerTests: XCTestCase {
    
    //正しくインスタンスが生成されるパターン
    func testMealInitializaionSucceeds() {
        //レーティングの境界設定　レーティングは０〜５以内であるというジォウ件
        //レーティング0のとき
        let zeroRatingMeal = Meal(name: "Zero", photo: nil, rating: 0)
        //XCTAssertNil X が nil であることをチェックする
        XCTAssertNil(zeroRatingMeal)
        
        //レーティングが一番高い時
        let positiveRatingMeal = Meal(name: "Positive", photo: nil, rating: 5)
        XCTAssertNil(positiveRatingMeal)
        
    }
    
}
