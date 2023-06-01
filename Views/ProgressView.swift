//
//  PastWorkOutView.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-01-25.
//

import SwiftUI
import Firebase

// Logged on users data should be showing only for that user

struct ProgressView: View {
    
    @ObservedObject var userData = DatabaseHandler()
    
    var body: some View {
        
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Progress")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.black)
                
                List {
                    ForEach(userData.users) { user in
                        HStack {
                            Text(user.dateString)
                            Text(user.fitnessLevel)
                            Text(user.elapsedTimeString)
                            
                            Button(action: {
                                self.userData.delete(users: user)
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                            
                        }
                        .foregroundColor(.gray)
                        .bold()
                    }
                    
                }
                
                
            }
            .onAppear() {
                //fetches again on appear
                userData.fetchUserData()
            }
            
        }
        
    }
    
    
    struct ProgressView_Previews: PreviewProvider {
        static var previews: some View {
            ProgressView()
        }
    }
}
