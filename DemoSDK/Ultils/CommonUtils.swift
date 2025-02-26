//
//  CommonUtils.swift
//  DemoSDK
//
//  Created by ThienDD9 on 26/02/2025.
//

import Foundation

enum EnvironmentType: String {
    case Debug
    case Release
    case Staging
    
    var tilte: String {
        get {
            switch self {
            case .Debug:
                return "Home Debug"
            case .Release:
                return "Home"
            case .Staging:
                return "Home Staging"
            }
        }
    }
}

class CommonUtils: NSObject {
    static var share = CommonUtils()
    func getEnvironmentType() -> EnvironmentType {
        if let eType = EnvironmentType(rawValue: infoForKey("DEMO_APP_ENVIRONMENT")) {
            return eType
        }
        return .Debug
    }
    
    func infoForKey(_ key: String) -> String {
        return (Bundle.main.infoDictionary?[key] as? String)?
            .replacingOccurrences(of: "\\", with: "") ?? ""
    }
}
