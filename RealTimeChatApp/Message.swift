//
//  Message.swift
//  RealTimeChatApp
//
//  Created by German Mendoza on 8/15/16.
//  Copyright © 2016 German LLC. All rights reserved.
//

import UIKit
import Firebase

class Message: NSObject {
    
    var fromId:String?
    var text:String?
    var toId:String?
    var timestamp:NSNumber?
    func chatPartnerId() -> String? {
        return fromId == FIRAuth.auth()?.currentUser?.uid ? toId : fromId
    }
}
