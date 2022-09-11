//
//  HouseModel.swift
//  VillagioRealtyApp
//
//  Created by roman Khilchenko on 06.09.2022.
//

import Foundation

struct House {
    let image: String
    let title: String
    let price: String
    let place: String
    let square: Int
    let region: Double
   
}

extension House {
    static func setupModel() -> [House] {
        [
            House(image: "house1", title: "Дом в современном стиле", price: "85 481 000", place: "Agalarov Estate - Новорижское шоссе", square: 2247, region: 193.0),
            House(image: "house2", title: "Современный дом по проекту Attic Belvoir", price: "123 000 000", place: "Берёзки - Московская область", square: 3562, region: 200),
            House(image: "house3", title: "Дворец у озера с карпами", price: "135 368 000", place: "Шервуд - Москвовская область", square: 3575, region: 430.3),
            House(image: "house4", title: "Умный дом", price: "182 826 000", place: "Agalarov Estate - Новорижское шоссе", square: 1400, region: 180),
            House(image: "house5", title: "Дом из клеёного бруса", price: "27 500 000", place: "Михалково - Московская область", square: 3220, region: 280.5),
            House(image: "house6", title: "Лесная резиденция", price: "255 986 000", place: "Зеленая роща - Минское шоссе", square: 2600, region: 220),
            House(image: "house7", title: "Дом у пруда", price: "877 565 000", place: "Бенилюкс - Московское шоссе", square: 1900, region: 140),
            House(image: "house8", title: "Лесная резиденция", price: "85 481 000", place: "Зеленая роща - Московская область", square: 2600, region: 230),
            House(image: "house9", title: "Дом в современном стиле", price: "85 481 000", place: "Agalarov Estate - Новорижское шоссе", square: 2200, region: 196.4),
            House(image: "house10", title: "Дом в современном стиле", price: "85 481 000", place: "Agalarov Estate - Новорижское шоссе", square: 1950, region: 178.6),
            House(image: "house11", title: "Умный дом в КП Липка", price: "182 847 000", place: "Липка - Московское шоссе", square: 2000, region: 190.9)
        ]
    }
}
