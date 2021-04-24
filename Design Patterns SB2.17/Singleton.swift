//
//  Singleton.swift
//  Design Patterns SB2.17
//
//  Created by Артём on 4/23/21.
//

import Foundation


//Singleton (порождающий) - Гарантирует, что у класса есть только один экземпляр, и предоставляет к нему глобальную точку доступа.


// В игре это может быть как API запросы, так и чат между игроками, так и сохранение данных UserDefaults


class NetworkService{
    
    static let shared = NetworkService()
    
    func getPlayerIP(){
        print("IP cacher is runing")
    }
    
}

class PlayerVC{
    
    func run(){
        NetworkService.shared.getPlayerIP()
    }
    
}




