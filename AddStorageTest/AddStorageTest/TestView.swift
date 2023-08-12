//
//  TestView.swift
//  CharmTrueRealFact
//
//  Created by JOHNNY_MAC_1 on 2023/07/26.
//

import SwiftUI

struct TotalType: Codable {
    var iTest: Int
    var strTest: String
    var dTest: Double
    var fTest: Float
    var bTest: Bool
    var sTest: CShort
    var lTest: CLongLong
    var uiTest: UInt
    var uRLTest: URL
}

let totalType = TotalType(iTest: 1, strTest: "2", dTest: 3.3, fTest: 4.4, bTest: true, sTest: 6, lTest: 7, uiTest: 8, uRLTest: URL(filePath: "9"))
//let totalType = TotalType(iTest: 1, strTest: "2", dTest: 3.3, fTest: 4.4, bTest: true, cTest: "5", sTest: 6, lTest: 7, uiTest: 8, uRLTest: URL(filePath: "9"))

//extension AppStorage {
//    init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value == TotalType {
//        self.init(wrappedValue: wrappedValue, key, store: UserDefaults.standard )
//    }
//}

struct TestView: View {
//    @AppStorage("isTrue") private var isTrue: Int = 15
    @AppStorage("isPresented") private var isFalse: Double = 15.15
    @AppStorage("isPresented") private var isString: String = "15.15"
    @AppStorage("isPresented") private var isBool: Bool = false
    @AppStorage("isPresented") private var isTrue: Int = 15
//    @AppStorage("testingStruct") private var testingStruct: Data? = totalType
    @AppStorage("testingStruct") private var data: Data?
    @State private var testingStruct = totalType
    
    var body: some View {
        VStack {
            Text("\(isTrue)")
            Stepper("1", value: $isTrue)
            Text("\(isFalse)")
            Stepper("2", value: $isFalse, step: 1.5)
            Text("\(isString)")
//            Text("\(isBool)")
            Button {
//                doModifyUserDefault()
                doBringStore()
            } label: {
                Text("Apple is thief")
            }

        }
        .onAppear {
            loadData()
            saveData()
        }
    }
    
    private func loadData() {
        if let data = data {
            do {
                // Decode the Data back into the customData struct
                testingStruct = try JSONDecoder().decode(TotalType.self, from: data)
            } catch {
                print("Error decoding data: \(error)")
            }
        }
    }
    
    private func saveData() {
        do {
            // Encode the customData into Data
            var data = try JSONEncoder().encode(data)
            // Save the encoded Data to UserDefaults using @AppStorage
            self.data = data
        } catch {
            print("Error encoding data: \(error)")
        }
    }
    
    func doModifyUserDefault(){
        UserDefaults.standard.set("Go away", forKey: "isPresented")
    }
    
    func doBringStore(){
        print("\(UserDefaults.standard.dictionaryRepresentation())")
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
