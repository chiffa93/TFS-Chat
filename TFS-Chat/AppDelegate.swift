//
//  AppDelegate.swift
//  Lifecycle Logger
//
//  Created by a.kramerov on 14.02.2020.
//  Copyright © 2020 a.kramerov. All rights reserved.
//

import UIKit

#if DEBUG
let debugVersion = true
#else
let debugVersion = false
#endif


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    

    var pastState = "No status"
    var currentState  = String()
    var funcName = String()
    
    func appState () {
        switch UIApplication.shared.applicationState {
        case .active where currentState != "Active":
            currentState = "Active"
            print("Приложение перешло из статуса \(pastState) в статус \(currentState). Метод: \(funcName)")
            pastState = currentState
        case .background where currentState != "Background":
            currentState = "Background"
            print("Приложение перешло из статуса \(pastState) в статус \(currentState). Метод: \(funcName)")
            pastState = currentState
        case .inactive where currentState != "Inactive":
            currentState = "Inactive"
            print("Приложение перешло из статуса \(pastState) в статус \(currentState). Метод: \(funcName)")
            pastState = currentState
        default:
            print("Состояние приложения не изменилось. Метод: \(funcName)")
        }
    }
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        funcName = #function
        debugVersion ? appState() : ()
        return true
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        funcName = #function
        debugVersion ? appState() : ()
        return true
    }

}

