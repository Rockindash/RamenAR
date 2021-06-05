//
//  ViewController.swift
//  Ramen 3
//
//  Created by Amol Kumar on 2021-06-05.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let box = createBox()
        placeBox(box: box)
        installGesture(on: box)
    }
    
    func createBox() -> ModelEntity {
        let box = MeshResource.generateBox(size: 0.5)
        let boxMaterial = SimpleMaterial(color: .blue, isMetallic: true)
        let boxEntity = ModelEntity(mesh: box, materials: [boxMaterial])
        
        return boxEntity
    }
    
    func placeBox(box: ModelEntity) {
        let boxAnchor = AnchorEntity(world: SIMD3(x: 0, y: 0, z: 0))
        boxAnchor.addChild(box)
        
        arView.scene.addAnchor(boxAnchor)
    }
    
    func installGesture(on object: ModelEntity) {
        object.generateCollisionShapes(recursive: true)
        arView.installGestures([.translation, .scale], for: object)
    }
}
