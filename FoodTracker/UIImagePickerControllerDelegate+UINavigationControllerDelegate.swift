//
//  UIImagePickerControllerDelegate+UINavigationControllerDelegate.swift
//  FoodTracker
//
//  Created by 中川万莉奈 on 2018/01/30.
//  Copyright © 2018年 中川万莉奈. All rights reserved.
//

import UIKit

// MARK: UIImagePickerControllerDelegate+UINavigationControllerDelegate
extension ViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
  //ユーザーが画像の選択をキャンセルした時に実行される関数
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    dismiss(animated: true, completion: nil)
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
        fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
    }
    self.imageView.image = selectedImage
    
    dismiss(animated: true, completion: nil)
  }
  
}
