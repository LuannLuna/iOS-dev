//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

class ViewController: UIViewController{
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        
    }
    
    func playSoundAudioToolbox(_ nSound: Int) {
        if let soundURL: URL = Bundle.main.url(forResource: "note\(nSound)", withExtension: "wav"){
            var mySound: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
            
            AudioServicesPlaySystemSound(mySound)
        }
    }
  
    func playSoundAVFoundation (_ nSound: Int) {
        var audioPlayer: AVAudioPlayer?
        let url: URL = Bundle.main.url(forResource: "note\(nSound)", withExtension: "wav")!
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            guard let audioPlayer = audioPlayer else { return }
            
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

