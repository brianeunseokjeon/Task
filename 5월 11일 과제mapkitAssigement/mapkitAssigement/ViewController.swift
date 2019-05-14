//
//  ViewController.swift
//  mapkitAssigement
//
//  Created by brian은석 on 10/05/2019.
//  Copyright © 2019 brian. All rights reserved.
//
import MapKit
import UIKit

class ViewController: UIViewController {
    let geocoder = CLGeocoder()
    var count = 0
//    var lati :CLLocationDegrees = 0
//    var longi :CLLocationDegrees = 0
    var arr :[CLLocationCoordinate2D] = []
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        
    }
    
    @IBAction func remove(_ sender: Any) {
        mapView.removeAnnotations(mapView.annotations)
        mapView.removeOverlays(mapView.overlays)
        arr.removeAll()
    }
    @IBAction func seekTextfield(_ sender: UITextField) {
   
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        geocoder.geocodeAddressString(textField.text ?? "서울특별시 강남구 강남역") { (placeMark, error) in
            guard let placeMark = placeMark?.first else {return}
//            self.lati = (placeMark.location?.coordinate.latitude)!
//            self.longi = (placeMark.location?.coordinate.longitude)!
//            print("333333순서체크중-----\(self.lati),\(self.longi) seekTextFeild")
            self.arr.append(placeMark.location!.coordinate)
            
            let span = MKCoordinateSpan(latitudeDelta: 0.5 , longitudeDelta: 0.5)
            let region = MKCoordinateRegion(center: self.arr.last ?? self.arr[0], span: span)
            self.mapView.setRegion(region, animated: true)
            
//            if self.count >= 2 {
//                let point1 = self.arr[self.arr.count-2]
//                let point2 = self.arr[self.arr.count-1]
                 /*= [point1,point2]*/
            
            // 소름 배열 이해.
            let polyline = MKPolyline(coordinates: self.arr, count: self.arr.count)
                self.mapView.addOverlay(polyline)
//            }
            self.whereAmI(placeMark.location!.coordinate)
        }
        
        
        
        print("22222----맵뷰에 뭐있는지 보자")
        return true
    }
   
    
    func whereAmI(_ sender: CLLocationCoordinate2D) {

    
        let whereAmI = MKPointAnnotation()
        whereAmI.title = "\(arr.count)번째 행선지"
        whereAmI.coordinate = sender
        mapView.addAnnotation(whereAmI)
        
        
        let center = whereAmI.coordinate
        var point1 = center; point1.latitude -= 0.001; point1.longitude -= 0.001
        var point2 = center; point2.latitude -= 0.001; point2.longitude += 0.001
        var point3 = center; point3.latitude += 0.001; point3.longitude += 0.001
        var point4 = center; point4.latitude += 0.001; point4.longitude -= 0.001
        let points: [CLLocationCoordinate2D] = [point1,point2,point3,point4,point1]
        let polyline = MKPolyline(coordinates: points, count: points.count)
        mapView.addOverlay(polyline)
       
        
        print("11111순서체크중 whereAmI --------------------------")

    }
}
extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let polyline = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: polyline)
            renderer.strokeColor = .red
            renderer.lineWidth = 2
            return renderer
        }
        return MKOverlayRenderer(overlay: overlay)
    }
}
