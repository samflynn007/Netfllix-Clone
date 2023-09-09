//
//  Extensions.swift
//  NetflixClone
//
//  Created by Venky on 07/09/23.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
