//
//  DrawingGameOverScene.swift
//  PDCare
//
//  Created by Jacky Lin on 11/18/19.
//  Copyright © 2019 PDCare. All rights reserved.
//

import Foundation

import SpriteKit
import CoreMotion


class DrawingGameOverScene: SKScene{
    var quitbutton=SKSpriteNode()
    var retrybutton=SKSpriteNode()
    var scoreDisplay = SKLabelNode()
    var score=0
    var game_over : GameOverDelegate?
    
    override func didMove(to view: SKView) {
        quitbutton=self.childNode(withName:"quitbutton") as! SKSpriteNode
        retrybutton=self.childNode(withName:"retrybutton") as! SKSpriteNode
        scoreDisplay = self.childNode(withName: "scoreDisplay") as! SKLabelNode
        if score <= 0 {
            scoreDisplay.text = "Score: 0"
        }
        else {
            scoreDisplay.text = "Score: " + String(score)
        }
        scoreDisplay.fontSize = 65
    }
    
    func quitPressed() {
        if let scene = DrawingGameScene(fileNamed: "DrawingGameScene") {
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFill
            
            // Present the scene
            view?.presentScene(scene, transition: SKTransition.crossFade(withDuration: 1))
            game_over?.goback()
        }
    }
    
    func retryPressed() {
        if let scene = DrawingGameScene(fileNamed: "DrawingGameScene") {
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFill
            
            // Present the scene
            view?.presentScene(scene, transition: SKTransition.crossFade(withDuration: 1))
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //if let scene = SKScene(fileNamed: "BalanceGameOverScene") {
        for touch in touches {
            let location = touch.location(in:self)
            let nodes = self.nodes(at:location)
            
            for node in nodes
            {
                if node.name == "retrybutton"
                {
                    retryPressed()
                    
                    break
                }
                if node.name == "quitbutton"
                {
                    quitPressed()
                    
                    break
                }
                //}
            }
        }
    }
    
}