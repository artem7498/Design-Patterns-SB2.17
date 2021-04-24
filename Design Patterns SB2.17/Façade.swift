//
//  Façade.swift
//  Design Patterns SB2.17
//
//  Created by Артём on 4/23/21.
//

import Foundation


// Фасад(структурный) - Предоставляет простой интерфейс к сложной системе классов, библиотеке или фреймворку.

// В игре может использоваться для построения какой-либо цепочки из интуитивно связанных методов (например, телепорт)


class Teleport{
    func currentLocation() {
//        ...
        print("You are here")
    }
    
    func finalLocation(location: String){
        print("Let's go to \(location)")
    }
    
    func maeRoute(){
        print("Ready? Set. Let's check some ...")
    }
}

class TeleportStore{
    
    func payment(){
        print("Чем будете платить? Мани или Камни")
    }
    
    func cashThemOut(){
        print("Let's pay with Apple Pay")
    }
    
    func teleport(){
        print("Teleporting...")
    }
}

class TicketSystem{
    func ctreateTicket(){
        print("Ticket systen is in progress")
    }
    
    func printTicket(){
        print("... tickets printing")
    }
}

class Facade {
    func teleportTo(location: String){
        
        let tp = Teleport()
        let tpS = TeleportStore()
        let tckt = TicketSystem()
        
        tp.currentLocation()
        tp.finalLocation(location: location)
        tp.maeRoute()
        
        tpS.payment()
        tpS.cashThemOut()
        tpS.teleport()
        
        tckt.ctreateTicket()
        tckt.printTicket()
        
    }
}

//Использование:

//let facade = Facade()
//let travel1 = facade.teleportTo(location: "Zimbabwe")
