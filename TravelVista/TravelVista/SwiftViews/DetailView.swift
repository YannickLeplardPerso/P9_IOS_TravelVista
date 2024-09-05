//
//  DetailView.swift
//  TravelVista
//
//  Created by Yannick LEPLARD on 04/09/2024.
//

import SwiftUI
import UIKit
import MapKit


struct DetailView: UIViewControllerRepresentable {
    var country: Country
    
    func makeUIViewController(context: Context) -> DetailViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            fatalError("DetailViewController not found in storyboard")
        }
        viewController.country = country
        return viewController
    }
    
    func updateUIViewController(_ viewController: DetailViewController, context: Context) {
        viewController.title = country.name
        viewController.imageView.image = UIImage(named: country.pictureName)
        viewController.descriptionTextView.text = country.description
        
        let initialLocation = CLLocationCoordinate2D(latitude: country.coordinates.latitude, longitude: country.coordinates.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        let region = MKCoordinateRegion(center: initialLocation, span: span)
        viewController.mapView.setRegion(region, animated: true)
        viewController.mapView.delegate = viewController
    }
}

//#Preview {
//    DetailView()
//}
