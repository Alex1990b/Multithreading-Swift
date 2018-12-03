//
//  DispathGroup.swift
//  Multithreading Swift
//
//  Created by Alex on 03.12.18.
//  Copyright © 2018 alex. All rights reserved.
//

import Foundation

//Якщо у вас є кілька завдань, які потрібно виконати асинхронно, і дочекатися їх повного завершення, то застосовується група DispatchGroup, яку дуже легко створити:

struct GCDDispathGroupConcurrent {
    
    private let concurrentQueue = DispatchQueue(label: "test", attributes: .concurrent)
    private let group = DispatchGroup()
    
    func doSomething() {
    
        group.enter()  //відкрити групу
        concurrentQueue.async {
            sleep(5)
            print("test1")
            
            self.group.leave() // залишити групу
        }
        
        group.enter()
        concurrentQueue.async {
            sleep(2)
            print("test2")
            self.group.leave()
        }
        
        group.enter()
        concurrentQueue.async {
            sleep(3)
            print("test3")
            self.group.leave()
        }
        
        group.wait()
        
        group.notify(queue: .main) {
            print("all task finished")
        }
    }
}


struct GCDDispathGroupSerial {
    
    private let serialQueue = DispatchQueue(label: "test")
    private let group = DispatchGroup()
    
    func doSomething() {
        
        serialQueue.async(group: group) {
            sleep(1)
            print("test1")
        }
        
        serialQueue.async(group: group) {
            sleep(2)
            print("test2")
        }
        
        serialQueue.async(group: group) {
            sleep(3)
            print("test3")
        }
        
        group.wait()
        
        print("finished")
    }
}
