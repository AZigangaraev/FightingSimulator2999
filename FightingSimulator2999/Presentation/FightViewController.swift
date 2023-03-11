//
//  ViewController.swift
//  FightingSimulator2999
//
//  Created by Teacher on 11.03.2023.
//
@MainActor
protocol FightView: AnyObject {

}

import UIKit
class FightViewController: UIViewController {
    @IBOutlet
    var myHealthView: UIProgressView!

    @IBOutlet
    var enemyHealthView: UIProgressView!

    var presenter: FightPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()

        myHealthView.progress = 1
        enemyHealthView.progress = 1
    }

    @IBAction
    private func basicAttackTap() {
        presenter.basicAttack()
        presenter.getMyHealth()
    }

    @IBAction
    private func magicAttackTap() {
        presenter.magicAttack()
        presenter.getMyHealth()
    }
    
    
}

