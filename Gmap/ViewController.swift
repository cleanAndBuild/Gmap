//
//  ViewController.swift
//  Gmap
//
//  Created by Yako Kobayashi on 2018/08/04.
//  Copyright © 2018年 yako Kobayashi. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {
    var _googleMap : GMSMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //カメラを作る
        let camera: GMSCameraPosition = GMSCameraPosition.camera(withLatitude:35.6808941,longitude:139.767229, zoom:15)
        
        //MapViewを作る
        _googleMap = GMSMapView(frame: CGRect(x:0, y:0, width:self.view.bounds.width,height:self.view.bounds.height))
        
        //カメラを追加
        _googleMap.camera = camera
        
        //viewにMapViewを追加.
        self.view.addSubview(_googleMap)
        self.view.sendSubview(toBack: _googleMap)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //マーカー追加ボタン
    @IBAction func tapButtonAddMarker(_ sender: Any) {
        let marker: GMSMarker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(_googleMap.camera.target.latitude,_googleMap.camera.target.longitude)
        marker.icon = UIImage(named:"marker_r.png") //アイコン画像を指定する
        marker.groundAnchor = CGPoint(x:0.5,y:0.5) //アイコンの中心に座標が合うようにする
        
        marker.map = _googleMap
    }
    
}

