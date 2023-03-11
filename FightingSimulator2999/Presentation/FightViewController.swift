//
//  ViewController.swift
//  FightingSimulator2999
//
//  Created by Teacher on 11.03.2023.

import UIKit
import Combine

class FightViewController: UIViewController {
    @IBOutlet private var myHealthView: UIProgressView!
    @IBOutlet private var enemyHealthView: UIProgressView!
    
    private var presenter: FightPresenter!
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = FightPresenter(service: FightServiceImpl())
        presenter.myHealth
            .map { Float($0) / 1 }
            .sink(receiveValue: { [weak self] in
                self?.myHealthView.progress = $0
            })
            .store(in: &cancellables)
        
        presenter.enemyHealth
            .map { Float($0) / 1 }
            .sink(receiveValue: { [weak self] in
                self?.enemyHealthView.progress = $0
            })
            .store(in: &cancellables)
        
        presenter.startFight()
    }
    
    @IBAction private func basicAttackTap() {
        presenter.basicAttack()
    }
    
    @IBAction private func magicAttackTap() {
        presenter.magicAttack()
    }
}
