//
//  SuggestionModel.swift
//  NotBored
//
//  Created by Alejandro Bruno Vola on 08/09/2022.
//

import Foundation

class SuggestionModel{
    private var service: SuggestionService
    private var delegate: SuggestionDelegate
    
    init(service: SuggestionService, delegate: SuggestionDelegate){
        self.service = service
        self.delegate = delegate
    }
    
    func setNewActivity(){
        let activity = self.service.getActivity { activity in
            let activityDto : Activity = Activity(activity: activity.activity, type: activity.type, participants: activity.participants, price: setPrice(activity.price))

            self.delegate.setActivity(activityDto)

            let title = self.service.getCategory()
            self.delegate.setTitle(title: title.catergory, hiddenType: title.hiddenCategory)
        } onError: { message in
            self.delegate.showError(errorMessage: message)
        }
    }
}

