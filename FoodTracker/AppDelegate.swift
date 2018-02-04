//
//  AppDelegate.swift
//  FoodTracker
//
//  Created by 中川万莉奈 on 2018/01/24.
//  Copyright © 2018年 中川万莉奈. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
    
    var myNavigationController: UINavigationController?


    // 起動した直後
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    self.window = UIWindow(frame: UIScreen.main.bounds)
    let initialViewController = MealTableViewController()
    
    
    let navigationController = UINavigationController(rootViewController: initialViewController)
    //ビューコントローラのビューがウィンドウのコンテンツビューとしてインストールされる
    //新しいコンテンツビューは、ウィンドウサイズが変更されると変更されてウィンドウサイズを追跡するように構成されています。
    //ウィンドウに既存のビュー階層がある場合、古いビューは新しいものがインストールされる前に削除されます。
    self.window?.rootViewController = navigationController
    
    //現在のウィンドウを表示し、それを同じレベルまたはそれ以下の他のすべてのウィンドウの前に置く便利な関数。
    self.window?.makeKeyAndVisible()
    
    
    
    return true
  }

  func applicationWillResignActive(_ application: UIApplication) {
    //アプリケーションがアクティブな状態にになる直前
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    //アプリケーションがアクティブな状態でバックグラウンドになった直後
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    //アプリケーションがアクティブな状態でフォアグラウンドになった直後
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    //アプリケーションがアクティブな状態になる直後
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(_ application: UIApplication) {
    //アプリケーションが終了する直前
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}

