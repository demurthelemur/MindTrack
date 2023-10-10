//
//  QuestionViewModel.swift
//  MindTrack
//
//  Created by Demir Dereli on 10.10.2023.
//

import Foundation

class QuestionViewModel: ObservableObject {
    @Published var totalPoint = 0
    @Published var question1ImpactPoint: Double = 0
    @Published var question2ImpactPoint = 0
    @Published var question3ImpactPoint = 0
    @Published var question4ImpactPoint: Double = 0
    @Published var question5ImpactPoint = 0
    @Published var question6ImpactPoint = 0
    @Published var question7ImpactPoint = 0
    
}
