//
//  NetworkError.swift
//  GithubFollowers
//
//  Created by Daehoon Lee on 2024/03/24.
//

import Foundation

enum NetworkError: String, Error {
    case invalidUsername    = "This username created an invalid request. Please try again."
    case unableToComplete   = "Unable to complete your request. Please check your internet connection."
    case invalidResponse    = "Invalid response from the server. Please try again."
    case invalidData        = "The data received from the server was invalid. Please try again."
}
