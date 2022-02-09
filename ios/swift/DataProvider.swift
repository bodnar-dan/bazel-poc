// swiftlint:disable:this file_name
//
// Copyright (c) 2022 BBalance. All rights reserved.
//
// Copying this file via any medium without the prior written consent of BBalance is strictly prohibited.
// Proprietary and confidential.
//

import Combine
import Foundation
import DataCore
import UIKit

public struct SwiftStruct {
    public let intValue: Int
    public let floatValue: Float
}

public class DataProvider {
    private let dataController: DataController
    private let subject: PassthroughSubject<SwiftStruct, Never> = PassthroughSubject()

    public var output: AnyPublisher<SwiftStruct, Never> {
        subject.eraseToAnyPublisher()
    }

    public init() {
        self.dataController = DataController()

        dataController.delegate = self
    }

    public func start() {
        dataController.start()
    }
}

extension DataProvider: DataControllerDelegate {
    public func controller(
        _ controller: DataController,
        didOutputIntValue intValue: Int32,
        andFloatValue floatValue: Float
    ) {
        subject.send(SwiftStruct(intValue: Int(intValue), floatValue: floatValue))
    }
}
