//
//  WelcomeView.swift
//  Travelio
//
//  Created by Neosoft on 09/01/26.
//

import SwiftUI

struct WelcomeView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack {
            VStack {
                Image("banana_shape_top")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
                Spacer()
                
                Text("Welcome")
                    .font(.system(size: 30))
                    .bold()
                Spacer()
                
                Image("banana_shape_bottom")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
            }
            
            VStack {
                Spacer()
                NavigationLink(destination: OnboardingView(), label: {
                    VStack {
                        Image(systemName: "arrow.right")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(Color("green"))
                            .frame(width: 25, height: 25, alignment: .bottom)
                            .bold()
                    }
                    .frame(width: 84, height: 84)
                    .background(colorScheme == .dark ? Color(.secondarySystemBackground) : Color(.systemBackground) )
                    .cornerRadius(80)
                    .foregroundStyle(Color.white)
                    .shadow(radius: 50)
                    .padding(.bottom, 80)
                    .padding(.trailing, 30)
                })
                .frame(minWidth: 80, maxWidth: .infinity, minHeight: 80, maxHeight: .infinity, alignment: .bottomTrailing)


            }
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    WelcomeView()
}
