//
//  HoseDetailViewController.swift
//  VillagioRealtyApp
//
//  Created by Ilya Sokolov on 09.09.2022.
//

import UIKit

final class HouseDetailViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet var closeButton: UIButton!
    @IBOutlet var requestButton: UIButton!
        
    @IBOutlet var titelLabel: UILabel!
    @IBOutlet var houseImage: UIImageView!
    @IBOutlet var priceLable: UILabel!
    @IBOutlet var squareLabel: UILabel!
    @IBOutlet var regionLabel: UILabel!
    @IBOutlet var placeLabel: UILabel!
    @IBOutlet var floorLabel: UILabel!

    
    // MARK: - Public Properties
    
        var house: House!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titelLabel.text = house.title
        priceLable.text = house.price + " " + "руб."
        regionLabel.text = String(house.region)
        squareLabel.text = String(house.square)
        placeLabel.text = house.place
        houseImage.image = UIImage(named: house.image)
        navigationItem.hidesBackButton = true
        
    }
   
    // MARK: - IBAction
    @IBAction func pressedCloseButton() {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func pressedRequestButton() {
        
        let alert = UIAlertController(title: "Спасибо за заявку", message: "Менеджер скоро свяжется с Вами", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Закрыть", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}
