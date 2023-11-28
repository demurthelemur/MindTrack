//
//  AppToolbar.swift
//  MindTrack
//
//  Created by Demir Dereli on 10.09.2023.
//

import SwiftUI

struct AppToolbar: View {
    @ObservedObject var currentUser: User
    
    var body: some View {
        HStack {
            NavigationLink(destination: FriendsListView()) {
                Image(systemName: "person.crop.circle.fill.badge.plus")
            }
            
            Spacer()
            
            Text("MindTrack")
                .bold()
                .font(.title)
            
            Spacer()
            
            NavigationLink(destination: SettingsPageView(currentUser: currentUser)) {
                Image(systemName: "gearshape.fill")
            }
        }
    }
}
