//
//  Category.swift
//  Todoey
//
//  Created by Valeria Duran on 9/13/18.
//  Copyright © 2018 Valeria Duran. All rights reserved.
//

import Foundation
import RealmSwift

class Category : Object {
  @objc dynamic var name : String = ""
    
    let items = List<Item>() // set as child relationship
}






