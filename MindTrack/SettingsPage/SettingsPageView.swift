//
//  SettingsPageView.swift
//  MindTrack
//
//  Created by Demir Dereli on 8.09.2023.
//

import SwiftUI

struct SettingsPageView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    Text("Destination")
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
        
    }
}

struct SettingsPageView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPageView()
    }
}
