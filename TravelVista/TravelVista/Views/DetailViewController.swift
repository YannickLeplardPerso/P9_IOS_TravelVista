//
//  DetailViewController.swift
//  TravelVista
//
//  Created by Amandine Cousin on 18/12/2023.
//

import UIKit
import MapKit
//yl
import SwiftUI

class DetailViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var capitalNameLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var embedMapView: UIView!
    //yl déconnection l'Outlet dans le storyboard
    //@IBOutlet weak var titleView: UIView!
    @IBOutlet weak var rateView: UIView!
    
    var country: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setCustomDesign()

        if let country = self.country {
            self.setUpData(country: country)
        }
        //yl
        self.addSwiftUITitleView()
    }
    
    private func setUpData(country: Country) {
        self.title = country.name
        
//        self.countryNameLabel.text = country.name
//        self.capitalNameLabel.text = country.capital
        self.imageView.image = UIImage(named: country.pictureName )
        self.descriptionTextView.text = country.description
        
//        self.setRateStars(rate: country.rate)
        self.setMapLocation(lat: self.country?.coordinates.latitude ?? 28.394857,
                            long: self.country?.coordinates.longitude ?? 84.124008)
    }
    
    private func setCustomDesign() {
        self.mapView.layer.cornerRadius = self.mapView.frame.size.width / 2
        self.embedMapView.layer.cornerRadius = self.embedMapView.frame.size.width / 2
        self.mapButton.layer.cornerRadius = self.mapButton.frame.size.width / 2
        
        self.mapView.layer.borderColor = UIColor(named: "CustomSand")?.cgColor
        self.mapView.layer.borderWidth = 2
    }
    
    private func setMapLocation(lat: Double, long: Double) {
        let initialLocation = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let span = MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        let region = MKCoordinateRegion(center: initialLocation, span: span)
        self.mapView.setRegion(region, animated: true)
        self.mapView.delegate = self
    }
    
//    private func setRateStars(rate: Int) {
//        var lastRightAnchor = self.rateView.rightAnchor
//        for _ in 0..<rate {
//            let starView = UIImageView(image: UIImage(systemName: "star.fill"))
//            self.rateView.addSubview(starView)
//            
//            starView.translatesAutoresizingMaskIntoConstraints = false
//            starView.widthAnchor.constraint(equalToConstant: 19).isActive = true
//            starView.heightAnchor.constraint(equalToConstant: 19).isActive = true
//            starView.centerYAnchor.constraint(equalTo: self.rateView.centerYAnchor).isActive = true
//            starView.rightAnchor.constraint(equalTo: lastRightAnchor).isActive = true
//            lastRightAnchor = starView.leftAnchor
//        }
//    }
    
    //yl
    private func addSwiftUITitleView() {
        guard let country = self.country else {
            fatalError("addSwiftUITitleView : country is nil")
        }
        let titleSwiftUIView = TitleViewSwiftUI(country: country)
        let hostingController = UIHostingController(rootView: titleSwiftUIView)
        
        self.addChild(hostingController)
        self.view.addSubview(hostingController.view)
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            hostingController.view.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 0),
            hostingController.view.bottomAnchor.constraint(lessThanOrEqualTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
        
        hostingController.didMove(toParent: self)
    }
    
    // Cette fonction est appelée lorsque la carte est cliquée
    // Elle permet d'afficher un nouvel écran qui contient une carte
    @IBAction func showMap(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController: MapViewController = storyBoard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        nextViewController.setUpData(capitalName: self.country?.capital, lat: self.country?.coordinates.latitude ?? 28.394857, long: self.country?.coordinates.longitude ?? 84.124008)
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
