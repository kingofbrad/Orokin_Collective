import SwiftUI

struct VoidTraderCountDownTimer: View {
    @State private var timeRemaining: TimeInterval = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let endOfDay: Date
    let expiryDate: Date

    init(expiryDateString: String) {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        dateFormatter.timeZone = TimeZone(identifier: "UTC")


        
        if let date = dateFormatter.date(from: expiryDateString) {
            let calendar = Calendar.current
            let endOfDayComponents = calendar.dateComponents([.year, .month, .day], from: Date())
            let endOfDayDate = calendar.date(from: endOfDayComponents)?.addingTimeInterval(24 * 60 * 60) ?? Date()
            self.endOfDay = endOfDayDate < date ? endOfDayDate : date
            self.expiryDate = date
        } else {
            // If date parsing fails, fallback to current date
            self.endOfDay = Date()
            self.expiryDate = Date()
        }
    }

    var body: some View {
        ZStack{
        RoundedRectangle(cornerRadius: 5)
              .frame(width: 109, height: 25)
              .foregroundStyle(Color.tundora)
          Text("\(daysRemaining())d \(timeString(time: timeRemaining))")
              .font(.system(size: 15).weight(.semibold))
      }
        .onReceive(timer) { _ in
            let now = Date()
            if now < endOfDay {
                timeRemaining = endOfDay.timeIntervalSince(now)
            } else {
                timeRemaining = 0
                timer.upstream.connect().cancel()
            }
        }
    }
    
    func daysRemaining() -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: Date(), to: expiryDate)
        return components.day ?? 0
    }
    
    func hoursRemaining() -> Int {
        let calendar = Calendar.current
        let remainingHours = calendar.dateComponents([.hour], from: Date(), to: endOfDay).hour ?? 0
        return max(0, remainingHours) // Ensure remaining hours don't go negative
    }
    
    func timeString(time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
}

struct VoidTraderCountDownTimer_Previews: PreviewProvider {
    static var previews: some View {
        VoidTraderCountDownTimer(expiryDateString: "2024-04-07T13:00:00.000Z")
    }
}


private struct CountDownTimerTest: View {
    var body: some View {
        Text("Hello there")
    }
}
