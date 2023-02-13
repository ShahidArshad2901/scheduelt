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
    @State private var date = 13
    @State private var description = "Personal"
    @State private var startTime = defaultStartTime
    @State private var endTime = defaultStartTime
    
    static var defaultStartTime: Date{
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    let dates = Array(13...22)
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
                DatePicker("Please enter a start time", selection: $startTime, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                DatePicker("Please enter an ending time", selection: $endTime, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                Picker("Date", selection: $date) {
                    ForEach(dates, id: \.self) {
                        Text("\($0)")
                    }
                }
            }
            .navigationTitle("Add new Event")
            .toolbar {
                Button ("Save") {
                    let event = EventItem(title: title, description: description,
                        startTime: startTime,
                        endTime: endTime,
                        date: date
                    )
                    events.events.append(event)
                }
            }
        }
    }
}

struct AddEvent_Previews: PreviewProvider {
    static var previews: some View {
        AddEvent(events: Events())
    }
}
