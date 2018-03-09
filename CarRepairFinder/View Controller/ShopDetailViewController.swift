//
//  ShopDetailViewController.swift
//  CarRepairFinder
//
//  Created by Luana on 05/03/18.
//  Copyright © 2018 lccj. All rights reserved.
//

import UIKit

class ShopDetailViewController: UIViewController {

    var selectedShop: Result?
    
    @IBOutlet weak var selectedShopImage: UIImageView!
    @IBOutlet weak var selectedShopAddress: UILabel!
    @IBOutlet weak var selectedShopStatus: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = selectedShop?.name
        
        selectedShopAddress.text = selectedShop?.vicinity
        
        if let photoReference = selectedShop?.photos?.first?.photoReference {
            let imageURL = URL(string: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=\(photoReference)&key=\(AppDelegate.GOOGLE_PLACES_KEY)")
            selectedShopImage.kf.setImage(with: imageURL)
        }
        
        if selectedShop!.openingHours?.openNow == true {
            selectedShopStatus.text = "Aberto"
        } else {
            selectedShopStatus.text = "Fechado"
            selectedShopStatus.textColor = UIColor.red
        }

    }

}
