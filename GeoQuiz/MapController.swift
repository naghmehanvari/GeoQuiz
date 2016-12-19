//
//  MapController.swift
//  GeoQuiz
//
//  Created by Naghmeh on 12/8/16.
//  Copyright © 2016 Naghmeh. All rights reserved.
//

import UIKit
import MapKit

class MapController: UIViewController, MKMapViewDelegate {
    weak var model: CountryModel?
    
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        model = appDelegate.model
        setUpAnnotationsOnMap()
        
    }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var view = mapView.dequeueReusableAnnotationView(withIdentifier: "annotationView")
        
        if view==nil
        {
            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "annotationView")
            view?.canShowCallout = true
        }
        else{
            view?.annotation = annotation
        }
        

        return view
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        let btn = UIButton(type: .detailDisclosure)
        view.rightCalloutAccessoryView = btn
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl){
        print("hello")
        performSegue(withIdentifier: "quiz", sender: view)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("in here")
        if segue.identifier == "quiz"
        {
            if let quizC = segue.destination as? QuizTableViewController{
                quizC.title = (sender as? MKAnnotationView)?.annotation?.title!
                quizC.correctCapital = ((sender as? MKAnnotationView)?.annotation as? Location)?.capital
            }
        }
    }
    
    
    
    
    func setUpAnnotationsOnMap(){
        performSegue(withIdentifier: "quiz", sender: view)
        mapView.addAnnotations((model?.listOfCountries)!)
    }
   



}

