import UIKit

class FightCoordinator {
    private let navigationController: UINavigationController
    private let fightService: FightService
    private var fightPresenter: FightPresenter?

    init(navigationController: UINavigationController, fightService: FightService, fightView: FightView) {
        self.navigationController = navigationController
        self.fightService = fightService
        
    }

    func start() {
        let fightViewController = FightViewController()
        fightPresenter = FightPresenter(fightService: fightService, view: fightViewController)
        navigationController.pushViewController(fightViewController, animated: true)
    }

    func showResult(result: ResultViewController.Result) {
        let resultViewController = ResultViewController()
        resultViewController.result = result
        navigationController.pushViewController(resultViewController, animated: true)
    }
}

