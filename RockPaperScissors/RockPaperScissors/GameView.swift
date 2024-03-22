//
//  RockPaperScissors - GameView.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class GameView: UIView {

    private let computerHandLabel: UILabel = UILabel()
    private let userHandLabel: UILabel = UILabel()
    private let resultLabel: UILabel = UILabel()
    private let currentWinLoseLabel: UILabel = UILabel()
    
    
    @objc private func touchUpNextButton() {
        
    }
    
    @objc private func touchUpResetButton() {
        
    }
    
    private func initialSetup() {
        backgroundColor = .white
        
        computerHandLabel.text = Hand.paper.rawValue
        userHandLabel.text = Hand.paper.rawValue
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
    
    init() {
        super.init(frame: .zero)
        initialSetup()
        layViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
