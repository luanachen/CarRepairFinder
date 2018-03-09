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
    
    var defaultSession: DHURLSession = URLSession(configuration: URLSessionConfiguration.default)
    
    func fetchGooglePlaces(latitude: String, longitude: String, completionHandler: @escaping ([Result]) -> ()) {
        
        var shopsArray = [Result]()

        let googleURL = URL(string: "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(latitude),\(longitude)&radius=500&type=car_repair&key=\(AppDelegate.GOOGLE_PLACES_KEY)")
        
        Alamofire.request(googleURL!).responseJSON { (response) in
            
            if response.result.isSuccess {
                
               shopsArray = self.updatePlacesResult(response.data)
            
            } else {
                print("Error with request: \(String(describing: response.result.error))")
                let alerta = UIAlertController(title: "Alerta", message: "Erro ao receber dados, por favor reporte o problema. :(", preferredStyle: .alert)
                let actionOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alerta.addAction(actionOk)
                UIApplication.shared.keyWindow?.rootViewController?.present(alerta, animated: true, completion: nil)
            }
            completionHandler(shopsArray)
        }
    }
    
    func updatePlacesResult(_ data: Data?) -> [Result]{
        var shopsArray = [Result]()
        var shopsDataModel = ShopsModel(results: shopsArray)

        do {
            let decoder = JSONDecoder()
            if let data = data {
            shopsDataModel = try decoder.decode(ShopsModel.self, from: data)
            shopsArray = shopsDataModel.results
            } else { print("no data retrieved") }
            if shopsArray.isEmpty {
                print(shopsDataModel.status!)
            }
        } catch {
            print("Error while parsing json: \(error)")
        }
        
        return shopsArray
    }
    
    func getShopImage(photoReference: Photo, completionHandler: (UIImage) -> ()) {
        let image = UIImage()
        let imageURL = URL(string: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=\(String(describing: photoReference))&key=\(AppDelegate.GOOGLE_PLACES_KEY)")
        
        Alamofire.request(imageURL!).responseData { (response) in
        
            guard UIImage(data: response.data!) != nil else {return}
        }
        completionHandler(image)
    }
    
}
