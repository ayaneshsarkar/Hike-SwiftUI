//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Ayanesh Sarkar on 28/12/24.
//

import SwiftUI

struct MotionAnimationView: View {
  // Properties
  @State private var randomCircle: Int = Int.random(in: 6...12)
  @State private var isAnimating: Bool = false
  
  // Functions
  // Random Coordinate
  func ramdomCoordinate() -> CGFloat {
    return CGFloat.random(in: 0...256)
  }
  
  // Random size
  func randomSize() -> CGFloat {
    return CGFloat(Int.random(in: 4...80))
  }
  
  // Random scale
  func randomScale() -> CGFloat {
    return CGFloat(Double.random(in: 0.1...2.0))
  }
  
  // Random speed
  func randomSpeed() -> Double {
    return Double.random(in: 0.05...1.0)
  }
  
  // Random delay
  func randomDelay() -> Double {
    return Double.random(in: 0...2)
  }
  
  var body: some View {
    ZStack {
      ForEach(0...randomCircle, id: \.self) { item in
        Circle()
          .foregroundStyle(.white)
          .opacity(0.25)
          .frame(width: randomSize())
          .position(
            x: ramdomCoordinate(),
            y: ramdomCoordinate()
          )
          .scaleEffect(isAnimating ? randomScale() : 1)
          .onAppear(perform: {
            withAnimation(
              .interpolatingSpring(stiffness: 0.25, damping: 0.25)
              .repeatForever()
              .speed(randomSpeed())
              .delay(randomDelay())
            ) {
              isAnimating = true
            }
          })
      }
    } // ZStack
    .frame(width: 256, height: 253)
    .mask(Circle())
    .drawingGroup()
  }
}

//#Preview {
//    MotionAnimationView()
//}
