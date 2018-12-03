//
//  Mutex.swift
//  Multithreading Swift
//
//  Created by Alex on 25.11.18.
//  Copyright © 2018 alex. All rights reserved.
//

import Foundation

//Mutex призначено для захисту певного об’єкта у потоці від доступу інших потоків. М'ютекс є одним із засобів синхронізації роботи потоків

struct MutexC  {
    
    private var ptmutex = pthread_mutex_t()
    
    init() {
        pthread_mutex_init(&ptmutex, nil)
    }
    
    mutating func doSomethingInSafeThreadC(completion: () -> ()) {
        
        //блокуємо потік
        pthread_mutex_lock(&ptmutex)
        
        completion()
        
        defer {
            //розблоковуємо потік
            pthread_mutex_unlock(&ptmutex)
        }
    }
}

struct MutexObjectiveC  {
    
    private let lockMutex = NSLock()
    
    mutating func doSomethingInSafeThreadObjectiveC(completion: () -> ()) {
        
        //блокуємо потік
        lockMutex.lock()
        
        completion()
        
        defer {
            //розблоковуємо потік
            lockMutex.unlock()
        }
    }
}
