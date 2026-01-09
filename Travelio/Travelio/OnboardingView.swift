//
//  OnboardingView.swift
//  Travelio
//
//  Created by Neosoft on 09/01/26.
//

import SwiftUI
struct OnboardingItem: Hashable {
    var imageName: String
    var title: String
    var description: String
    var tag: Int
}

struct OnboardingView: View {
    @State var activeSlide: Int = 0;
    @Environment(\.colorScheme) var colorScheme
    
    var slide: [OnboardingItem] = [
        OnboardingItem(imageName: "onboarding_slide_1",
                       title: "Explore Destinations",
                       description: "Discover the places for your trip in the world and feel great.",
                       tag: 0),
        
        OnboardingItem(imageName: "onboarding_slide_2",
                       title: "Choose a Destination",
                       description: "Select a place for your trip easily and know the exact cost of the tour.",
                       tag: 1),

        OnboardingItem(
            imageName: "onboarding_slide_3",
            title: "Fly to Desitination",
            description: "Finally, get ready for the tour and go to your desire destination.",
            tag: 2)
    ]
    
    var body: some View {
        VStack {
            TabView(selection: $activeSlide) {
                ForEach(slide, id: \.self) { slide in
                    onboardingItem(onboardingItem: slide).tag(slide.tag)
                }
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        
        VStack {
            HStack {
                ForEach(slide, id: \.self) { slide in
                    RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                        .frame(width: slide.tag == activeSlide ? 60: 20, height: 11)
                        .foregroundStyle(slide.tag == activeSlide ? Color("green") : Color("grey"))
                        .animation(.default, value: activeSlide)
                        
                }
            }
        }
        NavigationLink(destination: SignInView()) {
            VStack {
                Image(systemName: "arrow.right")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color("green"))
                    .frame(width: 20, height: 20)
                    .bold()
            }
            .frame(width: 64, height: 64)
            .background(colorScheme == .dark ? Color(.secondarySystemBackground) : Color(.systemBackground) )
            .cornerRadius(84)
            .shadow(color: .primary.opacity(Double(0.1)), radius: 30, x: 4, y: 16)
            .scaleEffect(activeSlide == 2 ? 1 : 0)
            .animation(.default, value: activeSlide)
        }
        
    }
}


struct onboardingItem: View {
    var onboardingItem: OnboardingItem?
    
    var body: some View {
        VStack {
            Image(onboardingItem?.imageName ?? "")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width * 0.65, height: UIScreen.main.bounds.width * 0.65)
            
            Text(onboardingItem?.title ?? "")
                .bold()
                .font(.title)
                .padding(.top, 20)
            
            Text(onboardingItem?.description ?? "")
                .font(Font.system(size: 20))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color.gray)
        }
    }
}
#Preview {
    OnboardingView()
}
