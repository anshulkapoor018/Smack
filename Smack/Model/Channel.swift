//
//  Channel.swift
//  Smack
//
//  Created by Anshul Kapoor on 16/10/17.
//  Copyright © 2017 Anshul Kapoor. All rights reserved.
//

import Foundation

struct Channel : Decodable {
    public private(set) var channelTitle: String!
    public private(set) var channelDescription: String!
    public private(set) var id: String!
}
