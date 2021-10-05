//
//  Extension.swift
//  GOT
//
//  Created by Damien Serin on 04/10/2021.
//

import Foundation
import UIKit

extension String {

    init?(htmlEncodedString: String) {

        guard let data = htmlEncodedString.data(using: .utf8) else {
            return nil
        }

        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]

        guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
            return nil
        }

        self.init(attributedString.string)

    }

}

extension NSMutableAttributedString {

    @discardableResult func appendWith(color: UIColor = UIColor.darkText, weight: UIFont.Weight = .regular, ofSize: CGFloat = 12.0, _ text: String) -> NSMutableAttributedString{
        let attrText = NSAttributedString.makeWith(color: color, weight: weight, ofSize:ofSize, text)
        self.append(attrText)
        return self
    }

}
extension NSAttributedString {

    public static func makeWith(color: UIColor = UIColor.darkText, weight: UIFont.Weight = .regular, ofSize: CGFloat = 12.0, _ text: String) -> NSMutableAttributedString {

        let attrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: ofSize, weight: weight), NSAttributedString.Key.foregroundColor: color]
        return NSMutableAttributedString(string: text, attributes:attrs)
    }
}
