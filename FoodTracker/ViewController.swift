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
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.title = "てすとてすと"
        return stackView
    }()

    //MARK: -lifecycle-
    //1
    override func loadView() {
        super.loadView()
        self.debugLog()
    }
    //2
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
        //制約をかける
        self.constraints()
        self.debugLog()

    }
    //3
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.debugLog()
        
        
    }
    
    //制約の更新中に呼び出され、ビューコントローラがプロセスを調整できるようにします
    //7 9
    override func updateViewConstraints() {
        super.updateViewConstraints()
        self.debugLog()
    }
    
    //レイアウトされる前に実行される関数
    //4 10 12
    override func viewWillLayoutSubviews() {
        //print(self.view.safeAreaInsets)
        super.viewWillLayoutSubviews()
        //self.myStackView.setNeedsUpdateConstraints()
        self.debugLog()
    }
    
    //レイアウトされた後に実行される関数
    //8 11 13
    override func viewDidLayoutSubviews() {
        //print(self.view.safeAreaInsets)

        
        super.viewDidLayoutSubviews()
        self.debugLog()
    }
    //15
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        //print(self.view.safeAreaInsets)
        self.debugLog()
    }

    override func didReceiveMemoryWarning() {
        //メモリワーニングを受け取った直後に呼ばれるメソッド
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        self.debugLog()
    }

    func constraints() {
        //myStackViewの制約
        self.myStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.safeAreaInsets.top).isActive = true
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
    
    func print(debug: Any = "", function: String = #function, file: String = #file, line: Int = #line) {
        
            var filename: NSString = file as NSString
            filename = filename.lastPathComponent as NSString
            Swift.print("File: \(filename), Line: \(line), Func: \(function) \n\(debug)")
        
    }
    
    func debugLog( condition: @autoclosure () -> Bool = true, _ message: String = "", function: StaticString = #function, file: StaticString = #file, line: UInt = #line) {
        
        #if DEBUG
            if let fileName = NSURL(string: String(describing: file))?.lastPathComponent {
                Swift.print("function: \(function), file: \(fileName)")
            } else {
                Swift.print("function: \(function), file: \(file)")
            }
            
            assert(condition, message, file: file, line: line)
        #endif
        
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


