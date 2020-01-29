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
    @State private var tipPercentage = ""

    var totalPerPerson: Double {
        let peopleCount = Double(amountPeople + 2)
        let orderAmount = Double(checkAmount) ?? 0
        let tip = Double(tipPercentage) ?? 0

        let tipValue = orderAmount / 100 * tip
        let totalSum = orderAmount + tipValue
        let perPeson = totalSum / peopleCount

        return perPeson
    }

    var totalCheck: String {
        let total = Double(checkAmount) ?? 0
         let tip = Double(tipPercentage) ?? 0
        let totalTip = total / 100 * tip

        return String(format: "Total: $%.2f Tips: $%.2f", total, totalTip)
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)

                    Picker("Number of people", selection: $amountPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }

                Section(header: Text("How much would you like to leave?")) {
                    TextField("Percentage %", text: $tipPercentage)
                        .keyboardType(.numberPad)
                }

                Section(header: Text("Amount per person:")) {
                    Text("$ \(totalPerPerson, specifier: "%.2f")")
                }

                Section(header: Text("Check Total:")) {
                    Text(totalCheck)
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
