//
//  QuizzResponse.swift
//  Queazzy
//
//  Created by Mickael PAYAN on 29/06/2023.
//

import Foundation

// MARK: - QuizzResponse
struct QuizzResponse: Codable {
    let responseCode: Int
    let results: [ResultResponse]
    
    enum CodingKeys: String, CodingKey {
        case responseCode = "response_code"
        case results
    }
}

// MARK: - Result
struct ResultResponse: Codable {
    let category: Category
    let type: TypeEnum
    let difficulty: Difficulty
    let question, correctAnswer: String
    let incorrectAnswers: [String]
    
    enum CodingKeys: String, CodingKey {
        case category, type, difficulty, question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
}

enum Category: String, Codable {
    case scienceNature = "Science & Nature"
}

enum Difficulty: String, Codable {
    case easy = "easy"
    case hard = "hard"
    case medium = "medium"
}

enum TypeEnum: String, Codable {
    case multiple = "multiple"
}
