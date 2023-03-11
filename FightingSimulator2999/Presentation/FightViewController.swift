import UIKit
import Combine

protocol FightView: AnyObject {
    func setMyHealthProgress(_ progress: Float)
    func setEnemyHealthProgress(_ progress: Float)
    func showResultScreen(result: ResultViewController.Result)
}

class FightViewController: UIViewController, FightView {
    @IBOutlet private var myHealthView: UIProgressView!
    @IBOutlet private var enemyHealthView: UIProgressView!

    var presenter: FightPresenter!

    override func viewDidLoad() {
        presenter = FightPresenter(fightService: FightServiceImpl(), view: self)
        super.viewDidLoad()
    }

    @IBAction private func basicAttackTap() {
        presenter.didTapBasicAttack()
    }

    @IBAction private func magicAttackTap() {
        presenter.didTapMagicAttack()
    }

    func setMyHealthProgress(_ progress: Float) {
        myHealthView.progress = progress
    }

    func setEnemyHealthProgress(_ progress: Float) {
        enemyHealthView.progress = progress
    }

    func showResultScreen(result: ResultViewController.Result) {
        let resultVC = ResultViewController()
        resultVC.result = result
        let navController = UINavigationController(rootViewController: resultVC)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true, completion: nil)
    }
}
