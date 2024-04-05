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
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [.withInternetDateTime]
        
        if let date = isoDateFormatter.date(from: apiDateString) {
            expiryDate = date
        } else {
            // Fallback to current date if conversion fails
            expiryDate = Date()
        }
    }
    
    var body: some View {
        VStack {
            Text("Expiry Date: \(expiryDate, formatter: dateFormatter)")
            Text("Day of Expiry: \(calculateDayOfExpiry())")
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
        ExpiryDateView(apiDateString: "2024-04-07T13:00:00.000Z")
    }
}


struct TimeRemainingTimer_Days_View: View {
    let activation: String
    let expiry: String
    @State private var timer: Timer?
    @State private var countDownText: String = ""
    
   
    
    
    var body: some View {
        
        HStack {
            ExpiryDateView(apiDateString: expiry)
            ZStack{
            RoundedRectangle(cornerRadius: 5)
                    .frame(height: 25)
                  .foregroundStyle(Color.tundora)
              Text(countDownText)
                  .font(.system(size: 15).weight(.semibold))
          }
            .frame(width: 170)
            .onAppear {
                self.startTimer()
            }
            .onDisappear {
                self.stopTimer()
            }
        
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
            return countDownText = "\(timeRemaining(from: currentDate, to: activationDate))"
            
        } else if currentDate >= activationDate && currentDate < expiryDate {
            return countDownText = "\(timeRemaining(from: currentDate, to: expiryDate))"
        } else {
            stopTimer()
            return countDownText = "Expired"
            
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
}

#Preview {
    TimeRemainingTimer_Days_View(activation: "2024-04-05T13:00:00.000Z", expiry: "2024-04-07T13:00:00.000Z")
}
