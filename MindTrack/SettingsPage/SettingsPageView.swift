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
                    Text("Change Quiz Timing")
                } label: {
                    HStack {
                        Image(systemName: "clock.fill")
                        Text("Change Quiz Timing")
                    }
                }
                
                NavigationLink {
                    Text("Change Quiz Timing")
                } label: {
                    HStack {
                        Image(systemName: "person.fill")
                        Text("Account Settings")
                    }
                }
                
                Spacer()
                


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
