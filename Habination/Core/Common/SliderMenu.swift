//
//  SliderMenu.swift
//  Habination
//
//  Created by Darya Zhitova on 27.06.2022.
//


import SwiftUI

struct SliderMenu: View {

    @State public var selectedSection: Int = 0
    private let size: CGSize = CGSize(width: 351, height: 60)
    private let segmentLabels: [String] = ["Yuup!", "No"]
    private let segmentPadding: CGFloat = 3

    var body: some View {
        
        ZStack(alignment: .leading) {
            
            // # Background shape
            RoundedRectangle(cornerRadius: 30)
                .frame(width: size.width, height: size.height)
                .foregroundColor(.white)
            
            // # Selection background
            RoundedRectangle(cornerRadius: 30)
                .frame(width: segmentWidth(size) - (segmentPadding * 2), height: size.height - (segmentPadding * 2))
                .foregroundColor(.accentColor)
                .offset(x: calculateSegmentOffset(size) + segmentPadding)
                .animation(Animation.easeInOut(duration: 0.5))
            
            // # Labels
            HStack(spacing: 0) {
                ForEach(0..<segmentLabels.count) { index in
                    SegmentLabel(title: segmentLabels[index], width: segmentWidth(size), textColour: selectedSection == index ? Color.white : Color.black)
                        .onTapGesture {
                            selectedSection = index
                        }
                }
            }
        }
    }
    
    private func segmentWidth(_ mainSize: CGSize) -> CGFloat {
        let width = (mainSize.width / CGFloat(segmentLabels.count))
        return width
    }

    private func calculateSegmentOffset(_ mainSize: CGSize) -> CGFloat {
        segmentWidth(mainSize) * CGFloat(selectedSection)
    }

}

fileprivate struct SegmentLabel: View {
    
    let title: String
    let width: CGFloat
    let textColour: Color
    
    var body: some View {
        
        Text(title)
            .foregroundColor(textColour)
            .frame(width: width)
            .contentShape(Rectangle())
    }
}

struct CustomSegmentedControl_Previews: PreviewProvider {
    static var previews: some View {
        SliderMenu()
    }
}
