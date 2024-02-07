//
//  RockPaperScissors - GameView.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class GameView: UIView {

    private let computerHandLabel: UILabel = UILabel()
    private let userHandLabel: UILabel = UILabel()
    private let resultLabel: UILabel = UILabel()
    private let currentWinLoseLabel: UILabel = UILabel()
    private let nextButton: UIButton = UIButton(type: .roundedRect)
    private let resetButton: UIButton = UIButton(type: .roundedRect)
    
    private var game: Game
    
    @objc private func touchUpNextButton() {
        game.startGame()
        game.decideWinner()
        
        updateHandLabel()
        updateResultLabel()
        updateWinLoseLabel()
    }
    
    @objc private func touchUpResetButton() {
        resetGame()
    }
    
    private func updateHandLabel() {
        computerHandLabel.text = game.computer.hand.value
        userHandLabel.text = game.user.hand.value
    }
    
    private func updateWinLoseLabel() {
        let user: Player = game.user
        currentWinLoseLabel.text = "\(user.winCount)승 \(user.drawCount)무 \(user.loseCount)패"
    }
    
    private func updateResultLabel() {
        if let winnerName: String = game.winnerName() {
            resultLabel.text = "\(winnerName) 이겼습니다!!"
            
            updateButtonEnabled()
        }
    }
    
    private func updateButtonEnabled() {
        nextButton.isEnabled.toggle()
        resetButton.isEnabled.toggle()
    }
    
    private func resetGame() {
        game.reset()
        
        resetLabel()
        updateHandLabel()
        updateWinLoseLabel()
        updateButtonEnabled()
    }
    
    private func resetLabel() {
        resultLabel.text = ""
        currentWinLoseLabel.text = "0승 0무 0패"
    }
    
    private func initialSetup() {
        backgroundColor = .white
        
        computerHandLabel.text = game.computer.hand.value
        userHandLabel.text = game.user.hand.value
        resetLabel()
        
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
        
        nextButton.setTitle("NEXT", for: .normal)
        nextButton.addTarget(self, action: #selector(touchUpNextButton), for: .touchUpInside)
        
        resetButton.isEnabled = false
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
    
    init(game: Game) {
        self.game = game
        super.init(frame: .zero)
        
        initialSetup()
        layViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
