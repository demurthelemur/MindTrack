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
        changePet(petName: selectedPet)
        currentUser.petType = selectedPet
        UserDefaults.standard.set(selectedPet, forKey: "petType")
        print(currentUser.petType)
    }
    
    private func changePet(petName: String) {
        let id = UserDefaults.standard.string(forKey: "id")
        guard let url = URL(string: "http://localhost:8080/users/pet/\(id!)") else {return}
        let body: [String : String] = ["petType": "\(petName)"]
        let JSONBody = try! JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = JSONBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            print(response)
        }.resume()
    }
}

