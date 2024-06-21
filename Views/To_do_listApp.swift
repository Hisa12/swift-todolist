//
//  To_do_listApp.swift
//  To do list
//
//  Created by Hisano Sato on 18/6/2024.
//
import FirebaseCore
import SwiftUI

@main
struct To_do_listApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
