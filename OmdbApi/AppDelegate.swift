//
//  AppDelegate.swift
//  OmdbApi
//
//  Created by cice on 11/1/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //HAY QUE DARLE UN ID AL NAVIGATION CONTROLLER EN EL STORYBOARD
        //ESTMOS CREANDO UN VIEWCONTROLLER MEDIANTE CODIGO. COMO CREAR PESTAÑS EN TIEMPO DE EJECUCION, SI QUEREMOS USAR EL MISMO CODIGO QUE EN LA OTRA
        
        
        if let tabBarController = window?.rootViewController as? UITabBarController{ //accedes a la ventana, al viewcontroller raiz y miras si es UITabBarController
            let storyboard = UIStoryboard(name: "Main", bundle: nil) //Creamos una constante Storyboard e iniciamos de tipo storyboard con el nombre main(El nombre del storiboard por defecto) y un bundle nil (que quiere decir que coge el bundle de esta aplicacion)
            let vc = storyboard.instantiateViewController(withIdentifier: "NavController")//Al tener el storyboard inicializado podemos ya utilizar sis metodos. Inicializamos el viewcontorller que tenga ese identificador
            vc.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 1) //1 PARA PODER IDENTIFICAR A QUE TABBARITEM SE REFIERE
            tabBarController.viewControllers?.append(vc) //Lo añadimos al tabBarController
        
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

