//
//  DayView.swift
//  Scheduelt
//
//  Created by Dev on 13/02/2023.
//


import SwiftUI

struct DayView: View {
    let hours = getHours()
    @StateObject var events = Events()
    let timeNow = timeFormatter.string(from: Date.now)
    var date: Date
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(0..<hours.count) { num in
                    let hour = timeFormatter.string(from: hours[num])
                    HStack {
                        Text("\(hour)")
                            .font(.headline)
                            .foregroundColor(.indigo)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(events.events) { event in
                                    if (dateFormatter.string(from: event.date) == dateFormatter.string(from: date) && hours[num] >= event.startTime) && hours[num] <=  event.endTime {
                                        Text("\(event.title) ")
                                            .foregroundColor(.white)
                                            .padding(5)
                                            .background(
                                                RoundedRectangle(cornerRadius: 8)
                                                    .fill(Color.indigo)
                                                    .shadow(color: Color.red.opacity(0.5), radius: 4, x: 1, y: 1)
                                            )
                                    }
                                }
                            }
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("\(dateFormatter.string(from: date))")
            .navigationBarTitleDisplayMode(.inline)
        }
        .accentColor(.blue)
    }
}

        
        //    func getHours(time: Date) -> Int{
        //        let components = Calendar.current.dateComponents([.hour, .minute], from: time)
        //        return (components.hour ?? 0) * 1

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView(date: Date.now)
    }
}
