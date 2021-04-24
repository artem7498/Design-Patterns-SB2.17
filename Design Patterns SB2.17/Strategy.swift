//
//  Strategy.swift
//  Design Patterns SB2.17
//
//  Created by Артём on 4/24/21.
//

import Foundation

//Strategy(поведенческий) - Определяет семейство схожих алгоритмов и помещает каждый из них в собственный класс, после чего алгоритмы можно взаимозаменять прямо во время исполнения программы.

//в игре может быть использована для создания и изменения алгоритма расположения объектов на какой-то области



class Context {
    
    private var strategy: Strategy

    init(strategy: Strategy) {
        self.strategy = strategy
    }

    func update(strategy: Strategy) {
        self.strategy = strategy
    }

    func doSomeBusinessLogic() {
        print("Context: Sorting data using the strategy\n")

        let result = strategy.doAlgorithm(["troop with power 1", "2", "3", "4", "5"])
        print(result.joined(separator: ","))
    }
}

protocol Strategy {

    func doAlgorithm<T: Comparable>(_ data: [T]) -> [T]
}

class ConcreteStrategyA: Strategy {

    func doAlgorithm<T: Comparable>(_ data: [T]) -> [T] {
        return data.sorted()
    }
}

class ConcreteStrategyB: Strategy {

    func doAlgorithm<T: Comparable>(_ data: [T]) -> [T] {
        return data.sorted(by: >)
    }
}
