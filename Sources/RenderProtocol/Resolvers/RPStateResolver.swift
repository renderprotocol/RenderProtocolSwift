//
//  RPStateResolver.swift
//  RenderProtocolSwift
//
//  Created by Arindam Karmakar on 20/02/26.
//

import Foundation

public protocol RPStateResolver {
    associatedtype Value: Hashable & Sendable
}
