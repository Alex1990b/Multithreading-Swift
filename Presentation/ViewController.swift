//
//  ViewController.swift
//  Multithreading Swift
//
//  Created by Alex on 31.10.18.
//  Copyright © 2018 alex. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    private let serialGueue = GCDSerialQueue()
    private let concurrentQueue = GCDConcurrentQueue()
    private let semaphore = GCDSemaphore()
    private let serialGroup = GCDDispathGroupSerial()
    private let concurrentGroup = GCDConcurrentQueue()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        serialGroup.doSomething()
    }
}

