//
//  ImageDataSource.swift
//  uri
//
//  Created by Arpan Dhatt on 2/20/21.
//

import SwiftUI

class ImageDataSource: ObservableObject {
    static var shared = ImageDataSource()
    
    @Published var images = [String: UIImage]()
    
    func loadImage(url_string: String) {
        let url = URL(string: url_string)
        
        if let urlu = url {
            if !images.keys.contains(url_string) {
                let task = URLSession.shared.dataTask(with: urlu) { data, response, error in
                    guard let data = data else { return }
                    DispatchQueue.main.async {
                        self.images[url_string] = UIImage(data: data)
                    }
                }
                task.resume()
            }
        }
    }
}
