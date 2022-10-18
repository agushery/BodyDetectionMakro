//
//  ContentView.swift
//  SplitViewTesting
//
//  Created by Agus Hery on 17/10/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = LiveCameraViewModel()
    var body: some View {
                    HStack {
                        ZStack {
                            LiveCameraView(image: vm.frame)
                            GeometryReader { geo in
                                BodyDetectionView(poseEstimator: vm, size: geo.size)
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width / 2)
                        AVVideoPlayerController(videoURL: URL(string: "https://cvws.icloud-content.com/B/ATACyeNInfTAxqkpHw2rCw6-5vP1Aa4cOBTRBiAq4XH1wNNw2ii-gN8k/CEBON.mov?o=ArRnuy1YEv36DKmBQLG8oQNUf6RUNuV31pbK-hkL1yXD&v=1&x=3&a=CAogXiJJ_PzRGAUUkJvDitaMPr2mazq5iHh_Zqnn62lPSgwSbxCxorHGvjAYsf-MyL4wIgEAUgS-5vP1WgS-gN8kaifKkEzojw9ExFDI2z6I4CHNnBVD_SE0jJDNGqm9gfZ_hVwZawH0kbpyJ5VYDOIMTnIXd-eJD0-l9_Oi6XeZhjhE4TM9R2qOwpyjTZYWDRWCRQ&e=1666061647&fl=&r=e1647419-9db9-4f25-9534-eb13fc29c5e6-1&k=0QYy-pyVdtgXY7Uzbl8JJQ&ckc=com.apple.clouddocs&ckz=com.apple.CloudDocs&p=58&s=e9Dbec1S_ql6f15upoe33n1dW0c&cd=i"))
                            .frame(width: UIScreen.main.bounds.width / 2).background {
                                Color.black
                            }.ignoresSafeArea(.all)
                    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
