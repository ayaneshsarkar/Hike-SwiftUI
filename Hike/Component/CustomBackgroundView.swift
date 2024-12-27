//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by Ayanesh Sarkar on 22/12/24.
//

import SwiftUI

struct CustomBackgroundView: View {
  var body: some View {
    ZStack {
      // 3. DEPTH
      Color.colorGreenDark
        .cornerRadius(40)
        .offset(y: 12)
      
      // 2. LIGHT
      Color.colorGreenLight
        .cornerRadius(40)
        .offset(y: 3)
        .opacity(0.85)
      
      // 1. SURFACE
      LinearGradient(
        colors: [
          Color.colorGreenLight,
          Color.colorGreenMedium
        ],
        startPoint: .top,
        endPoint: .bottom
      )
      .cornerRadius(40)
    }
  }
}
