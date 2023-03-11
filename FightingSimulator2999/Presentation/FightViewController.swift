//
//  ViewController.swift
//  FightingSimulator2999
//
//  Created by Teacher on 11.03.2023.
//

import UIKit
import Combine

class FightViewController: UIViewController, FightPresenterDelegate {
    @IBOutlet
    private var myHealthView: UIProgressView!

    @IBOutlet
    private var enemyHealthView: UIProgressView!
    
    private var presenter: FightPresenter
    private var cancellables = Set<AnyCancellable>()
    init(presenter: FightPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
        
    required init?(coder: NSCoder) {
        self.presenter = FightPresenter(fightService: FightModel())
        super.init(coder: coder)
    }
    override func viewDidLoad() {
        presenter.myHealth
                    .map { Float($0) / 100 }
                .assign(to: \.progress, on: myHealthView)
                .store(in: &cancellables)

        presenter.enemyHealth
                .map { Float($0) / 100 }
                .assign(to: \.progress, on: enemyHealthView)
                .store(in: &cancellables)
        presenter.delegate = self
        super.viewDidLoad()

        myHealthView.progress = 1
        enemyHealthView.progress = 1
    }
    func playerDidLose() {
        print("Player lost")
    }

    func enemyDidLose() {
        print("Enemy lost")
    }

    @IBAction
    private func basicAttackTap() {
        presenter.didTapBasicAttack()
    }

    @IBAction
    private func magicAttackTap() {
        presenter.didTapMagicAttack()
    }
}

