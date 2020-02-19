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
    @IBOutlet weak var clickTextView: UITextView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        clickableTextView()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    //UIApplication.shared.open(URL(string:"link")) as URL, options: [:], completionHandler:nil)
    
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
    
    func clickableTextView()
    {
        let path = "https://en.wikipedia.org/wiki/UEFA_Europa_League"
        let text = clickTextView.text ?? ""
        let attributedString = NSAttributedString.makeClickableLink(for: path, in: text, as: "https://en.wikipedia.org/wiki/UEFA_Europa_League")
            
        let path2 = "https://www.uefa.com/uefaeuropaleague/"
        let attributedString2 = NSAttributedString.makeClickableLink(for: path2, in: text, as: "https://www.uefa.com/uefaeuropaleague/")
            
        let font = clickTextView.font
        let textColor = clickTextView.textColor
            
        clickTextView.attributedText = attributedString
        clickTextView.attributedText = attributedString2
        clickTextView.font = font
        clickTextView.textColor = textColor
    }
}
