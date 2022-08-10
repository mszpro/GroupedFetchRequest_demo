//
//  CelestialBodyType.swift
//  GroupedFetchRequest
//
//  Created by Sora on 2022/08/09.
//

import Foundation

enum CelestialBodyType: Int16, CaseIterable {
    case planet = 0
    case star = 1
    case moon = 2
    case blackHole = 3
    func getDisplayName() -> String {
        switch self {
        case .planet:
            return "惑星"
        case .star:
            return "恒星"
        case .moon:
            return "衛星"
        case .blackHole:
            return "ブラックホール"
        }
    }
}
