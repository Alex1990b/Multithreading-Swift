//
//  Condition.swift
//  Multithreading Swift
//
//  Created by Alex on 25.11.18.
//  Copyright © 2018 alex. All rights reserved.
//

import Foundation

var isAvaliable = false

struct ConditionC  {
    
    private var ptmutex = pthread_mutex_t()
    private var condition = pthread_cond_t()
    
    init() {
        pthread_cond_init(&condition, nil)
        pthread_mutex_init(&ptmutex, nil)
    }
    
    mutating func firstTask() {
        
        pthread_mutex_lock(&ptmutex)
        
        while !isAvaliable {
            pthread_cond_wait(&condition, &ptmutex)
        }
        isAvaliable = false
      
        defer {
            pthread_mutex_unlock(&ptmutex)
        }
    }
    
    mutating func secondTask() {
        pthread_mutex_lock(&ptmutex)
        
        isAvaliable = true
        pthread_cond_signal(&condition)
        
        defer {
            pthread_mutex_unlock(&ptmutex)
        }
    }
}


struct ConditionObjectiveC  {
    
    private var condition = NSCondition()
    
    mutating func firstTask() {
        
        condition.lock()
    
        while !isAvaliable {
            condition.wait()
        }
        isAvaliable = false
        
        defer { condition.unlock()  }
    }
    
    mutating func secondTask() {
        condition.lock()
        
        isAvaliable = true
        condition.signal()
        
        defer { condition.unlock() }
    }
}
