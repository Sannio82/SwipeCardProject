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
    
    var body: some View {
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
