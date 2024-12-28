//
//  SettingsView.swift
//  Hike
//
//  Created by Ayanesh Sarkar on 28/12/24.
//

import SwiftUI

struct SettingsView: View {
  // Properties
  private let alternateAppIcons: [String] = [
    "AppIcon-MagnifyingGlass",
    "AppIcon-Map",
    "AppIcon-Mushroom",
    "AppIcon-Camera",
    "AppIcon-Backpack",
    "AppIcon-Campfire"
  ]
  
  var body: some View {
    List {
      // Header
      Section {
        VStack {
          HStack {
            Spacer()
            
            Image(systemName: "laurel.leading")
              .font(.system(size: 80, weight: .black))
            
            VStack(spacing: -10) {
              Text("Hike")
                .font(.system(size: 66, weight: .black))
              
              Text("Editors' Choice")
                .fontWeight(.medium)
            }
            
            Image(systemName: "laurel.trailing")
              .font(.system(size: 80, weight: .black))
            
            Spacer()
          }
          .foregroundStyle(
            LinearGradient(
              colors: [
                .customGreenLight,
                .customGreenMedium,
                .customGreenDark
              ],
              startPoint: .top,
              endPoint: .bottom
            )
          )
          .padding(.top, 8)
          
          VStack(spacing: 8) {
            Text("Where can you find \nperfect tracks?")
              .font(.title2)
              .fontWeight(.heavy)
            
            Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app.")
              .font(.footnote)
              .italic()
            
            Text("Dust off the boots! It's time for a walk.")
              .fontWeight(.heavy)
              .foregroundStyle(Color.customGreenMedium)
          }
          .multilineTextAlignment(.center)
          .padding(.bottom, 16)
          .frame(maxWidth: .infinity)
        }
      } // Header
      .listRowSeparator(.hidden)
      
      // Icons
      Section(header: Text("Alternate Icons")) {
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(spacing: 12) {
            ForEach(alternateAppIcons.indices, id: \.self) { item in
              Button {
                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) {
                  error in
                  if error != nil {
                    print("Failed request to update the app's icon: \(String(describing: error?.localizedDescription))")
                  } else {
                    
                  }
                }
              } label: {
                Image("\(alternateAppIcons[item])-Preview")
                  .resizable()
                  .scaledToFit()
                
                  .frame(width: 80, height: 80)
                  .cornerRadius(16)
              }
              .buttonStyle(.borderless)
            }
          }
        } // Scroll view
        .padding(.top, 12)
        
        Text("Choose your favourite app icon from the collection above.")
          .frame(minWidth: 0, maxWidth: .infinity)
          .multilineTextAlignment(.center)
          .foregroundStyle(.secondary)
          .font(.footnote)
          .padding(.bottom, 12)
      } // Section
      .listRowSeparator(.hidden)
      
      // About
      Section(
        header: Text("ABOUT THE APP"),
        footer: HStack {
          Spacer()
          Text("Copyright © All right reserved.")
          Spacer()
        }
          .padding(.vertical, 8)
      ) {
        // Basic labled content
        // LabeledContent("Application", value: "Hike")
        
        // Advanced labeled content
        CustomListRowView(
          rowLabel: "Application",
          rowIcon: "apps.iphone",
          rowContent: "HIKE",
          rowTintColor: .blue
        )
        
        CustomListRowView(
          rowLabel: "Compatibility",
          rowIcon: "info.circle",
          rowContent: "iOS, iPadOS",
          rowTintColor: .red
        )
        
        CustomListRowView(
          rowLabel: "Technology",
          rowIcon: "swift",
          rowContent: "Swift",
          rowTintColor: .orange
        )
        
        CustomListRowView(
          rowLabel: "Version",
          rowIcon: "gear",
          rowContent: "1.0",
          rowTintColor: .purple
        )
        
        CustomListRowView(
          rowLabel: "Developer",
          rowIcon: "ellipsis.curlybraces",
          rowContent: "Ayanesh Sarkar",
          rowTintColor: .mint
        )
        
        CustomListRowView(
          rowLabel: "Designer",
          rowIcon: "paintpalette",
          rowContent: "Ayonika Sarkar II",
          rowTintColor: .pink
        )
        
        CustomListRowView(
          rowLabel: "Website",
          rowIcon: "globe",
          rowTintColor: .indigo,
          rowLinkLabel: "Nomadrism",
          rowLinkDestination: "https://nomadrism.com"
        )
      }
    }
  }
}

//#Preview {
//    SettingsView()
//}
