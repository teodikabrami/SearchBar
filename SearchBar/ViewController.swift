//
//  ViewController.swift
//  SearchBar
//
//  Created by Teodik Abrami on 7/18/18.
//  Copyright © 2018 Teodik Abrami. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController, UISearchControllerDelegate, UISearchBarDelegate,MKMapViewDelegate {
    
    
    
    @IBOutlet weak var mapView: MKMapView!
    var searchController: UISearchController!
    var selectedItem = "tehran" {
        didSet {
            self.searchController.isActive = false
            doThis()
        }
    }
    
    var item: String?

    override func viewDidLoad() {
        
        super.viewDidLoad()
        searchUpdate()
        mapView.delegate = self
        doThis()
        

    }
    override func viewDidAppear(_ animated: Bool) {
        
        if let item = item {
            print("aaa")
            self.selectedItem = item
        }
    }
    
  /*  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "Pin"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as! MKPinAnnotationView
 
    } */
    
    func doThis() {
       let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(selectedItem) { (placeMarks, error) in
            if error != nil {
                return
            }
            if let placeMarks = placeMarks {
                let placeMark = placeMarks[0]
                let annotation = MKPointAnnotation()
                if let location = placeMark.location {
                    annotation.coordinate = location.coordinate
                    self.mapView.addAnnotation(annotation)
                    let region = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 40_000, 40_000)
                    //self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.region = region
                }
                
            }
            
        }
    }
    
    func searchUpdate() {
        
        let resultController = storyboard?.instantiateViewController(withIdentifier: "2") as! TableViewController2
        
        
        searchController = UISearchController(searchResultsController: resultController)
        
        searchController.searchResultsUpdater = resultController
        
        self.searchController.delegate = self
        self.searchController.searchBar.delegate = self
        
        searchController.dimsBackgroundDuringPresentation = true
        
        self.searchController.hidesNavigationBarDuringPresentation = false
        
        navigationItem.searchController = searchController
        
        self.definesPresentationContext = true
    }
    
 
}
