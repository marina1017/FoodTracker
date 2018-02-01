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
        for _ in 0 ..< 5 {
            let button = UIButton()
            button.backgroundColor = UIColor.red
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
            button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
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
