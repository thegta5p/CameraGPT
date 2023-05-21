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
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("CameraGPT").font(.title).foregroundColor(.red)
        }
        .padding()
        
        .onAppear(){
           // findRes()
          /*  let viewController = ViewController()
            if let image = UIImage(named: "TestImage") {
                viewController.readTextFromImage(image: image)
            }
            */
        }
        
        
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
