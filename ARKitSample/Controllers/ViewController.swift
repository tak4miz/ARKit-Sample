//
//  ViewController.swift
//  ARKitSample
//
//  Created by ExtYabecchi on 2017/12/11.
//  Copyright © 2017年 ExtYabecchi. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet var sceneView: ARSCNView!
    
    var planes = [UUID:PlaneNode]()
    var picture: PictureNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScene()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap(gestureRecognize:)))
        view.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupSession()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        stopSession()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}

extension ViewController {
    private func setupScene() {
        sceneView.delegate = self
        
        sceneView.showsStatistics = true
        sceneView.autoenablesDefaultLighting = true
        
        //set feature point
        sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
        //set scene
        sceneView.scene = SCNScene()
    }
    
    private func setupSession() {
        sceneView.session.run()
    }
    
    private func stopSession() {
        sceneView.session.pause()
    }
    
    @objc func handleTap(gestureRecognize: UITapGestureRecognizer){
        guard let currentFrame = sceneView.session.currentFrame else {
            return
        }
        
        let pitch = sceneView.session.currentFrame?.camera.eulerAngles.x
        let yawn = sceneView.session.currentFrame?.camera.eulerAngles.y
        let roll = sceneView.session.currentFrame?.camera.eulerAngles.z
        
        let orientation = SCNVector3Make(pitch!, yawn!, roll!)
        
        picture = PictureNode(fileName: "sample",
                              width: sceneView.bounds.width / 6000,
                              height: sceneView.bounds.height / 6000,
                              orientation: orientation)
        
        sceneView.scene.rootNode.addChildNode(picture)
        
        var translation = matrix_identity_float4x4
        translation.columns.3.z = -0.2
        picture.simdTransform = matrix_multiply(currentFrame.camera.transform, translation)
    }
}
