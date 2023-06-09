//
//  DetectTextInPhoto.swift
//  CameraGPT
//
//  Created by Isaac Castro on 5/15/23.
//

import Foundation
import UIKit
import Vision

public class ViewController: UIViewController {
    
    func getImage(fileName: String) {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            // Failed to get the document directory
            print("Failed to get directory")
            return
        }
        let fileUrl = documentDirectory.appendingPathComponent(fileName)

        print("Sending Image")
        print(fileName)
        guard let imageData = try? Data(contentsOf: fileUrl), let image = UIImage(data: imageData) else {
            // Failed to load image from the specified directory
            print("Image Not Found")
            return
        }
        
        readTextFromImage(image: image)
    }
    
   /* override public func viewDidLoad() {
        super.viewDidLoad()
        
        guard let image = UIImage(named: "TestImage") else {
            print("Image not found!!")
            return
        }
        readTextFromImage(image: image)
    }
    */
    
    
    func readTextFromImage(image: UIImage) {
        guard let cgImage = image.cgImage else {
            print("Failed to convert UIImage to cgImage")
            return
        }
        
        let requestHandler = VNImageRequestHandler(cgImage: cgImage)
        
        let request = VNRecognizeTextRequest{ (request, error) in
            if let error = error {
                print("Failed to recognize text: \(error)")
                return
            }
            
            guard let observations = request.results as? [VNRecognizedTextObservation] else {return}
            
            for observation in observations {
                guard let topCandidate = observation.topCandidates(1).first else {continue}
                
                print ("Recognized text: \(topCandidate.string)")
                
                dispResult(topCandidate.string)
            }
        }
        
        do {
            try requestHandler.perform([request])
        } catch {
            print("Failed to perform text recognition request: \(error)")
        }
    }
}
