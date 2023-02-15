//
//  Utils.swift
//  Scheduelt
//
//  Created by Dev on 14/02/2023.
//

import Foundation

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM d"
    return formatter
}()

let timeFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "h a"
    return formatter
}()

func setDates() -> [Date] {
    let calendar = Calendar.current
    var currentDate = Date()
    var days: [Date] = []
    for _ in 0..<30 {
        days.append(currentDate)
        currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
    }
    return days
}

func getHours() -> [Date] {
    var dateComponents = DateComponents()
    dateComponents.hour = 0
    dateComponents.minute = 0
    dateComponents.second = 0

    var hours: [Date] = []

    for hour in 0..<24 {
        dateComponents.hour = hour
        let hourDate = Calendar.current.date(from: dateComponents)!
        hours.append(hourDate)
    }

    return hours
}
