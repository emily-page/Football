//
//  Search.swift
//  Football Test
//
//  Created by apcs2 on 1/12/18.
//  Copyright © 2018 apcs7. All rights reserved.
//

import UIKit

class Search: NSObject
{
    let name: String
    let image: UIImage?
    let element: Element
    
    enum Element: String
    {
        case Pro
        case Trip
        case Iso
        case All
    }
    
    init(name: String, element: Element)
    {
        self.name = name
        self.image = UIImage(named: name)
        self.element = element
        super.init()
    }

}
