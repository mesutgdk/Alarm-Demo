//
//  ViewController.swift
//  task2_app
//
//  Created by Mesut Gedik on 29.08.2023.
//

import UIKit

class AlarmViewController: UIViewController {
    
    var datePicker: UIPickerView = {
        var picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    let setButton: UIButton = {
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
        // Do any additional setup after loading the view.
        setup()
        layout()
    }
    private func setup (){
        view.addSubviews(datePicker,setButton)
        view.backgroundColor = .white
    }
    private func layout() {
        // datePicker
        NSLayoutConstraint.activate([
            datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            datePicker.heightAnchor.constraint(equalToConstant: 100),
            datePicker.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            datePicker.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
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
        
    }
}
// MARK: -PickerView Delegate and DataSourse
extension AlarmViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 30
    }
    
}

