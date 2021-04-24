//
//  Command.swift
//  Design Patterns SB2.17
//
//  Created by Артём on 4/24/21.
//

import Foundation

//Command (Поведенческий)- Превращает запросы в объекты, позволяя передавать их как аргументы при вызове методов, ставить запросы в очередь, логировать их, а также поддерживать отмену операций.


// В игре может быть использован для панели управления на которой естиь множество команд для какого то существа или предмета.

class Garden{
    var name = ""
}

typealias GardenCommand = (Garden) -> Void

func PourGardenCommand() -> GardenCommand{
    return {g in print("Pouring \(g) garden")}
}

func SafeGardenCommand() -> GardenCommand{
    return { g in print("Chemicals for \(g)")}
}



class GardenOperations{
    let garden: Garden
    private let pourGardenCommand = PourGardenCommand()
    private let safeGardenCommand = SafeGardenCommand()
    
    init(garden: Garden) {
        self.garden = garden
    }
    
    func pour() {
        pourGardenCommand(garden)
    }
    
    func safe(){
        safeGardenCommand(garden)
    }
}
