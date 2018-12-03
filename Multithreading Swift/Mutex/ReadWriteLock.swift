//
//  ReadWriteLock.swift
//  Multithreading Swift
//
//  Created by Alex on 01.12.18.
//  Copyright © 2018 alex. All rights reserved.
//

import Foundation

struct ReadWriteLock {
    
    private var readWriteLock = pthread_rwlock_t()
    private var lockAttributes = pthread_rwlockattr_t()
    private var globalProperty = 0
    
    init() {
        pthread_rwlock_init(&readWriteLock, &lockAttributes)
    }
    
    var property: Int {
        mutating get {
            pthread_rwlock_wrlock(&readWriteLock)
            let temp = globalProperty
            pthread_rwlock_unlock(&readWriteLock)
            return temp
        }
        mutating set {
            pthread_rwlock_wrlock(&readWriteLock)
            globalProperty = newValue
            pthread_rwlock_unlock(&readWriteLock)
        }
    }
}
