//
//  ContentView.swift
//  AVCamera
//
//  Created by BJIT on 13/9/22.
//

import SwiftUI

struct ContentView: View {
    @State private var capturedImage: UIImage? = nil
    @State private var isCustomCameraViewPresented = false
    
    var body: some View {
        if capturedImage != nil{
            Image(uiImage: capturedImage!)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        }else{
            Color(UIColor.systemBackground)
        }
        
        ZStack{
            VStack{
                Spacer()
                Button( action: {
                    isCustomCameraViewPresented.toggle()
                }, label: {
                    Image(systemName: "camera.fill")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                })
                .padding(.bottom)
                .sheet(isPresented: $isCustomCameraViewPresented, content: {
                    CustomCameraView(captureedImage: $capturedImage)
                })
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
