//
//  RPS.swift
//  RockPaperScissors
//
//  Created by qussk on 3/21/24.
//

import Foundation

fileprivate enum Hand {
    static let paper: String = "🖐️"
    static let rock: String = "✊"
    static let scissor: String = "✌️"
    
    static let hands: [String] = [paper, rock, scissor]
}

struct Genealogy {
    let win = "승"
    let lose = "패"
    let draw = "무"
    
    //가위바위보 족보
    func determineWinner(hand: [String]) -> String {
        switch hand {
        case ["🖐️", "✊"] : return win
        case ["🖐️", "✌️"] : return lose
        case ["✊", "✌️"] : return win
        case ["✊", "🖐️"] : return lose
        case ["✌️", "🖐️"] : return win
        case ["✌️", "✊"] : return lose
        default:
            return draw
        }
    }
    
}

class RPS {
    let genealogy: Genealogy
    
    init(genealogy: Genealogy) {
        self.genealogy = genealogy
    }

    
    func rpsModify(of rps: [String]) throws -> Bool {
        guard rpsHandsCheck(of: rps),
              !rpsEmptyCheck(of: rps)
        else {
            throw NSError() as Error
        }
        
        fightToMatch(of: rps)
        
        return true
    }
    
    //손인지 확인
    private func rpsHandsCheck(of rps: [String]) -> Bool {
        return !rps.filter { Hand.hands.contains($0) }.isEmpty
    }
    
    //비어있는지 확인
    private func rpsEmptyCheck(of rps: [String]) -> Bool {
        return !rps.filter { $0 == "" }.isEmpty
    }
        
    //승패 확인
    func fightToMatch(of rps: [String]) -> [Int] {
        return fightToCounting(of: genealogy.determineWinner(hand: rps))
    }
    
    //승패 카운팅
    func fightToCounting(of matching: String) -> [Int] {
        var counts:[Int] = [0, 0]
        
        if matching == "승" {
            counts[0] += 1
        } else if matching == "패" {
            counts[1] += 1
        }

        return counts
    }
    
    func besttwooutOfthree() {
        
    }
    
}
