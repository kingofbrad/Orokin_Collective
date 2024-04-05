import SwiftUI

struct CountdownView: View {
    @State private var timeRemaining: TimeInterval = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let expiryDate: Date

    init(expiryDateString: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        if let date = dateFormatter.date(from: expiryDateString) {
            self.expiryDate = date
        } else {
            // If date parsing fails, fallback to current date
            self.expiryDate = Date()
        }
    }

    var body: some View {
        ZStack{
          RoundedRectangle(cornerRadius: 5)
                .frame(width: 109, height: 25)
                .foregroundStyle(Color.tundora)
            Text("\(timeString(time: timeRemaining))")
                .font(.system(size: 15).weight(.semibold))
        }
        .onReceive(timer) { _ in
            let now = Date()
            if now < expiryDate {
                timeRemaining = expiryDate.timeIntervalSince(now)
            } else {
                timeRemaining = 0
                timer.upstream.connect().cancel()
            }
        }
    }
    
    func timeString(time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView(expiryDateString: "2024-04-05T21:29:00.000Z")
    }
}
