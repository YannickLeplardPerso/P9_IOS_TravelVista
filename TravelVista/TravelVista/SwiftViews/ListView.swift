//
//  ListView.swift
//  TravelVista
//
//  Created by Yannick LEPLARD on 04/09/2024.
//

import SwiftUI



struct ListView: View {
    let regions: [Region] = [
        Region(name: "North America", countries: [
            Country(name: "United States", capital: "Washington, D.C.", description: "A country in North America.", rate: 5, pictureName: "vietnam", coordinates: Coordinates(latitude: 38.8977, longitude: -77.0365)),
            Country(name: "Canada", capital: "Ottawa", description: "A country in North America.", rate: 4, pictureName: "vietnam", coordinates: Coordinates(latitude: 45.4215, longitude: -75.6972))
        ]),
        Region(name: "Europe", countries: [
            Country(name: "Germany", capital: "Berlin", description: "A country in Europe.", rate: 5, pictureName: "vietnam", coordinates: Coordinates(latitude: 52.5200, longitude: 13.4050)),
            Country(name: "France", capital: "Paris", description: "A country in Europe.", rate: 4, pictureName: "vietnam", coordinates: Coordinates(latitude: 48.8566, longitude: 2.3522)),
            Country(name: "France", capital: "Paris", description: "A country in Europe.", rate: 4, pictureName: "vietnam", coordinates: Coordinates(latitude: 48.8566, longitude: 2.3522))
        ]),
        Region(name: "Asia", countries: [
            Country(name: "United States", capital: "Washington, D.C.", description: "A country in North America.", rate: 5, pictureName: "vietnam", coordinates: Coordinates(latitude: 38.8977, longitude: -77.0365)),
            Country(name: "Canada", capital: "Ottawa", description: "A country in North America.", rate: 4, pictureName: "vietnam", coordinates: Coordinates(latitude: 45.4215, longitude: -75.6972)),
            Country(name: "United States", capital: "Washington, D.C.", description: "A country in North America.", rate: 5, pictureName: "vietnam", coordinates: Coordinates(latitude: 38.8977, longitude: -77.0365)),
            Country(name: "Canada", capital: "Ottawa", description: "A country in North America.", rate: 4, pictureName: "vietnam", coordinates: Coordinates(latitude: 45.4215, longitude: -75.6972))
        ]),
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(regions, id: \.name) { region in
                    Section(header: Text(region.name)
                        .font(.system(size: 12, weight: .bold))
                    ) {
                        ForEach(region.countries, id: \.name) { country in
                            CountryRowView(country: country)
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Liste de voyages")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.primary)
                }
            }
        }
        .scrollContentBackground(.hidden)
    }
    
}

#Preview {
    ListView()
}
