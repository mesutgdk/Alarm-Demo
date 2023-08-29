//
//  ViewController.swift
//  task2_app
//
//  Created by Mesut Gedik on 29.08.2023.
//

import UIKit

final class AlarmViewController: UIViewController {
    
    private let alarmManager = AlarmManager()
    
    private let datePicker: UIPickerView = {
        var picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    private let setButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 25
        button.backgroundColor = .systemIndigo
        button.setTitle("Set alarm", for: [])
        button.addTarget(self, action: #selector(setButtonTapped), for: .primaryActionTriggered)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        layout()
        
    }
    
    private func setup (){
        view.addSubviews(datePicker,setButton)
      
        view.backgroundColor = .systemBackground
        
        datePicker.delegate = self
        datePicker.dataSource = self

    }
    private func layout() {
        // datePicker
        NSLayoutConstraint.activate([
            datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150),
            datePicker.heightAnchor.constraint(equalToConstant: 100),
            datePicker.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            datePicker.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
        ])
        // setButton
        NSLayoutConstraint.activate([
            setButton.heightAnchor.constraint(equalToConstant: 50),
            setButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),
            setButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            setButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50)
        ])
    }
    
}
// MARK: - Action
extension AlarmViewController{
    @objc func setButtonTapped(){
        print(alarmManager.getSelectedTimeFromPicker(pickerView: datePicker))
        
        let alert = UIAlertController(title: "Successfull", message: "Alarm successfully set!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
}

// MARK: - PickerView Delegate and DataSourse
extension AlarmViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return component == 0 ? alarmManager.hourArray.count : alarmManager.minuteArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            let hour = alarmManager.hourArray[row] < 10 ? "0\(alarmManager.hourArray[row])" : "\(alarmManager.hourArray[row])"
            return hour
        } else {
            let minute = alarmManager.minuteArray[row] < 10 ? "0\(alarmManager.minuteArray[row])" : "\(alarmManager.minuteArray[row])"
            return minute
        }
    }
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 70
    }

}

