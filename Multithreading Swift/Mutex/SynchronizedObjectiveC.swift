//
//  SynchronizedObjectiveC.swift
//  Multithreading Swift
//
//  Created by Alex on 01.12.18.
//  Copyright © 2018 alex. All rights reserved.
//

import Foundation

// під капотом використовуються ті самі рекурсивні мютекси PTHREAD_MUTEX_RECURSIVE

struct SynchronizedObjc {
    private let lock = NSObject()
    
    mutating func doSomething() {
        objc_sync_enter(lock)
        //do what you need
        objc_sync_exit(lock)
    }
}
