//
//  Date+Ext.swift
//  GithubFollowers
//
//  Created by Daehoon Lee on 2024/03/27.
//

import Foundation

extension Date {
    func convertToMonthYearFormat() -> String {
        return formatted(.dateTime.locale(Locale(identifier: "en_US_POSIX")).month().year())
    }
}
