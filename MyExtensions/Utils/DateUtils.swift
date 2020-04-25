//
//  DateUtils.swift
//  WToDo
//
//  Created by Shai Ariman on 20/11/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

class DateUtils {
    
    static let dateFormat = "dd-MM-yyyy"
    
    public let daysDescription = "Days"
    public let weeksDescription = "Weeks"
    public let monthsDescription = "Months"
    public let yearsDescription = "Years"
    
    public enum RepeatingToDosPeriods {
        case days
        case weeks
        case months
        case years
    }
    
    public var periods : [String]
    
    private var dateFormatter : DateFormatter? = nil
    private var calendar : Calendar
    
    init() {
        calendar = Calendar(identifier: .gregorian)
        calendar.timeZone =  TimeZone.current
        periods = [daysDescription, weeksDescription, monthsDescription, yearsDescription]
    }
    
    private static var sharedDateUtils: DateUtils = {
        let dateUtils = DateUtils()
        return dateUtils
    }()

    private static var dateUtilsInstance = DateUtils()
    public static var shared : DateUtils {
        get {
            return dateUtilsInstance
        }
    }
    
    private func getFormatter() -> DateFormatter {
        if dateFormatter == nil {
            dateFormatter = DateFormatter()
            dateFormatter!.dateFormat = DateUtils.dateFormat
        }
        
        return dateFormatter!
    }
    
    public func getStringFrom(date : Date) -> String {
        let dateResult = getFormatter().string(from: date)
        return dateResult
    }
    
    public func getDateFor(dateString : String) -> Date? {
        var dateResult : Date? = nil
        if !dateString.isEmpty {
            dateResult = getFormatter().date(from: dateString)
        }
        return dateResult
    }
    
    func getTodayDate() -> Date {
        let date = getDateAdding(days: 0)
        return date
    }
    
    func getTodayDateAsString() -> String {
        return getStringFrom(date: getTodayDate())
    }
    
    func isDateToday(date : Date) -> Bool {
        return calendar.isDateInToday(date)
    }
    
    func getTomorrowDate() -> Date {
        let date = getDateAdding(days: 1)
        return date
    }
    
    func getTomorrowDateAsString() -> String {
        return getStringFrom(date: getTomorrowDate())
    }
    
    func getDateAdding(days : Int) -> Date {
        var timeInterval = DateComponents()
        timeInterval.day = days
        return calendar.date(byAdding: timeInterval, to: Date())!
    }
    
    func getDateAdding(months : Int) -> Date {
        var timeInterval = DateComponents()
        timeInterval.month = months
        return calendar.date(byAdding: timeInterval, to: Date())!
    }
    
    
    // Repeating ToDo Dates
    
    private func getPeriodBy(periodDescription : String) -> Calendar.Component {
        
        var period : Calendar.Component
        
        switch periodDescription {
            case daysDescription:
                period = .day
            case weeksDescription:
                period = .weekOfMonth
            case monthsDescription:
                period = .month
            case yearsDescription:
                period = .year
            default:
                period = .day
        }
        
        return period
    }
    
    public func getNextRepeatingDate(withPeriod periodDescription : String, number : Int, dateToRepeatFrom : Date?) -> Date? {
        let period = getPeriodBy(periodDescription: periodDescription)
        var date : Date
        if dateToRepeatFrom == nil {
            date = getTodayDate()
        } else {
            date = dateToRepeatFrom!
            let todayDate = DateUtils.shared.getTodayDate()
            if date < todayDate {
                date = todayDate
            }
        }

        if let newDate = Calendar.current.date(byAdding: period, value: number, to: date) {
            return newDate
        }
        
        return nil
    }
}
