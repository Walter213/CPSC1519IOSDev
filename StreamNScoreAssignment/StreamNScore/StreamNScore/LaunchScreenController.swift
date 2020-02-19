//
//  LaunchScreenController.swift
//  StreamNScore
//
//  Created by Pajo Teljega on 2020-02-19.
//  Copyright © 2020 Walter Teljega. All rights reserved.
//

import UIKit

class LaunchScreenController: UIViewController
{
    @IBOutlet weak var streamNScore: UILabel!
    @IBOutlet weak var streamLogo: UIImageView!
    @IBOutlet weak var byLabel: UILabel!
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 2.0, animations:
        {
            self.streamNScore.transform = CGAffineTransform(translationX: self.view.bounds.size.width, y: 0)
            self.streamLogo.transform = CGAffineTransform(translationX: self.view.bounds.size.width, y: 0)
            self.byLabel.transform = CGAffineTransform(translationX: self.view.bounds.size.width, y: 0)
        }) { (success) in
            let sendback = UIStoryboard(name: "Main", bundle: nil)
            let viewcontroller = sendback.instantiateInitialViewController()
            UIApplication.shared.keyWindow?.rootViewController = viewcontroller
        }
    }
}
