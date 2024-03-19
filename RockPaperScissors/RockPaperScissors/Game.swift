//
//  Game.swift
//  RockPaperScissors
//
//  Created by 홍승완 on 2024/03/19.
//

import Foundation

///
/// 사용자와 컴퓨터의 가위 바위 보 게임입니다
/// 사용자가 패를 선택하면 컴퓨터의 패는 임의의 패로 지정됩니다
/// 현재 승/무/패 기록은 화면 중앙에 표시합니다
/// 승/무/패 기록은 사용자 기준 승/무/패를 나타냅니다
/// 삼세판 선승제로, 세 판을 먼저 이기는 쪽이 승리합니다
/// 어느 한 쪽이 최종 승리하면 얼럿을 통해 승자를 표시하고 게임을 초기화합니다
///

final class User {
    var score: Int
    
    init(score: Int = 0) {
        self.score = score
    }
}

final class Game {
    let user: User
    let computer: User
    
    init(user: User, computer: User) {
        self.user = user
        self.computer = computer
    }
    
    func userWin(){
        user.score += 1
    }
    
    func computerWin(){
        user.score += 1
    }
}
