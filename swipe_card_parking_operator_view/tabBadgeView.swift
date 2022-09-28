////
////  tabBadgeView.swift
////  swipe_card_parking_operator_view
////
////  Created by Sanna Johansson on 2022-09-28.
////
//
//import SwiftUI
//
//struct TabBadgeView: View {
//    
//    @State private var badgeNumber: Int = 10
//    private var badgePosition: Int = 1
//    private var tabsCount: CGFloat = 2
//    @State private var selectedTab = 0
//    @State private var name = ""
//    
//    var body: some View {
//        GeometryReader { geometry in
//            ZStack {
//                Circle()
//                    .foregroundColor(.red)
//                
//                Text("\(self.badgeNumber)")
//                    .foregroundColor(.white)
//                    .font(Font.system(size: 12))
//            }
//            .frame(width: 20, height: 20)
//            .offset(x: ( ( 2 * CGFloat(self.badgePosition)) - 1 ) * ( geometry.size.width / ( 2 * self.tabsCount ) ), y: -30)
//            .opacity(self.badgeNumber == 0 ? 0 : 1)
//        }
//    }
//}
//
