//
//  randomizeViewController.swift
//  Food_Mood
//
//  Created by Paula Scanlan '18 on 2/1/18.
//  Copyright © 2018 Megan DeMott '18. All rights reserved.
//

import UIKit
import AVFoundation
import CoreLocation

let client_id = "QMSFYVYCUU0VUYAW4LU5NFZGKNQXK3PCVD3NQOWFOGJ3AJYC"
let client_secret = "S5FLAVJE5WBUMAU25TEUWXJQC2KUTXZ4W3JWEGZYH3ZOXFIU"


class randomizeViewController: UIViewController {
    
    
    var currentLocation:CLLocationCoordinate2D!
    var searchResults = [JSON]()

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
    
    // MARK: - venues/search endpoint
    // https://developer.foursquare.com/docs/venues/search
    func snapToPlace() {
        let url = "https://api.foursquare.com/v2/venues/search?ll=\(currentLocation.latitude),\(currentLocation.longitude)&v=20160607&intent=checkin&limit=1&radius=4000&client_id=\(client_id)&client_secret=\(client_secret)"
        
        let request = NSMutableURLRequest(url: URL(string: url)!)
        let session = URLSession.shared
        
        request.httpMethod = "GET"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, err -> Void in
            
            var currentVenueName:String?
            
            let json = JSON(data: data!)
            currentVenueName = json["response"]["venues"][0]["name"].string
            
            // set label name and visible
            /*DispatchQueue.main.async {
                if let v = currentVenueName {
                    self.currentLocationLabel.text = "You're at \(v). Here's some ☕️ nearby."
                }
                self.currentLocationLabel.isHidden = false
            }*/
        })
        
        task.resume()
    }
    
    // MARK: - search/recommendations endpoint
    // https://developer.foursquare.com/docs/search/recommendations
    func searchForCoffee() {
        let url = "https://api.foursquare.com/v2/search/recommendations?ll=\(currentLocation.latitude),\(currentLocation.longitude)&v=20160607&intent=coffee&limit=15&client_id=\(client_id)&client_secret=\(client_secret)"
        
        let request = NSMutableURLRequest(url: URL(string: url)!)
        let session = URLSession.shared
        
        request.httpMethod = "GET"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, err -> Void in
            
            let json = JSON(data: data!)
            self.searchResults = json["response"]["group"]["results"].arrayValue
            print(self.searchResults)
            self.shuffle(array: self.searchResults)
            
            /*DispatchQueue.main.async {
                self.tableView.isHidden = false
                self.tableView.reloadData()
            }*/
        })
        
        task.resume()
    }
    
    func shuffle(array: [JSON]) {
        var shuffled = [JSON]();
        for i in 0..<array.count{
            let rand = Int(arc4random_uniform(UInt32(array.count)))
            
            shuffled.append(array[rand])
            
            //array.remove(at: rand)
        }
        print(shuffled)
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
