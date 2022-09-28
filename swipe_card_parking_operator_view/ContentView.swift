//
//  ContentView.swift
//  swipe_card_parking_operator_view
//
//  Created by Sanna Johansson on 2022-09-21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var numbers = [1,3,4,5,6]
    @State private var currentNumber = 1
    @State private var showingSheet = false
    
    @State var nativeAlert = false
    @State var customAlert = false
    @State var HUD = false
    
    @State private var badgeNumber: Int = 10
    private var badgePosition: Int = 1
    private var tabsCount: CGFloat = 2
    @State private var selectedTab = 0
    
    @State private var heightPopUp: CGFloat = 300
    @State private var isVisible: Bool = true
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack(alignment: .topLeading) {
                TabView (selection: $selectedTab){
                    VStack {
                        List{
                            ForEach(numbers, id: \.self) {
                                Text("\($0)")
                                    .listRowSeparator(.hidden)
                                    .frame(width: 300, height: 300)
                                    .background(Color.blue)
                                    .swipeActions(edge: .trailing) {
                                        Button {
                                            alertView()
                                            
                                            //                                                                showingSheet.toggle()
                                        } label: {
                                            Image(systemName: "info.circle")
                                                .background(Color.gray)
                                        }
                                    }
                            }
                        }
                        .scrollContentBackground(.hidden)
                    }
                    .sheet(isPresented: $showingSheet) {
                        sheetView()
                    }
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Open sheet")
                    }
                    .tag(0)
                    sheetView()
                        .tabItem {
                            Image(systemName: "circle.fill")
                            Text("Open popup")
                        }
                        .tag(1)
                    
                }
                VStack {
                    Button {
                        withAnimation(.easeOut(duration: 10)) {
                     
                            if (heightPopUp == 100) {
                               heightPopUp = 300
                                isVisible = true
                            } else {
                                heightPopUp = 100
                                isVisible = false
                                
                            }
                        }
                      
                 
                        //                                                                showingSheet.toggle()
                    } label: {
                        Text("hej hej")
                            .frame(width: 500, height: heightPopUp)
                            .background(Color.red)
                    }
                    .opacity(isVisible ? 1 : 0)
                  
                }
//                ZStack ((alignment: .bottomLeading){
//                   Circle()
//                     .foregroundColor(.red)
//
//                   Text("\(self.badgeNumber)")
//                     .foregroundColor(.white)
//                     .font(Font.system(size: 12))
//                 }
//                 .frame(width: 20, height: 20)
//                 .offset(x: ( ( 2 * CGFloat(self.badgePosition)) - 1 ) * ( geometry.size.width / ( 2 * self.tabsCount ) ), y: -30)
//                 .opacity(self.badgeNumber == 0 ? 0 : 1)
            }
        } .ignoresSafeArea(.keyboard)
    }
     
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
