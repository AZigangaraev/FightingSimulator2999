//
//  ViewController.swift
//  FightingSimulator2999
//
//  Created by Teacher on 11.03.2023.
//

import UIKit

@MainActor
class FightViewController: UIViewController {
    @IBOutlet
    private var myHealthView: UIProgressView!

    @IBOutlet
    private var enemyHealthView: UIProgressView!
    
    
    var presenter: FightPresenter!
    
    func getAttacked() {
        myHealthView.progress -= 0.2
    }
    
    func attack() {
        enemyHealthView.progress -= 0.3
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myHealthView.progress = 1
        enemyHealthView.progress = 1
    }

    @IBAction
    private func basicAttackTap() {
        presenter.basicAttack()
    }

    @IBAction
    private func magicAttackTap() {
        presenter.magicAttack()
    }
}

