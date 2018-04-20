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
    var rating: Int = 0 {
        didSet {
            self.updateButtonSelectionStates()
        }
    }

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

    //MARK: lifeCycle
    //5
    override func updateConstraints() {
        super.updateConstraints()
    }

    //11
    override func layoutSubviews() {
        super.layoutSubviews()
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
            //画像を登録
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])

            //制約関係
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true

            //音声読み上げ
            button.accessibilityLabel = "Set \(index) star rating"

            //ボタンのアクション
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            //ビューにaddする
            self.addArrangedSubview(button)

            ratingButtons.append(button)
        }
        self.updateButtonSelectionStates()
    }

    private func updateButtonSelectionStates() {
        //ratingButtons配列をタプルで添え字と要素を取り出せる
        for (index, button) in ratingButtons.enumerated() {
            button.isSelected = index < rating

            //ヒントを表示させる
            let hintString: String?
            if rating == index + 1 {
                hintString = "タップすると０になります"
            } else {
                hintString = nil
            }

            let valueString: String
            switch rating {
            case 0:
                valueString = "レイティングがセットされていません"
            case 1:
                valueString = "1 スターがセットされています"
            default:
                valueString = "\(rating)スターがセットされてます"
            }

            button.accessibilityHint = hintString
            button.accessibilityValue = valueString
        }



    }

    //MARK: Button Action
    @objc func ratingButtonTapped(button:UIButton) {
        guard let index = ratingButtons.index(of: button) else {
            fatalError("\(button)エラーです")
        }
        let serectedRating = index + 1

        if serectedRating == rating {
            rating = 0
        } else {
            rating = serectedRating
        }
    }

}
