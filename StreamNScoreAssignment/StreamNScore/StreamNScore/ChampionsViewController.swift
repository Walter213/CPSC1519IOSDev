//
//  ChampionsViewController.swift
//  StreamNScore
//
//  Created by Walter Teljega on 2/4/20.
//  Copyright © 2020 Walter Teljega. All rights reserved.
//

import UIKit
import AVFoundation

class ChampionsViewController: UIViewController
{
    // Going to make url clickable hopefully soon once i find out how to do that
    // Did not have enough time to complete it for assignment 2
    
    // I might as well do image animation as well (something like https://www.youtube.com/watch?v=oe8kJYLR-qQ)
    var audioPlayer:AVAudioPlayer?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func championsPlayButton(_ sender: Any)
    {
        let url = Bundle.main.url(forResource: "UEFA Champions League Theme Song [Lyrics On Screen]", withExtension: "mp3")
        
        
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
            print("Champions League play button no work")
        }
    }
    
    @IBAction func stopAudioButton(_ sender: Any)
    {
        audioPlayer?.stop()
    }
}
