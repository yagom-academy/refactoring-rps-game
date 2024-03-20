//
//  HandGameable.swift
//  RockPaperScissors
//
//  Created by 홍승완 on 2024/03/20.
//

protocol HandGameable {
    var user: Playable { get }
    var computer: Playable { get }
    
    func play()
    func reset()
    func nextGame()
}
