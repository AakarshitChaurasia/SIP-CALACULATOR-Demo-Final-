
//  SettingView.swift

//
//  Created by Aakarshit Chaurasia on 16/10/23.
//

import Foundation
import SwiftUI

struct SettingView: View {
    @EnvironmentObject var settingsViewModel: SettingViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var themeType = AppUserDefaults.preferredTheme
    @State private var showShareSheet = false
    
    var body: some View {
            Form {
                Section(header: Text("Preferences")) {
                    
                    ColorPicker("Modify Color", selection:$settingsViewModel.appThemeColor.onChange(colorChange))
                   
                    HStack{
                        Text("Theme")
                        Spacer()
                        Picker("", selection: $themeType.onChange(themeChange)){
                            Text("System").tag(0)
                            Text("Light").tag(1)
                            Text("Dark").tag(2)
                        }
                        .fixedSize()
                        .pickerStyle(.segmented)
                    }
                }
                
                Section(header: Text("Support"),
                        footer: SettingsRowView(name: "Version", content: "0.0.1")
                                ) {

                    Button(action: {
                    }) {
                        Text("Send Feedback")
                            .tint(Color.appTheme)
                    }
                    Button(action: {
                        showShareSheet.toggle()
                    }) {
                        Text("Share This App")
                            .tint(Color.appTheme)
                    }
                    .sheet(isPresented: $showShareSheet) {
                        ShareSheet(activityItems: [URL(string: "https://apps.apple.com/in/app/")!])
                    }

                    Button(action: {
                        rateApp()
                    }) {
                        Text("Rate Us")
                            .tint(Color.appTheme)
                    }
                }
            }
            .navigationTitle("Settings")
    }
    
    func rateApp() {
        guard let url = URL(string: "https://apps.apple.com/in/app/") else {
            return
        }
        UIApplication.shared.open(url)
    }
    
    func themeChange(_ tag: Int){
        settingsViewModel.changeAppTheme(theme: tag)
    }
    
    func colorChange(_ color: Color){
        settingsViewModel.changeAppColor(color: color)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
            .environmentObject(SettingViewModel())
    }
}


struct SettingsLabelView: View {
    
    var labelText: String
    var labelImage: String
    
    var body: some View {
        HStack {
            Text(labelText.uppercased())
            Spacer()
            Image(systemName: labelImage )
                .font(.headline)
        }
    }
}


struct SettingsRowView: View {
    
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    
    var body: some View {
        VStack {
            HStack{
                Text(LocalizedStringKey(name)).foregroundColor(.gray)
                Spacer()
                if content != nil {
                    Text(content!)
                }  else {
                    EmptyView()
                }
            }
        }
    }
}

struct ShareSheet: UIViewControllerRepresentable {
    let activityItems: [Any]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let appURL = activityItems.first as? URL
        let shareMessage = """
        Hey! Check out this app called SIP-Calculator. It makes your SIP calculation super easy. Download it now: \(appURL?.absoluteString ?? "")
        """

        let controller = UIActivityViewController(activityItems: [shareMessage], applicationActivities: nil)
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
