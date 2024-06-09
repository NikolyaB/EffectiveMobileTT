//
//  MainScreenCoordinator.swift
//  EffectiveMobileTT
//
//  Created by Nikolay Bocharnikov on 06.06.2024.
//

import SwiftUI

struct MainScreenCoordinator: View {
    @StateObject var coordinator: Coordinator
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.getScreen(CScreen.main)
                .environmentObject(coordinator)
                .navigationDestination(for: CScreen.self) { screen in
                    coordinator.getScreen(screen)
                }
                .sheet(item: $coordinator.sheet) { sheet in
                    coordinator.getScreen(sheet)
                        .presentationDetents([.large, .fraction(1)])
                }
        }
    }
}
