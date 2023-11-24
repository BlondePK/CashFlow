//
//  CategorysJSON.swift
//  CashFlow
//
//  Created by joakim simonsen on 16/11/2023.
//

import Foundation
import SwiftUI





class Categorys: ObservableObject{
    
    
    
    func combineAllCategories(){
        if !Assets.isEmpty{
            AllCatgegories.append(Assets)
        }
        if !Liabilities.isEmpty{
            AllCatgegories.append(Liabilities)
        }
        AllCatgegories.append(Miscellaneus)
        AllCatgegories.append(Entertainment)
        AllCatgegories.append(FoodAndDringks)
        AllCatgegories.append(Housing)
        AllCatgegories.append(Income)
        AllCatgegories.append(LifeStyle)
        AllCatgegories.append(Savings)
        AllCatgegories.append(Transportation)
    }
    
    @Published var isCategorySelected: Bool = false 
    @Published var expandView: Bool = false 
    
    @Published var categorySelected: category = category(mainCategory: "Miscellaneus", categoryName: "Miscellaneous", icon: "archivebox.fill", colorInt: 0, asset: false, liability: false)
    
    @Published var CategoryColors: [Color] = [Color.primaryGreen, Color.red, Color.gray, Color.cyan, Color.yellow, Color.blue, Color.green, Color.pink, Color.indigo, Color.brown]
    
    
    
    @Published var AllCatgegories: [[category]] = []
    
    @Published var Assets: [category] = [
        category(mainCategory: "Assets", categoryName: "Investments", icon: "chart.line.uptrend.xyaxis", colorInt: 6, asset: true, liability: false)
    ]
    
    @Published var Liabilities: [category] = [
        category(mainCategory: "Liabilities", categoryName: "Subscriptions", icon: "play.square.stack.fill",colorInt: 3, asset: false, liability: true, subCategoryArray: [category.subCat.init(name: "Netflix")])
    ]

    @Published var Miscellaneus: [category] = [
        category(mainCategory: "Miscellaneus", categoryName: "Bank Cost", icon: "building.columns.fill", colorInt: 2, asset: false, liability: false),
        category(mainCategory: "Miscellaneus", categoryName: "Clothes", icon:"tshirt.fill",colorInt: 2, asset: false, liability: false),
        category(mainCategory: "Miscellaneus", categoryName: "Healthcare", icon: "medical.thermometer.fill",colorInt: 2, asset: false, liability: false),
        category(mainCategory: "Miscellaneus", categoryName: "Miscellaneous", icon: "archivebox.fill",colorInt: 2, asset: false, liability: false),
        category(mainCategory: "Miscellaneus", categoryName: "Student loan", icon: "graduationcap.fill",colorInt: 2, asset: false, liability: false),
        category(mainCategory: "Miscellaneus", categoryName: "Unknown", icon: "questionmark.circle.fill",colorInt: 2, asset: false, liability: false)
    ]
    @Published var Entertainment: [category] = [
        category(mainCategory: "Entertainment", categoryName: "Bowling", icon: "figure.bowling",colorInt: 3, asset: false, liability: false),
        category(mainCategory: "Entertainment", categoryName: "Cinema", icon: "movieclapper",colorInt: 3, asset: false, liability: false),
        category(mainCategory: "Entertainment", categoryName: "Concert", icon: "music.mic",colorInt: 3, asset: false, liability: false),
        category(mainCategory: "Entertainment", categoryName: "Electronics", icon: "bolt.fill",colorInt: 3, asset: false, liability: false),
        category(mainCategory: "Entertainment", categoryName: "Entertainment", icon: "face.smiling",colorInt: 3, asset: false, liability: false),
        category(mainCategory: "Entertainment", categoryName: "Gym", icon: "dumbbell.fill",colorInt: 3, asset: false, liability: false),
        category(mainCategory: "Entertainment", categoryName: "Hobby", icon: "paintbrush.fill",colorInt: 3, asset: false, liability: false),
        category(mainCategory: "Entertainment", categoryName: "NightClub", icon: "wineglass",colorInt: 3, asset: false, liability: false),
        category(mainCategory: "Entertainment", categoryName: "Sports", icon: "basketball.fill",colorInt: 3, asset: false, liability: false),
        category(mainCategory: "Entertainment", categoryName: "Subscriptions", icon: "play.square.stack.fill",colorInt: 3, asset: false, liability: false),
        category(mainCategory: "Entertainment", categoryName: "Vacation", icon: "beach.umbrella.fill",colorInt: 3, asset: false, liability: false),
        category(mainCategory: "Entertainment", categoryName: "Gaming", icon: "gamecontroller", colorInt: 3, asset: false, liability: false)
    ]

    @Published var FoodAndDringks: [category] = [
        category(mainCategory: "Food And Drinks", categoryName: "Candy", icon: "popcorn", colorInt: 4, asset: false, liability: false),
        category(mainCategory: "Food And Drinks", categoryName: "Coffee", icon: "mug", colorInt: 4, asset: false, liability: false),
        category(mainCategory: "Food And Drinks", categoryName: "Drinks", icon: "wineglass", colorInt: 4, asset: false, liability: false),
        category(mainCategory: "Food And Drinks", categoryName: "Food", icon: "fork.knife", colorInt: 4, asset: false, liability: false),
        category(mainCategory: "Food And Drinks", categoryName: "Groceries", icon: "bag", colorInt: 4, asset: false, liability: false),
        category(mainCategory: "Food And Drinks", categoryName: "Restaurant", icon: "frying.pan", colorInt: 4, asset: false, liability: false),
        category(mainCategory: "Food And Drinks", categoryName: "Tobacco", icon: "nosign", colorInt: 4, asset: false, liability: false)
    ]
    @Published var Housing: [category] = [
        category(mainCategory: "Housing", categoryName: "Bank", icon: "building.columns", colorInt: 5, asset: false, liability: false),
        category(mainCategory: "Housing", categoryName: "Bills", icon: "dollarsign.arrow.circlepath", colorInt: 5, asset: false, liability: false),
        category(mainCategory: "Housing", categoryName: "Electricity", icon: "bolt", colorInt: 5, asset: false, liability: false),
        category(mainCategory: "Housing", categoryName: "Home Supplies", icon: "washer", colorInt: 5, asset: false, liability: false),
        category(mainCategory: "Housing", categoryName: "Housing", icon: "house.and.flag", colorInt: 5, asset: false, liability: false),
        category(mainCategory: "Housing", categoryName: "insurance", icon: "suit.heart.fill", colorInt: 5, asset: false, liability: false),
        category(mainCategory: "Housing", categoryName: "Internet", icon: "wifi", colorInt: 5, asset: false, liability: false),
        category(mainCategory: "Housing", categoryName: "Loan", icon:  "norwegiankronesign.circle", colorInt: 5, asset: false, liability: false),
        category(mainCategory: "Housing", categoryName: "Maintenance", icon: "hammer", colorInt: 5, asset: false, liability: false),
        category(mainCategory: "Housing", categoryName: "Rent", icon: "house.fill", colorInt: 5, asset: false, liability: false),
        category(mainCategory: "Housing", categoryName: "Service", icon: "shippingbox", colorInt: 5, asset: false, liability: false),
        category(mainCategory: "Housing", categoryName: "TV", icon: "play.tv", colorInt: 5, asset: false, liability: false),
        category(mainCategory: "Housing", categoryName: "Taxes", icon: "percent", colorInt: 5, asset: false, liability: false),
        category(mainCategory: "Housing", categoryName: "Telephone", icon: "candybarphone", colorInt: 5, asset: false, liability: false),
        category(mainCategory: "Housing", categoryName: "Water", icon: "drop", colorInt: 5, asset: false, liability: false)
    ]

    @Published var Income: [category] = [
        category(mainCategory: "Income", categoryName: "Child benefit", icon: "figure.and.child.holdinghands", colorInt: 6, asset: false, liability: false),
        category(mainCategory: "Income", categoryName: "Income", icon: "dollarsign", colorInt: 6, asset: false, liability: false),
        category(mainCategory: "Income", categoryName: "Interest", icon: "building.columns", colorInt: 6, asset: false, liability: false),
        category(mainCategory: "Income", categoryName: "Investments", icon: "chart.line.uptrend.xyaxis", colorInt: 6, asset: true, liability: false),
        category(mainCategory: "Income", categoryName: "Pension", icon: "sun.rain.fill", colorInt: 6, asset: false, liability: false),
        category(mainCategory: "Income", categoryName: "Salary", icon: "case", colorInt: 6, asset: false, liability: false)
    ]

    @Published var LifeStyle: [category] = [
        category(mainCategory: "Lifestyle", categoryName: "Chaity", icon: "arrow.up.heart.fill", colorInt: 7, asset: false, liability: false),
        category(mainCategory: "Lifestyle", categoryName: "Child care", icon: "figure.child.circle", colorInt: 7, asset: false, liability: false),
        category(mainCategory: "Lifestyle", categoryName: "Community", icon: "figure.2.and.child.holdinghands", colorInt: 7, asset: false, liability: false),
        category(mainCategory: "Lifestyle", categoryName: "Dentist", icon: "face.smiling", colorInt: 7, asset: false, liability: false),
        category(mainCategory: "Lifestyle", categoryName: "Doctor", icon:  "stethoscope", colorInt: 7, asset: false, liability: false),
        category(mainCategory: "Lifestyle", categoryName: "Education", icon: "book", colorInt: 7, asset: false, liability: false),
        category(mainCategory: "Lifestyle", categoryName: "Gift", icon: "gift", colorInt: 7, asset: false, liability: false),
        category(mainCategory: "Lifestyle", categoryName: "Hotel", icon: "bed.double", colorInt: 7, asset: false, liability: false),
        category(mainCategory: "Lifestyle", categoryName: "Lifestyle", icon: "star", colorInt: 7, asset: false, liability: false),
        category(mainCategory: "Lifestyle", categoryName: "Pet", icon: "pawprint", colorInt: 7, asset: false, liability: false),
        category(mainCategory: "Lifestyle", categoryName: "Pharmacy", icon: "pills.fill", colorInt: 7, asset: false, liability: false),
        category(mainCategory: "Lifestyle", categoryName: "Shopping", icon: "cart", colorInt: 7, asset: false, liability: false),
        category(mainCategory: "Lifestyle", categoryName: "Travel", icon: "airplane", colorInt: 7, asset: false, liability: false),
        category(mainCategory: "Lifestyle", categoryName: "Work", icon: "folder", colorInt: 7, asset: false, liability: false)
    ]

    @Published var Savings: [category] = [
        category(mainCategory: "Savings", categoryName: "Emergency Savings", icon:  "star.fill", colorInt: 8, asset: false, liability: false),
        category(mainCategory: "Savings", categoryName: "Savings", icon: "building.columns.fill", colorInt: 8, asset: false, liability: false),
        category(mainCategory: "Savings", categoryName: "Vacation savings", icon: "figure.sailing", colorInt: 8, asset: false, liability: false)
    ]

    @Published var Transportation: [category] = [
        category(mainCategory: "Transportation", categoryName: "Car costs", icon: "car", colorInt: 9, asset: false, liability: false),
        category(mainCategory: "Transportation", categoryName: "Car insurance", icon: "list.bullet.rectangle.portrait", colorInt: 9, asset: false, liability: false),
        category(mainCategory: "Transportation", categoryName: "Flight", icon: "airplane.departure", colorInt: 9, asset: false, liability: false),
        category(mainCategory: "Transportation", categoryName: "Gas", icon: "fuelpump", colorInt: 9, asset: false, liability: false),
        category(mainCategory: "Transportation", categoryName: "Parking", icon: "parkingsign", colorInt: 9, asset: false, liability: false),
        category(mainCategory: "Transportation", categoryName: "Public transport", icon: "train.side.front.car", colorInt: 9, asset: false, liability: false),
        category(mainCategory: "Transportation", categoryName: "Repair", icon: "wrench.and.screwdriver.fill", colorInt: 9, asset: false, liability: false),
        category(mainCategory: "Transportation", categoryName: "Taxi", icon: "car.side", colorInt: 9, asset: false, liability: false),
        category(mainCategory: "Transportation", categoryName: "Transportation", icon: "cablecar", colorInt: 9, asset: false, liability: false)
    ]

}
