//
//  Typealiases.swift
//  Tafseer
//
//  Created by Mohamed Eldewaik on 19/02/2021.
//

import Foundation

//public typealias EmptyCompletion = () -> Void
public typealias CompletionObject<T> = (_ response: T) -> Void
//public typealias CompletionOptionalObject<T> = (_ response: T?) -> Void
//public typealias CompletionResponse = (_ response: Result<Void, Error>) -> Void
