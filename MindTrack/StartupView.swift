//
//  StartupView.swift
//  MindTrack
//
//  Created by Demir Dereli on 23.09.2023.
//

import SwiftUI

struct StartupView: View {
    @State var path = NavigationPath()
    @State var userLoggedIn = false
    
    @ViewBuilder
    var body: some View {
        NavigationStack(path: $path) {
            if userLoggedIn {
                MainPageView()
            } else {
                LandingPage(userState: $userLoggedIn, path: $path)
            }
        }
    }
}

#Preview {
    StartupView()
}
