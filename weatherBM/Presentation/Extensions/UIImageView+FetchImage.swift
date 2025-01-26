//
//  UIImageView+Extension.swift
//  weatherBM
//
//  Created by zyad baset on 15/01/2025.
//

import Foundation
import UIKit
import Combine
extension UIImageView {
    private var networkService: NetworkServiceImageProtocol {
        return NetworkService()
    }
    ///Fetching image and show it inside UIImageView
    /// - Paramters:
    ///    - link: link of the image
    ///    - cancel:Cancellable of the UIviewcontroller
    func fetchImage(link:String,cancel:inout Set<AnyCancellable>) {
        networkService.fetchImage(link: link)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.image = UIImage(systemName: "xmark.circle.fill")
                    print(error.localizedDescription)
                case .finished:
                    print("finished in image fetching")
                }
            } receiveValue: { val in
                self.image = UIImage(data: val)
            }.store(in: &cancel)

    }
}
