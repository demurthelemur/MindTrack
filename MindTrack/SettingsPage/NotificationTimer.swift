//
//  NotificationTimer.swift
//  MindTrack
//
//  Created by Demir Dereli on 13.10.2023.
//

import SwiftUI
import UserNotifications

struct NotificationTimer: View {
    @AppStorage("notificationSetup") var notificationSetup: Bool = false
    @State private var selectedDate = Date()
    
    var body: some View {
        
        if notificationSetup == false {
            Text("No notification has been set yet")
                .padding(.top)
                .font(.title)
        }
        
        Spacer()
        
        Text("Please select the time for your daily reminder")
        
        DatePicker("Select a date", selection: $selectedDate, displayedComponents: .hourAndMinute)
            .labelsHidden()
        
        Spacer()
        
        Button("Set-Up Notifications") {
            if notificationSetup == false {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                        notificationSetup = true
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
            
            if notificationSetup {
                UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
            }
            
            let content = UNMutableNotificationContent()
            content.title = "Daily Reminder"
            content.body = "Don't forget to complete your quiz today."
            
            let calendar = Calendar.current
            let components = calendar.dateComponents([.day, .hour, .minute], from: selectedDate)
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("Error scheduling notification: \(error.localizedDescription)")
                } else {
                    print("Notification scheduled successfully.")
                }
            }
            
        }
        
    }
}

#Preview {
    NotificationTimer()
}
