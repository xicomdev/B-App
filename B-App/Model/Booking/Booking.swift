//
//  Booking.swift
//  B-App
//
//  Created by Ankit Chhabra on 06/12/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import Foundation
class Booking: NSObject {
    var startDate = String()
    var endDate = String()
    var selectedCardId = Int()
    var noOFDays = Int()
    static var newBooking = Booking()
}
