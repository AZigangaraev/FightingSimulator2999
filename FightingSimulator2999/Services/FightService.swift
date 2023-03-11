import Foundation
import Combine

struct Enemy {
    var health: Int
}

protocol FightService {
    var myHealth: AnyPublisher<Int, Never> { get }
    var enemyHealth: AnyPublisher<Int, Never> { get }
    // Restores player and enemy health to 100
    func startFight()
    // Deals 9 damage to enemy. Enemy attacks back and reduces `myHealth` by 10.
    func basicAttack()
    // Deals 7-15 damage. Enemy attacks back and reduces `myHealth` by 10.
    func magicAttack()
}

class FightServiceImpl: FightService {
    private var myHealthSubject = CurrentValueSubject<Int, Never>(100)
    private var enemyHealthSubject = CurrentValueSubject<Int, Never>(100)
    
    var myHealth: AnyPublisher<Int, Never> {
        return myHealthSubject.eraseToAnyPublisher()
    }
    
    var enemyHealth: AnyPublisher<Int, Never> {
        return enemyHealthSubject.eraseToAnyPublisher()
    }
    
    func startFight() {
        myHealthSubject.send(100)
        enemyHealthSubject.send(100)
    }
    
    func basicAttack() {
        enemyHealthSubject.send(enemyHealthSubject.value - 9)
        myHealthSubject.send(myHealthSubject.value - 10)
    }
    
    func magicAttack() {
        let damage = Int.random(in: 7...15)
        enemyHealthSubject.send(enemyHealthSubject.value - damage)
        myHealthSubject.send(myHealthSubject.value - 10)
    }
}

