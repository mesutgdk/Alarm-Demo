//
//  AppDelegate.swift
//  task2_app
//
//  Created by Mesut Gedik on 29.08.2023.
//

import UIKit
import AVFoundation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { (approved, error) in
                   if approved {
                       print("İzin Alındı Hadi İyisin")
                   } else {
                       print("İzin Verilmedi, Malesef")
                   }
               }
               
               return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        // Configure the audio session
           do {
               try AVAudioSession.sharedInstance().setCategory(.playback)
               try AVAudioSession.sharedInstance().setActive(true)
           } catch {
               print("Error setting audio session: \(error.localizedDescription)")
           }
        
        // Start playing the alarm sound
        SoundManager.shared.playAlarmSound()
        
        completionHandler(.newData)
    }
}

