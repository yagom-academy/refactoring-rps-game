//
//  RockPaperScissors - GameView.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class GameView: UIView {

    var gameRule: GameRule
    var showAlert: (UIAlertController) -> Void
    
    private let computerHandLabel: UILabel = UILabel()
    private let userHandLabel: UILabel = UILabel()
    private let resultLabel: UILabel = UILabel()
    private let currentWinLoseLabel: UILabel = UILabel()
    
    private let winAlertController: UIAlertController = UIAlertController(title: "이겼어요", message: nil, preferredStyle: .alert)
    private let loseAlertController: UIAlertController = UIAlertController(title: "졌어요", message: nil, preferredStyle: .alert)
    
    @objc private func touchUpNextButton() {
        // 무작위로 my, commputer action 선택
        guard let myAction = Actions.random(),
              let computerAction = Actions.random() else { return }
        
        userHandLabel.text = myAction.icon
        computerHandLabel.text = computerAction.icon
        
        // game rule 적용 (play)
        let playResult = gameRule.playGame(myAction: myAction, opponentAction: computerAction)
        
        // play result 확인
        currentWinLoseLabel.text = "\(gameRule.gameStatus.score.win)승 \(gameRule.gameStatus.score.draw)무 \(gameRule.gameStatus.score.lose)패"
        switch playResult {
        case .draw:
            resultLabel.text = "비겼어요"
        case .win:
            resultLabel.text = "이겼어요"
        case .lose:
            resultLabel.text = "졌어요"
        default:
            resultLabel.text = "ㅤㅤㅤㅤ "
        }
        
        // 전체 game result에 따른 처리
        let gameResult = gameRule.gameStatus.gameResult
        switch gameResult {
        case .win:
            showAlert(winAlertController)
            
        case .lose:
            showAlert(loseAlertController)

        default:
            return
        }
    }
    
    @objc private func touchUpResetButton() {
        // game status 초기화
    }
    
    private func initialSetup() {
        backgroundColor = .white
        
        computerHandLabel.font = .systemFont(ofSize: 40)
        userHandLabel.font = .systemFont(ofSize: 40)
        resultLabel.font = .preferredFont(forTextStyle: .headline)
        currentWinLoseLabel.font = .preferredFont(forTextStyle: .largeTitle)
        
        let retryAlert = UIAlertAction(title: "다시하기", style: .default) { _ in
            self.gameRule.resetGameStatue()
            self.resetContents()
        }
        
        winAlertController.addAction(retryAlert)
        loseAlertController.addAction(retryAlert)
        
        [computerHandLabel, userHandLabel, resultLabel, currentWinLoseLabel].forEach { label in
            label.textColor = .black
            label.textAlignment = .center
        }
    }
    
    private func resetContents() {
        computerHandLabel.text = Actions.paper.icon
        userHandLabel.text = Actions.paper.icon
        resultLabel.text = " "
        currentWinLoseLabel.text = "\(gameRule.gameStatus.score.win)승 \(gameRule.gameStatus.score.draw)무 \(gameRule.gameStatus.score.lose)패"
    }
    
    private func setLayout() {
        
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
    
    init(gameRule: GameRule, showAlert: @escaping (UIAlertController) -> Void) {
        self.gameRule = gameRule
        self.showAlert = showAlert
        
        super.init(frame: .zero)
        
        initialSetup()
        resetContents()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
