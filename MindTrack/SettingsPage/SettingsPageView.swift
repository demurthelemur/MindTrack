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
    @Environment(\.presentationMode) var presentationMode
    @State private var showShareSheet = false
    
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

            
            BigBlueButton(action: shareID, buttonText: "Share ID")
                .sheet(isPresented: $showShareSheet) {
                    ShareSheet(itemsToShare: [currentUser.id])
                }

            BigButtonWithCustomColor(action: logOutButtonClicked, buttonText: "Log Out", color: Color.red)
        }
    }
    
    private func logOutButtonClicked() {
        presentationMode.wrappedValue.dismiss()
        UserDefaults.standard.set(false, forKey: "userState")
    }
    
    private func shareID() {
        showShareSheet = true
    }
}

struct ShareSheet: UIViewControllerRepresentable {
    var itemsToShare: [Any]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: itemsToShare, applicationActivities: nil)
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        // No update currently needed
    }
}
