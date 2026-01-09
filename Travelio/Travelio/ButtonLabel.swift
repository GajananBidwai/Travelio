//
//  ButtonLabel.swift
//  Travelio
//
//  Created by Neosoft on 09/01/26.
//

import SwiftUI

struct ButtonLabel: View {
    var isDisabled: Bool = false;
    var label: String = "";
    
    var body: some View {
        Text(label)
            .bold()
            .font(.title3)
            .foregroundColor(.white)
            .padding(.horizontal, 14)
            .frame(height: 57)
            .frame(maxWidth: .infinity)
            .background(isDisabled ? Color("darkgrey") : Color("green"))
            .cornerRadius(15)
    }
}

#Preview {
    ButtonLabel()
}
