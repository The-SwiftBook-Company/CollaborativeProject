//
//  ViewController.swift
//  VillagioRealtyApp
//
//  Created by roman Khilchenko on 06.09.2022.
//

import UIKit

final class ShowCaseViewController: UITableViewController {
    
    private let houseModel = House.setupModel()
    
    
    //MARK: - TableView DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        houseModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showCase") as! CustomTableViewCell
        let house = houseModel[indexPath.row]
        cell.houseImage.image = UIImage(named: house.image)
        cell.titleHouseLabel.text = house.title
        cell.priceHouseLabel.text = ("\(house.price) руб.")
        cell.placeHouseLabel.text = house.place
        return cell
    }
    
    
    //MARK: - TableViewDelegate
    //Высота ячейки
    override  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.rowHeight = 600
        return tableView.rowHeight
    }
    
    //Анимация при нажатии на ячейку
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //Настраиваю хедер
   override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       let headerLabel = UILabel(frame: CGRect(x: 120, y: 40, width: 200, height: 40))
       headerLabel.text = "Дома"
       headerLabel.font = UIFont.systemFont(ofSize: 50, weight: .light)
       let contentView = UIView()
       contentView.addSubview(headerLabel)
       return contentView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        100
        
    }
    
// MARK: - Navigation
    // Передача данных на HouseDetailViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let houseDV = segue.destination as? HouseDetailViewController
        else{return}
        guard let index = tableView.indexPathForSelectedRow else {return}
        let house = houseModel[index.row]
        houseDV.house = house
        houseDV.hidesBottomBarWhenPushed = true
        
    }

}



