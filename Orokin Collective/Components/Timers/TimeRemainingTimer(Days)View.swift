//
//  TimeRemainingTimer(Days)View.swift
//  Orokin Collective
//
//  Created by Bradlee King on 05/04/2024.
//

import SwiftUI

struct ExpiryDateView: View {
    let expiryDate: Date
    
    init(apiDateString: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        
        
        if let date = dateFormatter.date(from: apiDateString) {
            expiryDate = date
        } else {
            // Fallback to current date if conversion fails
            expiryDate = Date()
        }
    }
    
    var body: some View {
        VStack {
            Text("\(calculateDayOfExpiry()) \(expiryDate, formatter: dateFormatter)")
        }
    }
    
    private func calculateDayOfExpiry() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: expiryDate)
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }
}

struct ExpiryDateView_Previews: PreviewProvider {
    static var previews: some View {
        ExpiryDateView(apiDateString: "2024-04-16T18:11:00.000Z")
    }
}


struct TimeRemainingTimer_Days_View: View {
    let activation: String
    let expiry: String
    @State private var timer: Timer?
    @State private var countdownText: String = ""
    @State private var countdownTimer: String = ""
    @State private var travelText: String = ""
    @State private var timeText: String = ""
    
    
    
    
    var body: some View {
        
        
        
        VStack(alignment: .leading)
        {
            HStack{
                Text(timeText)
                    .foregroundStyle(Color.white)
                Text(countdownTimer)
                    
            }
            HStack{
                Text(travelText)
                    .foregroundStyle(Color.white)
                Text(countdownText)
                    
            }
            
        }
        
        .onAppear {
            self.startTimer()
        }
        .onDisappear {
            self.stopTimer()
        }
        
        
        
        
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {  _ in
            self.updateCountDown()
        }
        updateCountDown()
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    
    func updateCountDown() {
        let activationDate = DateUtils.dateFromString(activation)
        let expiryDate = DateUtils.dateFromString(expiry)
        let currentDate = Date()
        
        if currentDate < activationDate {
            let activationDay = DateUtils.stringFromDate(activationDate, format: "d'\(self.getDaySuffix(from: activationDate))' MMMM yyyy")
            timeText = "Arrives in:"
            travelText = "Arrives on:"
            countdownText = "\(activationDay)"
            countdownTimer = "\(timeRemaining(from: currentDate, to: activationDate))"
        } else if currentDate >= activationDate && currentDate < expiryDate {
            let expiryDay = DateUtils.stringFromDate(expiryDate, format: "d'\(self.getDaySuffix(from: expiryDate))' MMMM yyyy")
            timeText = "Departs in:"
            travelText = "Departs on:"
            countdownText = "\(expiryDay)"
            countdownTimer = "\(timeRemaining(from: currentDate, to: expiryDate))"
        } else {
            // Reset countdown to activation time
            let activationDay = DateUtils.stringFromDate(activationDate, format: "d'\(self.getDaySuffix(from: activationDate))' MMMM yyyy")
            timeText = "Arrives in:"
            travelText = "Arrives on:"
            countdownText = "\(activationDay)"
            countdownTimer = "\(timeRemaining(from: currentDate, to: activationDate))"
        }
    }
    
    func timeRemaining(from startDate: Date, to endDate: Date) -> String {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .hour,.minute,.second], from: startDate, to: endDate)
        
        let days = components.day ?? 0
        let hours = components.hour ?? 0
        let minutes = components.minute ?? 0
        let seconds = components.second ?? 0
        
        if days > 0 {
            return "\(days)d \(hours)h \(minutes)m \(seconds)s"
        } else {
            return String(format:"%02d:%02d:%02d:%02d", days,hours,minutes,seconds)
            
        }
        
    }
    func getDaySuffix(from date: Date) -> String {
        let calendar = Calendar.current
        let dayOfMonth = calendar.component(.day, from: date)
        
        switch dayOfMonth {
        case 1, 21, 31:
            return "st"
        case 2, 22:
            return "nd"
        case 3, 23:
            return "rd"
        default:
            return "th"
        }
    }
}

struct DateUtils {
    static func dateFromString(_ dateString: String) -> Date {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        if let date = formatter.date(from: dateString) {
            return date
        } else {
            fatalError("Invalid date string")
        }
    }
    
    static func stringFromDate(_ date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}

#Preview {
    TimeRemainingTimer_Days_View(activation: "2024-04-05T00:00:00.000Z", expiry: "2024-04-07T13:00:00.000Z")
}
