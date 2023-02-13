//
//  ContentView.swift
//  Scheduelt
//
//  Created by Dev on 13/02/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAddExpense = false
    @StateObject var events = Events()
    let dates = Array(13...22)
    var body: some View {
        NavigationView {
            VStack(  alignment: .leading, spacing: 15) {
                ForEach(0..<dates.count){ num in
                    HStack{
                        Image(systemName: "\(dates[num]).circle.fill").imageScale(.large)
                            .foregroundColor(dates[num] == 15 ? .green : .blue)
                        ForEach(events.events) { event in
                            if (event.date == dates[num] ){ Text(event.title)}
                        }
                        .onDelete(perform: removeEvents)
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }
                    Divider()
                }
                
            }.navigationTitle("Scheduelt")
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
            .padding()
        }
        
    }
    func removeEvents(at offsets: IndexSet) {
        events.events.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
