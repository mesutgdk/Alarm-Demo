//
//  AlarmManager.swift
//  task2_app
//
//  Created by Mesut Gedik on 29.08.2023.
//

import AVFoundation
import UIKit

struct AlarmManager{
    let hourArray = Array(0...23)
    let minuteArray = Array(0...59)
    
    
    func getSelectedTimeFromPicker(pickerView: UIPickerView) {
        let selectedHourRow = pickerView.selectedRow(inComponent: 0)
        let selectedMinuteRow = pickerView.selectedRow(inComponent: 1)
        
        let selectedHour = hourArray[selectedHourRow]
        let selectedMinute = minuteArray[selectedMinuteRow]
        
        print(selectedHour,selectedMinute)
        setAlarmButtonTapped(selectedHour: selectedHour, selectedHour: selectedMinute)
    }
    
    // MARK: - Creating an Alarm

    private func setAlarmButtonTapped(selectedHour hour: Int, selectedHour minute: Int) {
        
        // Create a UNMutableNotificationContent
        let content = UNMutableNotificationContent()
        content.title = "Wake Up!"
        content.body = "You shall not sleep"
        content.sound = .criticalSoundNamed(UNNotificationSoundName(rawValue: "wakeup.mp3"), withAudioVolume: 1)
        
        // Create a date based on the selected hour and minute
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        // Create a trigger based on the date
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // Create a request with the content and trigger
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        callTheAlart()
        
    }
    
    private func callTheAlart(){
        // Show success message using UIAlertController
        let alert = UIAlertController(title: "Successfull", message: "Alarm successfully set!", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(okayAction)
        
        // Present the alert
        if let VC = UIApplication.shared.windows.first?.rootViewController {
            VC.present(alert, animated: true, completion: nil)
        }
    }
    
    

    // Kullanımı
}
