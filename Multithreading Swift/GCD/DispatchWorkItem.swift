//
//  DispatchWorkItem.swift
//  Multithreading Swift
//
//  Created by Alex on 03.12.18.
//  Copyright © 2018 alex. All rights reserved.
//

import Foundation

struct GCDDispathWorkItem {
    
    private var workItem: DispatchWorkItem!
    
    init() {
        workItem = DispatchWorkItem {
            print("do something...")
        }
    }
    
    func doSomething() {
       
        //запустити виконання work item
        DispatchQueue.global().sync(execute: workItem)
        
        //повідомляєм головний потік шо таск закінчився
        workItem.notify(queue: .main) {
            print("task finished")
        }
    
        //відмінити операції
        //спрацює тільки тоді коли таск ше не почався
        // workItem.cancel()
    }
}
