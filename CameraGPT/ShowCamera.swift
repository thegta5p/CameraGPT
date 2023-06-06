//
//  ShowCamera.swift
//  CameraGPT
//
//  Created by Isaac Castro on 5/22/23.
//

import Foundation
import SwiftUI

struct CameraView: UIViewControllerRepresentable {
    @Environment(\.dismiss) var dismiss
    @Binding var image: UIImage?
    @Binding var savedImageName: String?
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    typealias UIViewControllerType = UIImagePickerController

    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = context.coordinator
        return picker
    }
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: CameraView
        
        init(_ parent: CameraView) {
            self.parent = parent
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            // Handle cancellation
            parent.dismiss()
        }
        
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            // Handle image selection
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
                
                let fileName = UUID().uuidString
                let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                let fileUrl = documentDirectory.appendingPathComponent(fileName)
                
                guard let data = uiImage.jpegData(compressionQuality: 1) else {return}
                
                do {
                    try data.write(to: fileUrl)
                    print("Image saved at \(fileUrl)")
                    DispatchQueue.main.async {
                        self.parent.savedImageName = fileName
                    }
               //     parent.savedImageName = fileName
                } catch {
                    print("Error saving image: \(error)")
                }
            }
            parent.dismiss()
        }
    }
}
