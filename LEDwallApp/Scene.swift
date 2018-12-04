//
//  Scene.swift
//  ARTest
//
//  Created by Travis Brigman on 11/5/18.
//  Copyright © 2018 Travis Brigman. All rights reserved.
//

import Foundation
import SceneKit

struct WallScene {
    
    var resultView = ResultsViewController()
    
    var scene: SCNScene?
    
    init() {
        scene = self.initializeScene()
    }
    
    func initializeScene() -> SCNScene? {
        let scene = SCNScene()
        
        setDefaults(scene: scene)
        
        return scene
    }
    
    func setDefaults(scene: SCNScene) {
        
    }
    
    func addWall(position: SCNVector3) {
        
        guard let scene = self.scene else { return }
        
        let cubeNode = SCNNode()
        cubeNode.geometry = SCNBox(width: 0.5, height: 0.5, length: 0.25, chamferRadius: 0)
        cubeNode.opacity = 0.5
        cubeNode.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        //cubeNode.position = SCNVector3(0, 0, -1) // SceneKit/AR coordinates are in meters
        
        guard let columns = resultView.resultWallHeight,
            let rows = resultView.resultWallWidth else { return }
        
        print(columns,rows)
        
        var yPosition = 0.0
        var xPosition = 0.0
        
        let wallNodeColumn = SCNNode()
        let wallNodeRow = SCNNode()
        
        for _ in 1...columns {
            
            let columnNodes = wallNodeColumn
            let rowNodes = wallNodeRow
            
            for _ in 1...rows {
                let clonedCube = cubeNode.clone()
                clonedCube.position = SCNVector3(0, yPosition, -1)
                columnNodes.addChildNode(clonedCube)
                yPosition += 0.5
            }
            
            let clonedColumns = columnNodes.clone()
            clonedColumns.position = SCNVector3(xPosition, 0, -1)
            rowNodes.addChildNode(clonedColumns)
            xPosition += 0.5
            yPosition = 0
        }
        
        wallNodeRow.position = position
        scene.rootNode.addChildNode(wallNodeRow)
    }
}
