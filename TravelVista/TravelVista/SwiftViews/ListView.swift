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
            Country(name: "Vietnam", capital: "Hanoi", description: "Officiellement la République socialiste du Vietnam, est un pays d'Asie du Sud-Est et le pays le plus à l'est de la péninsule indochinoise. Avec une population estimée à 97,8 millions d'habitants en 2020, c'est le 16e pays le plus peuplé du monde. Le Vietnam partage ses frontières terrestres avec la Chine au nord, le Laos et le Cambodge à l'ouest. Il partage ses frontières maritimes avec la Thaïlande à travers le golfe de Thaïlande, et les Philippines, l'Indonésie et la Malaisie à travers la mer de Chine méridionale. Sa capitale est Hanoï, et sa ville la plus peuplée est Ho Chi Minh-Ville.", rate: 4, pictureName: "vietnam", coordinates: Coordinates(latitude: 38.8977, longitude: -77.0365)),
            Country(name: "Vietnam", capital: "Hanoi", description: "Officiellement la République socialiste du Vietnam, est un pays d'Asie du Sud-Est et le pays le plus à l'est de la péninsule indochinoise. Avec une population estimée à 97,8 millions d'habitants en 2020, c'est le 16e pays le plus peuplé du monde. Le Vietnam partage ses frontières terrestres avec la Chine au nord, le Laos et le Cambodge à l'ouest. Il partage ses frontières maritimes avec la Thaïlande à travers le golfe de Thaïlande, et les Philippines, l'Indonésie et la Malaisie à travers la mer de Chine méridionale. Sa capitale est Hanoï, et sa ville la plus peuplée est Ho Chi Minh-Ville.", rate: 4, pictureName: "vietnam", coordinates: Coordinates(latitude: 38.8977, longitude: -77.0365))
        ]),
        Region(name: "Europe", countries: [
            Country(name: "Vietnam", capital: "Hanoi", description: "Officiellement la République socialiste du Vietnam, est un pays d'Asie du Sud-Est et le pays le plus à l'est de la péninsule indochinoise. Avec une population estimée à 97,8 millions d'habitants en 2020, c'est le 16e pays le plus peuplé du monde. Le Vietnam partage ses frontières terrestres avec la Chine au nord, le Laos et le Cambodge à l'ouest. Il partage ses frontières maritimes avec la Thaïlande à travers le golfe de Thaïlande, et les Philippines, l'Indonésie et la Malaisie à travers la mer de Chine méridionale. Sa capitale est Hanoï, et sa ville la plus peuplée est Ho Chi Minh-Ville.", rate: 4, pictureName: "vietnam", coordinates: Coordinates(latitude: 38.8977, longitude: -77.0365)),
            Country(name: "Vietnam", capital: "Hanoi", description: "Officiellement la République socialiste du Vietnam, est un pays d'Asie du Sud-Est et le pays le plus à l'est de la péninsule indochinoise. Avec une population estimée à 97,8 millions d'habitants en 2020, c'est le 16e pays le plus peuplé du monde. Le Vietnam partage ses frontières terrestres avec la Chine au nord, le Laos et le Cambodge à l'ouest. Il partage ses frontières maritimes avec la Thaïlande à travers le golfe de Thaïlande, et les Philippines, l'Indonésie et la Malaisie à travers la mer de Chine méridionale. Sa capitale est Hanoï, et sa ville la plus peuplée est Ho Chi Minh-Ville.", rate: 4, pictureName: "vietnam", coordinates: Coordinates(latitude: 38.8977, longitude: -77.0365)),
            Country(name: "Vietnam", capital: "Hanoi", description: "Officiellement la République socialiste du Vietnam, est un pays d'Asie du Sud-Est et le pays le plus à l'est de la péninsule indochinoise. Avec une population estimée à 97,8 millions d'habitants en 2020, c'est le 16e pays le plus peuplé du monde. Le Vietnam partage ses frontières terrestres avec la Chine au nord, le Laos et le Cambodge à l'ouest. Il partage ses frontières maritimes avec la Thaïlande à travers le golfe de Thaïlande, et les Philippines, l'Indonésie et la Malaisie à travers la mer de Chine méridionale. Sa capitale est Hanoï, et sa ville la plus peuplée est Ho Chi Minh-Ville.", rate: 4, pictureName: "vietnam", coordinates: Coordinates(latitude: 38.8977, longitude: -77.0365))
        ]),
        Region(name: "Asia", countries: [
            Country(name: "Vietnam", capital: "Hanoi", description: "Officiellement la République socialiste du Vietnam, est un pays d'Asie du Sud-Est et le pays le plus à l'est de la péninsule indochinoise. Avec une population estimée à 97,8 millions d'habitants en 2020, c'est le 16e pays le plus peuplé du monde. Le Vietnam partage ses frontières terrestres avec la Chine au nord, le Laos et le Cambodge à l'ouest. Il partage ses frontières maritimes avec la Thaïlande à travers le golfe de Thaïlande, et les Philippines, l'Indonésie et la Malaisie à travers la mer de Chine méridionale. Sa capitale est Hanoï, et sa ville la plus peuplée est Ho Chi Minh-Ville.", rate: 4, pictureName: "vietnam", coordinates: Coordinates(latitude: 38.8977, longitude: -77.0365)),
            Country(name: "Vietnam", capital: "Hanoi", description: "Officiellement la République socialiste du Vietnam, est un pays d'Asie du Sud-Est et le pays le plus à l'est de la péninsule indochinoise. Avec une population estimée à 97,8 millions d'habitants en 2020, c'est le 16e pays le plus peuplé du monde. Le Vietnam partage ses frontières terrestres avec la Chine au nord, le Laos et le Cambodge à l'ouest. Il partage ses frontières maritimes avec la Thaïlande à travers le golfe de Thaïlande, et les Philippines, l'Indonésie et la Malaisie à travers la mer de Chine méridionale. Sa capitale est Hanoï, et sa ville la plus peuplée est Ho Chi Minh-Ville.", rate: 4, pictureName: "vietnam", coordinates: Coordinates(latitude: 38.8977, longitude: -77.0365))
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
                            //new
                            NavigationLink(destination: DetailView(country: country)) {
                                CountryRowView(country: country)
                            }
                            //CountryRowView(country: country)
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
