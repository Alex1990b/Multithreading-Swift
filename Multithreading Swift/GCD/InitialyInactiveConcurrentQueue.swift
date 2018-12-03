//
//  InitialyInactiveConcurrentQueue.swift
//  Multithreading Swift
//
//  Created by Alex on 03.12.18.
//  Copyright © 2018 alex. All rights reserved.
//

import Foundation

struct GCDInitialyInactiveConcurrentQueue {
    
    private let concurrentQueue = DispatchQueue(label: "test", attributes: [.concurrent, .initiallyInactive])
    
    func doSomething() {
        
        // черга з атрибутом initiallyInactive по дефолту ше на запущена
        concurrentQueue.async {
            print("hello")
        }
        
        //запускаєм чергу
        concurrentQueue.activate()
        
        //ставим на паузу
        concurrentQueue.suspend()
        
        //знімаємо з паузи
        concurrentQueue.resume()
    }
}
