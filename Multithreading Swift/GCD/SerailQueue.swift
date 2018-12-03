//
//  SerailQueue.swift
//  Multithreading Swift
//
//  Created by Alex on 01.12.18.
//  Copyright © 2018 alex. All rights reserved.
//

import Foundation

//serial queue або послідовна чергу.

//serial  черги завершення завдань відбувається строго в тому порядку, в якому вони надходили на виконання

struct GCDSerialQueue {
    
    private let main = DispatchQueue.main // призначенa для інтерфейсу ( UI )
    private let serialQueue = DispatchQueue(label: "test")
    
    func doSomething() {

        //1
        serialQueue.async { // async - асинхронне виконання по відношенню до поточної черги.
            self.printNumbers(Array(100...2000))
        }
        
        //2
        serialQueue.async {
            self.printNumbers(Array(50...100))
        }
        
        //3
        serialQueue.async {
            self.printNumbers(Array(0...10))
        }
        
        //sync - синхронне виконання по відношенню до поточної черги
        //Синхронна функція  повертає управління на поточну чергу тільки після повного завершення завдання, тим самим блокуючи поточну чергу:
        //4
        serialQueue.sync {
            print("test")
        }
        
        //5
        serialQueue.async {
            self.printNumbers(Array(999...1000))
        }
    }
}

private extension GCDSerialQueue {
    func printNumbers(_ numbers: [Int]) {
        numbers.forEach { print($0) }
    }
}
