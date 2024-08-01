//
//  Extensions.swift
//  Netflix Clone
//
//  Created by  Samet Eğerci on 30.07.2024.
//

import Foundation

extension String {
    func capitalizedFirstLatter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
