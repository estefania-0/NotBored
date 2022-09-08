//
//  SuggestionService.swift
//  NotBored
//
//  Created by Alejandro Bruno Vola on 08/09/2022.
//
import Alamofire
import Foundation

struct Activity: Codable {
    let activity: String
    let accessibility: Double
    let type: String
    let participants: Int
    let price: Double
    let link: String
    let key: String
}

//    protocol ApiResponse {
//        var activity: String {get}
//        var accessibility: Decimal {get}
//        var type: String {get}
//        var participants: Int {get}
//        var price: Decimal {get}
//    }

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
    
    func getActivity(success: @escaping (Activity)->()) -> Void{
        
        var parameters : [String: String] = [:]
        if category != nil {
            parameters["type"] = "\(category!)"
        }
        
        //parameters["participants"] = "\(participants)"
                        
        let request = AF.request("http://www.boredapi.com/api/activity", method: .get,parameters: parameters,  encoding: URLEncoding.queryString)
        
        request.response { [self] response in
            switch response.result {
            case .success(let data):
                do {
                    if let data = data {
                        let activity = try
                        
                        JSONDecoder().decode(Activity.self, from: data)
                        success(activity)
                    }
                } catch {
                    print("catch")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
