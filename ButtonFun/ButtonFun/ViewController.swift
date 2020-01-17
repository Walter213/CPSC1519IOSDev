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
        let text = "\(title) button pressed"
        let styledText = NSMutableAttributedString(string: text)
        let attributes = [
            NSFontAttributeName:
                UIFont.boldSystemFont(ofSize: statusLabel.font.pointSize)
        ]
        let nameRange = (text as NSString).range(of: title)
        styledText.setAttributes(attributes, range: nameRange)
        
        statusLabel.attributedText = styledText
    }
    
    @IBAction func leftActionController(_ sender: UIButton)
    {
        
    }
}
