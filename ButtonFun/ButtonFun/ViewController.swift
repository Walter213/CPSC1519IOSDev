//
//  ViewController.swift
//  ButtonFun
//
//  Created by Walter Teljega on 1/14/20.
//  Copyright © 2020 Walter Teljega. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
//    override func viewDidLoad()
//    {
//        super.viewDidLoad()
//        // Do any additional setup
          // after loading the view.
//    }

    @IBOutlet weak var statusLabel: UILabel!
    
    @IBAction func myButton(_ sender: UIButton)
    {
        let title = sender.title(for: .selected)!
        let text = "\(title) button has been pressed!¡!"
        statusLabel.text = text
    }
    
    @IBAction func leftActionController(_ sender: UIButton)
    {
        
    }
}
