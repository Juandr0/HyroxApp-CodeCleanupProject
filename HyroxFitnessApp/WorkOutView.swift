//
//  ListView.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-01-11.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct WorkOutView: View {
    @EnvironmentObject var dataManager : DataManager
    @State var userIsLoggedIn = false
    
    @State var selectedTab: Tabs = .workout
    
    var body: some View {
        
        List(dataManager.users, id: \.id) { user in
            
            HStack{
                Text(user.fitnesslevel)
                Text(user.id)
            }
        }
        
        Spacer()
        Button(action: {
            signOut()
            
        }) {
            Text("Sign Out")
        }
        .fullScreenCover(isPresented: $userIsLoggedIn, content: {
            ContentView()
        })
        
        
        Spacer()
        
        CustomNavBarView(selectedTabs: $selectedTab)
            
    }
    
    func signOut() {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            print("User is signed out")
            userIsLoggedIn.toggle()
            
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
            
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkOutView()
    }
}
