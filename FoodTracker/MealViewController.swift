//
//  ViewController.swift
//  FoodTracker
//
//  Created by 中川万莉奈 on 2018/01/24.
//  Copyright © 2018年 中川万莉奈. All rights reserved.
//

import UIKit
import os.log

class MealViewController: UIViewController {

    //MARK: -propties-
    var cancelButton: UIBarButtonItem!
    var saveButton: UIBarButtonItem!
    var originViewController = MealTableViewController()
    //選択されたセル番号を保存する
    var selectedIndexPath: IndexPath!
    
    
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
    
    //渡すオブジェクト
    var meal: Meal?

    //MARK: -lifecycle-
    override func loadView() {
        super.loadView()
        cancelButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel, target: self, action: #selector(MealViewController.tappedLeftBarButton))
        saveButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.save, target: self, action: #selector(MealViewController.tappedRightBarButton))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.myStackView.initLayout()
        self.myStackView.textFiled.delegate = self
        self.view.addSubview(self.myStackView)
        
        //Mealにデータが入っている場合
        if let meal = meal {
            self.navigationItem.title = meal.name
            self.myStackView.textFiled.text = meal.name
            self.myStackView.imageView.image = meal.photo
            self.myStackView.ratingControllView.rating = meal.rating
        }

        //ジェスチャーを導入
        let singleTap: UITapGestureRecognizer = {
            let singleTap = UITapGestureRecognizer(target: self, action: #selector(MealViewController.selectImageFromPhotoLibrary(sender:)))
            singleTap.numberOfTapsRequired = 1
            return singleTap
        }()
        self.myStackView.imageView.addGestureRecognizer(singleTap)
        
        //MARK: ナビゲーションバーの設定
        self.navigationController!.setNavigationBarHidden(false, animated: false)
        self.navigationItem.title = "タイトル"
        self.navigationItem.leftBarButtonItem = self.cancelButton
        self.navigationItem.rightBarButtonItem = self.saveButton

        //テキストフィールドに名前が入るとNavigation Bar のタイトルが変更される
        self.updateSaveButtonState()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //SafeAreaができたら制約をかける
        self.constraints()
        
        
    }
    
    override func viewSafeAreaInsetsDidChange() {
    }
    
    //制約の更新中に呼び出され、ビューコントローラがプロセスを調整できるようにします
    override func updateViewConstraints() {
        super.updateViewConstraints()
    }
    
    //レイアウトされる前に実行される関数
    override func viewWillLayoutSubviews() {
        //print(self.view.safeAreaInsets)
        super.viewWillLayoutSubviews()
        self.myStackView.layoutIfNeeded()
    }
    
    //レイアウトされた後に実行される関数
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }

    override func didReceiveMemoryWarning() {
        //メモリワーニングを受け取った直後に呼ばれるメソッド
        super.didReceiveMemoryWarning()
    }
    

    func constraints() {
        //myStackViewの制約
        self.myStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        self.myStackView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, constant: 10).isActive = true
        self.myStackView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
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
    
    // MARK: Navigation
    
    /*
     NavigationBarButtonイベント
     */
    //MARK: saveボタンをタップしたときのアクション
    @objc func tappedRightBarButton() {
        //キーボードをしまう
        self.myStackView.textFiled.resignFirstResponder()
        
        //変更されたデータを入れる
        let name = self.myStackView.textFiled.text ?? ""
        let photo = self.myStackView.imageView.image
        let rating = self.myStackView.ratingControllView.rating
        
        meal = Meal(name: name, photo: photo, rating: rating)
        
        //現在モーダル遷移かプッシュ遷移どちらで表示されているのか判定する
        let isPresentingIndAddMealMode = presentingViewController is UINavigationController
        //モーダルの時に実行する関数
        if isPresentingIndAddMealMode {
            self.originViewController.unwindToMealList(sourceViewController: self)
            self.dismiss(animated: true, completion:nil)
        }
        //プッシュの時に実行する関数
        else if let owingNavigationController = navigationController {
            self.originViewController.fixToMealList(sourceViewController: self, indexPath: self.selectedIndexPath)
        }
        else {
            fatalError("The MealViewController is not inside a navigation controller.")
        }
       
    }
    
    //MARK: キャンセルボタンをタップしたときのアクション
    @objc func tappedLeftBarButton() {
        //現在モーダル遷移かプッシュ遷移どちらで表示されているのか判定する
        let isPresentingIndAddMealMode = presentingViewController is UINavigationController
        //モーダルの時の遷移方法
        if isPresentingIndAddMealMode {
            self.dismiss(animated: true, completion: nil)
        }
        //プッシュの時の遷移方法
        else if let owingNavigationController = navigationController {
            owingNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("The MealViewController is not inside a navigation controller.")
        }
        
    }
    
    //MARK: エディットボタンをタップしたときのアクション
    @objc func tappedEditButton() {
        //キーボードをしまう
        self.myStackView.textFiled.resignFirstResponder()
        
        let name = self.myStackView.textFiled.text ?? ""
        let photo = self.myStackView.imageView.image
        let rating = self.myStackView.ratingControllView.rating
        
        meal = Meal(name: name, photo: photo, rating: rating)
        
        self.originViewController.fixToMealList(sourceViewController: self, indexPath: self.selectedIndexPath)
    }


}

// MARK: UITextFiledDelegate
extension MealViewController: UITextFieldDelegate {

    // MARK: リターンキーが押された時に実行される関数
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //キーボードを隠す関数
        textField.resignFirstResponder()
        return true
    }

    //MARK: テキストを入力し終わった時に実行される関数
    //First Responder が解除された後に呼ばれるデリゲートメソッド
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.updateSaveButtonState()
        navigationItem.title = textField.text
        
    }
    
    //MARK: テキストが編集し始めた時キーボードが出現した時に呼ばれるメソッド
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.saveButton.isEnabled = false
    }
    
    //MARK: Private Methods
    fileprivate func updateSaveButtonState() {
        let text = self.myStackView.textFiled.text ?? ""
        self.saveButton.isEnabled = !text.isEmpty
    }
}



