//
//  RPSGame.swift
//  RockPaperScissors
//
//  Created by 구 민영 on 3/21/24.
//

import Foundation

final class RPSGame {
    var user: Player = User(score: Score(), hand: .paper)
    var computer: Player = Computer(score: Score(), hand: .paper)
    
    func play() {
        applyScore(result: userVersusComputer())
        guard isFinished() else {return}
        resetScore()
    }
    
    func resetScore() {
        user.score.reset()
        computer.score.reset()
    }
    
    func userVersusComputer() -> RoundMatchResult {
        switch (user.hand, computer.hand) {
        case (.paper, .scissor), (.rock, .paper), (.scissor, .rock):
            return .userLost
            
        case (.paper, .rock), (.rock, .scissor), (.scissor, .paper):
            return .userWon
            
        case (.paper, .paper), (.rock, .rock), (.scissor, .scissor):
            return .userDrew
        }
    }
    
    func finalWinner() -> Player? {
        guard user.score.win == 3 || computer.score.win == 3 else {
            return nil
        }
        let winner = user.score.win > computer.score.win ? user : computer
        return winner
    }
    
    func isFinished() -> Bool {
        return user.score.win == 3 || computer.score.win == 3
    }
    
    func applyScore(result: RoundMatchResult) {
        let newScore = result.strategy.applyScore(user.score, computer.score)
        user.score = newScore.user
        computer.score = newScore.computer
    }
}

/*
 가위 바위 보 게임 프로그래밍 요구사항
 - 사용자와 컴퓨터의 가위 바위 보 게임입니다
 - 사용자가 패를 선택하면 컴퓨터의 패는 임의의 패로 지정됩니다
 - 현재 승/무/패 기록은 화면 중앙에 표시합니다
 - 승/무/패 기록은 사용자 기준 승/무/패를 나타냅니다
 - 삼세판 선승제로, 세 판을 먼저 이기는 쪽이 승리합니다
 - 어느 한 쪽이 최종 승리하면 얼럿을 통해 승자를 표시하고 게임을 초기화합니다
 */

/*
 TDD를 통한 로직 구현
 TDD의 RED-GREEN-REFACTOR 세 단계를 지켜가며 기능을 구현해봅니다
 UI와의 연동 없이 비지니스 로직만 구현합니다
 
 양쪽이 낸 패의 승패 판결을 위한 기능을 TDD로 구현합니다
 해당 타입, 메서드를 구현해가며 지속적으로 리팩터링 합니다
 삼세판을 이기면 승리하는 기능을 TDD로 구현합니다
 삼세판이 끝나고 승패가 갈리면 초기화 하는 기능을 TDD로 구현합니다
 성능에 유리한 코드로 작성하도록 노력합니다
 기획의 변경에 대해서 최대한 열린 코드로 작성해봅니다
 */
