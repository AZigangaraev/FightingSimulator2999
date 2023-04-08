//
//  ViewController.swift
//  FightingSimulator2999
//
//  Created by Teacher on 11.03.2023.
//

import UIKit
class FightViewController: UIViewController {
    @IBOutlet
    private var myHealthView: UIProgressView!

    @IBOutlet
    private var enemyHealthView: UIProgressView!
    
    var presenter: FightViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myHealthView.progress = 1
        enemyHealthView.progress = 1

        presenter = FightViewPresenter(service: FightServiceImpl())
        presenter.startFight()
    }

    @IBAction
    private func basicAttackTap() {
        presenter.basicAttack()
        presenter.myHealth.sink { [weak self] health in
            DispatchQueue.main.async {
                self?.myHealthView.progress = Float(health) / 100
            }
        }.store(in: &presenter.cancellables)
        
        presenter.enemyHealth.sink { [weak self] health in
            DispatchQueue.main.async {
                self?.enemyHealthView.progress = Float(health) / 100
            }
        }.store(in: &presenter.cancellables)
    }

    @IBAction
    private func magicAttackTap() {
        presenter.magicAttack()
        presenter.myHealth.sink { [weak self] health in
            DispatchQueue.main.async {
                self?.myHealthView.progress = Float(health) / 100
            }
        }.store(in: &presenter.cancellables)
        
        presenter.enemyHealth.sink { [weak self] health in
            DispatchQueue.main.async {
                self?.enemyHealthView.progress = Float(health) / 100
            }
        }.store(in: &presenter.cancellables)
    }
}

