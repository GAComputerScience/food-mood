//
//  loadingPageViewController.swift
//  Food_Mood
//
//  Created by Paula Scanlan '18 on 2/6/18.
//  Copyright © 2018 Megan DeMott '18. All rights reserved.
//

import UIKit


class loadingPageViewController: UIViewController {

    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(timeToMoveOn), userInfo: nil, repeats: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func timeToMoveOn(){
        self.performSegue(withIdentifier: "goToMainUI", sender: self)
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
