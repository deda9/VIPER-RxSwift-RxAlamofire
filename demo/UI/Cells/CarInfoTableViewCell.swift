//
//  CarInfoTableViewCell.swift
//  demo
//
//  Created by Bassem Qoulta on 4/3/18.
//  Copyright © 2018 Bassem Qoulta. All rights reserved.
//

import UIKit

class CarInfoTableViewCell: UITableViewCell {
    
    public static let ID = "CarInfoTableViewCell"
    
    @IBOutlet weak var carNameLabel: UILabel!
    @IBOutlet weak var vinLabel: UILabel!
    @IBOutlet weak var interiorLabel: UILabel!
    @IBOutlet weak var fuelLabel: UILabel!
    @IBOutlet weak var exteriorLabel: UILabel!
    @IBOutlet weak var engineTypeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateData(placemark: Placemark){
        carNameLabel.text    = placemark.name
        vinLabel.text        = placemark.vin
        interiorLabel.text   = placemark.interior
        fuelLabel.text       = placemark.fuel.toString()
        exteriorLabel.text   = placemark.exterior
        engineTypeLabel.text = placemark.engineType
        addressLabel.text    = placemark.address
    }

}
