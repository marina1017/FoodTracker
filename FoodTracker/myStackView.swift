//
//  myStackView.swift
//  FoodTracker
//
//  Created by nakagawa on 2018/02/01.
//  Copyright © 2018年 中川万莉奈. All rights reserved.
//

import UIKit

class MyStackView: UIStackView {

    //MARK: -propties-
    lazy private var titleLabel: UILabel = self.createTitleLabel()
    lazy private var buttom: UIButton = self.createButton()
    lazy private var textFiled: UITextField = self.createTextField()

    var title:String? {
        get {
            return titleLabel.text
        }
        set(title) {
            titleLabel.text = title
            self.setNeedsLayout()
        }
    }


    //MARK: initialize
    required override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }

    private func commonInit() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.textFiled)
        self.addSubview(self.buttom)

    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutTitleLabel()
        self.layoutButton()
    }

    //MARK: -createSubView-
    private func createTitleLabel() ->UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }

    private func createButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Set Default Label Texta", for: .normal)
        return button
    }

    private func createTextField() -> UITextField {
        let textFiled = UITextField()
        textFiled.placeholder = "Enter meal name"
        textFiled.borderStyle = .roundedRect
        textFiled.enablesReturnKeyAutomatically = true
        textFiled.keyboardType = UIKeyboardType.emailAddress
        textFiled.returnKeyType = UIReturnKeyType.done
        textFiled.keyboardAppearance = UIKeyboardAppearance.alert
        textFiled.textContentType = UITextContentType.emailAddress
        textFiled.translatesAutoresizingMaskIntoConstraints = false
        return textFiled
    }

    //MARK: layoutSubView
    private func layoutTitleLabel() {
        self.titleLabel.sizeToFit()
        self.titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: self.frame.size.width/10).isActive = true
        self.titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: self.frame.size.width/10).isActive = true
        self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.size.height/10).isActive = true
        self.titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    private func layoutTextFiled() {
        self.textFiled.sizeToFit()
        self.textFiled.leftAnchor.constraint(equalTo: self.leftAnchor, constant: self.frame.size.width/10).isActive = true
        self.textFiled.rightAnchor.constraint(equalTo: self.rightAnchor, constant: self.frame.size.width/10).isActive = true
        self.textFiled.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: self.frame.size.height/10).isActive = true
        self.textFiled.heightAnchor.constraint(equalToConstant: 30).isActive = true

    }

    private func layoutButton() {
        self.buttom.sizeToFit()
        self.buttom.leftAnchor.constraint(equalTo: self.leftAnchor, constant: self.frame.size.width/10).isActive = true
        self.buttom.rightAnchor.constraint(equalTo: self.rightAnchor, constant: self.frame.size.width/10).isActive = true
        self.buttom.topAnchor.constraint(equalTo: self.textFiled.bottomAnchor, constant: self.frame.size.height/10).isActive = true
        self.titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }





}
