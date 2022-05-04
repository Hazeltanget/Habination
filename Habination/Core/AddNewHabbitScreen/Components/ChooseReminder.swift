//
//  ChooseReminder.swift
//  HabbiTracker
//
//  Created by Денис Большачков on 31.03.2022.
//

import SwiftUI

struct ChooseReminder: View {
    
    var data = [String]()
    
    @Binding var selectedItems: Set<UUID>
    
    init(type: ChooseType, selectedItems: Binding<Set<UUID>>) {
        //        switch type {
        //        case .onDays:
        //            data = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]
        //            break
        //        case .onWeek:
        //            data = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]
        //            break
        //        case .onMonth:
        //            data = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]
        //            break
        //        case .onYear:
        //            data = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]
        //            break
        //        }
        //
        //data = [ChooseModel(title: "MON"), ChooseModel(title: "TUE"), ChooseModel(title: "WED"), ChooseModel(title: "THU"), ChooseModel(title: "FRI"), ChooseModel(title: "SAT"), ChooseModel(title: "SUN")]
        
        data = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]
        
        _selectedItems = selectedItems
    }
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false){
            HStack (spacing: 8) {
                
                
                ForEach(data, id: \.self){ element in
                    
                    ChooseItem(item: ChooseModel(title: element), selectedItems: $selectedItems)
                }
            }
        }
    }
}

enum ChooseType {
    case onDays, onWeek, onMonth, onYear
}

struct ChooseItem: View {
    
    var item: ChooseModel
    @Binding var selectedItems: Set<UUID>
    
    var isSelected: Bool {
        selectedItems.contains(item.id)
    }
    
    var body: some View {
        Button(action: {
            if isSelected{
                selectedItems.remove(item.id)
            } else {
                selectedItems.insert(item.id)
            }
        }){
            ZStack {
                
                if isSelected {
                    Circle()
                    .fill(Color.AccentColor)
                    .frame(width: 52, height: 52)
                
                    Text(item.title)
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                } else {
                    Circle()
                        .stroke()
                        .fill(Color.black.opacity(0.25))
                        .frame(width: 52, height: 52)
                    
                    Text(item.title)
                        .font(.system(size: 16))
                        .foregroundColor(Color.AccentColor)
                    
                }
                
            }
        }
    }
}

struct ChooseModel: Identifiable{
    var id = UUID()
    var title: String
}
