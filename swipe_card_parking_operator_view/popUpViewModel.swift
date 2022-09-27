//
//  popUpViewModel.swift
//  swipe_card_parking_operator_view
//
//  Created by Sanna Johansson on 2022-09-27.
//

import Foundation
import SwiftUI

func alertView() {
    let alert = UIAlertController(title: "Update", message: "There is a new update available, will you update?", preferredStyle: .alert)
    
    let update = UIAlertAction(title: "Update", style: .default) {
        (_) in
    }
    let cancel = UIAlertAction(title: "Cancel", style: .destructive) {
        (_) in
    }
    alert.addAction(update)
    
    alert.addAction(cancel)
    
    UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: {
        
    })
}
