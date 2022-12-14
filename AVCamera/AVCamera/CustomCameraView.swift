//
//  CustomCameraView.swift
//  AVCamera
//
//  Created by BJIT on 14/9/22.
//

import SwiftUI

struct CustomCameraView: View{
    let cameraService = CameraService()
    @Binding var captureedImage: UIImage?
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View{
        ZStack{
            CameraView(cameraService: cameraService) { result in
                switch result{
                    
                case .success(let photo):
                    if let data = photo.fileDataRepresentation(){
                        captureedImage = UIImage(data: data)
                        presentationMode.wrappedValue.dismiss()
                    } else{
                        print("Error no image data found")
                    }
                case .failure(let erro):
                    print(erro.localizedDescription)
                }
            }
            VStack{
                Spacer()
                Button(action: {
                    cameraService.capturePhoto()
                }, label: {
                    Image(systemName: "circle")
                        .font(.system(size: 72))
                        .foregroundColor(.white)
                })
                .padding(.bottom)
            }
        }
    }
}
