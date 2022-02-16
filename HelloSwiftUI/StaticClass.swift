//
// Created by Sergey Brazhnik on 06.07.2021.
//

import Foundation
import Combine

public class StaticClass{
    static var staticMember: StaticClass = StaticClass(counter: 0)

    var todaSyda = PassthroughSubject<String,Never>()

    public var counter: Int

    private init(counter: Int) {
        self.counter = counter
    }

    func getPublishee() -> AnyPublisher<String, Never>{
        AnyPublisher<String, Never>(Just("Init"))
    }




}