//
//  Extensions.swift
//  TabataTimer
//
//  Created by MARCEAU Cyril on 10/10/2024.
//


import UIKit

extension UIScreen {
    static let screenWidth: CGFloat = UIScreen.main.bounds.size.width
    static let screenHeight: CGFloat = UIScreen.main.bounds.size.height
}


extension TimeInterval {
    var format: String {
            let endingDate = Date()
            let startingDate = endingDate.addingTimeInterval(-self)
            let calendar = Calendar.current

        let componentsNow = calendar.dateComponents([.hour, .minute, .second], from: startingDate, to: endingDate)
            if let minute = componentsNow.minute, let seconds = componentsNow.second {
                return "\(String(format: "%02d", minute)):\(String(format: "%02d", seconds))"
            } else {
                return "00:00"
            }
        }
}
