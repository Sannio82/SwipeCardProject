//
//  swipeActionView.swift
//  swipe_card_parking_operator_view
//
//  Created by Sanna Johansson on 2022-09-23.
//

import SwiftUI

struct swipeActionView: ViewModifier {
    
    private static let minSwipeableWidth = SwipeActionButton.width * 0.8
    
    let leading: [SwipeActionButton]
    let trailing: [SwipeActionButton]
    let allowsFullSwipeTrailing: Bool
    let allowsFullSwipeLeading: Bool
    
    private let totalLeadingWidth: CGFloat!
    private let totalTrailingWidth: CGFloat!
    
    @State private var offset: CGFloat = 0
    @State private var prevOffset: CGFloat = 0
    
    init(trailing: [SwipeActionButton] = [],
         allowsFullSwipeTrailing: Bool = false,
         leading: [SwipeActionButton] = [],
         allowsFullSwipeLeading: Bool = false)
    {
        self.trailing = trailing
        self.allowsFullSwipeTrailing = allowsFullSwipeTrailing && !trailing.isEmpty
        self.leading = leading
        self.allowsFullSwipeLeading = allowsFullSwipeLeading && !leading.isEmpty
        totalLeadingWidth = SwipeActionButton.width * CGFloat(leading.count)
        totalTrailingWidth = SwipeActionButton.width * CGFloat(trailing.count)
    }
    
    func body(content: Content) -> some View {
        GeometryReader { geo in
            HStack(spacing: 0) {
                if offset > 0 {
                    if fullSwipeEnabled(edge: .leading, width: geo.size.width) {
                        button(for: leading.first)
                            .frame(width: offset, height: geo.size.height)
                    } else {
                        ForEach(leading) {
                            actionView in
                            button(for: actionView)
                                .frame(width: individualButtonWidth(edge: .leading),
                                       height: geo.size.height)
                        }
                    }
                }
                content
                    .padding(.horizontal, 16)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .leading)
                    .offset(x: (offset > 0) ? 0 : offset)
                
                if offset > 0 {
                    Group {
                        if fullSwipeEnabled(edge: .trailing, width: geo.size.width) {
                            button(for: trailing.last)
                                .frame(width: -offset, height: geo.size.height)
                        } else {
                            ForEach(trailing) {
                                actionView in
                                button(for: actionView)
                                    .frame(width: individualButtonWidth(edge: .trailing),
                                           height: geo.size.height)
                            }
                        }
                    }
                    .offset(x: offset)
                }
            }
            .animation(.spring(), value: offset)
            .contentShape(Rectangle())
            .gesture(DragGesture(minimumDistance: 10,
                                 coordinateSpace: .local)
                .onChanged { gesture in
                    var total = gesture.translation.width + prevOffset
                    if !allowsFullSwipeTrailing{
                        total = max(total, -totalTrailingWidth)
                    }
                    offset = total
                }
                .onEnded { _ in
                    if offset > swipeActionView.minSwipeableWidth && !leading.isEmpty {
                        if !checkAndHandleFullSwipe(for: trailing, edge: .trailing, width: geo.size.width) {
                            offset = -totalTrailingWidth
                        }
                    } else {
                        offset = 0
                    }
                    prevOffset = offset
                })
        }
        .listRowInsets(EdgeInsets())
    }
    
    private func fullSwipeEnabled(edge: Edge, width: CGFloat) -> Bool {
        let threshold = abs(width) / 2
        switch (edge) {
        case .trailing:
            return allowsFullSwipeTrailing && offset > threshold
        case.leading:
            return allowsFullSwipeLeading && offset > threshold
        }
    }
    
    private func button(for button: SwipeActionButton?) -> some View {
        button?
            .onTapGesture {
                button?.action()
                offset = 0
                prevOffset = 0
            }
    }
    
    private func individualButtonWidth(edge: Edge) -> CGFloat {
        switch edge {
        case .leading:
            return (offset > 0) ? (offset / CGFloat(leading.count)) : 0
        case.trailing:
            return(offset > 0) ? (offset / CGFloat(trailing.count)) : 0
        }
    }
    
    private func checkAndHandleFullSwipe(for collection: [SwipeActionButton],
                                         edge: Edge,
                                         width: CGFloat) -> Bool {
        if fullSwipeEnabled(edge: edge, width: width) {
            offset = width * CGFloat(collection.count) * 1.2
            ((edge == .leading) ? collection.first : collection.last)?.action()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                offset = 0
                prevOffset = 0
            }
            return true
        } else {
            return false
        }
        
        func printHejhej() {
            print("hej hej, nu har du tryckt här!")
        }
    }
    
    private enum Edge {
        case leading, trailing
    }
}

extension View {
    func swipeActions(leading: [SwipeActionButton] = [],
                      allowsFullSwipeLeading: Bool = false,
                      trailing: [SwipeActionButton] = [],
                      allowsFullSwipeTrailing: Bool = false) -> some View {
        modifier(swipeActionView(trailing: trailing,
                                 allowsFullSwipeTrailing: allowsFullSwipeTrailing,
                                 leading: leading,
                                 allowsFullSwipeLeading: allowsFullSwipeLeading
                                 ))
    }
}

//struct swipeActionView_Previews: PreviewProvider {
//    static var previews: some View {
//        swipeActionView()
//    }
//}
