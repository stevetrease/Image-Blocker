//
//  ViewController.swift
//  Image Blocker
//
//  Created by Steve on 25/11/2018.
//  Copyright © 2018 Steve. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    @IBOutlet weak var blockerStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print (NSURL (fileURLWithPath: "\(#file)").lastPathComponent!, "\(#function)")
        update()
    }
    
    
    @IBAction func screenTappedTriggered(sender: AnyObject) {
        print (NSURL (fileURLWithPath: "\(#file)").lastPathComponent!, "\(#function)")
        print ("tapped")
        update()
    }
    
    
    func update () {
        print (NSURL (fileURLWithPath: "\(#file)").lastPathComponent!, "\(#function)")
        SFContentBlockerManager.getStateOfContentBlocker(withIdentifier: "eu.trease.Image-Blocker.Image-Blocker-blocker") { state, error in
            DispatchQueue.main.async {
                guard let state = state else {
                    print("Detection error: \(error!.localizedDescription)")
                    return
                }
                if (state.isEnabled) {
                    self.blockerStatus.text = "Enabled"
                } else {
                    self.blockerStatus.text = "Disabled"
                }
            }
        }
    }
}
