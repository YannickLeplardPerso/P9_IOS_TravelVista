//
//  TitleViewSwiftUI.swift
//  TravelVista
//
//  Created by Yannick LEPLARD on 02/09/2024.
//

import SwiftUI

struct TitleViewSwiftUI: View {
    var country: Country
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(country.name)
                    .foregroundStyle(.customBlue)
                    .font(.system(size: 22, weight: .medium))
                Text(country.capital)
                    .foregroundColor(Color(UIColor.darkGray))
                    .font(.system(size: 17))
            }
            
            Spacer()
            
            CountryRatingView(rating: country.rate)
        }
        .padding(.horizontal)
        .padding(.top)
    }
}


// Preview
struct TitleViewSwiftUIPreviews: PreviewProvider {
    static var previews: some View {
        let vietCountry = Country(
            name: "Vietnam",
            capital: "Hanoi",
            description: "Officiellement la République socialiste du Vietnam, est un pays d'Asie du Sud-Est et le pays le plus à l'est de la péninsule indochinoise. Avec une population estimée à 97,8 millions d'habitants en 2020, c'est le 16e pays le plus peuplé du monde. Le Vietnam partage ses frontières terrestres avec la Chine au nord, le Laos et le Cambodge à l'ouest. Il partage ses frontières maritimes avec la Thaïlande à travers le golfe de Thaïlande, et les Philippines, l'Indonésie et la Malaisie à travers la mer de Chine méridionale. Sa capitale est Hanoï, et sa ville la plus peuplée est Ho Chi Minh-Ville.",
            rate: 4,
            pictureName: "vietnam",
            coordinates: Coordinates(latitude: 21.0285, longitude: 105.8542)
        )
        
        TitleViewSwiftUI(country: vietCountry)
    }
}
