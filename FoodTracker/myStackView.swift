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
    lazy var textFiled: UITextField = self.createTextField()
    lazy var imageView: UIImageView = self.createImageView()

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
        self.addArrangedSubview(self.titleLabel)
        self.addArrangedSubview(self.textFiled)
        self.addArrangedSubview(self.buttom)
        self.addArrangedSubview(self.imageView)

    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutTitleLabel()
        self.layoutButton()
        self.layoutTextFiled()
        self.layoutImageView()
    }


    //MARK: -createSubView-
    private func createTitleLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }

    private func createButton() -> UIButton {
        let button = UIButton()
        button.setTitle("スタックビューのボタン", for: .normal)
        button.addTarget(getParentViewController(), action: #selector(ViewController.setDefaultLabelText(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }

    private func createTextField() -> UITextField {
        let textFiled = UITextField()
        textFiled.placeholder = "スタックビューのTextFiled"
        textFiled.borderStyle = .roundedRect
        textFiled.enablesReturnKeyAutomatically = true
        textFiled.keyboardType = UIKeyboardType.emailAddress
        textFiled.returnKeyType = UIReturnKeyType.done
        textFiled.keyboardAppearance = UIKeyboardAppearance.alert
        textFiled.textContentType = UITextContentType.emailAddress
        textFiled.translatesAutoresizingMaskIntoConstraints = false
        return textFiled
    }

    private func createImageView()-> UIImageView {
        let imageView = UIImageView()
        let image: UIImage = UIImage(named:"Image")!
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        return imageView
    }

    //MARK: layoutSubView
    private func layoutTitleLabel() {
        self.titleLabel.sizeToFit()
//        self.titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: self.frame.size.width/10).isActive = true
//        self.titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: self.frame.size.width/10).isActive = true
        self.titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    private func layoutTextFiled() {
        self.textFiled.sizeToFit()
//        self.textFiled.leftAnchor.constraint(equalTo: self.leftAnchor, constant: self.frame.size.width/10).isActive = true
//        self.textFiled.rightAnchor.constraint(equalTo: self.rightAnchor, constant: self.frame.size.width/10).isActive = true
        self.textFiled.heightAnchor.constraint(equalToConstant: 30).isActive = true

    }

    private func layoutButton() {
        self.buttom.sizeToFit()
//        self.buttom.leftAnchor.constraint(equalTo: self.leftAnchor, constant: self.frame.size.width/10).isActive = true
//        self.buttom.rightAnchor.constraint(equalTo: self.rightAnchor, constant: self.frame.size.width/10).isActive = true
    }

    private func layoutImageView() {
        self.imageView.sizeToFit()
//        self.imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: self.frame.size.width/10).isActive = true
//        self.imageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: self.frame.size.width/10).isActive = true
//        self.imageView.topAnchor.constraint(equalTo: self.buttom.bottomAnchor, constant: 10)
        
        self.imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }

}

extension MyStackView {
    //MARK:parentViewController
    //親のViewControllerを取得する
    func getParentViewController() -> UIViewController? {
        var parentResponder: UIResponder? = self
        while true {
            guard let nextResponder = parentResponder?.next else { return nil}
            if let viewController = nextResponder as? UIViewController {
                return viewController
            }
            parentResponder = nextResponder
        }
    }
}
