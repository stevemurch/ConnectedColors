//
//  ColorSwitchViewController.swift
//  ConnectedColors
//
//  Created by Steve Murch on 1/24/18.
//  Copyright © 2018 Steve Murch. All rights reserved.
//

import UIKit

class ColorSwitchViewController: UIViewController {

    let colorService = ColorServiceManager()
    
    
    @IBOutlet weak var theGameSceneView: GameSceneView!
    
    
    @IBOutlet weak var connectionsLabel: UILabel!
    
    
    @IBAction func redTapped(_ sender: Any) {
        self.change(color: .red)
        colorService.send(colorName: "red")
    }
    
    @IBAction func yellowTapped(_ sender: Any) {
        self.change(color: .yellow)
        colorService.send(colorName: "yellow")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorService.delegate = (self as ColorServiceManagerDelegate)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func change(color : UIColor) {
        UIView.animate(withDuration: 0.2) {
            self.view.backgroundColor = color
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ColorSwitchViewController : ColorServiceManagerDelegate {
    
    func connectedDevicesChanged(manager: ColorServiceManager, connectedDevices: [String]) {
        OperationQueue.main.addOperation {
            self.connectionsLabel.text = "Connections: \(connectedDevices)"
        }
    }
    
    func colorChanged(manager: ColorServiceManager, colorString: String) {
        OperationQueue.main.addOperation {
            switch colorString {
            case "red":
                self.change(color: .red)
                
                
            case "yellow":
                self.change(color: .yellow)
                
                
            default:
                NSLog("%@", "Unknown color value received: \(colorString)")
            }
        }
    }
    
    func dogDropped(manager: ColorServiceManager)
    {
    
    OperationQueue.main.addOperation {
      
        
        self.theGameSceneView!.addDog(position: CGPoint(x:0, y:300)   )
        }
    }
    
}
