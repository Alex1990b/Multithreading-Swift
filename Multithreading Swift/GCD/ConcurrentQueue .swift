//
//  ConcurrentQueue .swift
//  Multithreading Swift
//
//  Created by Alex on 01.12.18.
//  Copyright © 2018 alex. All rights reserved.
//

import Foundation

import Foundation

//concurrent queue або паралельна чергу.

//concurrent черги завдання закінчуються непередбачуваним чином

struct GCDConcurrentQueue {
    
    private let global = DispatchQueue.global() // глобальнa черга з різною якістю обслуговування
    private let concurrentQueue = DispatchQueue(label: "test", attributes: .concurrent)
    
    func doSomething() {
        
        // async - асинхронне виконання по відношенню до поточної черги.
        
        concurrentQueue.async {
            self.printNumbers(Array(100...2000))
        }
        
        concurrentQueue.async {
            self.printNumbers(Array(50...100))
        }
        
        concurrentQueue.async {
            self.printNumbers(Array(0...10))
        }
        
        //sync - синхронне виконання по відношенню до поточної черги
        //Синхронна функція  повертає управління на поточну чергу тільки після повного завершення завдання, тим самим блокуючи поточну чергу:
        concurrentQueue.sync {
            print("test")
        }
        
        concurrentQueue.async {
            self.printNumbers(Array(999...1000))
        }
        
        // виконати операцію через певний час
        concurrentQueue.asyncAfter(deadline: .now() + 1) {
            print("hello")
        }
    }
}

private extension GCDConcurrentQueue {
    func printNumbers(_ numbers: [Int]) {
        numbers.forEach { print($0) }
    }
}
