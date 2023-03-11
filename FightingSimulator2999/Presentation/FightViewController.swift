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
    
    var presenter: FightPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

        myHealthView.progress = 1
        enemyHealthView.progress = 1
    }

    @IBAction
    private func basicAttackTap() {
        let (me, enemy) = presenter.basicAttack()
        myHealthView.progress = Float(me)/100
        enemyHealthView.progress = Float(enemy)/100
    }

    @IBAction
    private func magicAttackTap() {
        let (me, enemy) = presenter.magicAttack()
        myHealthView.progress = Float(me)/100
        enemyHealthView.progress = Float(enemy)/100
    }
    
    func showWinner(player1: Float, player2: Float){
    }
}

