//
//  GCDSemaphore.swift
//  Multithreading Swift
//
//  Created by Alex on 03.12.18.
//  Copyright © 2018 alex. All rights reserved.
//

import Foundation

struct GCDSemaphore {
    
    private let semaphore = DispatchSemaphore(value: 2) // value - кількість потоків які можуть проходити
    
    func doSomething() {
    
        //запустити виконання work item
        DispatchQueue.global(qos: .userInteractive).async {
            self.semaphore.wait() // value - 1
            sleep(3)
            print("test1")
            self.semaphore.signal() // value + 1
        }
        
        DispatchQueue.global(qos: .userInteractive).async {
            self.semaphore.wait() // value - 1
            sleep(3)
            print("test2")
            self.semaphore.signal() // value + 1
        }
        
        DispatchQueue.global(qos: .userInteractive).async {
            self.semaphore.wait() // value - 1
            sleep(3)
            print("test3")
            self.semaphore.signal() // value + 1
        }
    }
}
