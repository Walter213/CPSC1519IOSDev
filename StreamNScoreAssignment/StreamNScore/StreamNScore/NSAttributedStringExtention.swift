//
//  NSAttributedStringExtention.swift
//  StreamNScore
//
//  Created by Pajo Teljega on 2020-02-19.
//  Copyright © 2020 Walter Teljega. All rights reserved.
//

import Foundation

extension NSAttributedString
{
    static func makeClickableLink(for path: String, in string: String, as substring: String) -> NSAttributedString
    {
        let nsString = NSString(string: string)
        let substringRange = nsString.range(of: substring)
        let attributedString = NSMutableAttributedString(string:string)
        attributedString.addAttribute(.link, value: path, range: substringRange)
        return attributedString
    }
}
