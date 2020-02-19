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
    var audioPlayer:AVAudioPlayer?
    @IBOutlet weak var championsLogo: UIImageView!
    @IBOutlet weak var clickableTextView: UITextView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        clickableLinkTextView()
        championsLogoMove()
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
    
    // Cannot get image to bounce after it is loaded
    func championsLogoMove()
    {
        UIView.animate(withDuration: 1, animations:
        {
            self.championsLogo.frame.origin.y -= 5
        }){_ in
            UIView.animateKeyframes(withDuration: 1, delay: 0.25, options: [.autoreverse, .repeat], animations:
            {
                self.championsLogo.frame.origin.y += 5
            })
        }
    }
    
    func clickableLinkTextView()
    {
        let path = "https://en.wikipedia.org/wiki/UEFA_Champions_League  "
        let text = clickableTextView.text ?? ""
        let attributedString = NSAttributedString.makeClickableLink(for: path, in: text, as: "https://en.wikipedia.org/wiki/UEFA_Champions_League  ")
        
        let path2 = "https://www.uefa.com/uefachampionsleague/"
        let attributedString2 = NSAttributedString.makeClickableLink(for: path2, in: text, as: "https://www.uefa.com/uefachampionsleague/")
        
        let font = clickableTextView.font
        let textColor = clickableTextView.textColor
        
        clickableTextView.attributedText = attributedString
        clickableTextView.attributedText = attributedString2
        clickableTextView.font = font
        clickableTextView.textColor = textColor
    }
}
