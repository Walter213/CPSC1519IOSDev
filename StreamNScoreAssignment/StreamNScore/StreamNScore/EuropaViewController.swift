//
//  EuropaViewController.swift
//  StreamNScore
//
//  Created by Walter Teljega on 2/4/20.
//  Copyright © 2020 Walter Teljega. All rights reserved.
//

import UIKit
import AVFoundation

class EuropaViewController: UIViewController
{
    var audioPlayer:AVAudioPlayer?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func europaPlayButton(_ sender: Any)
    {
        let url = Bundle.main.url(forResource: "UEFA Europa League Official Anthem 20192020 [FULL SONGFULL-LENGTH]", withExtension: "mp3")
        
        
        guard url != nil else
        {
            return
        }
        
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: url!)
            audioPlayer?.play()
        }
        catch
        {
            print("Europa League play button no work")
        }
    }
    
    @IBAction func stopAudioButton(_ sender: Any)
    {
        audioPlayer?.stop()
    }
}
