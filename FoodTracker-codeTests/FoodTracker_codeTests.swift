//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by 中川万莉奈 on 2018/02/03.
//  Copyright © 2018年 中川万莉奈. All rights reserved.
//

import XCTest
@testable import FoodTracker-code

//MARK: Meal Class Test
class FoodTrackerTests: XCTestCase {

    //正しくインスタンスが生成されるパターン
    func testMealInitializaionSucceeds() {
        //レーティングの境界設定　レーティングは０〜５以内であるというジォウ件
        //レーティング0のとき
        let zeroRatingMeal = Meal(name: "Zero", photo: nil, rating: 0)
        //XCTAssertNil X が nil であることをチェックする
        XCTAssertNotNil(zeroRatingMeal)

        //レーティングが一番高い時
        let positiveRatingMeal = Meal(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
    }

    func testMealInitializationFailes() {

        //初期化を失敗させるパターン
        //負の値の時
        let negativeRatingMeal = Meal(name: "negative", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingMeal)

        //nameが入ってない
        let emptyStringName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(emptyStringName)

        //５以上の時
        let largeRatingMeal = Meal(name: "Large", photo: nil, rating: 6)
        XCTAssertNil(largeRatingMeal)


    }



}

