//
//  GetAPIData.swift
//  CarRepairFinder
//
//  Created by Luana on 05/03/18.
//  Copyright © 2018 lccj. All rights reserved.
//

import UIKit
import Alamofire

class GetAPIData {
    
    func fetchGooglePlaces(latitude: String, longitude: String, completionHandler: @escaping ([Result]) -> ()) {
        
        var shopsArray = [Result]()
        
        let googleURL = URL(string: "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(latitude),\(longitude)&radius=500&type=car_repair&key=\(AppDelegate.GOOGLE_PLACES_KEY)")
        
        //        let shopsJSONFile = Bundle.main.url(forResource: "shops", withExtension: "json")
        
        Alamofire.request(googleURL!).responseJSON { (response) in
            
            if response.result.isSuccess {
                do {
                    let decoder = JSONDecoder()
                    let shopsDataModel = try decoder.decode(ShopsModel.self, from: response.data!)
                    shopsArray = shopsDataModel.results
                    if shopsArray.isEmpty {
                        print(shopsDataModel.status)
                    }
                } catch {
                    print("Error while parsing json: \(error)")
                }
            } else {
                print("Error with request: \(String(describing: response.result.error))")
                let alerta = UIAlertController(title: "Alerta", message: "Connection Issues", preferredStyle: .alert)
                let actionOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alerta.addAction(actionOk)
                UIApplication.shared.keyWindow?.rootViewController?.present(alerta, animated: true, completion: nil)
            }
            completionHandler(shopsArray)
        }
    }
    
    
    func getShopImage(photoReference: Photo, completionHandler: (UIImage) -> ()) {
        var image = UIImage()
        let imageURL = URL(string: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=\(String(describing: photoReference))&key=\(AppDelegate.GOOGLE_PLACES_KEY)")
        
        Alamofire.request(imageURL!).responseData { (response) in
        
            guard UIImage(data: response.data!) != nil else {return}
        }
        completionHandler(image)
    }
    
}
