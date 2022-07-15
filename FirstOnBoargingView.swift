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
        ZStack {
            VStack {
                
                Header()
                
                Spacer()
                
                Description()
                
                Grid()
                
                Spacer()
                
                HStack {
                    
                    BigButton(title: "Skip", color: .white, fontColor: .black) {
                        print("Skip")
                    }
                    .cornerRadius(15)
                    
                    BigButton(title: "Next", color: .accentColor) {
                        print("Next")
                    }
                    .cornerRadius(14)
                }
                .padding([.leading, .trailing], 24)
                
                HStack {
                    
                    Text("Already have an account?")
                        .foregroundColor(.gray)
                    
                    Button("Log in") {
                        print("login")
                    }
                    .foregroundColor(.blue)
                }
                .font(.system(size: 12))
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("OnBoardingBackground"))
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
            .padding(.leading, 16)
        }
        .padding()
    }
    
    @ViewBuilder
    private func Description() -> some View {
        VStack(alignment: .leading) {
            
            Text("Change your life")
                .foregroundColor(.black)
                .padding(.bottom, 2)
            
            Text("Create new habits and follow\nthem to feel yourself better")
                .foregroundColor(.gray)
        }
        .lineSpacing(3)
        .font(.system(size: 17))
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

extension Color {
    static let onBoardingBack = Color(red: 239, green: 239, blue: 239)
}

struct FirstOnBoargingView_Previews: PreviewProvider {
    static var previews: some View {
        FirstOnBoargingView()
    }
}
