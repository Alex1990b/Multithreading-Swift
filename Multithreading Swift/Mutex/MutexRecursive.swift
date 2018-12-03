//
//  MutexRecursive.swift
//  Multithreading Swift
//
//  Created by Alex on 25.11.18.
//  Copyright © 2018 alex. All rights reserved.
//

import Foundation

struct RecursiveMutexC  {
    
    private var ptmutex = pthread_mutex_t()
    private var mutexAtr = pthread_mutexattr_t()
    
    init() {
        pthread_mutex_init(&ptmutex, nil)
        pthread_mutexattr_settype(&mutexAtr, PTHREAD_MUTEX_RECURSIVE)
        pthread_mutex_init(&ptmutex, &mutexAtr)
    }
    
    mutating func firstTaskt() {
        
        pthread_mutex_lock(&ptmutex)
        
        secondTask()
        
        defer {
            pthread_mutex_unlock(&ptmutex)
        }
    }
    
  private mutating func secondTask() {
        
        pthread_mutex_lock(&ptmutex)
       
        print("finished")
       
        defer {
            pthread_mutex_unlock(&ptmutex)
        }
    }
}

class RecursiveMutexObjectiveC: Thread  {
    
    private let recursiveLock = NSRecursiveLock()
    
    override func main() {
        recursiveLock.lock()
        someTask()
        defer {  recursiveLock.unlock()  }
    }
    
    private func someTask() {
        recursiveLock.lock()
        print("finished")
        defer {  recursiveLock.unlock()  }
    }
}
