//
//  UtilOthers.swift
//  pitch-perfect
//
//  Created by Amadeu Andrade on 04/06/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import Foundation

class UtilOthers {
    
    func getDocumentsDirectory() -> NSURL {
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)[0] as String
        let recordingName = "recordedVoice.m4a"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        return filePath!
    }
    
}
