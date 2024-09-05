//
//  ListViewModel.swift
//  TravelVista
//
//  Created by Yannick LEPLARD on 05/09/2024.
//

import Foundation



class ListViewModel: ObservableObject {
    @Published var regions: [Region] = []
    
    init() {
        loadRegions()
    }
    
    private func loadRegions() {
        if let regions: [Region] = Service().load("Source.json") {
            self.regions = regions
        }
    }
}
