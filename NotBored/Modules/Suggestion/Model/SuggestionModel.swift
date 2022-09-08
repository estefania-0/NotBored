//
//  SuggestionModel.swift
//  NotBored
//
//  Created by Alejandro Bruno Vola on 08/09/2022.
//

import Foundation

struct ActivityDto {
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

class SuggestionModel{
    private var service: SuggestionService
    private var delegate: SuggestionDelegate
    
    init(service: SuggestionService, delegate: SuggestionDelegate){
        self.service = service
        self.delegate = delegate
    }
    
    func setNewActivity(){
        let activity = self.service.getActivity { activity in
            
            let activityDto : ActivityDto = ActivityDto(activity: activity.activity, type: activity.type, participants: activity.participants, price: setPrice(activity.price))
            
            self.delegate.setActivity(activityDto)
            
            let title = self.service.getCategory()
            self.delegate.setTitle(title: title.catergory, hiddenType: title.hiddenCategory)
            
        }
    }
}

