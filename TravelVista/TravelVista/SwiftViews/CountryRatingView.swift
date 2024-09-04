//
//  CountryRatingView.swift
//  TravelVista
//
//  Created by Yannick LEPLARD on 02/09/2024.
//

import SwiftUI

struct CountryRatingView: View {
    let rating: Int
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<rating, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .foregroundColor(.customSand)
                    .font(.system(size: 15))
            }
        }
        
    }
}

#Preview {
    CountryRatingView(rating: 5)
}
