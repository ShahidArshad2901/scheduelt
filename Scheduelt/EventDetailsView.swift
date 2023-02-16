//
//  EventDetailsView.swift
//  Scheduelt
//
//  Created by Dev on 15/02/2023.
//

import SwiftUI

struct EventDetailsView: View {
    let event: EventItem
    @ObservedObject var events: Events
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            VStack(spacing: 16) {
                Text(event.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.indigo)
                Divider()
                VStack(alignment: .leading, spacing: 16) {
                    Text(event.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("Start Time:")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(timeFormatter.string(from: event.startTime))
                        .font(.body)
                        .foregroundColor(.black)
                    Text("End Time:")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(timeFormatter.string(from: event.endTime))
                        .font(.body)
                        .foregroundColor(.black)
                    Text("Date:")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(dateFormatter.string(from: event.date))
                        .font(.body)
                        .foregroundColor(.black)
                }
                .padding(20)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.white)
                        .shadow(radius: 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .strokeBorder(Color.blue, lineWidth: 2)
                        )
                )
                Button(action: {
                    withAnimation {
                        self.events.removeEvent(event)
                    }
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Delete Event")
                        .foregroundColor(.red)
                }
                .padding(.bottom)
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Event Details")
    }
}

