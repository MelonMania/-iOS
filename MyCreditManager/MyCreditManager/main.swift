//
//  main.swift
//  MyCreditManager
//
//  Created by RooZin on 2022/11/27.
//

import Foundation

var isActive : Bool = true // 로직 계속 동작 할지 여부

var studentList : [Student] = [] // 학생 리스트

var mainObj = Main()
var studentManager = StudentManager()

while isActive {
    mainObj.mainLogic()
}



class Main {
    
    // 메인로직 실행
    func mainLogic() {
        print("원하는 기능을 입력해주세요")
        print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
        
        let selected = readLine()
        
        switch (selected) {
        case "1":
            print("추가할 학생의 이름을 입력해주세요")
          
            if let name = readLine() {
                studentManager.addStudent(name: name)
            } else {
                print("입력이 잘못되었습니다. 다시 확인해주세요.")
            }
            break
        case "2":
            print("삭제할 학생의 이름을 입력해주세요")
          
            if let name = readLine() {
                studentManager.deleteStudent(name: name)
            } else {
                print("입력이 잘못되었습니다. 다시 확인해주세요.")
            }
            break
        case "3":
            print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.")
            print("입력예) Mickey Swift A+")
            print("만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
          
            if let line = readLine() {
                studentManager.addScore(input: line)
            } else {
                print("입력이 잘못되었습니다. 다시 확인해주세요.")
            }
            break
        case "4":
            print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.")
            print("입력예) Mickey Swift")
          
            if let line = readLine() {
                studentManager.deleteScore(input: line)
            } else {
                print("입력이 잘못되었습니다. 다시 확인해주세요.")
            }
            break
        case "5":
            print("평점을 알고싶은 학생의 이름을 입력해주세요")
            
            if let name = readLine() {
                studentManager.showStudentRate(name: name)
            } else {
                print("입력이 잘못되었습니다. 다시 확인해주세요.")
            }
            break
        case "X":
            print("프로그램을 종료합니다...")
            isActive = false
        default :
            print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
            break
        }
    }
    
}


