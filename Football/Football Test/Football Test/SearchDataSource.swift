//
//  SearchDataSource.swift
//  Football Test
//
//  Created by apcs2 on 1/12/18.
//  Copyright © 2018 apcs7. All rights reserved.
//

import UIKit

class SearchDataSource: NSObject
{
    class func createList() -> [Search]
    {
        return [Search(name: "play one", element: .Pro),
                Search(name: "two", element: .Iso),
                Search(name: "three", element: .Trip)]
    }
}
