//
//  Router.swift
//  Radix
//
//  Created by Jonathan Mora on 15/05/25.
//

import SwiftUI
import Observation

public class AnyIdentifiable: Identifiable {

    public let destination: any Identifiable
    
    public init(destination: any Identifiable) {
        self.destination = destination
    }
}

@Observable
public final class Router {
    public var navigationPath = NavigationPath()
    public var sheetItems: Binding<AnyIdentifiable?> {
        Binding( get: { self.presentedSheetItem }, set: { self.presentedSheetItem = $0})
    }
    
    private var presentedSheetItem: AnyIdentifiable?
    
    public init() {}
    
    public func push(_ destination: any Hashable) {
        navigationPath.append(destination)
    }
    
    public func pop() {
        guard !navigationPath.isEmpty else { return }
        navigationPath.removeLast()
    }
    
    public func popToRoot() {
        navigationPath.removeLast(navigationPath.count)
    }
    
    public func presentSheet(_ destination: any Identifiable) {
        presentedSheetItem = AnyIdentifiable(destination: destination)
    }
    
    public func dismissSheet() {
        presentedSheetItem = nil
    }
}
