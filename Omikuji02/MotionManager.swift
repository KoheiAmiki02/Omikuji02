//
//  MotionManager.swift
//  Sensor02
//
//  Created by cmStudent on 2022/12/15.
//

import Foundation
import CoreMotion

final class MotionManager {
    static let shared = MotionManager.init()
    
    private let motion = CMMotionManager()
    
    private let queue = OperationQueue()
    
    var acclelerationY: Double = 0
    
    func startQueueUpdates() {
        guard motion.isDeviceMotionAvailable else { return }
        self.motion.deviceMotionUpdateInterval = 1.0 / 60.0
        self.motion.showsDeviceMovementDisplay = true
        self.motion.startDeviceMotionUpdates(to: self.queue) { data, error in
            if let validData = data {
                print("加速度y:\(validData.userAcceleration.y)")
                self.acclelerationY = validData.userAcceleration.y
            }
        }
    }
    
}
