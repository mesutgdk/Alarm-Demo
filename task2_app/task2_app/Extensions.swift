//
//  Extensions.swift
//  task2_app
//
//  Created by Mesut Gedik on 29.08.2023.
//

import UIKit

extension UIView{
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
