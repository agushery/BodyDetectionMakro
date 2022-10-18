//
//  BodyCalibrationView.swift
//  SplitViewTesting
//
//  Created by Agus Hery on 17/10/22.
//

import SwiftUI

struct BodyCalibrationView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.5).ignoresSafeArea(.all)
            Color.white
                .frame(width: 100, height: 100)
        }
    }
}

struct BodyCalibrationView_Previews: PreviewProvider {
    static var previews: some View {
        BodyCalibrationView()
    }
}
