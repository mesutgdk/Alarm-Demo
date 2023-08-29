//
//  AlarmManager.swift
//  task2_app
//
//  Created by Mesut Gedik on 29.08.2023.
//

import UIKit

struct AlarmManager{
    let hourArray = Array(0...23)
    let minuteArray = Array(0...59)
    
    func getSelectedTimeFromPicker(pickerView: UIPickerView) -> (Int, Int) {
        let selectedHourRow = pickerView.selectedRow(inComponent: 0)
        let selectedMinuteRow = pickerView.selectedRow(inComponent: 1)
        
        let selectedHour = hourArray[selectedHourRow]
        let selectedMinute = minuteArray[selectedMinuteRow]
        
        return (selectedHour, selectedMinute)
    }
}
