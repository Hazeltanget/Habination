//
//  ProgressCircle.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 04.05.2022.
//

import SwiftUI

private struct SlicedCircle: Shape {
    
    var progressProcent: Int
    
    var endDegress: Angle {
        return Angle(degrees: Double(progressProcent) * 3.6)
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        path.move(to: center)
        
        
        path.addArc(center: center, radius: rect.midX, startAngle: .degrees(0), endAngle: endDegress, clockwise: false)
        
        
        return path
    }
}

struct ProgressCircle: View {
    
    @Binding var procent: Int
    
    var body: some View {
        ZStack {
            Circle()
            
            Circle()
                .fill(.white)
                .padding()
            
            SlicedCircle(progressProcent: procent)
                .rotation(.degrees(-90))
                .fill(.black)
                .padding()
                .animation(.default, value: procent)
        }
    }
}

struct ProgressCircle_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCircle(procent: .constant(30))
    }
}
