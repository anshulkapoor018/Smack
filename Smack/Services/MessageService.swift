//
//  MessageService.swift
//  Smack
//
//  Created by Anshul Kapoor on 14/10/17.
//  Copyright © 2017 Anshul Kapoor. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class MessageServie{
    
    static let instance = MessageServie()
    var channels = [Channel]()
    
    func findAllChannel(completion: @escaping CompletionHandler){
        Alamofire.request("URL_GET_CHANNEL", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil{
                guard let data = response.data else {return}
                if let json = JSON(data: data).array {
                    for item in json{
                        let name = item["name"].stringValue
                        let channelDescription = item["description"].stringValue
                        let id = item["id"].stringValue
                        let channel = Channel(channelTitle: name ,channelDesc: channelDescription, id: id)
                        self.channels.append(channel)
                    }
                    print(self.channels[0].channelTitle)
                    completion(true)
                }
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
