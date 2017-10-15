//
//  MessageService.swift
//  Smack
//
//  Created by Anshul Kapoor on 14/10/17.
//  Copyright © 2017 Anshul Kapoor. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    
    static let instance = MessageService()
    
    var channels = [Channel]()
    
    func findAllChannel(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_CHANNEL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            
            print(URL_GET_CHANNEL)
            print("\n")
            if response.result.error == nil {

                guard let data = response.data else { return }
                
                do {
                    self.channels = try JSONDecoder().decode([Channel].self, from: data)
                } catch let error {
                    debugPrint(error as Any)
                }
                print(self.channels)
                print("Cusrsor 1 is here now\n")

                
//                if let json = JSON(data: data).array {
//                    for item in json {
//                        print("Cusrsor 2 is here now\n")
//
//                        let name = item["name"].stringValue
//                        let channelDescription = item["description"].stringValue
//                        let id = item["_id"].stringValue
//                        let channel = Channel(channelTitle: name, channelDesc: channelDescription, id: id)
//                        self.channels.append(channel)
//                    }
//                    print("Cusrsor is here now\n")
//                    print(self.channels[0].channelTitle)
//                    completion(true)
//                }
                
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    
}
