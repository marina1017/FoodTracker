//
//  Meal.swift
//  FoodTracker
//
//  Created by 中川万莉奈 on 2018/02/03.
//  Copyright © 2018年 中川万莉奈. All rights reserved.
//

import UIKit

class Meal {
    //MARk: Properties
    var name: String = ""
    var photo: UIImage?
    var rating: Int = 0
    
    //MARK: Initialization
    init?(name: String, photo: UIImage?, rating: Int) {
        //nameに何も入ってない時
        guard !name.isEmpty else {
            return nil
        }
        
        //rateingの値が0から５の時
        guard rating >= 0 && rating <= 5 else {
            return nil
        }
        
        // プロパティの初期化
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
