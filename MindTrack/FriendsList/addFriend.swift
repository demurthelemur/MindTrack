//
//  addFriend.swift
//  MindTrack
//
//  Created by Demir Dereli on 20.12.2023.
//

import SwiftUI

struct addFriendView: View {
    @Binding var show: Bool
    @Binding var ID: String
    @Binding var showAlert: Bool
    @Binding var friendsList: [FriendModel]

    var body: some View {
        VStack(spacing: 20) {
            Text("Add Friend")
            TextField("Enter the ID of the Friend", text: $ID)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            

            Button("OK") {
                let id = UserDefaults.standard.string(forKey: "id")
                guard let url = URL(string: "http://localhost:8080/users/addfriend/\(id!)") else {return}
                let body: [String : String] = ["friendId": "\(ID)"]
                let JSONBody = try! JSONSerialization.data(withJSONObject: body)
                
                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.httpBody = JSONBody
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                URLSession.shared.dataTask(with: request) { (data, response, error) in
                    if let _ = error {
                        showAlert = true
                    } else {
                        guard let response = response as? HTTPURLResponse else {return}
                        if response.statusCode == 200 {
                            do {

                            } catch {
                                print("\(error)")
                            }
                        } else {
                            print(response)
                            showAlert = true
                        }
                    }

                }.resume()
                show = false
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}
