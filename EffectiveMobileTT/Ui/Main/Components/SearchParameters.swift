//
//  SearchParameters.swift
//  EffectiveMobileTT
//
//  Created by Nikolay Bocharnikov on 04.06.2024.
//

import SwiftUI

struct SearchParameters: View {
    @Binding var depDate: Date
    @Binding var returnDate: Date
    @State var returnDateTitle: Text?
    
    var body: some View {
        HStack {
            ScrollView(.horizontal) {
                HStack {
                    ZStack {
                        if returnDateTitle != nil {
                            chip(title: Text(formatedDate(date: returnDate)))
                        } else {
                            chip(title: Text("обратно"), icon: "ic_plus", iconColor: Color.grey7)
                        }
                    }
                    .onChange(of: returnDate) { date in
                        if date < depDate {
                            returnDate = depDate
                        } else {
                            returnDateTitle = Text(formatedDate(date: returnDate))
                        }
                    }
                    .padding(.leading, 16)
                    .overlay {
                        DatePicker(
                            "",
                            selection: $returnDate,
                            in: Date()...depDate.addingTimeInterval(60*60*24*365),
                            displayedComponents: [.date]
                        )
                        .blendMode(.destinationOver)
                    }
                    
                    chip(
                        title: Text(formatedDate(date: depDate))
                    )
                    .overlay {
                        DatePicker(
                            "Выберите дату",
                            selection: $depDate,
                            in: Date()...depDate.addingTimeInterval(60*60*24*365),
                            displayedComponents: .date
                        )
                        .onChange(of: depDate, perform: { value in
                            if value < returnDate {
                                returnDate = value
                            }
                            print(depDate)
                            print(depDate.formatted(.iso8601.year().month().day()))
                        })
                        .blendMode(.destinationOver)
                    }
                    
                    
                    chip(title: Text("1,эконом"), icon: "ic_profile")
                    chip(title: Text("фильтры"), icon: "ic_filter")
                }
            }
            .scrollIndicators(.hidden)
        }
        .frame(maxWidth: .infinity)
    }
    
    private func chip(title: Text, icon: String? = nil, iconColor: Color? = nil, onClick: (() -> Void)? = nil) -> some View {
        Button(action: {
            if let onClick = onClick {
                onClick()
            }
        }) {
            HStack(spacing: 0) {
                if let icon = icon {
                    Image(icon)
                        .renderingMode(.template)
                        .resizable()
                        .frame(maxWidth: 16, maxHeight: 16)
                        .padding(.trailing, 8)
                        .foregroundStyle(iconColor != nil ? iconColor! : Color.systemWhite)
                    
                }
                title
                    .font(.Title4)
                    .foregroundStyle(Color.systemWhite)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 8.5)
            .background(Color.grey3)
            .clipShape(RoundedRectangle(cornerRadius: 50))
        }
    }
    
    private func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "dd MMM, EEE"
        return formatter.string(from: date).lowercased().replacingOccurrences(of: ".", with: "")
    }
    
    private func formatedDate(date: Date) -> AttributedString {
        let dateStart = AttributedString(dateToString(date: date).components(separatedBy: ",").first!)
        let weekday = dateToString(date: date).components(separatedBy: ",").last!
        var formatedDate: AttributedString = AttributedString(", \(weekday)")
        var container = AttributeContainer()
        container.foregroundColor = Color.grey6
        formatedDate = formatedDate.mergingAttributes(container)
        return dateStart + formatedDate
    }
}
