//
//  QuestionModel.swift
//  MindTrack
//
//  Created by Demir Dereli on 10.09.2023.
//

import Foundation

struct QuestionModel: Identifiable {
    let id = UUID()
    let Question: String
    let questionType: QuestionType
    let Answers: [Answer]? //Use for Radio Questions
    let impact: Int? //Use for slider questions
}

struct Answer: Identifiable {
    let id = UUID()
    let AnswerText: String
    let impactPoint: Int
}

enum QuestionType {
    case Radio
    case Slider
}

let developmentTestQuestions: [QuestionModel] = [
    QuestionModel(Question: "How are you feeling today?", questionType: .Slider, Answers: nil, impact: 3),
    QuestionModel(Question: "How are you feeling today?", questionType: .Radio, Answers: [Answer(AnswerText: "Good", impactPoint: 5), Answer(AnswerText: "Mid", impactPoint: 0), Answer(AnswerText: "Bad", impactPoint: -5)], impact: nil),
    QuestionModel(Question: "What type of food did you eat today?", questionType: .Radio, Answers: [Answer(AnswerText: "Balanced Diet", impactPoint: 5), Answer(AnswerText: "Mixed", impactPoint: 0), Answer(AnswerText: "Fast Food Mostly", impactPoint: -5)], impact: nil),
    QuestionModel(Question: "How was the weather today (from terrible to great)?", questionType: .Slider, Answers: nil, impact: 3),
    QuestionModel(Question: "Did you medidate today", questionType: .Radio, Answers: [Answer(AnswerText: "Yes", impactPoint: 5), Answer(AnswerText: "No", impactPoint: -5)], impact: nil),
    QuestionModel(Question: "Did you medidate today", questionType: .Radio, Answers: [Answer(AnswerText: "Yes", impactPoint: 5), Answer(AnswerText: "No", impactPoint: -5)], impact: nil),
    QuestionModel(Question: "Did you medidate today", questionType: .Radio, Answers: [Answer(AnswerText: "Yes", impactPoint: 5), Answer(AnswerText: "No", impactPoint: -5)], impact: nil)
]
