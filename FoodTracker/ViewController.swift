//
//  ViewController.swift
//  FoodTracker
//
//  Created by 中川万莉奈 on 2018/01/24.
//  Copyright © 2018年 中川万莉奈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let customView: CustomView = {
    let view = CustomView(frame: CGRect.zero)
    view.title = "こんにちは"
    return view
  }()
  
  let textFiled: UITextField = {
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
  }()
  
  let label: UILabel = {
    let label = UILabel()
    label.text = "Meal Name"
    return label
  }()
  
  
  let button: UIButton = {
    let button = UIButton()
    button.setTitle("Set Default Label Texta", for: .normal)
    button.tintColor = UIColor.blue
    button.setTitleColor(UIColor.blue, for: .normal)
    button.layer.cornerRadius = 10.0
    button.layer.masksToBounds = true
    button.addTarget(self, action: #selector(ViewController.setDefaultLabelText(_:)), for: .touchUpInside)
    return button
  }()
  
  let imageView: UIImageView = {
    let imageView = UIImageView()
    let image1:UIImage = UIImage(named:"2011031921220116bs.jpg")!
    imageView.backgroundColor = UIColor.green
    imageView.image = image1
    imageView.frame.size = CGSize(width: 320, height: 320)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.isUserInteractionEnabled = true
    
    
    
    return imageView
  }()
  
  
  @objc func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
    //キーボードを閉じる
    self.textFiled.resignFirstResponder()
    
    let imagePickerController = UIImagePickerController()
    imagePickerController.sourceType = .photoLibrary
    imagePickerController.delegate = self
    imagePickerController.modalTransitionStyle = .coverVertical
    self.present(imagePickerController, animated: true, completion: nil)
    
  }
  
  //StackViewをつくる
  let stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.spacing = 12
    stackView.alignment = .leading
    stackView.distribution = .fill
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  let layoutMarginsGuideView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.red
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  @objc func setDefaultLabelText(_ sender: UIButton) {
    self.label.text = "Default Text"
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor.blue
    
    self.textFiled.delegate = self
    
    self.stackView.addArrangedSubview(self.label)
    self.stackView.addArrangedSubview(self.textFiled)
    self.stackView.addArrangedSubview(self.button)
    self.stackView.addArrangedSubview(self.imageView)
    self.stackView.addSubview(self.customView)
    

    self.view.addSubview(self.layoutMarginsGuideView)
    self.layoutMarginsGuideView.addSubview(stackView)
    
    //ジェスチャーを導入
    let singleTap:UITapGestureRecognizer = {
      let singleTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.selectImageFromPhotoLibrary(sender:)))
      singleTap.numberOfTapsRequired = 1
      return singleTap
    }()
    self.imageView.addGestureRecognizer(singleTap)
    
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    //print(self.view.safeAreaInsets)
  }
  
  override func viewWillLayoutSubviews() {
    //print(self.view.safeAreaInsets)
  }
  
  override func viewDidLayoutSubviews() {
    //print(self.view.safeAreaInsets)
    print(self.view.layoutMarginsGuide.leadingAnchor)
    
    //制約をかける
    self.constraints()
    
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    //print(self.view.safeAreaInsets)
  }
  
  override func didReceiveMemoryWarning() {
    //メモリワーニングを受け取った直後に呼ばれるメソッド
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func constraints() {
    //stackVeiwの制約
    self.stackView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuideView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
    self.stackView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuideView.safeAreaLayoutGuide.trailingAnchor, constant: 20)
    self.stackView.topAnchor.constraint(equalTo: self.layoutMarginsGuideView.topAnchor).isActive = true
    
    // SafeAreaのガイド
    if #available(iOS 11, *) {
      self.layoutMarginsGuideView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
      self.layoutMarginsGuideView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
      self.layoutMarginsGuideView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
      self.layoutMarginsGuideView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
    } else {
      self.layoutMarginsGuideView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
      self.layoutMarginsGuideView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
      self.layoutMarginsGuideView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
      self.layoutMarginsGuideView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
    }
    
    //textFiledの制約
    self.textFiled.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 0).isActive = true
    self.textFiled.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor, constant: 0).isActive = true
    
    
    //imageViewの制約
    //Aspect Ratioがみつからないのでとりあえず
    let aspectRatioConstraint = NSLayoutConstraint(item: self.imageView,attribute: .height,relatedBy: .equal,toItem: self.imageView,attribute: .width,multiplier: (1.0 / 1.0),constant: 0)
    self.imageView.addConstraint(aspectRatioConstraint)
    self.imageView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0)
    self.imageView.frame.size = CGSize(width: 320, height: 320)
    
    
    
  }


}

// MARK: UITextFiledDelegate
extension ViewController: UITextFieldDelegate {
  
  // MARK: リターンキーが押された時に実行される関数
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //キーボードを隠す関数
    textField.resignFirstResponder()
    return true
  }
  
  //MARK: テキストを入力し終わった時に実行される関数
  //First Responder が解除された後に呼ばれるデリゲートメソッド
  func textFieldDidEndEditing(_ textField: UITextField) {
    self.label.text = textField.text
  }
}

