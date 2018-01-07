//
//  Picture.swift
//  ARKitSample
//
//  Created by ExtYabecchi on 2018/01/06.
//  Copyright © 2018年 ExtYabecchi. All rights reserved.
//

import Foundation
import ARKit
import SceneKit

class PictureNode: SCNNode {
    override init() {
        super.init()
    }
    
    init(fileName: String, width: CGFloat, height: CGFloat, orientation: SCNVector3){
        super.init()

        let imagePlane = SCNPlane(width: width, height: height)
        imagePlane.firstMaterial?.diffuse.contents = UIImage(named: fileName)
        imagePlane.firstMaterial?.isDoubleSided = true
        
        let transform = SCNMatrix4Mult(SCNMatrix4MakeTranslation(0, -1, 0),
                                       SCNMatrix4MakeRotation(Float.pi / 2, 0, 0, 1))
        //rotating on the upper left corner
        imagePlane.firstMaterial?.diffuse.contentsTransform = transform
        
        self.geometry = imagePlane
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
