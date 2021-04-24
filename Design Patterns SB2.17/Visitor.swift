//
//  Visitor.swift
//  Design Patterns SB2.17
//
//  Created by Артём on 4/24/21.
//

import Foundation

//Visitor(поведенческий) - Позволяет создавать новые операции, не меняя классы объектов, над которыми эти операции могут выполняться.

// в игре может быть использован для присвоения уникальных способностей герою


protocol SuperPower {

    func accept(_ visitor: Visitor)
}

class ConcreteSuperPowerA: SuperPower {

    func accept(_ visitor: Visitor) {
        visitor.visitConcreteSuperPowerA(element: self)
    }

    func exclusiveMethodOfConcreteSuperPowerA() -> String {
        return "Change weather"
    }
}

class ConcreteSuperPowerB: SuperPower {

    func accept(_ visitor: Visitor) {
        visitor.visitConcreteSuperPowerB(element: self)
    }

    func specialMethodOfConcreteComponentB() -> String {
        return "Increase fire"
    }
}

protocol Visitor {

    func visitConcreteSuperPowerA(element: ConcreteSuperPowerA)
    func visitConcreteSuperPowerB(element: ConcreteSuperPowerB)
}


class ConcreteVisitor1: Visitor {

    func visitConcreteSuperPowerA(element: ConcreteSuperPowerA) {
        print(element.exclusiveMethodOfConcreteSuperPowerA() + " + ConcreteVisitor1\n")
    }

    func visitConcreteSuperPowerB(element: ConcreteSuperPowerB) {
        print(element.specialMethodOfConcreteComponentB() + " + ConcreteVisitor1\n")
    }
}

class ConcreteVisitor2: Visitor {

    func visitConcreteSuperPowerA(element: ConcreteSuperPowerA) {
        print(element.exclusiveMethodOfConcreteSuperPowerA() + " + ConcreteVisitor2\n")
    }

    func visitConcreteSuperPowerB(element: ConcreteSuperPowerB) {
        print(element.specialMethodOfConcreteComponentB() + " + ConcreteVisitor2\n")
    }
}


//class Client {
    // ...
   /* static */func clientCode(components: [SuperPower], visitor: Visitor) {
        // ...
        components.forEach({ $0.accept(visitor) })
        // ...
    }
    // ...
//}

class VisitorConceptual {

    func test() {
        let components: [SuperPower] = [ConcreteSuperPowerA(), ConcreteSuperPowerB()]

        print("The client code works with all visitors via the base Visitor interface:\n")
        let visitor1 = ConcreteVisitor1()
        /*Client.*/clientCode(components: components, visitor: visitor1)

        print("\nIt allows the same client code to work with different types of visitors:\n")
        let visitor2 = ConcreteVisitor2()
        /*Client.*/clientCode(components: components, visitor: visitor2)
    }
}

