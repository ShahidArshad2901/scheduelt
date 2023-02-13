//
//  Events.swift
//  Scheduelt
//
//  Created by Dev on 13/02/2023.
//

import Foundation

class Events: ObservableObject {
    @Published var events = [EventItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(events) {
                UserDefaults.standard.set(encoded, forKey: "events")
            }
        }
    }
    
    init() {
        if let savedEvents = UserDefaults.standard.data(forKey: "events") {
            if let decodedEvents = try? JSONDecoder().decode([EventItem].self, from: savedEvents) {
                events = decodedEvents
                return
            }
        }
        
        events = []
    }
}
