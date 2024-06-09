//
//  TabViewNavigation.swift
//  EffectiveMobileTT
//
//  Created by Nikolay Bocharnikov on 03.06.2024.
//

import SwiftUI

struct TabViewNavigation: View {    
    @StateObject var coordinator = Coordinator()
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.grey6)
    }
    
    var body: some View {
        TabView(selection: $coordinator.tab) {
            ForEach(tabNavigationItems) { item in
                coordinator.getTab(coordinator.tab)
                    .tabItem {
                        Image(item.icon)
                            .renderingMode(.template)
                        Text(item.title)
                    }
                    .tag(item.tab)
            }
        }
        .tint(Color.systemBlue)
    }
}

#Preview {
    TabViewNavigation()
}

struct TabNavigationItem: Identifiable {
    let id = UUID()
    let tab: CScreen
    let icon: String
    let title: String
}

let tabNavigationItems = [
    TabNavigationItem(tab: .main, icon: "ic_airplane_1", title: "Авиабилеты"),
    TabNavigationItem(tab: .hotels, icon: "ic_hotels", title: "Отели"),
    TabNavigationItem(tab: .shortWay, icon: "ic_short_way", title: "Короче"),
    TabNavigationItem(tab: .subscriptions, icon: "ic_subscriptions", title: "Подписки"),
    TabNavigationItem(tab: .profile, icon: "ic_profile", title: "Профиль"),
    
]
