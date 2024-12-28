//
//  CustomListRowView.swift
//  Hike
//
//  Created by Ayanesh Sarkar on 28/12/24.
//

import SwiftUI

struct CustomListRowView: View {
  // Properties
  @State var rowLabel: String
  @State var rowIcon: String
  @State var rowContent: String? = nil
  @State var rowTintColor: Color
  @State var rowLinkLabel: String? = nil
  @State var rowLinkDestination: String? = nil
  
  var body: some View {
    LabeledContent {
      if rowContent != nil {
        Text(rowContent!)
          .foregroundStyle(.primary)
          .fontWeight(.heavy)
      } else if (
        rowLinkLabel != nil && rowLinkDestination != nil
      ) {
        Link(rowLinkLabel!, destination: URL(string: rowLinkDestination!)!)
          .foregroundStyle(.pink)
          .fontWeight(.heavy)
      } else {
        EmptyView()
      }
    } label: {
      HStack {
        ZStack {
          RoundedRectangle(cornerRadius: 8)
            .frame(width: 30, height: 30)
            .foregroundColor(rowTintColor)
          Image(systemName: rowIcon)
            .foregroundColor(.white)
            .fontWeight(.semibold)
        }
        Text(rowLabel)
      }
    }
  }
}

//#Preview {
//    CustomListRowView()
//}
