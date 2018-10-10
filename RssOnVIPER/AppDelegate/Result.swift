//
//  Result.swift
//  RssOnVIPER
//
//  Created by Ash on 10/9/18.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

import Foundation

enum Result<Value> {
    case success(Value)
    case failure(Error)

    var isSuccess: Bool {
        switch self {
        case .success:
            return true
        case .failure:
            return false
        }
    }

    var isFailure: Bool {
        return !isSuccess
    }

    var value: Value? {
        switch self {
        case .success(let value):
            return value
        case .failure:
            return nil
        }
    }

    var error: Error? {
        switch self {
        case .success:
            return nil
        case .failure(let error):
            return error
        }
    }
}

// MARK: - CustomStringConvertible

extension Result: CustomStringConvertible {
    var description: String {
        switch self {
        case .success:
            return "SUCCESS"
        case .failure:
            return "FAILURE"
        }
    }
}

// MARK: - CustomDebugStringConvertible

extension Result: CustomDebugStringConvertible {
    var debugDescription: String {
        switch self {
        case .success(let value):
            return "SUCCESS: \(value)"
        case .failure(let error):
            return "FAILURE: \(error)"
        }
    }
}

// MARK: - Functional APIs

extension Result {
    init(value: () throws -> Value) {
        do {
            self = try .success(value())
        } catch {
            self = .failure(error)
        }
    }

    func unwrap() throws -> Value {
        switch self {
        case .success(let value):
            return value
        case .failure(let error):
            throw error
        }
    }

    func map<T>(_ transform: (Value) -> T) -> Result<T> {
        switch self {
        case .success(let value):
            return .success(transform(value))
        case .failure(let error):
            return .failure(error)
        }
    }

    func flatMap<T>(_ transform: (Value) throws -> T) -> Result<T> {
        switch self {
        case .success(let value):
            do {
                return try .success(transform(value))
            } catch {
                return .failure(error)
            }
        case .failure(let error):
            return .failure(error)
        }
    }

    func mapError<T: Error>(_ transform: (Error) -> T) -> Result {
        switch self {
        case .failure(let error):
            return .failure(transform(error))
        case .success:
            return self
        }
    }

    func flatMapError<T: Error>(_ transform: (Error) throws -> T) -> Result {
        switch self {
        case .failure(let error):
            do {
                return try .failure(transform(error))
            } catch {
                return .failure(error)
            }
        case .success:
            return self
        }
    }

    @discardableResult
    func onSuccess(_ closure: (Value) -> Void) -> Result {
        if case let .success(value) = self { closure(value) }

        return self
    }

    @discardableResult
    func onFailure(_ closure: (Error) -> Void) -> Result {
        if case let .failure(error) = self { closure(error) }

        return self
    }
}
