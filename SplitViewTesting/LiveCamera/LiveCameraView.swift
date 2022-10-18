//
//  LiveCameraView.swift
//  CameraView
//
//  Created by Agus Hery on 13/10/22.
//

import SwiftUI

struct LiveCameraView: View {
    var image: CGImage?
    private let label = Text("frame")
    var body: some View {
        if let image = image {
            HStack {
                Image(image, scale: 1.0, orientation: .leftMirrored, label: label)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height)
                    .aspectRatio(contentMode: .fit)
                Text("Live Camera")
            }
            .ignoresSafeArea(.all)
        } else {
            Text("Error Live Camera View")
        }
    }
}

struct LiveCameraView_Previews: PreviewProvider {
    static var previews: some View {
        LiveCameraView()
    }
}
