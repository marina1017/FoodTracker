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
        //ratingが負の値のとき　初期化できないとき
        if name.isEmpty || rating < 0 {
            return nil
        }
        
        // プロパティの初期化
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
