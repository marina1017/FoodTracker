//
//  RatingControl.swift
//  FoodTracker
//
//  Created by 中川万莉奈 on 2018/02/01.
//  Copyright © 2018年 中川万莉奈. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {
    //MARK: Properties
    private var ratingButtons = [UIButton]()
    
    var rating = 0
    
    var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            createButtons()
        }
    }
    
    var starCount: Int = 5 {
        didSet {
            createButtons()
        }
    }
    
    //MARK : initicalize
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.createButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
        self.createButtons()
    }
    
    //MARK: methods
    private func createButtons() {
        //今まで作っていたボタンを消す
        for button in ratingButtons {
            //自動配置対象から外れる(stackviewのはなし)  ->単純にaddsubViewされる状態になってる
            removeArrangedSubview(button)
            //子ViewをUIStacViewから取り除きたい場合は、通常通りその子ViewからremoveFromSuperViewを呼ぶ必要がある
            button.removeFromSuperview()
        }
        //ratingButtonsをから配列にする
        ratingButtons.removeAll()
        
        //ボタンイメージ
        //Bundleは入れ物オブジェクトのようなものなので、定義したBundleの中に、empty/filled/highlited の3つのステータスの画像を入れることで、3つの画像アセットをキャッシュすることができる。
        //バンドルは、アプリケーションをビルドした後もパッケージ化されているリソースの保存領域
        let bundle = Bundle(for: type(of: self))
        //self.traitCollection:ここでのselfはRatingControlクラスそれ自体を表す。traitCollectionは該当の画像がUIStackViewに関連付けられているかを確認する
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        
        //ボタンを消す
        for _ in 0 ..< starCount {
            let button = UIButton()
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            self.addArrangedSubview(button)
            ratingButtons.append(button)
        }
    }
    
    //MARK: Button Action
    @objc func ratingButtonTapped(button:UIButton) {
        print("テスト")
    }

}
