//
//  Share+Extension.swift
//  Utilities
//
//  Created by Gizem Duman on 21.03.2023.
//

import UIKit

public extension UIViewController {
    
    func presentShare(url: URL?) {
        guard let url = url  else { return }
        let shareVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        self.present(shareVC, animated: true, completion: nil)
    }
}
