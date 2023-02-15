//
//  AddEvent.swift
//  Scheduelt
//
//  Created by Dev on 13/02/2023.
//

import SwiftUI

struct AddEvent: View {
    
    @ObservedObject var events: Events
    @State private var title = ""
    @State private var date = Date()
    @State private var description = ""
    @State private var startTime = defaultStartTime
    @State private var endTime = defaultStartTime
    
    static var defaultStartTime: Date{
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
//    let dates = Array(13...22)
    
    var body: some View {
            NavigationView {
                Form {
                    let days = setDates()
                    Section {
                        TextField("Title", text: $title)
                            .accentColor(.indigo)
                        TextField("Description", text: $description)
                            .accentColor(.indigo)
                    }
                    Section(header: Text("Start Time").foregroundColor(.indigo)) {
                        DatePicker("Pick Start Time", selection: $startTime,  displayedComponents: .hourAndMinute)
                            .accentColor(.indigo)
                    }
                    Section(header: Text("End Time").foregroundColor(.indigo)) {
                        DatePicker("Pick an end time", selection: $endTime,in: startTime...,  displayedComponents: .hourAndMinute)
                            .accentColor(.indigo)
                            
                    }
                    Section(header: Text("Date").foregroundColor(.indigo)) {
                        DatePicker("Pick a date", selection: $date, in: Date.now..., displayedComponents: .date)
                            .accentColor(.indigo)
                    }
                }
                
                .navigationTitle("Add New Event")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Save") {
                            let event = EventItem(title: title, description: description, startTime: startTime, endTime: endTime, date: date)
                            events.events.append(event)
                        }
                        .foregroundColor(.indigo)
                    }
                }
                
            }
            .accentColor(.indigo)
        
        }
}

struct AddEvent_Previews: PreviewProvider {
    static var previews: some View {
        AddEvent(events: Events())
    }
}
