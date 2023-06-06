//
//  ContentView.swift
//  CameraGPT
//
//  Created by Isaac Castro on 5/12/23.
//


import SwiftUI
import Foundation



struct ContentView: View {
    var body: some View {
        VStack {
            Text("CameraGPT").font(.title).foregroundColor(.red)
            Text("Take a picture to upload a problem").font(.subheadline)
            Spacer()
            OpenCamera()
                .padding(.bottom)
        }
        .padding()
        
        .onAppear(){
            
        }
        
        
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
