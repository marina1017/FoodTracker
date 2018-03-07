//
//  Meal.swift
//  FoodTracker
//
//  Created by 中川万莉奈 on 2018/02/03.
//  Copyright © 2018年 中川万莉奈. All rights reserved.
//

import UIKit
import os.log

class Meal: NSObject, NSCoding {
    
    
    //MARK: Properties
    var name: String = ""
    var photo: UIImage?
    var rating: Int = 0
    
    //MARK: Properties
    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
    }
    //DocumentsDirectory はアプリのドキュメントがあるディレクトリをさす　アプリごとに独立した記憶領域に保存される
    //FileManagerのドキュメントをよめとのこと
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    //これあとで調べる
    //ArchiveURL はそれに　meals というパスを加えている？
    //呼び出すときはMeal.ArchiveURL.pathになるらしい
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
    
    
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
    
    //MARK: NSCoding
    //NSCodingプロトコルの実装する必要があるメソッド
    //クラスの情報をデータ化するメソッド
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(rating, forKey: PropertyKey.rating)
    }
    //NSCodingプロトコルの実装する必要があるメソッド
    //保存されたデータからクラスを作成する初期化関数
    //初期化に失敗するかもしれないのでinit?がついてる
    required convenience init?(coder aDecoder: NSCoder) {
        //名前は必須で名前文字列をデコードできない場合イニシャライザは失敗する
        //decodeObject(forKey:) メソッドは Any? 型を返しString にダウンキャストする
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Meal Object.", log: OSLog.default, type: .debug)
            return nil
        }
        //写真はオプションのプロパティなので条件付きキャストを作る
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
        
        //指定された初期化子を呼び出さなければならない
        self.init(name: name, photo: photo, rating: rating)
        
    }
}
