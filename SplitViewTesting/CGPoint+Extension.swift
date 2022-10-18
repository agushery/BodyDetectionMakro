//
//  CGPoint+Extension.swift
//  CameraView
//
//  Created by Agus Hery on 14/10/22.
//

import Foundation
import UIKit

extension CGPoint {
    func distance(to point: CGPoint) -> CGFloat {
        return sqrt(pow(x - point.x, 2) + pow(y - point.y, 2))
    }
}
