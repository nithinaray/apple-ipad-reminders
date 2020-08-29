//
//  RemindersView.swift
//  Reminders
//
//  Created by Shreenithi Narayanan on 8/29/20.
//

import SwiftUI

struct RemindersView: View {

    // Content
    @State private var tasks = [TaskWrapper(task: "Take out the trash"), TaskWrapper(task: "Walk the 🐶"), TaskWrapper(task: "Finish SwiftUI project")]
    @State var selection: Set<UUID> = []

    // Fonts
    private let remindersTitleFont: Font = Font.system(size: 33.0, weight: .bold, design: .rounded)
    private let newReminderFont: Font = Font.system(size: 17.0, weight: .semibold, design: .rounded)
    private let iconFont: Font = Font.system(size: 22.0, weight: .bold, design: .default)

    // Images
    private let moreOptionsIcon: Image = Image(systemName: "ellipses.circle")
    private let newReminderIcon: Image = Image(systemName: "plus.circle.fill")

    // Strings
    private let newReminderTitle: String = "New Reminder"

    var body: some View {
        VStack(alignment: .leading) {

            HStack {
                Spacer()
                moreOptionsIcon
                    .foregroundColor(primaryColor)
                    .font(iconFont)
            }

            Text(remindersTitle)
                .font(remindersTitleFont)
                .foregroundColor(primaryColor)
                .padding(.leading, mediumPadding)

            List(selection: $selection) {
                ForEach(tasks, id: \.self) { task in
                    task
                }
                .onMove { _, _ in }
            }
            .padding(.top, -1 * standardPadding)
            .padding(.leading, -1 * mediumPadding)

            Spacer()

            HStack {
                newReminderIcon
                    .foregroundColor(primaryColor)
                    .font(iconFont)
                Text(newReminderTitle)
                    .foregroundColor(primaryColor)
                    .font(newReminderFont)
                    .padding(.leading, smallPadding)
                Spacer()
            }
            .padding(.leading, mediumPadding)
        }
        .padding()
    }
}

struct TaskWrapper: View, Hashable {

    // Content
    let task: String

    var body: some View {
        Task(task: task)
            .padding(.vertical, mediumPadding)
    }
}

struct Task: View {

    // Colors
    private let uncheckedBorderColor: Color = Color(#colorLiteral(red: 0.7607403398, green: 0.7608150244, blue: 0.7692946792, alpha: 1))

    // Content
    let task: String
    @State var checked: Bool = false

    // Dimensions
    private let checkboxWidth: CGFloat = 1.25
    private let checkboxCheckedDimension: CGFloat = 15.0
    private let checkboxDimension: CGFloat = 22.0

    // Fonts
    private let taskTitleFont: Font = Font.system(size: 16.0, weight: .regular, design: .rounded)

    var body: some View {
        HStack() {
            Circle()
                .strokeBorder(self.checked ? primaryColor: uncheckedBorderColor, lineWidth: checkboxWidth)
                .background(Circle()
                                .foregroundColor(self.checked ? primaryColor: .white)
                                .frame(width: checkboxCheckedDimension, height: checkboxCheckedDimension))
                .frame(width: checkboxDimension, height: checkboxDimension)
                .onTapGesture {
                    self.checked.toggle()
                }
            VStack(alignment: .leading) {
                Text(task)
                    .font(taskTitleFont)
                    .foregroundColor(self.checked ? darkGrayColor : .black)
            }
        }
    }
}
