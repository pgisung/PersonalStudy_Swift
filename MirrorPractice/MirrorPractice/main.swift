//
//  main.swift
//  MirrorPractice
//
//  Created by JOHNNY_MAC_1 on 2023/07/08.
//

import Foundation

struct StructExample: protocolA {
    var iExample: Int
    var dExample: Double
    var strExample: String
    var arrExample: [String]
    var closureStruct: () -> Int = { () in
        return 0
    }
    
    init() {
        iExample = 10
        dExample = 3.3
        strExample = "OnStruct"
        arrExample = ["First", "Second", "Third"]
    }
    
    @discardableResult func funcStruct () -> Int {
        let functionName = #function
        let functionNameWithoutParameters = functionName.components(separatedBy: "(")[0]
        print("\(functionNameWithoutParameters)")
        return 0
    }
}

class ClassExample {
    var iExample: Int
    var dExample: Double
    var strExample: String
    var arrExample: [String]
    var closureClass: () -> Int = { () in
        return 0
    }
    
    init() {
        iExample = 20
        dExample = 6.6
        strExample = "OnClass"
        arrExample = ["Fourth", "Fifth", "Sixth"]
    }
    
    @discardableResult func funcClass () -> Int {
        let functionName = #function
        let functionNameWithoutParameters = functionName.components(separatedBy: "(")[0]
        print("\(functionNameWithoutParameters)")
        return 0
    }
}

enum EnumExample: Int, CaseIterable {
    case caseExample1 = 0
    case caseExample2
    case caseExample3
}

var objStructExample = StructExample()
let objClassExample = ClassExample()
let objEnumExample = EnumExample.allCases

let mirrorStructExample = Mirror(reflecting: objStructExample)
let mirrorClassExample = Mirror(reflecting: objClassExample)

/// struct
print("-----Struct-----")
print(objStructExample)
print(objStructExample.arrExample)
objStructExample.funcStruct()
print(type(of:objStructExample))
print(objStructExample.funcStruct)
print(type(of:objStructExample.funcStruct))
print(objStructExample.closureStruct)
print(type(of:objStructExample.closureStruct))
print("-----Struct-----\n")


/// class
print("-----Class-----")
print(objClassExample)
print(objClassExample.arrExample)
objClassExample.funcClass()
print(type(of:objClassExample))
print(objClassExample.funcClass)
print(type(of:objClassExample.funcClass))
print(objClassExample.closureClass)
print(type(of:objClassExample.closureClass))
print("-----Class-----\n")

/// enum
print("-----Enum-----")
print(objEnumExample)
print(type(of:objEnumExample))
print(type(of:EnumExample.caseExample1))
print(type(of:EnumExample.caseExample1.rawValue))
print("-----Enum-----\n")

/// struct mirror
print("-----Struct Mirror-----")
print(mirrorStructExample)
for element in mirrorStructExample.children {
    print("self: \(element.self), label: \(element.label ?? "none"), value: \(element.value)")
    print("type of element: \(type(of:element.value))")
    //    if let elementName = element.label {
    //        print("\(elementName)")
    //    }
}
print(mirrorStructExample.subjectType)
print(mirrorStructExample.customMirror.subjectType)
print(mirrorStructExample.displayStyle.customMirror.children)
print("-----Struct Mirror-----\n")


/// class mirror
print("-----Class Mirror-----")
print(mirrorClassExample)
for element in mirrorClassExample.children {
    print("self: \(element.self), label: \(element.label ?? "none"), value: \(element.value)")
    print("type of element: \(type(of:element.value))")
    //    if let elementName = element.label {
    //        print("\(elementName)")
    //    }
}
print(mirrorClassExample.subjectType)
print(mirrorClassExample.customMirror.subjectType)
print(mirrorClassExample.displayStyle.customMirror.children)
print("-----Class Mirror-----\n")

/// enum mirror
print("-----Enum Mirror-----")
let mirrorEnumExample = Mirror(reflecting: objEnumExample)
print(mirrorEnumExample)
for element in mirrorEnumExample.children {
    print("self: \(element.self), label: \(element.label ?? "none"), value: \(element.value)")
    print("type of element: \(type(of:element.value))")
    //    if let elementName = element.label {
    //        print("\(elementName)")
    //    }
}
for caseExample in objEnumExample {
    let mirrorCaseExample = Mirror(reflecting: caseExample)
    print(mirrorCaseExample)
    for element in mirrorCaseExample.children {
        print("self: \(element.self), label: \(element.label ?? "none"), value: \(element.value)")
        print("type of element: \(type(of:element.value))")
        //    if let elementName = element.label {
        //        print("\(elementName)")
        //    }
    }
}
print("-----Enum Mirror-----\n")

//func save<T>(origin :T, modified :T) {
//    let origin = origin
//    let modified = modified
//
//    let mirrorOrigin = Mirror(reflecting: origin)
//    let mirrorModified = Mirror(reflecting: modified)
//
//    var index: Int = 0
//    for element in mirrorOrigin.children {
//        if element.value != mirrorModified.children[index].value {
//            // 저장해 둘이 다르니까
//            UserDefaults.standard.set(element.value, forKey: element.label)
//        }
//        index += 1
//    }
//}

// 예외처리
// 로깅
// 그 UI들을 우리가 인스턴스로 갖고있다...
// 즉 Mirror로 얘네도 가져와진다..
// UI 처리함수를 일반화시켜서 하나로 쓸수 있다. 공통된거
// isHidden
// Enable
// 서브 뷰라던가 그런 류의 집합


//    let mirrorObj = Mirror(reflecting: object)
//    for child in mirrorObj.children{
//        guard element.value else {
//
//        }
//        UserDefaults.standard.set(element.value, forKey: element.label ?? "none")
//    }
//
//    for _ in 0...EnumExample.rawValue {
//
//    }
//}
//
//enum EnumExample: Int {
//    case one = 0
//    case two
//    case three
//    case four
//    case five
//}

protocol protocolA {
    
}
protocol protocolB {
    
}
protocol protocolC {
    
}

struct exampleA: protocolA {
    
}
struct exampleB: protocolA {
    
}
struct exampleD: protocolA {
    
}
struct exampleC: protocolB {
    
}
struct exampleE: protocolC {
    
}
struct exampleF: protocolC {
    
}

let arrStruct: [protocolA] = [
    StructExample(),
    exampleA(),
    exampleB(),
    exampleD(),
]

let obj: protocolA = arrStruct[3]

let testObj: StructExample = arrStruct[0] as! StructExample// 옵셔널 <<<

for testObj in arrStruct {
    switch type(of: testObj) {
    case is StructExample.Type:
        break
    case is exampleA.Type:
        break
    case is exampleB.Type:
        break
    case is exampleD.Type:
        break
    default:
        break
    }
}
