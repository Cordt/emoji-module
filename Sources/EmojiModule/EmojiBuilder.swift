//
//  EmojiBuilder.swift
//  EmojiModule
//
//  Created by Cordt Zermin on 11.02.21.
//

import FeatherCore

@_cdecl("createEmojiModule")
public func createEmojiModule() -> UnsafeMutableRawPointer {
    return Unmanaged.passRetained(EmojiBuilder()).toOpaque()
}

public final class EmojiBuilder: ViperBuilder {

    public override func build() -> ViperModule {
        EmojiModule()
    }
}
