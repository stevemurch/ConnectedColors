//
//  GameScene.swift
//  ConnectedColors
//
//  Created by Steve Murch on 1/24/18.
//  Copyright © 2018 Steve Murch. All rights reserved.
//

import SpriteKit

class GameSceneView: SKView {

    
    
    func addDog(position: CGPoint)
    {
        let node = SKSpriteNode(imageNamed: "dog.png")
        node.physicsBody = SKPhysicsBody.init(circleOfRadius: 12)
        node.physicsBody?.mass = 2
        node.position = position
        
        self.scene?.addChild(node)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            
            addDog(position: CGPoint(x:0, y:300)   )
            
            
        }
        
        
    }
    
    override func didMoveToWindow() {
        
        super.didMoveToWindow()
        
        print("didMoveToWindow")
        
        if let view = self as SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = false
            view.showsPhysics = true
        
            
            view.scene?.speed = 0.002
            
        }
       
        
    }
    
    
    
    
       
        
    
}
