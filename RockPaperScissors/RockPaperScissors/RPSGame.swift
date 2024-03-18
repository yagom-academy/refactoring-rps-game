//
//  RPSGame.swift
//  RockPaperScissors
//
//  Created by 홍은표 on 3/19/24.
//

import Foundation

protocol Scoreable {
  var wins: Int { get set }
  var draws: Int { get set }
  var losses: Int { get set }
  
  mutating func reset()
}

struct Score: Scoreable {
  var wins: Int = 0
  var draws: Int = 0
  var losses: Int = 0
  
  mutating func reset() {
    wins = 0
    draws = 0
    losses = 0
  }
}

protocol Gamerable: AnyObject {
  var handStrategy: HandStrategy { get }
  var currentHand: Hand? { get set }
  var score: Scoreable { get set }
  
  func reset()
  func next()
}

extension Gamerable {
  var isWinner: Bool {
    score.wins >= 2
  }
  
  var isLoser: Bool {
    score.losses >= 2
  }
  
  func next() {
    currentHand = handStrategy.nextHand()
  }
  
  func reset() {
    score.reset()
    currentHand = nil
  }
}

final class User: Gamerable {
  var handStrategy: HandStrategy
  var currentHand: Hand? = nil
  var score: Scoreable
  
  init(handStrategy: HandStrategy, score: Scoreable = Score()) {
    self.handStrategy = handStrategy
    self.score = score
  }
}

final class Computer: Gamerable {
  var handStrategy: HandStrategy
  var currentHand: Hand? = nil
  var score: Scoreable
  
  init(handStrategy: HandStrategy, score: Scoreable = Score()) {
    self.handStrategy = handStrategy
    self.score = score
  }
}

protocol RPSGameable {
  var user: Gamerable { get }
  var computer: Gamerable { get }
  
  func battle(userHand: Hand, computerHand: Hand)
  func playBestOfThree()
  func reset()
}

extension RPSGameable {
  func reset() {
    user.reset()
    computer.reset()
  }
}

final class RPSGame: RPSGameable {
  let user: Gamerable
  let computer: Gamerable
  
  init(user: Gamerable, computer: Gamerable) {
    self.user = user
    self.computer = computer
  }
  
  func battle(userHand: Hand, computerHand: Hand) {
    switch (userHand, computerHand) {
    case let (u, c) where u == c:
      user.score.draws += 1
      computer.score.draws += 1
    case (.paper, .rock), (.rock, .scissor), (.scissor, .paper):
      user.score.wins += 1
      computer.score.losses += 1
    default:
      user.score.losses += 1
      computer.score.wins += 1
    }
  }
  
  func playBestOfThree() {
    while !user.isWinner && !computer.isWinner {
      user.next(); computer.next()
      guard let userHand = user.currentHand, let computerHand = computer.currentHand else {
        break
      }
      battle(userHand: userHand, computerHand: computerHand)
    }
  }
}
