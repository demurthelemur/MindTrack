//
//  SettingsPageView.swift
//  MindTrack
//
//  Created by Demir Dereli on 8.09.2023.
//

import SwiftUI

struct SettingsPageView: View {
    @ObservedObject var currentUser: User
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    ChangePet(currentUser: currentUser)
                } label: {
                    HStack {
                        Image(systemName: "pawprint.fill")
                        Text("Change Pet Type")
                    }
                }
                
                NavigationLink {
                    NotificationTimer()
                } label: {
                    HStack {
                        Image(systemName: "clock.fill")
                        Text("Change Quiz Timing")
                    }
                }

            }
            .navigationTitle("Settings")
            
            BigButtonWithCustomColor(action: logOutButtonClicked, buttonText: "Log Out", color: Color.red)
        }
    }
    
    private func logOutButtonClicked() {
        UserDefaults.standard.set(false, forKey: "userState")
    }
}


