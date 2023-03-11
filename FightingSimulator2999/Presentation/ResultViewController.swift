import UIKit

class ResultViewController: UIViewController {
    enum Result {
        case win
        case lose
    }

    var result: Result = .lose

    @IBOutlet
    private var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        switch result {
            case .win:
                resultLabel.text = "You win!"
            case .lose:
                resultLabel.text = "You lose!"
        }
    }

    @IBAction
    private func restartTap() {
        navigationController?.popViewController(animated: true)
    }
}
