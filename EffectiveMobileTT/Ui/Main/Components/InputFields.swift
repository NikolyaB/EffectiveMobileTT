//
//  InputFields.swift
//  EffectiveMobileTT
//
//  Created by Nikolay Bocharnikov on 03.06.2024.
//

import SwiftUI
import UIKit

struct InputFields: View {
    @EnvironmentObject var viewModel: MainViewModel
    let screen: CScreen
    var onClickWhere: (() -> Void)?
    
    var body: some View {
        HStack(spacing: 0) {
            if screen == .main {
                Image("ic_search")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(Color.grey7.opacity(0.62))
                    .frame(width: 24, height: 24)
                    .padding(.leading, 8)
                    .padding(.trailing, 16)
            }
            
            if screen == .searchResult {
                Image("ic_left")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(Color.systemWhite)
                    .frame(width: 24, height: 24)
                    .padding(.horizontal, 8)
            }
            
            VStack(alignment: .leading) {
                HStack {
                    if screen == .searchSheet {
                        Image("ic_airplane_2")
                            .resizable()
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(Color.grey6)
                    }
                    
                    TextField(
                        "", text: $viewModel.whereFrom) {
                            UIApplication.shared.endEditing()
                        }
                        .onChange(of: viewModel.whereFrom) { newValue in
                            let filtered = newValue.filter { $0.isCyrillic }
                            if filtered != newValue {
                                viewModel.whereFrom = filtered
                            }
                        }
                        .font(.ButtonText1)
                        .accentColor(Color.grey6)
                        .foregroundStyle(Color.systemWhite)
                        .placeholder(when: viewModel.whereFrom.isEmpty) {
                            Text(viewModel.whereFrom.isEmpty ? "Откуда - Москва" : viewModel.whereFrom)
                                .font(.ButtonText1)
                                .foregroundStyle(Color.grey6)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.systemWhite.opacity(0.001))

                    if screen == .searchResult {
                        Button(action: {
                            let changeText = viewModel.whereGo
                            viewModel.whereGo = viewModel.whereFrom
                            viewModel.whereFrom = changeText
                        }) {
                            Image("ic_change")
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: 24, height: 24)
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(Color.systemWhite)
                        }
                    }
                }
                Divider()
                    .background(Color.grey7)
                HStack {
                    if screen == .searchSheet {
                        Image("ic_search")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 24, height: 24)
                            .aspectRatio(contentMode: .fit)
                            .foregroundStyle(Color.systemWhite)
                    }
                    
                    if screen == .searchSheet {
                        TextField("", text: $viewModel.whereGo) {
                            UIApplication.shared.endEditing()
                        }
                        .onChange(of: viewModel.whereGo) { newValue in
                            let filtered = newValue.filter { $0.isCyrillic }
                            if filtered != newValue {
                                viewModel.whereGo = filtered
                            }
                        }
                        .font(.ButtonText1)
                        .foregroundStyle(Color.systemWhite)
                        .placeholder(when: viewModel.whereGo.isEmpty) {
                            Text("Куда - Турция")
                                .font(.ButtonText1)
                                .foregroundStyle(Color.grey6)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.systemWhite.opacity(0.001))
                    } else {
                        Text(viewModel.whereGo.isEmpty ? "Куда - Турция" : viewModel.whereGo)
                            .font(.ButtonText1)
                            .foregroundStyle(viewModel.whereGo.isEmpty ? Color.grey6 : Color.systemWhite)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.systemWhite.opacity(0.001))
                            .onTapGesture {
                                viewModel.goSearchSheet()
                            }
                    }
                    
                    if screen == .searchSheet || screen == .searchResult {
                        Button(action: { viewModel.whereGo = "" }) {
                            Image("ic_close")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(Color.grey6)
                        }
                    }
                }
            }
            .padding(.leading, screen == .searchSheet ? 16 : 0)
            .padding(.trailing)
        }
        .padding(.vertical)
        .background {
            switch screen {
            case .main:
                Color.grey4
            case .searchSheet:
                Color.grey3
            case .searchResult:
                Color.grey2
            default:
                Color.clear
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.systemBlack)
                .shadow(color: .systemBlack.opacity(0.25), radius: 4, x: 0, y: 4)
        )
        .padding()
        .background(content: {
            switch screen {
            case .main:
                Color.grey3
            default:
                Color.clear
            }
        })
        .clipShape(RoundedRectangle(cornerRadius: screen == .main ? 16 : 0))
    }
}
