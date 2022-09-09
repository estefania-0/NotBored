//
//  Activity.swift
//  NotBored
//
//  Created by Alejandro Bruno Vola on 09/09/2022.
//

import Foundation

struct Activity {
    var activity: String
    var type: String
    var participants: Int
    var price: Price
}

enum Price {
    case Free, Low, Medium, High
    
    func toString() -> String{
        switch self {
        case .Free: return "Free"
        case .Low: return "Low"
        case .Medium: return "Medium"
        case .High: return "High"
        }
    }
}

func setPrice(_ p : Double) -> Price{
    switch p {
    case 0 : return Price.Free
    case 0...0.3 : return Price.Low
    case 0.3...0.6 : return Price.Medium
    case 0.6...1 : return Price.High
    default:
        return Price.High
    }
}
