//
//  CustomButtonView.swift
//  Hike
//
//  Created by Ayanesh Sarkar on 22/12/24.
//

import SwiftUI

struct CustomButtonView: View {
  var body: some View {
    ZStack {
      Circle()
        .fill(
          LinearGradient(
            colors: [.white, .colorGreenLight, .colorGreenMedium],
            startPoint: .top,
            endPoint: .bottom
          )
        )
        
      Circle()
        .stroke(
          LinearGradient(
            colors: [
              .customGrayLight,
              .customGrayMedium
            ],
            startPoint: .top,
            endPoint: .bottom
          )
        )
      
      Image(systemName: "figure.hiking")
        .fontWeight(.black)
        .font(.system(size: 30))
        .foregroundStyle(
          LinearGradient(
            colors: [.customGrayLight, .customGrayMedium],
            startPoint: .top,
            endPoint: .bottom
          )
        )
    }
    .frame(width: 58, height: 58)
  }
}

#Preview {
    CustomButtonView()
}
