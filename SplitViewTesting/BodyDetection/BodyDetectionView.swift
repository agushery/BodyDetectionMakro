//
//  BodyDetectionView.swift
//  CameraView
//
//  Created by Agus Hery on 14/10/22.
//

import SwiftUI

struct BodyDetectionView: View {
    @ObservedObject var poseEstimator: LiveCameraViewModel
    var size: CGSize
    var body: some View {
        if poseEstimator.bodyParts.isEmpty == false {
            ZStack {
                // Right leg
                ShapeView(points: [poseEstimator.bodyParts[.rightAnkle]!.location, poseEstimator.bodyParts[.rightKnee]!.location, poseEstimator.bodyParts[.rightHip]!.location,
                               poseEstimator.bodyParts[.root]!.location], size: size)
                .stroke(lineWidth: 5.0)
                .fill(Color.blue)
                // Left leg
                ShapeView(points: [poseEstimator.bodyParts[.leftAnkle]!.location, poseEstimator.bodyParts[.leftKnee]!.location, poseEstimator.bodyParts[.leftHip]!.location,
                               poseEstimator.bodyParts[.root]!.location], size: size)
                .stroke(lineWidth: 5.0)
                .fill(Color.red)
                // Right arm
                ShapeView(points: [poseEstimator.bodyParts[.rightWrist]!.location, poseEstimator.bodyParts[.rightElbow]!.location, poseEstimator.bodyParts[.rightShoulder]!.location, poseEstimator.bodyParts[.neck]!.location], size: size)
                    .stroke(lineWidth: 5.0)
                    .fill(Color.orange)
                // Left arm
                ShapeView(points: [poseEstimator.bodyParts[.leftWrist]!.location, poseEstimator.bodyParts[.leftElbow]!.location, poseEstimator.bodyParts[.leftShoulder]!.location, poseEstimator.bodyParts[.neck]!.location], size: size)
                    .stroke(lineWidth: 5.0)
                    .fill(Color.orange)
                // Root to nose
                ShapeView(points: [poseEstimator.bodyParts[.root]!.location,
                               poseEstimator.bodyParts[.neck]!.location,  poseEstimator.bodyParts[.nose]!.location], size: size)
                .stroke(lineWidth: 5.0)
                .fill(Color.green)
            }
        }
        if poseEstimator.rightHand.isEmpty == false{
            ZStack{
                // Righthand
                ShapeView(points: [poseEstimator.rightHand[.thumbTip]!.location,
                               poseEstimator.rightHand[.thumbIP]!.location,
                               poseEstimator.rightHand[.thumbMP]!.location,
                               poseEstimator.rightHand[.thumbCMC]!.location,
                               poseEstimator.rightHand[.wrist]!.location
                              ], size: size)
                .stroke(lineWidth: 5.0)
                .fill(Color.red)
                ShapeView(points: [poseEstimator.rightHand[.indexTip]!.location,
                               poseEstimator.rightHand[.indexDIP]!.location,
                               poseEstimator.rightHand[.indexPIP]!.location,
                               poseEstimator.rightHand[.indexMCP]!.location,
                               poseEstimator.rightHand[.wrist]!.location
                              ], size: size)
                .stroke(lineWidth: 5.0)
                .fill(Color.black)
                ShapeView(points: [poseEstimator.rightHand[.middleTip]!.location,
                               poseEstimator.rightHand[.middleDIP]!.location,
                               poseEstimator.rightHand[.middlePIP]!.location,
                               poseEstimator.rightHand[.middleMCP]!.location,
                               poseEstimator.rightHand[.wrist]!.location
                              ], size: size)
                .stroke(lineWidth: 5.0)
                .fill(Color.white)
                ShapeView(points: [poseEstimator.rightHand[.ringTip]!.location,
                               poseEstimator.rightHand[.ringDIP]!.location,
                               poseEstimator.rightHand[.ringPIP]!.location,
                               poseEstimator.rightHand[.ringMCP]!.location,
                               poseEstimator.rightHand[.wrist]!.location
                              ], size: size)
                .stroke(lineWidth: 5.0)
                .fill(Color.blue)
                ShapeView(points: [poseEstimator.rightHand[.littleTip]!.location,
                               poseEstimator.rightHand[.littleDIP]!.location,
                               poseEstimator.rightHand[.littlePIP]!.location,
                               poseEstimator.rightHand[.littleMCP]!.location,
                               poseEstimator.rightHand[.wrist]!.location
                              ], size: size)
                .stroke(lineWidth: 5.0)
                .fill(Color.purple)
            }
            if poseEstimator.leftHand.isEmpty == false{
                ZStack{
                    // left
                    ShapeView(points: [poseEstimator.leftHand[.thumbTip]!.location,
                                   poseEstimator.leftHand[.thumbIP]!.location,
                                   poseEstimator.leftHand[.thumbMP]!.location,
                                   poseEstimator.leftHand[.thumbCMC]!.location,
                                   poseEstimator.leftHand[.wrist]!.location
                                  ], size: size)
                    .stroke(lineWidth: 5.0)
                    .fill(Color.red)
                    ShapeView(points: [poseEstimator.leftHand[.indexTip]!.location,
                                   poseEstimator.leftHand[.indexDIP]!.location,
                                   poseEstimator.leftHand[.indexPIP]!.location,
                                   poseEstimator.leftHand[.indexMCP]!.location,
                                   poseEstimator.leftHand[.wrist]!.location
                                  ], size: size)
                    .stroke(lineWidth: 5.0)
                    .fill(Color.black)
                    ShapeView(points: [poseEstimator.leftHand[.middleTip]!.location,
                                   poseEstimator.leftHand[.middleDIP]!.location,
                                   poseEstimator.leftHand[.middlePIP]!.location,
                                   poseEstimator.leftHand[.middleMCP]!.location,
                                   poseEstimator.leftHand[.wrist]!.location
                                  ], size: size)
                    .stroke(lineWidth: 5.0)
                    .fill(Color.white)
                    ShapeView(points: [poseEstimator.leftHand[.ringTip]!.location,
                                   poseEstimator.leftHand[.ringDIP]!.location,
                                   poseEstimator.leftHand[.ringPIP]!.location,
                                   poseEstimator.leftHand[.ringMCP]!.location,
                                   poseEstimator.leftHand[.wrist]!.location
                                  ], size: size)
                    .stroke(lineWidth: 5.0)
                    .fill(Color.blue)
                    ShapeView(points: [poseEstimator.leftHand[.littleTip]!.location,
                                   poseEstimator.leftHand[.littleDIP]!.location,
                                   poseEstimator.leftHand[.littlePIP]!.location,
                                   poseEstimator.leftHand[.littleMCP]!.location,
                                   poseEstimator.leftHand[.wrist]!.location
                                  ], size: size)
                    .stroke(lineWidth: 5.0)
                    .fill(Color.purple)
                }
            }
        }
    }
}

struct BodyDetectionView_Previews: PreviewProvider {
    static var previews: some View {
        BodyDetectionView(poseEstimator: LiveCameraViewModel(), size: CGSize(width: 100, height: 100))
    }
}
