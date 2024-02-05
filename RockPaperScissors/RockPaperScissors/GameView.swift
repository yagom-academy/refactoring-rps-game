//
//  RockPaperScissors - GameView.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

protocol HandStrategy {
    var hand: String { get }
    var winCount: Int { get }
    var loseCount: Int { get }
    var drawCount: Int { get }
}

extension HandStrategy {
    var randomHand: String? {
        return ["✊","✌️","🖐️"].randomElement()
    }
}

struct ComputerHand: HandStrategy {
    var hand: String { randomHand ?? "" }
    var winCount: Int
    var loseCount: Int
    var drawCount: Int
}

struct UserHand: HandStrategy {
    var hand: String { randomHand ?? "" }
    var winCount: Int
    var loseCount: Int
    var drawCount: Int
}

protocol HandGame: AnyObject {
    var handStrategy: HandStrategy { get }
    var gameResult: GameResult { get set }
    var hand: String { get }
}

extension HandGame {
    var hand: String { handStrategy.hand }
    
    var currentWinLose: String {
        let winCount: Int = handStrategy.winCount
        let loseCount: Int = handStrategy.loseCount
        let drawCount: Int = handStrategy.drawCount
        return "\(winCount)승\(loseCount)패\(drawCount)무"
    }
    
    func determineWinner(left: String?, right: String?) {
        let handComparison = self is LeftHandGame ? (right, left) : (left, right)
        switch handComparison {
        case ("✌️","✊"),("🖐️","✌️"),("✊","🖐️"):
            gameResult = .win
        case ("✊","✌️"),("✌️","🖐️"),("🖐️","✊"):
            gameResult = .lose
        case ("✊","✊"),("✌️","✌️"),("🖐️","🖐️"):
            gameResult = .draw
        default:
            gameResult = .ready
        }
    }
}

final class LeftHandGame: HandGame {
    var handStrategy: HandStrategy
    var gameResult: GameResult
    
    init(handStrategy: HandStrategy, gameResult: GameResult) {
        self.handStrategy = handStrategy
        self.gameResult = gameResult
    }
}

final class RightHandGame: HandGame {
    var handStrategy: HandStrategy
    var gameResult: GameResult
    
    init(handStrategy: HandStrategy, gameResult: GameResult) {
        self.handStrategy = handStrategy
        self.gameResult = gameResult
    }
}

enum GameResult: String {
    case win = "승리"
    case lose = "패배"
    case draw = "무승부"
    case ready = "준비"
}

final class GameView: UIView {

    private let leftHandGame: HandGame
    private let rightHandGame: HandGame
    
    private let computerHandLabel: UILabel = UILabel()
    private let userHandLabel: UILabel = UILabel()
    private let resultLabel: UILabel = UILabel()
    private let currentWinLoseLabel: UILabel = UILabel()
    
    private func initialSetup() {
        backgroundColor = .white
        
        computerHandLabel.text = leftHandGame.hand
        userHandLabel.text = rightHandGame.hand
        resultLabel.text = "이겼습니다!"
        currentWinLoseLabel.text = "0승 0무 0패"
        
        computerHandLabel.font = .systemFont(ofSize: 40)
        userHandLabel.font = .systemFont(ofSize: 40)
        resultLabel.font = .preferredFont(forTextStyle: .headline)
        currentWinLoseLabel.font = .preferredFont(forTextStyle: .largeTitle)
        
        [computerHandLabel, userHandLabel, resultLabel, currentWinLoseLabel].forEach { label in
            label.textColor = .black
            label.textAlignment = .center
        }
    }
    
    private func layViews() {
        
        let topClearView: UIView = UIView()
        topClearView.backgroundColor = .clear
        
        let nextButton: UIButton = UIButton(type: .roundedRect)
        nextButton.setTitle("NEXT", for: .normal)
        nextButton.addTarget(self, action: #selector(touchUpNextButton), for: .touchUpInside)
        let resetButton: UIButton = UIButton(type: .roundedRect)
        resetButton.setTitle("RESET", for: .normal)
        resetButton.addTarget(self, action: #selector(touchUpResetButton), for: .touchUpInside)
        
        let middleTopClearView: UIView = UIView()
        middleTopClearView.backgroundColor = .clear
        
        let computerLabel: UILabel = UILabel()
        computerLabel.text = "컴퓨터"
        computerLabel.textColor = .black
        computerLabel.textAlignment = .center
        computerLabel.font = .preferredFont(forTextStyle: .subheadline)
                
        let userLabel: UILabel = UILabel()
        userLabel.text = "나"
        userLabel.textColor = .black
        userLabel.textAlignment = .center
        userLabel.font = .preferredFont(forTextStyle: .subheadline)
        
        let computerHandStackView: UIStackView = .init(arrangedSubviews: [computerLabel, computerHandLabel])
        computerHandStackView.axis = .vertical
        
        let userHandStackView: UIStackView = .init(arrangedSubviews: [userLabel, userHandLabel])
        userHandStackView.axis = .vertical
        
        let handsStackView: UIStackView = .init(arrangedSubviews: [computerHandStackView, userHandStackView])
        handsStackView.axis = .horizontal
        handsStackView.distribution = .fillEqually
        
        let middleBottomClearView: UIView = UIView()
        middleBottomClearView.backgroundColor = .clear
        
        let buttonStackView: UIStackView = .init(arrangedSubviews: [nextButton, resetButton])
        buttonStackView.axis = .horizontal
        buttonStackView.alignment = .center
        buttonStackView.distribution = .fillEqually
        
        let bottomClearView: UIView = UIView()
        bottomClearView.backgroundColor = .clear
        
        let mainStackView: UIStackView = .init(arrangedSubviews: [topClearView, currentWinLoseLabel, middleTopClearView, handsStackView, resultLabel, middleBottomClearView, buttonStackView, bottomClearView])
        mainStackView.axis = .vertical
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(mainStackView)
        
        let safeArea = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            safeArea.topAnchor.constraint(equalTo: mainStackView.topAnchor),
            safeArea.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor),
            safeArea.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            safeArea.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            topClearView.heightAnchor.constraint(equalTo: bottomClearView.heightAnchor),
            topClearView.heightAnchor.constraint(equalTo: middleTopClearView.heightAnchor),
            topClearView.heightAnchor.constraint(equalTo: middleBottomClearView.heightAnchor)
        ])
    }
    
    init(leftHandGame: HandGame,
         rightHandGame: HandGame) {
        self.leftHandGame = leftHandGame
        self.rightHandGame = rightHandGame
        super.init(frame: .zero)
        initialSetup()
        layViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    @objc private func touchUpNextButton() {
        computerHandLabel.text = leftHandGame.hand
        userHandLabel.text = rightHandGame.hand
    }
    
    @objc private func touchUpResetButton() {
        currentWinLoseLabel.text = "0승 0무 0패"
    }
}
