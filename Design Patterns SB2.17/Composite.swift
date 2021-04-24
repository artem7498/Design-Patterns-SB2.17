//
//  Composite.swift
//  Design Patterns SB2.17
//
//  Created by Артём on 4/23/21.
//

import Foundation


//Компоновщик (структурный) - Позволяет сгруппировать объекты в древовидную структуру, а затем работать с ними так, как будто это единичный объект.


// В игре может быть использован для отображения кастомизированных элементов. Кнопок, лейблов, Views  и тд.

//Например отрисуем корабли разной длины противников в игре похожей на морской бой

protocol Ship {
    func draw(length: Int)
}


class MissileCarrier: Ship{
    func draw(length: Int) {
        print("MissileCarrier with lentgh of \(length)")
    }
}

class AircraftCarrier: Ship{
    func draw(length: Int) {
        print("AircraftCarrier with lentgh of \(length)")
    }
}


final class OceanView: Ship{
    
    private var ships: [Ship]
    
    init(_ ships: Ship...){
        self.ships = ships
    }
    
    func drawShip(ship: Ship){
        ships.append(ship)
    }
    
    
    func draw(length: Int) {
        for s in ships{
            s.draw(length: length)
        }
    }
    
}


//var ocean = OceanView(AircraftCarrier(), MissileCarrier())
//ocean.draw(length: 4)
