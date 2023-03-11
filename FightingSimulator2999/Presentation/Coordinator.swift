import Foundation
import UIKit
class Coordinator {
    static let shared: Coordinator = .init()
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    weak var window: UIWindow!
    var navigationController: UINavigationController!
    func start() {
        let controller: FightViewController = storyboard.instantiateViewController(withIdentifier: "FightViewController") as! FightViewController
        let presenter = FightPresenter(view: controller)
            controller.presenter = presenter
        window?.rootViewController = controller
        navigationController = UINavigationController(rootViewController: controller)

    }

    func showResult(result: Result){
        let resultVc = ResultViewController()
        resultVc.result = result
        navigationController.pushViewController(resultVc, animated: true)
    }
}
