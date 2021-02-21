//
//  VideoPicker.swift
//  uri
//
//  Created by user175571 on 2/20/21.
//

import SwiftUI

struct VideoPicker: UIViewControllerRepresentable {
    
    @Binding var video: URL?
    @Binding var isShown: Bool
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(isShown: $isShown, URL: $video)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<VideoPicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary) ?? []
        picker.mediaTypes = ["public.movie"]
        picker.videoQuality = .typeHigh
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<VideoPicker>) {
        
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        @Binding var video: URL?
        @Binding var isShown: Bool
        
        init(isShown: Binding<Bool>, URL:Binding<URL?>) {
            _isShown = isShown
            _video = URL
        }
        
        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            video = info[.mediaURL] as? URL
            isShown.toggle()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            isShown.toggle()
        }
    }
}

