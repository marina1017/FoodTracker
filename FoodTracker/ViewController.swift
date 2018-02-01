//
//  ViewController.swift
//  FoodTracker
//
//  Created by 中川万莉奈 on 2018/01/24.
//  Copyright © 2018年 中川万莉奈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: -propties-
    //mystackViewをつかう
    let myStackView: MyStackView = {
        let stackView = MyStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.title = "てすとてすと"
        return stackView
    }()

    //MARK: -lifecycle-
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myStackView.initLayout()
        self.myStackView.textFiled.delegate = self
        self.view.addSubview(self.myStackView)

        //ジェスチャーを導入
        let singleTap: UITapGestureRecognizer = {
            let singleTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.selectImageFromPhotoLibrary(sender:)))
            singleTap.numberOfTapsRequired = 1
            return singleTap
        }()
        self.myStackView.imageView.addGestureRecognizer(singleTap)


    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
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
        //myStackViewの制約
        self.myStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.safeAreaInsets.top + self.view.frame.height/10).isActive = true
        self.myStackView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        self.myStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
    }

    @objc func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        //キーボードを閉じる
        self.myStackView.textFiled.resignFirstResponder()

        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        imagePickerController.modalTransitionStyle = .coverVertical
        self.present(imagePickerController, animated: true, completion: nil)

    }

    

    @objc func setDefaultLabelText(_ sender: UIButton) {
        self.myStackView.title = "触りました"
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
        self.myStackView.title = textField.text
    }
}

