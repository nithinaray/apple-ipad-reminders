//
//  RemindersAppView.swift
//  Reminders
//
//  Created by Nithi on 8/26/20.
//

import SwiftUI

// Colors
let primaryColor: Color = Color(#colorLiteral(red: 0.007762347814, green: 0.4766914248, blue: 0.9985215068, alpha: 1))
let secondaryColor: Color = Color(#colorLiteral(red: 0.5254971385, green: 0.5254892707, blue: 0.5469090343, alpha: 1))
let darkGrayColor: Color = Color(#colorLiteral(red: 0.3553363681, green: 0.3852283359, blue: 0.4146982133, alpha: 1))
let lightGrayColor: Color = Color(#colorLiteral(red: 0.890173614, green: 0.89021492, blue: 0.9115887284, alpha: 1))

// Dimensions
let cornerRadiusValue: CGFloat = 12.0
let iconCircleDimension: CGFloat = 32.0

// Padding
let smallPadding: CGFloat = 4.0
let mediumPadding: CGFloat = 8.0
let largePadding: CGFloat = 12.0
let standardPadding: CGFloat = 16.0

// Strings
let remindersTitle: String = "Reminders"

struct RemindersAppView: View {

    // Dimensions
    private let separatorWidth: CGFloat = 0.5

    var body: some View {
        HStack {
            SidebarView()

            Rectangle().frame(width: separatorWidth)
                .padding(.all, -1 * mediumPadding)
                .edgesIgnoringSafeArea(.top)
                .foregroundColor(lightGrayColor)

            RemindersView()
            Spacer()
        }
    }
}

struct RemindersAppView_Previews: PreviewProvider {
    static var previews: some View {
        RemindersAppView()
    }
}
