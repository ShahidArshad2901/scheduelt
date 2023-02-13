//
//  EventItem.swift
//  Scheduelt
//
//  Created by Dev on 13/02/2023.
//

import Foundation

struct EventItem: Identifiable, Codable {
    var id = UUID()
    let title: String
    let description: String
    let startTime: Date
    let endTime: Date
    let date: Int
}
