//
//  LocationViewController.swift
//  Assignment
//
//  Created by RealCH on 8/1/2022.
//

import UIKit
import MapKit
import CoreLocation

class LocationViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView?
    
    var annotations = [MKPointAnnotation]();
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let CFTAnnotation = MKPointAnnotation();
        CFTAnnotation.coordinate = CLLocationCoordinate2D(latitude: 22.28722033668412,longitude: 114.19135713852506);
        CFTAnnotation.title = "Craft Facade Tech (Hong Kong) Company Limited";
        self.annotations.append(CFTAnnotation);
        
        
        let UMAGAnnotation = MKPointAnnotation();
        UMAGAnnotation.coordinate = CLLocationCoordinate2D(latitude: 22.283711642634053,longitude: 114.13906407458747);
        UMAGAnnotation.title = "The University of Hong Kong - University Museum and Art Gallery";
        self.annotations.append(UMAGAnnotation);
        
        
        let CACAnnotation = MKPointAnnotation();
        CACAnnotation.coordinate = CLLocationCoordinate2D(latitude: 22.277516749976947,longitude: 114.16528738386344);
        CACAnnotation.title = "Chinese Arts & Crafts";
        self.annotations.append(CACAnnotation);
        
        
        let HKFTTAnnotation = MKPointAnnotation();
        HKFTTAnnotation.coordinate = CLLocationCoordinate2D(latitude: 22.28594312964212, longitude: 114.1516836455119);
        HKFTTAnnotation.title = "Hong Kong Foodie Tasting Tours";
        self.annotations.append(HKFTTAnnotation);
        
        
        let BTSCLAnnotation = MKPointAnnotation();
        BTSCLAnnotation.coordinate = CLLocationCoordinate2D(latitude: 22.28483614072265, longitude: 114.21416862081186);
        BTSCLAnnotation.title = "Better Than Standard Crystal Limited";
        self.annotations.append(BTSCLAnnotation);
        
        
        let LMCAnnotation = MKPointAnnotation();
        LMCAnnotation.coordinate = CLLocationCoordinate2D(latitude: 22.29602932250799,longitude: 114.23875796716183);
        LMCAnnotation.title = "Love Multi Culture";
        self.annotations.append(LMCAnnotation);
        
        
        let EAnnotation = MKPointAnnotation();
        EAnnotation.coordinate = CLLocationCoordinate2D(latitude: 22.31288292700104,longitude: 114.22032585836801);
        EAnnotation.title = "Eldage";
        self.annotations.append(EAnnotation);
        
        
        let PAnnotation = MKPointAnnotation();
        PAnnotation.coordinate = CLLocationCoordinate2D(latitude: 22.33463920439782,longitude: 114.1614042917057);
        PAnnotation.title = "Papertopok";
        self.annotations.append(PAnnotation);
        
        
        let BTHKAnnotation = MKPointAnnotation();
        BTHKAnnotation.coordinate = CLLocationCoordinate2D(latitude: 22.32955385609241,longitude: 114.1661243677949);
        BTHKAnnotation.title = "Boma Tailor Hong Kong";
        self.annotations.append(BTHKAnnotation);
        
        
        self.mapView?.addAnnotations(self.annotations);
        
    
    }

    
}
