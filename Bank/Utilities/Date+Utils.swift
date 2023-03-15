//
//  Date+Utils.swift
//  Bank
//
//  Created by Asadullah Behlim on 14/03/23.
//

import Foundation

extension Date {
    static var bankDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "DMT")
        return formatter
    }
    
    var dayMonthYearString: String {
        let dateFormatter = Date.bankDateFormatter
        dateFormatter.dateFormat = "dd / MM / yyyy"
        return dateFormatter.string(from: self)
    }
}
