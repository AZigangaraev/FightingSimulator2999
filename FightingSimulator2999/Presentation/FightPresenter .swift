import Foundation
import Combine

class FightPresenter {
    init(
        view: FightViewController
    ){
        self.view = view
    }
    
    private weak var view: FightViewController!
    private var fightService = MyMockFightService()
    let coordinator  = Coordinator()

    
    func starFight() {
        fightService.startFight()
    }
    
    func basicAttack() {
        fightService.basicAttack()
        
    }
    
    func magicAttack() {
        fightService.magicAttack()
    }
    
    func result(result: Result) {
        coordinator.showResult(result: result)
    }
   
        
    func getMyHealth(){
        let healthSubscription = Publishers.Zip(fightService.myHealth, fightService.enemyHealth)
            .sink { myHealth, enemyHealth in
                self.view.myHealthView.progress = Float(myHealth) / 100
                self.view.enemyHealthView.progress = Float(enemyHealth) / 100
                if myHealth < 0{
                    self.result(result: .lose)
                }else if enemyHealth < 0 {
                    self.result(result: .win)
                    }
            }
    }
}
