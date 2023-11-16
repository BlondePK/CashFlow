//
//  CategorysJSON.swift
//  CashFlow
//
//  Created by joakim simonsen on 16/11/2023.
//

import Foundation
import SwiftUI


class Categorys: ObservableObject{
    
    struct category{
        var id = UUID().uuidString
        
        var mainCategory: String
        var categoryName: String
        var icon: String
        var colorInt: Int
        
        init(id: String = UUID().uuidString, mainCategory: String, categoryName: String, icon: String, colorInt: Int) {
            self.id = id
            self.mainCategory = mainCategory
            self.categoryName = categoryName
            self.icon = icon
            self.colorInt = colorInt
        }
    }
    
    func combineAllCategories(){
        AllCatgegories.append(Miscellaneus)
        AllCatgegories.append(Entertainment)
        AllCatgegories.append(FoodAndDringks)
        AllCatgegories.append(Housing)
        AllCatgegories.append(Income)
        AllCatgegories.append(LifeStyle)
        AllCatgegories.append(Savings)
        AllCatgegories.append(Transportation)
    }
    
    @Published var CategoryColors: [Color] = [Color.gray, Color.pink, Color.blue, Color.orange, Color.green, Color.red, Color.cyan, Color.purple]
    
    @Published var AllCatgegories: [[category]] = []

    @Published var Miscellaneus: [category] = [
        category(mainCategory: "Miscellaneus", categoryName: "Bank Cost", icon: "building.columns.fill", colorInt: 0),
        category(mainCategory: "Miscellaneus", categoryName: "Clothes", icon:"tshirt.fill",colorInt: 0),
        category(mainCategory: "Miscellaneus", categoryName: "Healthcare", icon: "medical.thermometer.fill",colorInt: 0),
        category(mainCategory: "Miscellaneus", categoryName: "Miscellaneous", icon: "archivebox.fill",colorInt: 0),
        category(mainCategory: "Miscellaneus", categoryName: "Student loan", icon: "graduationcap.fill",colorInt: 0),
        category(mainCategory: "Miscellaneus", categoryName: "Unknown", icon: "questionmark.circle.fill",colorInt: 0)
    ]
    @Published var Entertainment: [category] = [
        category(mainCategory: "Entertainment", categoryName: "Bowling", icon: "figure.bowling",colorInt: 1),
        category(mainCategory: "Entertainment", categoryName: "Cinema", icon: "movieclapper",colorInt: 1),
        category(mainCategory: "Entertainment", categoryName: "Concert", icon: "music.mic",colorInt: 1),
        category(mainCategory: "Entertainment", categoryName: "Electronics", icon: "bolt.fill",colorInt: 1),
        category(mainCategory: "Entertainment", categoryName: "Entertainment", icon: "face.smiling",colorInt: 1),
        category(mainCategory: "Entertainment", categoryName: "Gym", icon: "dumbbell.fill",colorInt: 1),
        category(mainCategory: "Entertainment", categoryName: "Hobby", icon: "paintbrush.fill",colorInt: 1),
        category(mainCategory: "Entertainment", categoryName: "NightClub", icon: "wineglass",colorInt: 1),
        category(mainCategory: "Entertainment", categoryName: "Sports", icon: "basketball.fill",colorInt: 1),
        category(mainCategory: "Entertainment", categoryName: "Subscriptions", icon: "play.square.stack.fill",colorInt: 1),
        category(mainCategory: "Entertainment", categoryName: "Vacation", icon: "beach.umbrella.fill",colorInt: 1),
        category(mainCategory: "Entertainment", categoryName: "Gaming", icon: "gamecontroller", colorInt: 1)
    ]

    @Published var FoodAndDringks: [category] = [
        category(mainCategory: "Food And Drinks", categoryName: "Candy", icon: "popcorn", colorInt: 2),
        category(mainCategory: "Food And Drinks", categoryName: "Coffee", icon: "mug", colorInt: 2),
        category(mainCategory: "Food And Drinks", categoryName: "Drinks", icon: "wineglass", colorInt: 2),
        category(mainCategory: "Food And Drinks", categoryName: "Food", icon: "fork.knife", colorInt: 2),
        category(mainCategory: "Food And Drinks", categoryName: "Groceries", icon: "bag", colorInt: 2),
        category(mainCategory: "Food And Drinks", categoryName: "Restaurant", icon: "frying.pan", colorInt: 2),
        category(mainCategory: "Food And Drinks", categoryName: "Tobacco", icon: "nosign", colorInt: 2)
    ]
    @Published var Housing: [category] = [
        category(mainCategory: "Housing", categoryName: "Bank", icon: "building.columns", colorInt: 3),
        category(mainCategory: "Housing", categoryName: "Bills", icon: "dollarsign.arrow.circlepath", colorInt: 3),
        category(mainCategory: "Housing", categoryName: "Electricity", icon: "bolt", colorInt: 3),
        category(mainCategory: "Housing", categoryName: "Home Supplies", icon: "washer", colorInt: 3),
        category(mainCategory: "Housing", categoryName: "Housing", icon: "house.and.flag", colorInt: 3),
        category(mainCategory: "Housing", categoryName: "insurance", icon: "suit.heart.fill", colorInt: 3),
        category(mainCategory: "Housing", categoryName: "Internet", icon: "wifi", colorInt: 3),
        category(mainCategory: "Housing", categoryName: "Loan", icon:  "norwegiankronesign.circle", colorInt: 3),
        category(mainCategory: "Housing", categoryName: "Maintenance", icon: "hammer", colorInt: 3),
        category(mainCategory: "Housing", categoryName: "Rent", icon: "house.fill", colorInt: 3),
        category(mainCategory: "Housing", categoryName: "Service", icon: "shippingbox", colorInt: 3),
        category(mainCategory: "Housing", categoryName: "TV", icon: "play.tv", colorInt: 3),
        category(mainCategory: "Housing", categoryName: "Taxes", icon: "percent", colorInt: 3),
        category(mainCategory: "Housing", categoryName: "Telephone", icon: "candybarphone", colorInt: 3),
        category(mainCategory: "Housing", categoryName: "Water", icon: "drop", colorInt: 3)
    ]

    @Published var Income: [category] = [
        category(mainCategory: "Income", categoryName: "Child benefit", icon: "figure.and.child.holdinghands", colorInt: 4),
        category(mainCategory: "Income", categoryName: "Income", icon: "dollarsign", colorInt: 4),
        category(mainCategory: "Income", categoryName: "Interest", icon: "building.columns", colorInt: 4),
        category(mainCategory: "Income", categoryName: "Investments", icon: "chart.line.uptrend.xyaxis", colorInt: 4),
        category(mainCategory: "Income", categoryName: "Pension", icon: "sun.rain.fill", colorInt: 4),
        category(mainCategory: "Income", categoryName: "Salary", icon: "case", colorInt: 4)
    ]

    @Published var LifeStyle: [category] = [
        category(mainCategory: "Lifestyle", categoryName: "Chaity", icon: "arrow.up.heart.fill", colorInt: 5),
        category(mainCategory: "Lifestyle", categoryName: "Child care", icon: "figure.child.circle", colorInt: 5),
        category(mainCategory: "Lifestyle", categoryName: "Community", icon: "figure.2.and.child.holdinghands", colorInt: 5),
        category(mainCategory: "Lifestyle", categoryName: "Dentist", icon: "face.smiling", colorInt: 5),
        category(mainCategory: "Lifestyle", categoryName: "Doctor", icon:  "stethoscope", colorInt: 5),
        category(mainCategory: "Lifestyle", categoryName: "Education", icon: "book", colorInt: 5),
        category(mainCategory: "Lifestyle", categoryName: "Gift", icon: "gift", colorInt: 5),
        category(mainCategory: "Lifestyle", categoryName: "Hotel", icon: "bed.double", colorInt: 5),
        category(mainCategory: "Lifestyle", categoryName: "Lifestyle", icon: "star", colorInt: 5),
        category(mainCategory: "Lifestyle", categoryName: "Pet", icon: "pawprint", colorInt: 5),
        category(mainCategory: "Lifestyle", categoryName: "Pharmacy", icon: "pills.fill", colorInt: 5),
        category(mainCategory: "Lifestyle", categoryName: "Shopping", icon: "cart", colorInt: 5),
        category(mainCategory: "Lifestyle", categoryName: "Travel", icon: "airplane", colorInt: 5),
        category(mainCategory: "Lifestyle", categoryName: "Work", icon: "folder", colorInt: 5)
    ]

    @Published var Savings: [category] = [
        category(mainCategory: "Savings", categoryName: "Emergency Savings", icon:  "star.fill", colorInt: 6),
        category(mainCategory: "Savings", categoryName: "Savings", icon: "building.columns.fill", colorInt: 6),
        category(mainCategory: "Savings", categoryName: "Vacation savings", icon: "figure.sailing", colorInt: 6)
    ]

    @Published var Transportation: [category] = [
        category(mainCategory: "Transportation", categoryName: "Car costs", icon: "car", colorInt: 7),
        category(mainCategory: "Transportation", categoryName: "Car insurance", icon: "list.bullet.rectangle.portrait", colorInt: 7),
        category(mainCategory: "Transportation", categoryName: "Flight", icon: "airplane.departure", colorInt: 7),
        category(mainCategory: "Transportation", categoryName: "Gas", icon: "fuelpump", colorInt: 7),
        category(mainCategory: "Transportation", categoryName: "Parking", icon: "parkingsign", colorInt: 7),
        category(mainCategory: "Transportation", categoryName: "Public transport", icon: "train.side.front.car", colorInt: 7),
        category(mainCategory: "Transportation", categoryName: "Repair", icon: "wrench.and.screwdriver.fill", colorInt: 7),
        category(mainCategory: "Transportation", categoryName: "Taxi", icon: "car.side", colorInt: 7),
        category(mainCategory: "Transportation", categoryName: "Transportation", icon: "cablecar", colorInt: 7)
    ]

}
