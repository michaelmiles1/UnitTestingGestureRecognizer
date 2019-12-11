//
//  ViewController.swift
//  SwipeRecognizer
//
//  Created by Michael Miles on 11/12/19.
//  Copyright © 2019 Michael Miles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var upLabel: UILabel!
    @IBOutlet weak var downLabel: UILabel!
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    
    @IBOutlet weak var swipeView: UIView!
    
    var upCount = 0
    var downCount = 0
    var leftCount = 0
    var rightCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addGestureRecognizers()
    }
    
    func addGestureRecognizers() {
        var swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = .right
        swipeView.addGestureRecognizer(swipeRight)
        
        var swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = .left
        swipeView.addGestureRecognizer(swipeLeft)
        
        var swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeUp.direction = .up
        swipeView.addGestureRecognizer(swipeUp)
        
        var swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeDown.direction = .down
        swipeView.addGestureRecognizer(swipeDown)
    }
    
    @objc func respondToSwipeGesture(gesture: UISwipeGestureRecognizer) {
        switch gesture.direction {
        case .right:
            rightCount += 1
            rightLabel.text = "RIGHT: \(rightCount)"
        case .left:
            leftCount += 1
            leftLabel.text = "LEFT: \(leftCount)"
        case .up:
            upCount += 1
            upLabel.text = "UP: \(upCount)"
        case .down:
            downCount += 1
            downLabel.text = "DOWN: \(downCount)"
        default:
            break
        }
    }

    @IBAction func resetCount(_ sender: Any) {
        upCount = 0
        upLabel.text = "UP: \(upCount)"
        
        downCount = 0
        downLabel.text = "DOWN: \(downCount)"
        
        leftCount = 0
        leftLabel.text = "LEFT: \(leftCount)"
        
        rightCount = 0
        rightLabel.text = "RIGHT: \(rightCount)"
    }
}

