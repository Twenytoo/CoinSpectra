//
//  UIApplication + endEditing.swift
//  CoinSpectra
//
//  Created by Artem Lushchan on 2024-04-13.
//

import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
