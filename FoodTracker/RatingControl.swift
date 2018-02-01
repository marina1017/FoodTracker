//
//  RatingControl.swift
//  FoodTracker
//
//  Created by 中川万莉奈 on 2018/02/01.
//  Copyright © 2018年 中川万莉奈. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {
    //MARK: propaties
    lazy var button: UIButton = self.createButton()
    
    //MARK : initicalize
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.commoninit()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
        self.commoninit()
    }
    
    //MARK: methods
    private func commoninit() {
        self.addArrangedSubview(self.button)
    }
    
    private func createButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = UIColor.red
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        return button
    }

}
