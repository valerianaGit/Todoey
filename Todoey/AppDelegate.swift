//
//  AppDelegate.swift
//  Todoey
//
//  Created by Valeria Duran on 8/30/18.
//  Copyright © 2018 Valeria Duran. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
       // print(Realm.Configuration.defaultConfiguration.fileURL)
       
        
        do {
        _ = try Realm()
          
        } catch {
            print("Error initializing new realm, \(error)")
        }
              return true
    }

}
