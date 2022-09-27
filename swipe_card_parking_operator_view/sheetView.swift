//
//  sheetView.swift
//  swipe_card_parking_operator_view
//
//  Created by Sanna Johansson on 2022-09-21.
//

import SwiftUI

struct sheetView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Här är informationen om laddarna! Bland annat så finns det också mer info här: https://trello.com/b/ks69ZNzu/app-20 ")
                .lineLimit(50)
                .padding(30)
                .underline()
            Text("Stäng")
                .onTapGesture {
                    dismiss()
                }
                .frame(alignment: .trailing)
                .padding(.top, 30)
        }
    }
}

struct sheetView_Previews: PreviewProvider {
    static var previews: some View {
        sheetView()
    }
}
