//
//  Options.swift
//  Define
//
//  Created by WendellXY on 2024/5/13
//  Copyright © 2024 WendellXY. All rights reserved.
//

public struct CodableKeyMacro {
  public struct Options: OptionSet {
    public let rawValue: Int32

    public init(rawValue: Int32) {
      self.rawValue = rawValue
    }

    /// The key will be ignored when encoding and decoding.
    public static let ignored = Self(rawValue: 1 << 0)
    /// The key will be explicitly set to `nil` (`null`) when encoding and decoding.
    /// By default, the key will be omitted if the value is `nil`.
    public static let explicitNil = Self(rawValue: 1 << 1)
    /// The default options for a `CodableKey`.
    public static let `default`: Self = []
  }
}
