//
//  SuggestionService.swift
//  NotBored
//
//  Created by Alejandro Bruno Vola on 08/09/2022.
//
import Alamofire
import Foundation

final class SuggestionService {

    static let shared = SuggestionService()
    
    private var participants : Int = 0
    private var category : String?

    init(){}
    
    func setParticipants(participants:Int){
        self.participants = participants
    }
    
    func setCategory(category:String? = nil){
        self.category = category
    }
    
    func getCategory() -> (catergory: String, hiddenCategory: Bool){
        let result = self.category == nil ? ("Random", true) : (self.category!,false)
        return result
    }
    
    func getActivity(success: @escaping (NotBored)->(), onError: @escaping (String)->()) -> Void{
        
        var parameters : [String: String] = [:]
        if category != nil {
            parameters["type"] = "\(category!.lowercased())"
        }
        
        parameters["participants"] = "\(participants)"
                        
        let request = AF.request("http://www.boredapi.com/api/activity", method: .get,parameters: parameters,  encoding: URLEncoding.queryString)
        
        request.response { [self] response in
            switch response.result {
            case .success(let data):
                do {
                    if let data = data {
                        let activity = try
                        
                        JSONDecoder().decode(NotBored.self, from: data)
                        success(activity)
                    }
                } catch {
                    onError("No activities")
                    print("catch")
                }
            case .failure(let error):
                onError(error.errorDescription!)
                print(error)
            }
        }
    }
}
