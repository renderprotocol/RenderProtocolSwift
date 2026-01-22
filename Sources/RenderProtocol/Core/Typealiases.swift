//
//  Typealiases.swift
//  RenderProtocolSwift
//
//  Created by Arindam Karmakar on 21/01/26.
//

import Foundation

public typealias RPPortable = Codable & Hashable & Equatable & Identifiable & Sendable

public typealias RPPortableEnum = RPPortable & CaseIterable
