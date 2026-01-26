//
//  Typealiases.swift
//  RenderProtocolSwift
//
//  Created by Arindam Karmakar on 21/01/26.
//

import Foundation
import RPGeneratedSwift
import GRPCNIOTransportHTTP2

public typealias RPPortable = Codable & Hashable & Equatable & Identifiable & Sendable

public typealias RPPortableEnum = RPPortable & CaseIterable

internal typealias RPClient = RPRenderService.Client<HTTP2ClientTransport.TransportServices>
