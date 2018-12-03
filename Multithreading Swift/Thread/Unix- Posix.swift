//
//  Unix- Posix.swift
//  Multithreading Swift
//
//  Created by Alex on 03.11.18.
//  Copyright © 2018 alex. All rights reserved.
//

import UIKit

struct PthreadTest {
    
    // На низькому рівні потоки працюють таким чином
    // найнижчий рівень на якому можна створити потік написаний на С
    
    func initiateThread() {
        //створюємо потік
        var thread = pthread_t(bitPattern: 0) // pthread_t == __darwin_pthread_t(C cтруктура)
        var attribut = pthread_attr_t()
        pthread_attr_init(&attribut)
        //запускаєм потік
        pthread_create(&thread, &attribut, { (pointer) -> UnsafeMutableRawPointer? in
            print("do something")
            return nil
        }, nil)
    }
}

// оболочка над pthread з Objective -C
struct ThreadTest {
    
    func initiateThread() {
        //створюємо потік
        let thread = Thread {
            print("do something")
        }
        //запускаєм потік
        thread.start()
        
    }
}




