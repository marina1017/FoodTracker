//
//  ViewController.swift
//  FoodTracker
//
//  Created by 中川万莉奈 on 2018/01/24.
//  Copyright © 2018年 中川万莉奈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let textFiled: UITextField = {
    let textFiled = UITextField()
    textFiled.placeholder = "Enter meal name"
    textFiled.frame.size = CGSize(width: 300, height: 30)
    textFiled.borderStyle = .roundedRect
    textFiled.enablesReturnKeyAutomatically = true
    textFiled.keyboardType = UIKeyboardType.emailAddress
    textFiled.returnKeyType = UIReturnKeyType.done
    textFiled.keyboardAppearance = UIKeyboardAppearance.alert
    textFiled.textContentType = UITextContentType.emailAddress
    return textFiled
  }()
  
  let label: UILabel = {
    let label = UILabel()
    label.text = "Meal Name"
    label.frame.size = CGSize(width: 300, height: 30)
    return label
  }()
  
  let button: UIButton = {
    let button = UIButton()
    button.setTitle("Set Default Label Text", for: .normal)
    button.tintColor = UIColor.blue
    button.setTitleColor(UIColor.blue, for: .normal)
    button.frame.size = CGSize(width: 150, height: 30)
    button.layer.cornerRadius = 10.0
    button.layer.masksToBounds = true
    return button
  }()
  
  //StackViewをつくる
  let stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.spacing = 12
    stackView.backgroundColor = UIColor.red
    stackView.alignment = .leading
    stackView.distribution = .fill
    return stackView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.stackView.frame = self.view.frame
    self.stackView.addArrangedSubview(self.label)
    self.stackView.addArrangedSubview(self.textFiled)
    self.stackView.addArrangedSubview(self.button)
    self.view.addSubview(stackView)
    self.stackView.frame = CGRect(x: 0, y: 50, width: 300, height: 100)
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    print(self.view.safeAreaInsets)
  }
  
  override func viewWillLayoutSubviews() {
    print(self.view.safeAreaInsets)
  }
  
  override func viewDidLayoutSubviews() {
    print(self.view.safeAreaInsets)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    print(self.view.safeAreaInsets)
  }
  
  override func didReceiveMemoryWarning() {
    //メモリワーニングを受け取った直後に呼ばれるメソッド
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

