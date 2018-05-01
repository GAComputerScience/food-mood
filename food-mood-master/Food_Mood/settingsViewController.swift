//
//  settingsViewController.swift
//  Food_Mood
//
//  Created by Paula Scanlan '18 on 2/1/18.
//  Copyright © 2018 Megan DeMott '18. All rights reserved.
//

import UIKit
var rNum: Int = 20
var pNum: Int = 50

class settingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    // Do any additional setup after loading the view.
        
        radiusNumber.text = "\(rNum)"
        radiusSlider.value = Float(rNum)
        
        
        priceNumber.text = "\(pNum)"
        priceSlider.value = Float(pNum)
        
    }
    
    @IBOutlet weak var radiusSlider: UISlider!
    
    @IBOutlet weak var radiusNumber: UILabel!
    
    @IBAction func radiusSliderChanged(_ sender: UISlider) {
        let num = Int(sender.value)
        radiusNumber.text = "\(num)"
        rNum = num
    }
    
    @IBOutlet weak var priceSlider: UISlider!
    
    @IBOutlet weak var priceNumber: UILabel!
    
    @IBAction func priceSliderChanged(_ sender: UISlider) {
        let num = Int(sender.value)
        priceNumber.text = "\(num)"
        pNum = num
        
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        rNum = Int(radiusSlider.value)
        pNum = Int(priceSlider.value)
        print("save button pressed")
        print("\(rNum)")
        print("\(pNum)")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
