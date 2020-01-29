//
//  ContentView.swift
//  WeSplit
//
//  Created by Gabriel Meira on 29.01.20.
//  Copyright © 2020 Gabriel Meira. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Hello, World!")
                }
            }
        .navigationBarTitle("SwiftUI")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
