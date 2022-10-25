//
//  Date+Extension.swift
//  SepiaPets
//
//  Created by Sushobhit Jain on 25/10/22.
//

import Foundation

extension Date {
  // returns an integer from 1 - 7, with 1 being Sunday and 7 being Saturday
  func dayNumberOfWeek() -> Int? {
    return Calendar.current.dateComponents([.weekday], from: self).weekday
  }
}
