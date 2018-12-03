//
//  SpinLock.swift
//  Multithreading Swift
//
//  Created by Alex on 01.12.18.
//  Copyright © 2018 alex. All rights reserved.
//

import Foundation

// заборонено з 10-ої оськи
struct SpinLock {
    private var spinLock = OS_SPINLOCK_INIT
    
    mutating func doSomething() {
        OSSpinLockLock(&spinLock)
        //do what you need
        OSSpinLockUnlock(&spinLock)
    }
}

// з 10-ої оськи  спін лок замінено на :

struct UnfairLock {
    
    private var unfairLock = os_unfair_lock()
    
    mutating func doSomething() {
        os_unfair_lock_lock(&unfairLock)
        //do what you need
        os_unfair_lock_unlock(&unfairLock)
    }
    
}
