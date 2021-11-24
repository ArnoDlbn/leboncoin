//
//  DateFormatter.swift
//  leboncoin
//
//  Created by Arnaud DALBIN on 23/11/2021.
//

import Foundation

class DateFormatter {
    static func getFullDate(date: String?) -> String? {
        guard let date = date else { return nil }
        let currentDate = Date()
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        let dateFormatted = dateFormatter.date(from: date)
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "UTC")!
        let month = calendar.component(.month, from: dateFormatted ?? currentDate)
        let monthString = month<10 ? String(format: "%02d", month) : String(month)
        let year = calendar.component(.year, from: dateFormatted ?? currentDate)
        let day = calendar.component(.day, from: dateFormatted ?? currentDate)
        let hour = calendar.component(.hour, from: dateFormatted ?? currentDate)
        let minutes = calendar.component(.minute, from: dateFormatted ?? currentDate)
        let minutesString = minutes<10 ? String(format: "%02d", minutes) : String(minutes)
        let result = "Le \(day)/\(monthString)/\(year) à \(hour):\(minutesString)"
        return result
    }
}
