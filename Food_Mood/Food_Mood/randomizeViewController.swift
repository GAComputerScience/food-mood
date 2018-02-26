//
//  randomizeViewController.swift
//  Food_Mood
//
//  Created by Paula Scanlan '18 on 2/1/18.
//  Copyright © 2018 Megan DeMott '18. All rights reserved.
//

import UIKit
import AVFoundation

class randomizeViewController: UIViewController {

    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        do {
            
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "MOO", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
        
        }
        
        catch {
            
            print(error)
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func MooButton(_ sender: Any) {
        audioPlayer.stop()
        audioPlayer.play()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
