//
//  ViewController+ARSCNViewDelegate.swift
//  ARKitSample
//
//  Created by ExtYabecchi on 2018/01/06.
//  Copyright © 2018年 ExtYabecchi. All rights reserved.
//

import Foundation
import ARKit

extension ViewController: ARSCNViewDelegate {
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let anchor = anchor as? ARPlaneAnchor else {fatalError()}
        
        DispatchQueue.main.async(execute: {
            let plane = PlaneNode(withAnchor: anchor)
            self.planes[anchor.identifier] = plane
            
            node.addChildNode(plane)
        })
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let plane = planes[anchor.identifier] else {
            return
        }
        
        DispatchQueue.main.async(execute: {
            plane.update(anchor: anchor as! ARPlaneAnchor)
        })
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didRemove node: SCNNode, for anchor: ARAnchor) {
        DispatchQueue.main.async(execute: {
            self.planes.removeValue(forKey: anchor.identifier)
        })
    }
}
