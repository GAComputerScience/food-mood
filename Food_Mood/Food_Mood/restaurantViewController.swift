//
//  restaurantViewController.swift
//  Food_Mood
//
//  Created by Paula Scanlan '18 on 2/6/18.
//  Copyright © 2018 Megan DeMott '18. All rights reserved.
//

import UIKit
import MapKit

class restaurantViewController: UIViewController {

    @IBAction func getDirections(_ sender: Any) {
        let latitude: CLLocationDegrees = 51.4826
        let longitude: CLLocationDegrees = 0.0077
        let regionDistance: CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placeMark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placeMark)
        mapItem.openInMaps(launchOptions: options)
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
