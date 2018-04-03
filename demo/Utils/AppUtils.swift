//
//  AppUtils.swift
//  demo
//
//  Created by Bassem Qoulta on 4/3/18.
//  Copyright © 2018 Bassem Qoulta. All rights reserved.
//

import Localize_Swift

class AppUtils {
    public static func localizedString(forKey key: String) -> String {
        Localize.setCurrentLanguage("en")
        let resutl = key.localized(using: "Localization", in: .main)
        return resutl;
    }
}
