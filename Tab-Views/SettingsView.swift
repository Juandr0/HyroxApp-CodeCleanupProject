//
//  SettingsView.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-01-24.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SettingsView: View {
    
    @AppStorage("notificationsEnabled") var notificationsEnabled = false
    @AppStorage("waterReminderEnabled") var waterReminderEnabled = false
    @AppStorage("standReminderEnabled") var standReminderEnabled = false
    
    @EnvironmentObject var signInRegister: SignInRegister
    
    var body: some View {
        
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Settings")
                    .font(.largeTitle)
                
                Toggle(isOn: $notificationsEnabled) {
                    Text("Enable Notifications")
                }
                
                if notificationsEnabled {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Reminders:")
                            .font(.headline)
                        
                        Toggle(isOn: $waterReminderEnabled) {
                            Text("Water Reminder")
                        }
                        
                        Toggle(isOn: $standReminderEnabled) {
                            Text("Stand Reminder")
                        }
                    }
                }
            }
            .padding()
            
            
            VStack{
                Spacer()
                Button(action: {
                    signInRegister.signOut()
                    
                }) {
                    Text("Sign Out")
                }
                .foregroundColor(.white)
                .font(.title3)
                .bold()
                
                .frame(maxWidth: .infinity)
                .padding()
                
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color("AccentColor"))
                )
                .frame(width: 200, height: 30)
                .padding(.horizontal)
                .padding(.bottom, 50)
            }
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
