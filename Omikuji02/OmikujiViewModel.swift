//
//  OmikujiViewModel.swift
//  Omikuji02
//
//  Created by cmStudent on 2023/01/26.
//

import SwiftUI
import CoreMotion
class OmikujiViewModel: NSObject, ObservableObject {
    let motionManager = CMMotionManager()
    @Published var isStarted = false
    @Published var image = "omikuji"
    var acclelerationY = 0.0
    var count = 0
    
    func start() {
        image = "omikuji"
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = 0.1
            motionManager.startDeviceMotionUpdates(to: OperationQueue.current!, withHandler: {(motion:CMDeviceMotion?, error:Error?) in
                self.updateMotionData(deviceMotion: motion!)
            })
        }
        
        isStarted = true
    }
    
    func stop() {
        isStarted = false
        motionManager.stopDeviceMotionUpdates()
    }
    
    private func updateMotionData(deviceMotion:CMDeviceMotion) {
        acclelerationY = deviceMotion.userAcceleration.y
        changeImage()
    }
    
    func changeImage() {
        if acclelerationY < -1 || acclelerationY > 1 {
            count += 1
            if count >= 4 {
                image = omikuji()
                count = 0
                stop()
            }
        }
    }
    
    func omikuji() -> String {
        switch Int.random(in: 1...100) {
        case 1:
            return "daikyou"
        case 2...12:
            return "kyou"
        case 13...31:
            return "suekichi"
        case 33...54:
            return "kichi"
        case 55...65:
            return "shoukichi"
        case 66...76:
            return "chuukichi"
        case 77...100:
            return "daikichi"
        default:
            return "omikuji"
        }
    }
}
