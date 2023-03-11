//
//  ViewController.swift
//  FightingSimulator2999
//
//  Created by Teacher on 11.03.2023.
//

import UIKit

@MainActor
protocol MainView: AnyObject {
    func showLoader() 
    func basicAttackTap()
    func magicAttackTap()
    func show(error: Error)
}

@MainActor
class FightViewController: UIViewController {
    @IBOutlet private var myHealthView: UIProgressView!
    @IBOutlet private var enemyHealthView: UIProgressView!
    var presenter: FightPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        showLoader()
    }
    
    func showLoader() {
        myHealthView.progress = Float(myHealthView) / 100
        enemyHealthView.progress = Float(enemyHealthView) / 100
    }

    @IBAction private func basicAttackTap() {
        presenter.basicAttack()
    }

    @IBAction private func magicAttackTap() {
        presenter.magicAttack()
    }
    
    func show(error: Error) {
        let alertController = UIAlertController(title: "OOOPS", message: "Something went wrong: \(error)", preferredStyle: .alert)
        alertController.addAction(.init(title: "OK", style: .cancel))
        present(alertController, animated: true)
    }
}

