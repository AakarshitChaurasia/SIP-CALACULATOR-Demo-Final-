
//  HistoryView.swift

//
//  Created by Aakarshit Chaurasia on 16/10/23.
//

import Foundation
import SwiftUI

struct HistoryView: View {
    @Environment(\.presentationMode) var presentationMode
    var totalAmount: Double
    var body: some View {
        VStack {
            Text("History")
            Spacer()
            Text("Total Return: \(totalAmount)")
            Spacer()
            Image(.thank)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .padding()
            Spacer()
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Done").tint(Color.appTheme)
            }
        }
    }
}
/*
struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(netReturn: netReturn)
    }
}*/

