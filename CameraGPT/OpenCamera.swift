//
//  OpenCamera.swift
//  CameraGPT
//
//  Created by Isaac Castro on 5/22/23.
//

import SwiftUI

struct OpenCamera: View {
    @State private var isCameraPresented = false
    
    var body: some View {
        VStack {
            Button(action: {isCameraPresented = true}) {
                Image(systemName: "camera.fill").font(.largeTitle).foregroundColor(.black)
            }
        }
        .sheet(isPresented: $isCameraPresented, onDismiss: {print("User dismissed the camera")}) {
            CameraView()
        }
    }
}

struct OpenCamera_Previews: PreviewProvider {
    static var previews: some View {
        OpenCamera()
    }
}
