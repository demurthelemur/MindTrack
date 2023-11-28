//
//  ChangePet.swift
//  MindTrack
//
//  Created by Demir Dereli on 28.11.2023.
//

import SwiftUI

struct ChangePet: View {
    @ObservedObject var currentUser: User
    @State var selectedPet = CharmanderModel().firstEvo
    
    var body: some View {
        

        Text("Change your pet")
            .padding(.horizontal)
        Picker("Label", selection: $selectedPet) {
            Text(CharmanderModel().firstEvo).tag(CharmanderModel().firstEvo)
            Text(PikachuModel().firstEvo).tag(PikachuModel().firstEvo)
            Text(SquirtleModel().firstEvo).tag(SquirtleModel().firstEvo)
        }
        
        BigBlueButton(action: changePet, buttonText: "Change Pet")
    }
    
    func changePet() {
        currentUser.petType = selectedPet
        print(currentUser.petType)
    }
}

