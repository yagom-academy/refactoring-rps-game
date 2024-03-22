//
//  RPS.swift
//  RockPaperScissors
//
//  Created by qussk on 3/21/24.
//

import Foundation


//GameView에 있는 fileprivate enum의 Hand를 공유해도 되는 건지.? 일단 따로 쓰긴했어요..

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
    var count:[Int] = [0,0]

    init(genealogy: Genealogy) {
        self.genealogy = genealogy
    }

    
    func rpsModify(of rps: [String]) throws -> Bool {
        guard rpsHandsCheck(of: rps),
              !rpsEmptyCheck(of: rps)
        else {
            throw NSError() as Error
        }
        
        var countting = self.count
        
        while !besttwooutOfthree(of: 3, in: countting)[0] && !besttwooutOfthree(of: 3, in: countting)[1] {
            print(self.count)
            countting = fightToMatch(of: rps, count: self.count)
       
        }
        
        return fightToResult(of: besttwooutOfthree(of: 3, in: countting))
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
    func fightToMatch(of rps: [String], count: [Int]) -> [Int] {
        return fightToCounting(of: genealogy.determineWinner(hand: rps), counts: count)
    }
    
    //승패 카운팅
    func fightToCounting(of matching: String, counts: [Int]) -> [Int] {
        var counts:[Int] = counts
        
        if matching == "승" {
            counts[0] += 1
        } else if matching == "패" {
            counts[1] += 1
        }

        self.count = counts
        return counts
    }
        
    //삼세판
    func besttwooutOfthree(of target: Int, in counting: [Int]) -> [Bool] {
        return counting.map { $0 == target } //[true, false]
    }
    
    
    //삼세판후 대결 결과
    func fightToResult(of countingResult: [Bool]) -> Bool {
        //index0 = 나
        //index1 = 컴퓨터
        return countingResult[0]
    }
}
