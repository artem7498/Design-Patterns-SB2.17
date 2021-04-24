//
//  Virtual Proxy.swift
//  Design Patterns SB2.17
//
//  Created by Артём on 4/24/21.
//

import Foundation

//Virtual Proxy(структурный) - Позволяет подставлять вместо реальных объектов специальные объекты-заменители. Эти объекты перехватывают вызовы к оригинальному объекту, позволяя сделать что-то до или после передачи вызова оригиналу.

//в игре может имспользоваться для демо версии игры


protocol Subject{
    func startGame()
}

class RealSubject: Subject{
    
    func startGame() {
        print("Level 0 Skills 0. Let's begin")
    }
    
}

class Proxy: Subject{
    
    private let realSubject: RealSubject
    
    init(_ realSubject: RealSubject ) {
        self.realSubject = realSubject
    }
    
    func startGame() {

            if (checkAccess()) {
                realSubject.startGame()
                logAccess()
            }
        }

    private func checkAccess() -> Bool {
        print("Proxy: Checking access prior to firing a real request.")
        return true
    }
    private func logAccess() {
        print("Proxy: Logging the time of request.")
    }
}


//class Client {
//    // ...
//    static func clientCode(subject: Subject) {
//        // ...
//        print(subject.startGame())
//        // ...
//    }
//    // ...
//}
