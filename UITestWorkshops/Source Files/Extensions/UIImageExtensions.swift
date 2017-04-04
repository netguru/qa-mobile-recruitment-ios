//
//  UIImageExtensions.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

extension UIImage {
    
    func save(with name: String) throws {
        let documentUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let url = documentUrl.appendingPathComponent(name)
        try UIImageJPEGRepresentation(self, 1.0)?.write(to: url, options: .atomic)
    }
    
    static func load(with name: String) throws -> UIImage {
        let documentUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let url = documentUrl.appendingPathComponent(name)
        let data = try Data(contentsOf: url)
        return UIImage(data: data)!
    }
}
