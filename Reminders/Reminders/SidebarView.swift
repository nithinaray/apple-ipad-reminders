//
//  SidebarView.swift
//  Reminders
//
//  Created by Shreenithi Narayanan on 8/29/20.
//

import SwiftUI

struct SidebarView: View {

    // Colors
    private let scheduledColor: Color = Color(#colorLiteral(red: 0.9995418191, green: 0.2292047143, blue: 0.1865143478, alpha: 1))
    private let sidebarBackgroundColor: Color = Color(#colorLiteral(red: 0.948992312, green: 0.9490415454, blue: 0.9704069495, alpha: 1))

    // Dimensions
    private let sidebarWidth: CGFloat = 332.0
    private let searchBarWidth: CGFloat = 300.0
    private let searchBarHeight: CGFloat = 32.0

    // Fonts
    private let myListsFont: Font = Font.system(size: 24.0, weight: .bold, design: .rounded)

    // Images
    private let searchBarIcon: Image = Image(systemName: "magnifyingglass")
    private let todayScheduledIcon: Image = Image(systemName: "calendar")
    private let allIcon: Image = Image(systemName: "tray.fill")

    // Spacing
    private let searchPadding: CGFloat = 35.0
    private let myListsPadding: CGFloat = 32.0

    // Strings
    private let editButtonTitle: String = "Edit"
    private let searchBarLabel: String = "Search"
    private let todayScheduledCount: String = "0"
    private let todayTitle: String = "Today"
    private let scheduledTitle: String = "Scheduled"
    private let allRemindersCount: String = "3"
    private let allTitle: String = "All"
    private let myListsTitle: String = "My Lists"
    private let addListButtonTitle: String = "Add List"

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Button(action: {}) {
                    Text(editButtonTitle)
                }
                .padding(.trailing)
                .padding(.top)
                .padding(.bottom, smallPadding)
            }
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadiusValue, style: .continuous)
                    .frame(width: searchBarWidth, height: searchBarHeight)
                    .foregroundColor(lightGrayColor)
                HStack {
                    searchBarIcon
                    Text(searchBarLabel)
                    Spacer()
                }
                .foregroundColor(secondaryColor)
                .padding(.leading, searchPadding)
            }
            .padding(.bottom, mediumPadding)

            HStack {
                MiniView(title: todayTitle, count: todayScheduledCount, color: primaryColor, icon: todayScheduledIcon)
                    .padding(.top)
                    .padding(.leading)
                    .padding(.trailing, smallPadding)
                MiniView(title: scheduledTitle, count: todayScheduledCount, color: scheduledColor, icon: todayScheduledIcon)
                    .padding(.top)
                    .padding(.trailing)
                    .padding(.leading, smallPadding)
            }

            MiniView(title: allTitle, count: allRemindersCount, color: darkGrayColor, icon: allIcon)
                .padding(.horizontal)
                .padding(.top, mediumPadding)

            Text(myListsTitle)
                .font(myListsFont)
                .padding(.leading, myListsPadding)

            InlineView()
                .padding(.horizontal)
                .padding(.top, -1.0 * mediumPadding)

            Spacer()

            HStack {
                Spacer()
                Button(action: {}) {
                    Text(addListButtonTitle)
                        .padding(.vertical)
                        .padding(.horizontal)
                }
            }
        }
        .frame(width: sidebarWidth)
        .background(sidebarBackgroundColor.edgesIgnoringSafeArea(.top))
    }
}

struct MiniView: View {

    // Content
    let title: String
    let count: String
    let color: Color
    let icon: Image

    // Dimensions
    private let viewHeight: CGFloat = 85.0

    // Fonts
    private let countFont: Font = Font.system(size: 28.0, weight: .bold, design: .rounded)
    private let titleFont: Font = Font.system(size: 17.0, weight: .semibold, design: .rounded)

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadiusValue, style: .continuous)
                .foregroundColor(.white)
                .frame(height: viewHeight)

            VStack(alignment: .leading) {
                HStack {
                    ZStack {
                        Circle()
                            .frame(width: iconCircleDimension, height: iconCircleDimension)
                            .foregroundColor(color)
                        icon
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Text(count)
                        .font(countFont)
                }
                Text(title)
                    .font(titleFont)
                    .foregroundColor(secondaryColor)
                    .padding(.top, smallPadding)
            }
            .padding(.all, largePadding)
            .frame(height: viewHeight)
        }
    }
}

struct InlineView: View {

    // Dimensions
    private let viewHeight: CGFloat = 55.0

    // Fonts
    private let textFont: Font = Font.system(size: 17.0, weight: .regular, design: .default)

    // Images
    private let remindersIcon: Image = Image(systemName: "list.bullet")

    // Strings
    private let remindersCount: String = "3"

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadiusValue, style: .continuous)
                .foregroundColor(.white)
                .frame(height: viewHeight)
            HStack {
                ZStack {
                    Circle()
                        .frame(width: iconCircleDimension, height: iconCircleDimension)
                        .foregroundColor(primaryColor)
                    remindersIcon
                        .foregroundColor(.white)
                }
                Text(remindersTitle)
                    .font(textFont)
                    .padding(.leading, smallPadding)
                Spacer()
                Text(remindersCount)
                    .font(textFont)
                    .foregroundColor(secondaryColor)
            }
            .padding(.all, largePadding)
        }
    }
}
