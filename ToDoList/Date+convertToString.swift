//
//  Date+convertToString.swift
//  ToDoList
//
//  Created by Chenyang Zhang on 6/27/17.
//  Copyright © 2017 Chenyang Zhang. All rights reserved.
//

import Foundation
extension Date {
    func convertToString() -> String {
        return DateFormatter.localizedString(from: self, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.medium)
    }
}

extension NSDate {
    func convertToString() -> String {
        return DateFormatter.localizedString(from: (self as Date), dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.medium)
    }
}
