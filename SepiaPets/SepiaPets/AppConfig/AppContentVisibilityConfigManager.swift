//
//  ContentVisibilityManager.swift
//  SepiaPets
//
//  Created by Sushobhit Jain on 25/10/22.
//

import Foundation

protocol ContentVisibilityConfigManagerProtocol {
  func getConfigModel() -> ConfigVisibiltyProtocol?
  func isAppAllowAccess() -> Bool
}

struct AppContentVisibilityConfigManager: ContentVisibilityConfigManagerProtocol {
  let settings: Settings
  let formatter: DateFormatter
  init(configSetting: Settings, formatter: DateFormatter) {
    self.settings = configSetting
    self.formatter = formatter
  }

  func getConfigModel() -> ConfigVisibiltyProtocol? {
    let component = settings.workHours.components(separatedBy: " ")
    if component.isEmpty {
      return nil
    }
    guard let days = component.first else { return nil }
    guard let startDay = days.first else { return nil }
    guard let endDay = days.last else { return nil }
    let startTime = component[component.index(component.startIndex, offsetBy: 1)]
    guard let endTime = component.last else { return nil}
    print(startTime)
    print(endTime)

    let startDayNumber = WeekDay.init(rawValue: "\(startDay)")?.getNumber() ?? 0
    let endDayNumber = WeekDay.init(rawValue: "\(endDay)")?.getNumber() ?? 0
    return ConfigVisibiltyModel(startDay: startDayNumber, endDay: endDayNumber, startTime: startTime, endTime: endTime)
  }

  func isAppAllowAccess() -> Bool {
    guard let config = getConfigModel() else {
      return false
    }
    let currentTime = formatter.string(from: Date())
    let todayDay = Date().dayNumberOfWeek()!
    if config.startDay <= todayDay && config.endDay >= todayDay && formatter.date(from: config.startTime)! <= formatter.date(from:currentTime)! && formatter.date(from: config.endTime)! >= formatter.date(from:currentTime)! {
      return true
    } else {
      return false
    }
  }

}
protocol ConfigVisibiltyProtocol {
  var startDay: Int { get }
  var endDay: Int { get }
  var startTime: String { get }
  var endTime: String { get }
}

struct ConfigVisibiltyModel: ConfigVisibiltyProtocol {
  let startDay: Int
  let endDay: Int
  let startTime: String
  let endTime: String
}

enum WeekDay: String {
  case U
  case M
  case T
  case W
  case R
  case F
  case S

  func getNumber() -> Int {
    switch self {
    case .U:
      return 1
    case .M:
      return 2
    case .T:
      return 3
    case .W:
      return 4
    case .R:
      return 5
    case .F:
      return 6
    case .S:
      return 7
    }
  }
}
