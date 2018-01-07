//
//  ARKit+Extension.swift
//  ARKitSample
//
//  Created by ExtYabecchi on 2018/01/07.
//  Copyright © 2018年 ExtYabecchi. All rights reserved.
//

import ARKit

extension ARSession {
    func run() {
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        configuration.isLightEstimationEnabled = true
        run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
}
