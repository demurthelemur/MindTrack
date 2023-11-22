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
    let Answers: [Answer]? //Use for Radio Questions
}

struct Answer: Identifiable {
    let id = UUID()
    let AnswerText: String
    let impactPoint: Int
}

let developmentTestQuestions: [QuestionModel] = [
    QuestionModel(Question: "How are you feeling today?", Answers: [Answer(AnswerText: "Good", impactPoint: 5), Answer(AnswerText: "Mid", impactPoint: 2), Answer(AnswerText: "Bad", impactPoint: -5)]),
    QuestionModel(Question: "What type of food did you eat today?", Answers: [Answer(AnswerText: "Balanced Diet", impactPoint: 5), Answer(AnswerText: "Mixed", impactPoint: 2), Answer(AnswerText: "Fast Food Mostly", impactPoint: -5)]),
    QuestionModel(Question: "Did you medidate today", Answers: [Answer(AnswerText: "Yes", impactPoint: 5), Answer(AnswerText: "No", impactPoint: -5)]),
    QuestionModel(Question: "Did you work out today", Answers: [Answer(AnswerText: "Yes", impactPoint: 5), Answer(AnswerText: "No", impactPoint: -5)]),
    QuestionModel(Question: "Did you work on your hobbies today", Answers: [Answer(AnswerText: "Yes", impactPoint: 5), Answer(AnswerText: "No", impactPoint: -5)]),
    QuestionModel(Question: "Did you work on your hobbies today", Answers: [Answer(AnswerText: "Yes", impactPoint: 5), Answer(AnswerText: "No", impactPoint: -5)]),
    QuestionModel(Question: "Did you work on your hobbies today", Answers: [Answer(AnswerText: "Yes", impactPoint: 5), Answer(AnswerText: "No", impactPoint: -5)])

]
