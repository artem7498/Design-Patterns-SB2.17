//
//  Builder.swift
//  Design Patterns SB2.17
//
//  Created by Артём on 4/23/21.
//

import Foundation


// Builder - Позволяет создавать сложные объекты пошагово. Строитель даёт возможность использовать один и тот же код строительства для получения разных представлений объектов.


//Допустим нам нужно создать отряд бойцов (разных: разведчик, лучник, и тд) в игре, можно заказать стандартную компановку, а можно настроить самому.

protocol ArmyBuilder {
    func produceArcher()
    func produceScout()
    func produceCrusader()
}

class ConcreteBuilder: ArmyBuilder{
    
    private var army = Army1()
    
    func reset(){
        army = Army1()
    }
    
    func produceArcher() {
        army.add(troop: "Archer")
    }
    
    func produceScout() {
        army.add(troop: "Scout")
    }
    
    func produceCrusader() {
        army.add(troop: "Crusader")
    }
    
    
//    функция сброса
    
    func retrieveArmy() -> Army1{
        let result = self.army
        reset()
        return result
    }
    
}

class Director{
    
    private var armyBuilder: ArmyBuilder?
    
    func update(builder: ArmyBuilder){
        self.armyBuilder = builder
    }
    
    func buildMinimalViableArmy() {
        armyBuilder?.produceArcher()
    }

    func buildFullFeaturedArmy() {
        armyBuilder?.produceArcher()
        armyBuilder?.produceScout()
        armyBuilder?.produceCrusader()
    }
    
}




class Army1{
    private var troops = [String]()
    
    func add(troop: String){
        self.troops.append(troop)
    }
    
    
    func listTroops() -> String {
            return "Army troops: " + troops.joined(separator: ", ") + "\n"
        }
}


class Client {
    // ...
    static func someClientCode(director: Director) {
        let builder = ConcreteBuilder()
        director.update(builder: builder)
        
        print("Standard basic product:")
        director.buildMinimalViableArmy()
        print(builder.retrieveArmy().listTroops())

        print("Standard full featured product:")
        director.buildFullFeaturedArmy()
        print(builder.retrieveArmy().listTroops())

        // Помните, что паттерн Строитель можно использовать без класса
        // Директор.
        print("Custom product:")
        builder.produceArcher()
        builder.produceCrusader()
        print(builder.retrieveArmy().listTroops())
    }
    // ...
}
