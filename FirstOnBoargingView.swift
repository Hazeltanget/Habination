//
//  FirstOnBoargingView.swift
//  Habination
//
//  Created by Darya Zhitova on 11.07.2022.
//

import SwiftUI

struct FirstOnBoargingView: View {
    
    @State private var progress: Int = 25
    @State private var currentStep = 1
    
    var body: some View {
        VStack {
            background(.gray)

            Header()

            Description()
            
            //Grid()
            
        }
    }
    
    @ViewBuilder
    private func Header() -> some View {
        HStack {
            Text("Welcome!")
                .font(.system(size: 17))
                .foregroundColor(Color.black)

            Spacer()

            Text("Step \(currentStep) of 4")
                .font(.system(size: 17))
                .foregroundColor(.black)


            ZStack {
                ProgressCircle(procent: $progress)
                    .frame(width: 25, height: 25)
                    .animation(.default, value: self.progress)
            }
            .padding(.leading, 8)
        }
        .padding()
    }

    @ViewBuilder
    private func Description() -> some View {
        VStack(alignment: .leading) {
            Text("Change your life")
                .foregroundColor(.black)

            Text("Create new habits and follow\nthem to feel yourself better")
                .foregroundColor(.gray)
        }
        .font(.system(size: 17))
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct FirstOnBoargingView_Previews: PreviewProvider {
    static var previews: some View {
        FirstOnBoargingView()
    }
}
