//
//  EmojiModule.swift
//  EmojiModule
//
//  Created by Cordt Zermin on 11.02.21.
//

import FeatherCore

final class EmojiModule: ViperModule {

    static var name: String = "emoji"
    
    func boot(_ app: Application) throws {
        app.hooks.register("content-filters", use: contentFilterHook)
    }

    
    // MARK: - hooks
    func contentFilterHook(args: HookArguments) -> [ContentFilter] {
        [EmojiFilter()]
    }
}
