//
//  OpenCamera.swift
//  CameraGPT
//
//  Created by Isaac Castro on 5/22/23.
//

import SwiftUI

struct OpenCamera: View {
    @State private var isCameraPresented = false
    @State private var image: UIImage? = nil
    @State private var savedImageName: String?
    
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {isCameraPresented = true}) {
                Image(systemName: "camera.fill").font(.largeTitle).foregroundColor(.white)
            }
            .sheet(isPresented: $isCameraPresented, onDismiss: {print("User dismissed the camera")}) {
                CameraView(image: $image, savedImageName: $savedImageName)

            }
            
            if image != nil {
                Button(action: {
                    if let imageName = savedImageName{
                    //    print(imageName)
                        let viewController = ViewController()
                        viewController.getImage(fileName: imageName)
                    }
                    else {
                        print("Error Image Name Not Stored!")
                    }
                }) {
                    Text("Send Image")
                }
            }
        }
        .padding(.bottom, 20)
    }
}


struct OpenCamera_Previews: PreviewProvider {
    static var previews: some View {
        OpenCamera()
    }
}
