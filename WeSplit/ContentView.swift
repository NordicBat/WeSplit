//
//  ContentView.swift
//  WeSplit
//
//  Created by Gabriel Meira on 29.01.20.
//  Copyright © 2020 Gabriel Meira. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var amountPeople = 2
    @State private var tipPercentage = 2

    let tipRange = [10, 15, 20, 25, 0]

    var totalPerPerson: Double {
        let peopleCount = Double(amountPeople + 2)
        let selecteTip = Double(tipRange[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = orderAmount / 100 * selecteTip
        let totalSum = orderAmount + tipValue
        let perPeson = totalSum / peopleCount

        return perPeson
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    Picker("Number of People:", selection: $amountPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }

                Section(header: Text("How much would you like to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipRange.count) {
                            Text("\(self.tipRange[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section {
                    Text("$ \(totalPerPerson, specifier: "%.2f")")
                }
            }
        .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
