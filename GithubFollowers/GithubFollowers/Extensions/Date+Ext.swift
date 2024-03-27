//
//  Date+Ext.swift
//  GithubFollowers
//
//  Created by Daehoon Lee on 2024/03/27.
//

import Foundation

extension Date {
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        
        return dateFormatter.string(from: self)
    }
}
