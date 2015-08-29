//
//  ViewController.swift
//  EightBall
//
//  Created by John Alstru on 8/29/15.
//  Copyright (c) 2015 nilpoint.sample. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var answerView: UITextView!
  let answers = [ "\rYES", "\rNO", "\rMAYBE",
    "I\rDON'T\rKNOW", "TRY\rAGAIN\rSOON", "READ\rTHE\rMANUAL" ]

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // Motion
  override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent) {
    if motion == .MotionShake {
      fadeFortune()
    }
  }
  
  override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
    if motion == .MotionShake {
      newFortune()
    }
  }
  
  override func motionCancelled(motion: UIEventSubtype, withEvent event: UIEvent) {
    if motion == .MotionShake {
      newFortune()
    }
  }

  // Helper func
  func fadeFortune() {
    UIView.animateWithDuration(0.75, animations: { () -> Void in
      self.answerView.alpha = 0.0
    });
  }
  
  func newFortune() {
    let randomIndex = Int(arc4random_uniform(UInt32(self.answers.count)))
    answerView.text = answers[randomIndex]
    UIView.animateWithDuration(2.0, animations: { () -> Void in
        self.answerView.alpha = 1.0;
      });
  }

}

