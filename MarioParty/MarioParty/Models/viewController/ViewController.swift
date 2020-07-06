//
//  ViewController.swift
//  MarioParty
//
//  Created by Dalal Alhazeem on 3/24/20.
//  Copyright © 2020 Dalal Alhazeem. All rights reserved.
//

import UIKit
import AVFoundation

var selectedPlayer = Player(name: "Mario")

class ViewController: UIViewController {
    @IBOutlet weak var playerImageView: UIImageView!
    
    @IBOutlet weak var gifImage: UIImageView!
    
    var playerSoundEffect: AVAudioPlayer?
    var backgroundMusic : AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playbackgroundMusic(musicName: "BG.wav")
        gifImages()
    }
    
    func playbackgroundMusic(musicName: String){
        let path = Bundle.main.path(forResource: musicName, ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            backgroundMusic = try AVAudioPlayer(contentsOf: url)
            backgroundMusic?.play()
        } catch {
            // couldn't load file :(
            
        }
    }
    
    // Do any additional setup after loading the view.
    //nextButton.isUserInteractionEnabled = false
    
    func playMusic(musicName: String){
        let path = Bundle.main.path(forResource: musicName, ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            playerSoundEffect = try AVAudioPlayer(contentsOf: url)
            playerSoundEffect?.play()
        } catch {
            // couldn't load file :(
            
        }
    }
    
    @IBAction func randomPlayer(_ sender: Any) {
        let randomPlayer = players.randomElement()!
        playerImageView.image = UIImage(named: randomPlayer.name)
        playMusic(musicName: randomPlayer.musicName())
        selectedPlayer = randomPlayer
    
    }
     
    func gifImages(){
    let jeremyGif = UIImage.gifImageWithName("SuperMario")
        gifImage.image = jeremyGif
   // gifImage.frame = CGRect(x: 20.0, y: 50.0, width: self.view.frame.size.width - 40, height: 150.0)
    view.addSubview(gifImage)
        
    }
}


