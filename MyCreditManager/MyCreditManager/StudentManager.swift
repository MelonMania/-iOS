//
//  StudentManager.swift
//  MyCreditManager
//
//  Created by RooZin on 2022/11/28.
//

import Foundation

struct StudentManager {
    
    // 학생 추가
    func addStudent(name : String) {
        
        var isAble : Bool = true
        
        if name == "" {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        }
        
        for student in studentList {
            if student.name == name {
                print("\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
                isAble = false
            }
        }
        
        if isAble {
            let new = Student(name: name, score: nil, subject: nil)
            
            studentList.append(new)
            print("\(name) 학생을 추가하였습니다.")
        }
    }
    
    // 학생 삭제
    func deleteStudent(name : String) {
        
        var isFind : Bool = false
        var removeIdx : [Int] = []
        for index in 0 ..< studentList.count {
            if studentList[index].name == name {
                isFind = true
                
                removeIdx.append(index)
            }
        }
        
        if isFind {
            removeIdx.reverse()
            
            for idx in removeIdx {
                studentList.remove(at: idx)
            }
            print("\(name) 학생을 삭제하였습니다.")
        }
        if isFind == false {
            print("\(name) 학생을 찾지 못했습니다.")
        }
    }
    
    // 성적 추가
    func addScore(input : String) {
        
        var isFind : Bool = false
        var isUpdate : Bool = false
        var isFirst : Bool = true
        
        var saveIndex : Int?
        var studentCnt : Int = 0
        
        let splited : [String] = input.components(separatedBy: " ")
        
        if splited.count == 3 {
            for index in 0 ..< studentList.count {
                if studentList[index].name! == splited[0] {
                    isFind = true
                    saveIndex = index
                    
                    if let subject = studentList[index].subject {
                        
                        if subject == splited[1] {
                            isUpdate = true
                            studentList[index].score = splited[2]
                            print("\(splited[0]) 학생의 \(splited[1]) 과목이 \(splited[2])로 추가(변경)되었습니다.")
                        }
                    }
                }
            }
            
            if isUpdate == false && isFind == true {
                
                if studentList[saveIndex!].subject == nil {
                    studentList[saveIndex!].score = splited[2]
                    studentList[saveIndex!].subject = splited[1]
                    isFirst = false
                } else {
                    let newScore = Student(name: splited[0], score: splited[1], subject: splited[2])
                    
                    studentList.append(newScore)
                }

                print("\(splited[0]) 학생의 \(splited[1]) 과목이 \(splited[2])로 추가(변경)되었습니다.")
            } else {
                print("\(splited[0]) 학생을 찾지 못했습니다.")
            }
        } else {
            print("입력이 잘못되었습니다.")
        }
    }
    
    // 성적 삭제
    func deleteScore(input : String) {
        
        var isFind : Bool = false
        
        let splited : [String] = input.components(separatedBy: " ")
        
        if splited.count == 2 {
            for index in 0 ..< studentList.count {
                if (studentList[index].name! == splited[0]) && (studentList[index].subject! == splited[1]) {
                    isFind = true
                    
                    studentList[index].score = nil
                    
                    print("\(splited[0]) 학생의 \(splited[1]) 과목의 성적이 삭제되었습니다.")
                }
            }
            
            if isFind == false {
                print("\(splited[0]) 학생을 찾지 못했습니다.")
            }
        } else {
            print("입력이 잘못되었습니다.")
        }
    }
    
    // 평점 보기
    func showStudentRate(name : String) {
        
        var isFind : Bool = false
        var saveScore : [String] = []
        
        for index in 0 ..< studentList.count {
            if name == studentList[index].name {
                isFind = true
                
                saveScore.append(studentList[index].score!)
                print("\(studentList[index].subject!) : \(studentList[index].score!)")
            }
        }
        
        if isFind {
            calcRate(scoreList: saveScore)
        } else {
            print("\(name) 학생을 찾지 못했습니다.")
        }
    }
    
    // 평점 계산기
    func calcRate(scoreList : [String]) {
        var total : Double = 0.0
        var rate : Double = 0
        
        for score in scoreList {
            switch (score) {
            case "A+" : total += 4.5
            case "A" : total += 4.0
            case "B+" : total += 3.5
            case "B" : total += 3.0
            case "C+" : total += 2.5
            case "C" : total += 2.0
            case "D+" : total += 1.5
            case "D" : total += 1.0
            case "F" : total += 0
                
            default : print("잘못된 성적")
            }
        }
        
        rate = total / Double(scoreList.count)
        print("평점 : \(rate)")
    }
}
