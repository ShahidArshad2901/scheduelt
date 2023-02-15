//
//  ContentView.swift
//  Scheduelt
//
//  Created by Dev on 13/02/2023.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State var selected: Date?
    @State private var date: Date = Date.now
    @State private var dateNumber: Int = 0
    @State private var showingAddExpense = false
    @State private var showingDay = false
    @StateObject var events = Events()
    let dates = setDates()
    let currentDay = dateFormatter.string(from: Date.now)
    
    // MARK: - Body
    var body: some View {
        
        NavigationView {
            List{
                
                ForEach(0..<dates.count){ num in
                    let day = dateFormatter.string(from: dates[num])
                    ZStack {
                        HStack{
                            Text("\(day)")
                                .foregroundColor(day == currentDay ? .green : .blue)
                                .font(.headline)
                            Spacer()
                            Text("\(countEvents(of: dates[num])) Events")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Image(systemName: "chevron.right")
                                .foregroundColor(.green)
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 14)
                                .foregroundColor(.white)
                                .shadow(color: .blue ,radius: 2)
                        )
                        .onTapGesture {
                            selected = self.dates[num]
                            self.showingDay = true
                        }
                        .sheet(item: $selected, content: { item in
                            DayView(date: item)
                        })
                    }
                }
            }
            .navigationTitle("Scheduelt")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddEvent(events: events)
            }
        }
    }
    
    // MARK: - Helper Functions
    func countEvents(of eventDate: Date) -> Int {
        return events.events.reduce(0) { count, event in
            if Calendar.current.isDate(event.date, inSameDayAs: eventDate) {
                return count + 1
            }
            return count
        }
    }

    
    func removeEvents(at offsets: IndexSet) {
        events.events.remove(atOffsets: offsets)
    }
}

extension Date: Identifiable {
    public var id: Date { self }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// calling is awesome

//
// ContentView.swift
// Scheduelt
//
// Created by Dev on 13/02/2023.
//

//import SwiftUI
//
//struct ContentView: View {
//  @State private var date: Int = 0
//
//  @State private var showingAddExpense = false
//  @State private var showingDay = false
//  @StateObject var events = Events()
//
//  let dateFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateFormat = "MMM d"
//    return formatter
//  }()
//
//  var body: some View {
//    NavigationView {
//      List {
//        let days = setDates()
//        ForEach(days, id: \.self) { date in
////          Text("\(dateFormatter.string(from: date))")
//          ZStack {
//           HStack{
//            Image(systemName: "\(dates[num]).circle.fill").imageScale(.large)
//            .foregroundColor(dates[num] == 15 ? .green : .blue)
//            ForEach(events.events) { event in
//            if (event.date == dates[num] ){ Text(event.title)}
//            }
//            .onDelete(perform: removeEvents)
//            .font(.system(size: 14))
//            .foregroundColor(.gray)
//
//           }
//
//           Button(""){
//            self.showingDay = true
//            self.date = self.dates[num]
//           }
//           .sheet(isPresented: $showingDay) {
//            DayView(date: self.date)
//           }
//          }
//        }
//      }
//      .navigationTitle("Scheduelt")
//      .toolbar {
//        Button {
//          showingAddExpense = true
//        } label: {
//          Image(systemName: "plus")
//        }
//      }
//      .sheet(isPresented: $showingAddExpense) {
//        AddEvent(events: events)
//      }
//      .environment(\.defaultMinListRowHeight, 60)
//    }
//  }
//
//  func removeEvents(at offsets: IndexSet) {
//    events.events.remove(atOffsets: offsets)
//  }
//
//  func setDates() -> [Date] {
//    let calendar = Calendar.current
//    var currentDate = Date()
//    var days: [Date] = []
//    for _ in 0..<30 {
//      days.append(currentDate)
//      currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
//    }
//    return days
//  }
//}
//
//
//struct ContentView_Previews: PreviewProvider {
//  static var previews: some View {
//    ContentView()
//  }
//}
//
//
//
// ContentView.swift
// Scheduelt
//
// Created by Dev on 13/02/2023.
//
//
//import SwiftUI
//
//struct ContentView: View {
// @State private var date: Int = 0
//  let dateFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateFormat = "MMM d"
//    return formatter
//  }()
//
// @State private var showingAddExpense = false
// @State private var showingDay = false
// @StateObject var events = Events()
// let dates = Array(13...22)
//// let now = Date.now
//// let tomorrow = Date.now.addingTimeInterval(259200)
//// let dates = setDates
//// let dates = Array(Date.now...Date.now.addingTimeInterval(259200))
// var body: some View {
//  NavigationView {
//   List{
//    let days = setDates()
//    ForEach(0..<days.count){ num in
//     ZStack {
//      HStack{
////       Image(systemName: "\(dates[num]).circle.fill").imageScale(.large)
////       .foregroundColor(dates[num] == 15 ? .green : .blue)
//        Text("\(dateFormatter.string(from: days[num]))")
////       ForEach(events.events) { event in
////       if (event.date == dates[num] ){ Text(event.title)}
////       }
////       .onDelete(perform: removeEvents)
////       .font(.system(size: 14))
////       .foregroundColor(.gray)
//
//      }
//
//      Button(""){
//       self.showingDay = true
//       self.date = self.dates[num]
//      }
//      .sheet(isPresented: $showingDay) {
//       DayView(date: self.date)
//      }
//     }
//    }
//
//
//   }.navigationTitle("Scheduelt")
//    .toolbar {
//     Button {
//      showingAddExpense = true
//     } label: {
//      Image(systemName: "plus")
//     }
//    }
//    .sheet(isPresented: $showingAddExpense) {
//     AddEvent(events: events)
//    }
//    .environment(\.defaultMinListRowHeight, 60)
//  }
//
// }
// func removeEvents(at offsets: IndexSet) {
//  events.events.remove(atOffsets: offsets)
// }
//
//  func setDates() -> [Date] {
//    let calendar = Calendar.current
//    var currentDate = Date()
//    var days: [Date] = []
//    for _ in 0..<30 {
//      days.append(currentDate)
//      currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
//    }
//    return days
//  }
//
//  func formatDate(dateString: String) -> String {
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "EEEE, MMMM dd, yyyy 'at' hh:mm:ss a, z"
//    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
//    let date = dateFormatter.date(from: dateString)!
//    dateFormatter.dateFormat = "MMMM dd"
//    return dateFormatter.string(from: date)
//  }
//}
//
//struct ContentView_Previews: PreviewProvider {
// static var previews: some View {
//  ContentView()
// }
//}
