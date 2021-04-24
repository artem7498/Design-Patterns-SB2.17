//
//  Memento.swift
//  Design Patterns SB2.17
//
//  Created by Артём on 4/24/21.
//

import Foundation
import UIKit

//Memento(поведенческий) - Позволяет делать снимки состояния объектов, не раскрывая подробностей их реализации. Затем снимки можно использовать, чтобы восстановить прошлое состояние объектов

// в игре может использоваться, например для отслеживания изменений положения героя в пространстве или иего сохранения (чекпоинт)


struct CheckpointMemento{
    let playerPosition: CGPoint
    let time: NSDate
    let level: Int
}

class Game{
    
    func createCheckpoint() -> CheckpointMemento{
        fatalError()
    }
    
    func loadCheckpoint(memento: CheckpointMemento){
//        load&update checkpoint
    }
}

// пример 2

class UndoStack: CustomStringConvertible {

    private lazy var mementos = [Memento]()
    private let textView: UITextView

    init(_ textView: UITextView) {
        self.textView = textView
    }

    func save() {
        mementos.append(textView.memento)
    }

    func undo() {
        guard !mementos.isEmpty else { return }
        textView.restore(with: mementos.removeLast())
    }

    var description: String {
        return mementos.reduce("", { $0 + $1.description })
    }
}

protocol Memento: CustomStringConvertible {

    var text: String { get }
    var date: Date { get }
}

extension UITextView {

    var memento: Memento {
        return TextViewMemento(text: text,
                               textColor: textColor,
                               selectedRange: selectedRange)
    }

    func restore(with memento: Memento) {
        guard let textViewMemento = memento as? TextViewMemento else { return }

        text = textViewMemento.text
        textColor = textViewMemento.textColor
        selectedRange = textViewMemento.selectedRange
    }

    struct TextViewMemento: Memento {

        let text: String
        let date = Date()

        let textColor: UIColor?
        let selectedRange: NSRange

        var description: String {
            let time = Calendar.current.dateComponents([.hour, .minute, .second, .nanosecond],
                                                       from: date)
            let color = String(describing: textColor)
            return "Text: \(text)\n" + "Date: \(time.description)\n"
                + "Color: \(color)\n" + "Range: \(selectedRange)\n\n"
        }
    }
}
