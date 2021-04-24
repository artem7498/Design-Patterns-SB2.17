//
//  Factory.swift
//  Design Patterns SB2.17
//
//  Created by Артём on 4/22/21.
//

import Foundation

// Factory (порождающий) - Позволяет создавать семейства связанных объектов, не привязываясь к конкретным классам создаваемых объектов.


//Допустим, есть добрый и злой персонаж, интерфейс, в какой-то момент игры зависит от выбранного персонажа.

protocol PlayerView {
    func drawPlayerView()
}

class ShrekView: PlayerView{
    func drawPlayerView() {
        print("Drawing swamp")
    }
}

class ShrekActionView: PlayerView {
    func drawPlayerView() {
        print("drawing action Shrek")
    }
}

class RumpleshtitskinView: PlayerView{
    func drawPlayerView() {
        print("Drawing goose and witches")
    }
}

class RumpleshtitskinActionView: PlayerView{
    func drawPlayerView() {
        print("drawing action Rumple")
    }
}


protocol PlayerViewFactory{
    func createPlayerView() -> PlayerView
    func createActionView() -> PlayerView
}

class ShrekViewFactory: PlayerViewFactory{
    func createActionView() -> PlayerView {
        ShrekActionView()
    }
    
    func createPlayerView() -> PlayerView {
        return ShrekView()
    }
}

class RumpleshtitskinViewFactory: PlayerViewFactory{
    func createActionView() -> PlayerView {
        return RumpleshtitskinActionView()
    }
    
    func createPlayerView() -> PlayerView {
        return RumpleshtitskinView()
    }
}


class ElementFactory: PlayerViewFactory{
    
    
    let factory: PlayerViewFactory
    
    init(factory: PlayerViewFactory){
        self.factory = factory
    }
    
    func createPlayerView() -> PlayerView {
        factory.createPlayerView()
    }
    
    func createActionView() -> PlayerView {
        factory.createActionView()
    }
    
    static func create(player: String) -> ElementFactory{
//        let player = "Shrek"
        switch player {
        case "Shrek":
            return ElementFactory(factory: ShrekViewFactory())
        case "Rumpleshtitskin":
            return ElementFactory(factory: RumpleshtitskinViewFactory())
        default:
            fatalError("ooops choose player")
        }
    }
    
}

