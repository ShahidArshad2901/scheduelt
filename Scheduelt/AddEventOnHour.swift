import SwiftUI

struct AddEventOnHour: View {
    @ObservedObject var events: Events
    @State private var title = ""
    let date: Date
    @State private var description = ""
    let startTime: Date
    @State private var endTime = defaultStartTime
    
    static var defaultStartTime: Date{
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Date: \(dateFormatter.string(from: date)) and Hour: \(timeFormatter.string(from: startTime))")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.vertical, 8)
                
                TextField("Title", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .accentColor(.blue)
                    .padding(.vertical, 8)
                
                TextField("Description", text: $description)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .accentColor(.blue)
                    .padding(.vertical, 8)
                
                VStack(alignment: .leading) {
                    Text("End Time")
                        .font(.subheadline)
                        .foregroundColor(.indigo)
                        .padding(.vertical, 8)
                    
                    DatePicker("", selection: $endTime, in: startTime.addingTimeInterval(60 * 60)..., displayedComponents: .hourAndMinute)
                        .accentColor(.blue)
                }
                .padding(.vertical, 8)
                
                Spacer()
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.blue, lineWidth: 2)
            )
            .padding()
            .navigationBarTitle("Add New Event")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        let event = EventItem(title: title, description: description, startTime: set(of: startTime), endTime: set(of: endTime), date: date)
                        withAnimation {
                            events.events.append(event)
                        }
                    }
                    .foregroundColor(.indigo)
                }
            }
        }
        .accentColor(.indigo)
    }
    
    func set(of time: Date) -> Date{
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        let date = calendar.date(from: components)!
        let time = calendar.date(bySettingHour: calendar.component(.hour, from: time),
                                  minute: calendar.component(.minute, from: time),
                                  second: 0, of: date)!
        return time
    }
}

struct AddEventOnHour_Previews: PreviewProvider {
    static var previews: some View {
        AddEventOnHour(events: Events(), date: Date(), startTime: Date())
    }
}
