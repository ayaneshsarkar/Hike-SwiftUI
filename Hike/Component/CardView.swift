//
//  CardView.swift
//  Hike
//
//  Created by Ayanesh Sarkar on 22/12/24.
//

import SwiftUI

struct CardView: View {
  // Properties
  @State private var imageNumber: Int = 1
  @State private var randomNumber: Int = 1
  @State private var isShowingSheet: Bool = false
  
  // Functions
  func randomIkmage() {
    repeat {
      randomNumber = Int.random(in: 1...5)
    } while randomNumber == imageNumber
    
    imageNumber = randomNumber
  }
  
  var body: some View {
    // Card
    ZStack {
      CustomBackgroundView()
      
      VStack {
        // Header
        VStack(alignment: .leading) {
          HStack {
            Text("Hiking")
              .fontWeight(.black)
              .font(.system(size: 52))
              .foregroundStyle(
                LinearGradient(
                  colors: [.customGrayLight, .customGrayMedium],
                  startPoint: .top,
                  endPoint: .bottom
                )
              )
            
            Button {
              isShowingSheet.toggle()
            } label: {
              CustomButtonView()
            }
            .sheet(isPresented: $isShowingSheet) {
              SettingsView()
                .presentationDragIndicator(.visible)
                .presentationDetents([.medium, .large])
            }
          }
          
          Text("Fun and enjoyable outdoor activity for feidnds and families.")
            .multilineTextAlignment(.leading)
            .italic()
            .foregroundStyle(.colorGrayMedium)
        } // Header
          .padding(.horizontal, 30)
        
        // Main Content
        ZStack {
          CustomCircleView()
            
          Image("image-\(imageNumber)")
            .resizable()
            .scaledToFit()
            .animation(.default, value: imageNumber)
        }

        // Footer
        Button {
          // Generate a random number
          randomIkmage()
        } label: {
          Text("Explore")
            .font(.title2)
            .fontWeight(.heavy)
            .foregroundStyle(
              LinearGradient(
                colors: [.customGreenLight, .customGreenMedium],
                startPoint: .top,
                endPoint: .bottom
              )
            )
            .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
        }
        .buttonStyle(GradientButton())
      }
      
    } // Card
    .frame(width: 320, height: 570)
  }
}
