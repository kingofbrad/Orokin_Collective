//
//  URLExtenstion.swift
//  Orokin Collective
//
//  Created by Bradlee King on 12/03/2024.
//

import Foundation

extension URL {
    static func arbitrationURL() -> URL? {
        guard let url = URL(string: "https://api.warframestat.us/pc/arbitration") else {
           return nil
        }
        return url
    }
    static func weaponsURL() -> URL? {
        guard let url = URL(string: "") else {
            return nil
        }
        return url
    }
}
