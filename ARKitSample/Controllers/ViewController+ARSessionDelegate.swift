//
//  ViewController+ARSessionDelegate.swift
//  ARKitSample
//
//  Created by ExtYabecchi on 2018/01/06.
//  Copyright © 2018年 ExtYabecchi. All rights reserved.
//

import Foundation
import ARKit

extension ViewController: ARSessionDelegate {
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        guard let planeAnchors = anchors as? [ARPlaneAnchor] else {return}
        
        print("平面を検出: \(planeAnchors)")
    }
    
    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
        guard let planeAnchors = anchors as? [ARPlaneAnchor] else {return}
        print("平面を更新: \(planeAnchors)")
    }
    
    func session(_ session: ARSession, didRemove anchors: [ARAnchor]) {
        print("検出した平面を削除")
    }
    
}
