//
//  DecodingHlper.swift
//  weatherBM
//
//  Created by zyad baset on 10/01/2025.
//

import Foundation
final class DateOptimizer {
    
    func getDayName(from dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: dateString) {
            let calendar = Calendar.current
            if calendar.isDateInToday(date) {
                return "Today"
            } else {
                dateFormatter.dateFormat = "EEE"
                return dateFormatter.string(from: date)
            }
        }
        return dateString
    }
}
