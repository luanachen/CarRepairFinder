//
//  RepairShopListTableViewController.swift
//  CarRepairFinder
//
//  Created by Luana on 05/03/18.
//  Copyright © 2018 lccj. All rights reserved.
//

import UIKit
import CoreLocation
import GooglePlaces
import Kingfisher


class RepairShopListTableViewController: UITableViewController {
    
    // MARK: Properties
    var locationManager = CLLocationManager()
    var shopsArray = [Result]()
    var photoReferenceArray = [Photo]()
        
        
    // MARK: ViewCicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "RepairShopTableViewCell", bundle: nil), forCellReuseIdentifier: "shopsCell")
    
        getCurrentLocation()
        
    }
    
    // MARK: Functions
    
    func getCurrentLocation() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestWhenInUseAuthorization()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }

    func upDatePlaces(latitude: String, longitude: String)  {
        
        
    }
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: UPDATE ROWS
        
        return shopsArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shopsCell", for: indexPath) as! RepairShopTableViewCell
        
        cell.shopNameLabel.text = shopsArray[indexPath.row].name
        cell.shopAddressLabel.text = shopsArray[indexPath.row].vicinity
        
        if shopsArray[indexPath.row].openingHours?.openNow == true {
            cell.shopStatusLabel.text = "Aberto"
        } else {
            cell.shopStatusLabel.text = "Fechado"
            cell.shopStatusLabel.textColor = UIColor.red
        }
        
//        let iconURLString = URL(string: shopsArray[indexPath.row].icon)
//        cell.shopImage.kf.setImage(with: iconURLString)
        
        if let photoReference = shopsArray[indexPath.row].photos?.first?.photoReference {
           let imageURL = URL(string: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=\(photoReference)&key=\(AppDelegate.GOOGLE_PLACES_KEY)")
            cell.shopImage.kf.setImage(with: imageURL)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let shopDetailVC = storyboard.instantiateViewController(withIdentifier: "ShopDetailViewController") as! ShopDetailViewController
        shopDetailVC.selectedShop = self.shopsArray[indexPath.row]
        self.navigationController?.pushViewController(shopDetailVC, animated: true)
    }
    
}

// MARK: Extensio CLLocationManagerDelegate

extension RepairShopListTableViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1] // get the last location
        if location.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)
            GetAPIData().fetchGooglePlaces(latitude: latitude, longitude: longitude, completionHandler: { (shopsArray) in
                self.shopsArray = shopsArray
                self.tableView.reloadData()
            })
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        let alerta = UIAlertController(title: "Alerta", message: "Não foi possível acessar a sua localização", preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alerta.addAction(actionOk)
        self.present(alerta, animated: true, completion: nil)
    }
    
}
