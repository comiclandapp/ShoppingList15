//
//  ConfirmationAlerts.swift
//  ShoppingList
//
//  Created by Jerry on 12/16/20.
//  Copyright © 2020 Jerry. All rights reserved.

import SwiftUI

// i collect all the confirmation alerts here in one file.  there are three of them, although
// two of them are used in different places throughout the app; that's why they are all
// here and not distributed in different Views.
//
// please be sure to read through the file ConfirmationAlertProtocol.swift that describes
// how to set up alerts.


// MARK: - Confirm DELETE ITEM Alert

class ConfirmDeleteItemAlert: IdentifiableAlertItem {
	
	// the item to delete
	var item: Item
	
	// to function, we just need to know what item we're talking about, and how to do
	// the deletion as the destructive action.
	init(item: Item, destructiveCompletion: (() -> Void)?) {
		// init this object's custom data, then call its superclass's initializer
		self.item = item
		super.init()
		// now update appropriate messages and actions
		self.title = "Delete \'\(item.name)\'?"
		self.message = "Are you sure you want to delete the Item named \'\(item.name)\'? This action cannot be undone."
		self.destructiveAction = { Item.delete(item) }
		self.destructiveCompletion = destructiveCompletion
	}
}

// MARK: - Confirm MOVE ALL ITEMS OF LIST Alert

class ConfirmMoveAllItemsOffShoppingListAlert: IdentifiableAlertItem {
	
	init(destructiveCompletion: (() -> Void)?) {
		super.init()
		title = "Move All Items Off-List"
		destructiveAction = Item.moveAllItemsOffShoppingList
		self.destructiveCompletion = destructiveCompletion
	}
	
}

// MARK: - Confirm DELETE LOCATION Alert

struct ConfirmDeleteLocationAlert: ConfirmationAlertProtocol {
	var id = UUID()
	
	var location: Location
	
	var title: String { "Delete \'\(location.name)\'?" }
	
	var message: String {
		"Are you sure you want to delete the Location named \'\(location.name)\'? All items at this location will be moved to the Unknown Location.  This action cannot be undone."
	}
	
	func destructiveAction() {
		Location.delete(location)
	}
	
	var destructiveCompletion: (() -> Void)?
	var nonDestructiveCompletion: (() -> Void)?
	
	init(location: Location, destructiveCompletion: (() -> Void)? = nil) {
		self.location = location
		self.destructiveCompletion = destructiveCompletion
	}
	
}
