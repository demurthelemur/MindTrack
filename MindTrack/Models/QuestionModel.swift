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
    QuestionModel(Question: "How are you feeling today?", Answers: [Answer (AnswerText: "Good", impactPoint: 5), Answer (AnswerText: "Mid", impactPoint: 2), Answer (AnswerText: "Bad", impactPoint: -5)]),
    QuestionModel(Question: "What type of food did you eat today?", Answers: [Answer(AnswerText: "Balanced Diet", impactPoint: 5), Answer (AnswerText: "Mixed", impactPoint: 2), Answer(AnswerText: "Fast Food Mostly", impactPoint: -5)]),
    QuestionModel(Question: "Did you medidate today", Answers: [Answer (AnswerText: "Yes", impactPoint: 5), Answer(AnswerText: "No", impactPoint: -5)]),
    QuestionModel(Question: "Did you work out today", Answers: [Answer (AnswerText: "Yes", impactPoint: 5), Answer(AnswerText: "No", impactPoint: -5)]),
    QuestionModel(Question: "Did you work on your hobbies today", Answers: [Answer (AnswerText: "Yes", impactPoint: 5), Answer(AnswerText: "No", impactPoint: -5)]),
    QuestionModel(Question: "Did you learn something new today?", Answers: [Answer(AnswerText: "Yes, a lot", impactPoint: 5),Answer(AnswerText: "Yes, a little", impactPoint: 3), Answer(AnswerText: "No", impactPoint: -2)]),
    QuestionModel(Question: "Did you set and achieve specific goals for the day?", Answers: [Answer(AnswerText: "Yes, all of them", impactPoint: 5),Answer(AnswerText: "Some", impactPoint: 3), Answer(AnswerText: "None", impactPoint: -2)]),
    QuestionModel(Question: "Did you spend quality time with loved ones today?", Answers: [Answer(AnswerText: "Yes, a lot", impactPoint: 4),Answer(AnswerText: "Some", impactPoint: 2), Answer(AnswerText: "No", impactPoint: -2)]),
    QuestionModel(Question: "How much water did you drink today?", Answers: [Answer(AnswerText: "Adequate amount", impactPoint: 4),Answer(AnswerText: "Some", impactPoint: 2), Answer(AnswerText: "Very little", impactPoint: -3)]),
    QuestionModel(Question: "How much screen time did you have today?", Answers: [Answer(AnswerText: "Limited", impactPoint: 3),Answer(AnswerText: "Moderate", impactPoint: 1), Answer(AnswerText: "Excessive", impactPoint: -2)]),
    QuestionModel(Question: "How well did you prioritize tasks and manage your workload today?", Answers: [Answer(AnswerText: "Very well", impactPoint: 4),Answer(AnswerText: "Okay", impactPoint: 2), Answer(AnswerText: "Poorly", impactPoint: -3)]),
    QuestionModel(Question: "How well did you stick to your planned schedule or routine today?", Answers: [Answer(AnswerText: "Very well", impactPoint: 4),Answer(AnswerText: "Moderately well", impactPoint: 2), Answer(AnswerText: "Poorly", impactPoint: -3)]),
    QuestionModel(Question: "Did you take breaks to relax and recharge during work or study?", Answers: [Answer(AnswerText: "Frequently", impactPoint: 4),Answer(AnswerText: "Occasionally", impactPoint: 2), Answer(AnswerText: "Rarely", impactPoint: -3)]),
    QuestionModel(Question: "How much time did you spend in nature or outdoors today?", Answers: [Answer(AnswerText: "Significant time", impactPoint: 4),Answer(AnswerText: "Some time", impactPoint: 2), Answer(AnswerText: "None", impactPoint: -2)]),
    QuestionModel(Question: "How much time did you spend on activities you enjoy?", Answers: [Answer(AnswerText: "A significant amount", impactPoint: 4),Answer(AnswerText: "Some time", impactPoint: 2), Answer(AnswerText: "Negligible", impactPoint: -2)]),
    QuestionModel(Question: "Did you connect with friends or family members today?", Answers: [Answer(AnswerText: "Yes, meaningfully", impactPoint: 4),Answer(AnswerText: "Casually", impactPoint: 2), Answer(AnswerText: "No", impactPoint: -2)]),
    QuestionModel(Question: "Did you express your feelings and thoughts openly to someone today?", Answers: [Answer(AnswerText: "Yes, fully", impactPoint: 4),Answer(AnswerText: "Partially", impactPoint: 2), Answer(AnswerText: "No", impactPoint: -2)]),
    QuestionModel(Question: "How much time did you spend on activities that bring you joy?", Answers: [Answer(AnswerText: "Significant time", impactPoint: 4), Answer(AnswerText: "Some time", impactPoint: 2), Answer(AnswerText: "Negligible", impactPoint: -2)]),
    QuestionModel(Question: "How well did you maintain boundaries between work and personal life?", Answers: [Answer(AnswerText: "Very well", impactPoint: 4),Answer(AnswerText: "Moderately well", impactPoint: 2), Answer(AnswerText: "Poorly", impactPoint: -3)]),
    QuestionModel(Question: "How many hours did you sleep last night?", Answers: [Answer(AnswerText: "7-9 hours", impactPoint: 4),Answer(AnswerText: "5-6 hours", impactPoint: 2), Answer(AnswerText: "Less than 5 hours", impactPoint: -3)]),
    QuestionModel(Question: "How much time did you spend in natural light or sunshine today?", Answers: [Answer(AnswerText: "Significant time", impactPoint: 4),Answer(AnswerText: "Some time", impactPoint: 2), Answer(AnswerText: "None", impactPoint: -2)]),
    QuestionModel(Question: "Did you limit your caffeine intake and avoid it close to bedtime?", Answers: [Answer(AnswerText: "Yes, consistently", impactPoint: 4),Answer(AnswerText: "Moderately", impactPoint: 2), Answer(AnswerText: "No", impactPoint: -3)]),
    QuestionModel(Question: "Did you engage in any form of self-care or pampering today?", Answers: [Answer(AnswerText: "Yes, extensively", impactPoint: 4),Answer(AnswerText: "Moderately", impactPoint: 2), Answer(AnswerText: "No", impactPoint: -2)]),
    QuestionModel(Question: "How well did you adapt to unexpected challenges or changes in your day?", Answers: [Answer(AnswerText: "Very well", impactPoint: 4),Answer(AnswerText: "Okay", impactPoint: 2), Answer(AnswerText: "Poorly", impactPoint: -3)]),
    QuestionModel(Question: "How well did you manage and cope with any negative emotions or stressors today?", Answers: [Answer(AnswerText: "Very well", impactPoint: 4),Answer(AnswerText: "Moderately well", impactPoint: 2), Answer(AnswerText: "Struggled", impactPoint: -3)]),
    QuestionModel(Question: "Did you use stairs instead of the elevator or choose to walk for short distances today?", Answers: [Answer(AnswerText: "Always", impactPoint: 4),Answer(AnswerText: "Sometimes", impactPoint: 2), Answer(AnswerText: "Never", impactPoint: -2)]),
    QuestionModel(Question: "How well did you manage your personal and professional boundaries today?", Answers: [Answer(AnswerText: "Very well", impactPoint: 4),Answer(AnswerText: "Moderately well", impactPoint: 2), Answer(AnswerText: "Poorly", impactPoint: -3)]),
    QuestionModel(Question: "Did you change into clean clothes and maintain overall cleanliness?", Answers: [Answer(AnswerText: "Yes, completely", impactPoint: 4),Answer(AnswerText: "Partially", impactPoint: 2), Answer(AnswerText: "No", impactPoint: -2)]),
    QuestionModel(Question: "Did you shower or bathe today?", Answers: [Answer(AnswerText: "Yes, thoroughly", impactPoint: 4),Answer(AnswerText: "Quick shower", impactPoint: 2), Answer(AnswerText: "No", impactPoint: -2)]),
    QuestionModel(Question: "How well did you take care of your oral hygiene today?", Answers: [Answer(AnswerText: "Very well", impactPoint: 4),Answer(AnswerText: "Moderately well", impactPoint: 2), Answer(AnswerText: "Neglected", impactPoint: -2)]),
    QuestionModel(Question: "Did you wear clean and appropriate clothing today?", Answers: [Answer(AnswerText: "Yes, always", impactPoint: 4),Answer(AnswerText: "Some outfits were clean", impactPoint: 2), Answer(AnswerText: "Wore the same clothes", impactPoint: -2)]),
    QuestionModel(Question: "Did you change and launder your bed linens or sleepwear today?", Answers: [Answer(AnswerText: "Yes, regularly", impactPoint: 4),Answer(AnswerText: "Sometimes", impactPoint: 2), Answer(AnswerText: "No", impactPoint: -2)])

]
