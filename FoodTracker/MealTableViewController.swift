//
//  TableViewController.swift
//  FoodTracker
//
//  Created by 中川万莉奈 on 2018/02/03.
//  Copyright © 2018年 中川万莉奈. All rights reserved.
//

import UIKit
import os.log

class MealTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    // MARK: Properties
    //入力されるデータたち
    var meals = [Meal]()
    var myTableView = UITableView()
    
    

    //MARK: Private methods
    private func loadSampleMeals() {
        let photo1 = #imageLiteral(resourceName: "meal1")
        let photo2 = #imageLiteral(resourceName: "meal2")
        let photo3 = #imageLiteral(resourceName: "meal3")

        guard let meal1 = Meal(name: "Hamburger", photo: photo1, rating: 4) else {
            fatalError("Unable to instantialte meal1")
        }

        guard let meal2 = Meal(name: "Sushi Bento", photo: photo2, rating: 5) else {
            fatalError("Unable to instantialte meal2")
        }

        guard let meal3 = Meal(name: "Grilled Beaf", photo: photo3, rating: 3) else {
            fatalError("Unable to instantialte meal3")
        }

        meals += [meal1, meal2, meal3]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ナビゲーションバーの設定
        // タイトルをセット
        self.navigationItem.title = "title font test"
        let barButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(MealTableViewController.pushButton(sender:)))
        self.navigationItem.setRightBarButton(barButton, animated: true)
        self.navigationItem.leftBarButtonItem = editButtonItem
        //データの呼び出し
        if let savedMeals = loadMeals() {
            meals += savedMeals
        } else {
            loadSampleMeals()
        }
        // iOS 11 からの機能
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
        if #available(iOS 11.0, *) {
            // この ViewController でどうするか
            self.navigationItem.largeTitleDisplayMode = .always
            self.dismiss(animated: true){
                
            }
        }

        //テーブルビュー
        myTableView = UITableView(frame: self.view.frame, style: .plain)
        myTableView.rowHeight = 100
        myTableView.delegate = self
        myTableView.dataSource = self
        //表示するUITableViewCellクラスを登録する
        //NSStrignFromClassはクラスの名前をStringで返してくれる
        myTableView.register(MealTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(MealTableViewCell.self))
        self.view.addSubview(myTableView)
        
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    //セクションの数を定義するUITableViewDataSource
    //UITableViewDelegate はセルの選択やセルの高さなど Table View の操作に関するものです。
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //行数 セクションによって行数が違う場合はsectionで場合分けをするUITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.meals.count
    }

    //列ごとに表示するセルを決めるデリゲートメソッド
    //UITableViewDataSource は主に Table View が表示するデータを与えるものです。
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //セルを取得するメソッド
        // Identifier はどの型セルを再利用または作成するかを決めるものです。
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(MealTableViewCell.self), for: indexPath) as? MealTableViewCell else {
            fatalError("The dequeued cell is not instance of MealTableViewCell.")
        }

        let meal = meals[indexPath.row]
        cell.nameLabel.text = meal.name
        cell.photoImageView.image = meal.photo
        cell.ratingControl.rating = meal.rating
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Sample"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let second = MealViewController()
        //セルの選択解除
        tableView.deselectRow(at: indexPath, animated: true)
        //遷移先のMealViewControllerに遷移元のself(MealTableViewController)を渡しておく
        second.originViewController = self
        //選択したセルの番号に対応するデータを取り出す
        let selectedMeal = meals[indexPath.row]
        second.meal = selectedMeal
        second.selectedIndexPath = indexPath
        //遷移先コントローラーの渡してプッシュ遷移を行う
        self.navigationController?.pushViewController(second, animated: true)
    }
    
    //TableView編集時のデリゲートメソッド
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //indexPath.row番目のモデルをmealsから削除している
            meals.remove(at: indexPath.row)
            //データの永続化
            saveMeals()
            //削除したのをtableViewに反映させている
            self.myTableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            //データを挿入する場合はこの辺にかけばいいらしい
        }
    }
    
    //TableViewの条件付き編集をサポートする関数　指定した項目を編集可能にしたい場合はtrueを返す
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //追加ボタンをおした時
    @objc func pushButton(sender:UIButton) {
        let second = MealViewController()
        //遷移先のMealViewControllerに遷移元のself(MealTableViewController)を渡しておく
        second.originViewController = self
        //遷移する前にナビゲーションコントローラーのインスタンスに遷移先のViewContorollerを入れる
        let navVC = UINavigationController(rootViewController:second)
        //ナビゲーションコントローラーの渡してモーダル遷移を行う
        self.present(navVC, animated: true, completion: nil)
    }
    
    //MealViewControllerから戻ってきた時mealsにデータを入れる
    func unwindToMealList(sourceViewController: MealViewController) {
        
        if let meal = sourceViewController.meal {
            // mealsの配列に新しいデータを入れる
            let newIndexPath = IndexPath(row: meals.count, section: 0)
            meals.append(meal)
            saveMeals()
            self.myTableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    //すでに入っているデータを修正する
    func fixToMealList(sourceViewController: MealViewController, indexPath: IndexPath) {
        if let meal = sourceViewController.meal {
            // mealsの配列に新しいデータを入れる
            self.meals[indexPath.row] = meal
            saveMeals()
            self.myTableView.reloadRows(at: [indexPath], with: .none)
        }
    }
    
    //データの永続化 meals を保存するタイミングになったらこのメソッドを呼び出す
    //このメソッドには保存できる形式にした Meal オブジェクトを適切な場所に保存する処理をかく
    private func saveMeals() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(meals, toFile: Meal.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("保存が成功しました", log: OSLog.default, type: .debug)
        } else {
            os_log("保存が失敗しました", log:OSLog.default, type: .error)
        }
    }
    
    private func loadMeals() -> [Meal]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Meal.ArchiveURL.path) as? [Meal]
    }
    
    
}

