//
//  Actions.swift
//  RockPaperScissors
//
//  Created by Park Sungmin on 3/19/24.
//

import Foundation

enum Actions: Int, CaseIterable {
    case rock = 0, paper, sissor
    
    var icon: String {
        get {
            switch self {
            case .rock:
                return "✊"
            case .paper:
                return "🖐️"
            case .sissor:
                return "✌️"
            }
        }
    }
    
    static func random() -> Actions? {
        return Actions.allCases.randomElement()
    }
}
