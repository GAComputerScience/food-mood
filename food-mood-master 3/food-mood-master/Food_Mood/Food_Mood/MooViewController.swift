//
//  MooViewController.swift
//  Food_Mood
//
//  Created by Paula Scanlan '18 on 2/2/18.
//  Copyright © 2018 Megan DeMott '18. All rights reserved.
//

import UIKit

class MooViewController: UIViewController {
    /*@IBAction func tap(_ sender: UITapGestureRecognizer) {
        guard sender.view != nil else { return }
        if sender.state == .ended{
            self.performSegue(withIdentifier: "goToRestView", sender: self)
        }
    }*/
    
    
    @IBOutlet var mooView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action:#selector(timeToMoveOn))
        
        mooView.addGestureRecognizer(tap)
        
        /*self.performSegue(withIdentifier: "goToRestView", sender: self)*/

        // Do any additional setup after loading the view.
        //self.timeToMoveOn()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func timeToMoveOn(){
        self.performSegue(withIdentifier: "goToRestView", sender: self)
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
