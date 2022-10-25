//
//  SettingModel.swift
//  SepiaPets
//
//  Created by Sushobhit Jain on 25/10/22.
//

import Foundation

// MARK: - Setting
struct SettingModel: Codable {
  let settings: Settings
}

// MARK: - Settings
struct Settings: Codable {
  let workHours: String
}

