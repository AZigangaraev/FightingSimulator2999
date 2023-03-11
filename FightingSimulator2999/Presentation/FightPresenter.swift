import Foundation
import Combine

class FightPresenter {
    private let fightService: FightService
    private var cancellables = Set<AnyCancellable>()
    weak var view: FightView?
    
    init(fightService: FightService, view: FightView) {
        self.fightService = fightService
        self.view = view
    }
    
    func didTapBasicAttack() {
        fightService.basicAttack()
        checkGameStatus()
    }
    
    func didTapMagicAttack() {
        fightService.magicAttack()
        checkGameStatus()
    }
    
    private func checkGameStatus() {
        var myHealth: Float = 0.0
        var enemyHealth: Float = 0.0
        
        fightService.myHealth
            .map { Float($0) / 100.0 }
            .sink { [weak self] in
                myHealth = $0
                self?.view?.setMyHealthProgress($0)
            }
            .store(in: &cancellables)
        
        fightService.enemyHealth
            .map { Float($0) / 100.0 }
            .sink { [weak self] in
                enemyHealth = $0
                self?.view?.setEnemyHealthProgress($0)
            }
            .store(in: &cancellables)
        
        Publishers.CombineLatest(fightService.myHealth, fightService.enemyHealth)
            .sink { [weak self] myHealthValue, enemyHealthValue in
                if myHealthValue <= 0 {
                    self?.view?.showResultScreen(result: .lose)
                } else if enemyHealthValue <= 0 {
                    self?.view?.showResultScreen(result: .win)
                }
            }
            .store(in: &cancellables)
    }

}


