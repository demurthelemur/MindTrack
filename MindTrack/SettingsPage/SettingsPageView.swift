//
//  SettingsPageView.swift
//  MindTrack
//
//  Created by Demir Dereli on 8.09.2023.
//

import SwiftUI
import UIKit

struct SettingsPageView: View {
    @ObservedObject var currentUser: User
    @State var showAlert = false
    
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
            .alert(isPresented: $showAlert) {
                Alert(
                  title: Text("Coppied your ID"),
                  message: Text("Share your ID to add new Friends"),
                    dismissButton: .default(Text("OK"))
                )
            }
            
            Button {
                let textToCopy = currentUser.id
                UIPasteboard.general.string = textToCopy
                showAlert = true
            } label: {
                Text("Current user ID: \(currentUser.id)")
                    .bold()
            }
            
            BigButtonWithCustomColor(action: logOutButtonClicked, buttonText: "Log Out", color: Color.red)
        }
    }
    
    private func logOutButtonClicked() {
        UserDefaults.standard.set(false, forKey: "userState")
    }
}


