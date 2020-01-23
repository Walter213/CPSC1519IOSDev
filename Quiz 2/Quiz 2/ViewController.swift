//
//  ViewController.swift
//  Quiz 2
//
//  Created by Walter Teljega on 1/23/20.
//  Copyright © 2020 Walter Teljega. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var numberTextBox: UITextField!
    @IBOutlet weak var productLabel: UILabel!
    
    let ten = 10
    
    @IBAction func productNumber(_ sender: UITextField)
    {
        //let text = numberTextBox + ten
        //productLabel.text = text
    }
}
