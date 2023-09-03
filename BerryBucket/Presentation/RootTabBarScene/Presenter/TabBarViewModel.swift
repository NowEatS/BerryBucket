//
//  TabBarViewModel.swift
//  BerryBucket
//
//  Created by 태원 on 7/2/23.
//

import Combine

class TabBarViewModel: ObservableObject {
    @Published var selectedIndex: Int = 0
    
    func select(index: Int) {
        selectedIndex = index
        objectWillChange.send()
        print("select is called")
    }
}
