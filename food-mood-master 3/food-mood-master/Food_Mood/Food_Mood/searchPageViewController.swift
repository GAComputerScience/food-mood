//
//  searchPageViewController.swift
//  Food_Mood
//
//  Created by Megan DeMott '18 on 1/30/18.
//  Copyright © 2018 Megan DeMott '18. All rights reserved.
//

import UIKit

class searchPageViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var userSearch: String!
    @IBAction func searchTap(_ sender: UITapGestureRecognizer) {
        searchBar.becomeFirstResponder()
        if searchBar.text != nil {
            userSearch = searchBar.text
        }
        searchBar.resignFirstResponder()
        print(userSearch)
    }

    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func typingTime(){
        
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
