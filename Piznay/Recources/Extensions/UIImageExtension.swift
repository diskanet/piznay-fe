//
//  UIImageExtension.swift
//  Piznay
//
//  Created by Dima Kahanets on 24.11.2023.
//

import UIKit

extension UIImage {
    func cropImage(toRect cropRect: CGRect, viewWidth: CGFloat, viewHeight: CGFloat) -> UIImage?
    {
        let imageViewScale = max(self.size.width / viewWidth,
                                 self.size.height / viewHeight)


        // Scale cropRect to handle images larger than shown-on-screen size
        let cropZone = CGRect(x:cropRect.origin.x * imageViewScale,
                              y:cropRect.origin.y * imageViewScale,
                              width:cropRect.size.width * imageViewScale,
                              height:cropRect.size.height * imageViewScale)


        // Perform cropping in Core Graphics
        guard let cutImageRef: CGImage = self.cgImage?.cropping(to:cropZone)
        else {
            return nil
        }


        // Return image to UIImage
        let croppedImage: UIImage = UIImage(cgImage: cutImageRef)
        return croppedImage
    }
}
