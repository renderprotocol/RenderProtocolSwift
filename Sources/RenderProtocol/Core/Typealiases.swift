//
//  Typealiases.swift
//  RenderProtocolSwift
//
//  Created by Arindam Karmakar on 21/01/26.
//

import Foundation
import GRPCCore
import RPGeneratedSwift
import GRPCNIOTransportHTTP2

internal typealias RPClient = GRPCClient<HTTP2ClientTransport.TransportServices>

internal typealias RPRenderServiceClient = RPRenderService.Client<HTTP2ClientTransport.TransportServices>
