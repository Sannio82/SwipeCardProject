////
////  badgeUpdaterViewModel.swift
////  swipe_card_parking_operator_view
////
////  Created by Sanna Johansson on 2022-09-28.
////
//
//import Foundation
//import SwiftUI
//
//final class BadgeUpdater {
//    var badgeNumber: Int { ///update on change of badge value
//        didSet {
//            self.tabViewController?.viewControllers?[badgeIndex].tabBarItem.badgeValue = "\(self.badgeNumber)"
//        }
//    }
//    var badgeIndex: Int { ///update on change of index
//        didSet {
//            self.tabViewController?.viewControllers?[badgeIndex].tabBarItem.badgeValue = "\(self.badgeNumber)"
//        }
//    }
//    
//    weak var tabViewController: UITabBarController?
//    var observar: NSKeyValueObservation?
//    init(badgeNumber: Int, badgeIndex: Int) {
//        self.badgeNumber = badgeNumber
//        self.badgeIndex = badgeIndex
//    }
//    
//    func onViewAppear() {
//        if let rootTabVC =  UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.rootViewController?.children.first as? UITabBarController { //get your tab controller from window
//            self.tabViewController = rootTabVC
//            self.tabViewController?.viewControllers?[badgeIndex].tabBarItem.badgeValue = "\(self.badgeNumber)"
//            self.observar = self.tabViewController?.viewControllers?[badgeIndex].observe(\.tabBarItem, options: .new, changeHandler: { [weak self] (vc, valueWrapper) in
//                guard let self = self else { return }
//                if (self.badgeNumber != 0) && valueWrapper.newValue??.badgeValue == nil {
//                    //force block tab badgeNumber reset
//                    vc.tabBarItem.badgeValue = "\(self.badgeNumber)"
//                }
//            })
//        }
//    }
//}
//
//
