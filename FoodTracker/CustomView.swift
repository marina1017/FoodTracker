//
//  CustomView.swift
//  FoodTracker
//
//  Created by 中川万莉奈 on 2018/01/30.
//  Copyright © 2018年 中川万莉奈. All rights reserved.
//

import UIKit

class CustomView: UIView {
  // MARK: - Properties -
  lazy private var titleLabel:UILabel = self.createTitleView()
  lazy private var submitButton:UIButton = self.createUIbuttom()
  
  var title:String? {
    get {
      return titleLabel.text
    }
    set(title) {
      titleLabel.text = title
      self.setNeedsLayout()
    }
    
  }
  
  required override init(frame: CGRect) {
    super.init(frame: frame)
    self.commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.commonInit()
  }
  
  private func commonInit() {
    self.backgroundColor = UIColor.blue
    self.addSubview(self.titleLabel)
    self.addSubview(self.submitButton)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    self.layoutTitleLabel()
    self.layoutButtonLabel()
  }
  
  // MARK: - Create subviews -
  private func createTitleView() -> UILabel {
    let label = UILabel(frame: CGRect.zero)
    label.font = UIFont.systemFont(ofSize: 10)
    label.textColor = UIColor.black
    return label
  }
  
  private func createUIbuttom() -> UIButton {
    let button = UIButton(frame: CGRect.zero)
    button.setTitle("送信ボタン", for: .normal)
    return button
  }
  
  // MARK: - Layout subviews -
  private func layoutTitleLabel() {
    titleLabel.sizeToFit()
    titleLabel.center.x = self.frame.size.width/2
    titleLabel.frame.origin.y = 100
  }
  
  private func layoutButtonLabel() {
    submitButton.sizeToFit()
    submitButton.center.x = self.frame.size.width/2
    submitButton.frame.origin.y = titleLabel.frame.maxY + 10
  }

}
