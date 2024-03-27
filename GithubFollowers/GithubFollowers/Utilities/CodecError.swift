//
//  CodecError.swift
//  GithubFollowers
//
//  Created by Daehoon Lee on 2024/03/27.
//

import Foundation

enum CodecError: String, Error {
    case unableToFavorite   = "There was an error favoriting this user. Please try again."
    case alreadyInFavorites = "You've already favorited this user. You must REALLY like them!"
}
