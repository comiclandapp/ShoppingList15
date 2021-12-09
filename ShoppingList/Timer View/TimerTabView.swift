//
//  TimerTabView.swift
//  ShoppingList
//
//  Created by Jerry on 7/19/20.
//  Copyright © 2020 Jerry. All rights reserved.
//

import SwiftUI

// this view is straighforward.  a time display plus three buttons.  the timer
// logic is found in GlobalTimer.swift

struct TimerTabView: View {
	
	@StateObject var instoreTimer = gInStoreTimer

	var body: some View {
			VStack {

				Spacer()
				
				Text("Elased Time")
					.font(.title)
				Text(timeString(accumulatedTime: instoreTimer.totalAccumulatedTime))
					.font(.custom("Times", size: 72))
					.foregroundColor(instoreTimer.isRunning ? .green : .gray)
				
				Spacer()
				
				HStack(spacing: 40) {
					Button(action: { instoreTimer.start() } ){
						Text("Start")
							.font(.title)
					}
					.disabled(instoreTimer.isRunning)
					Button(action: { instoreTimer.stop() } ){
						Text("Stop")
							.font(.title)
					}
					.disabled(!instoreTimer.isRunning)
					Button(action: { instoreTimer.reset() } ){
						Text("Reset")
							.font(.title)
					}
					.disabled(!instoreTimer.isStopped)
				}
				
				Spacer()
				
			}
			.navigationBarTitle("In-Store Timer")
		.onAppear { logAppear(title: "TimerTabView") }
		.onDisappear { logDisappear(title: "TimerTabView") }
		
	}
	
	func timeString(accumulatedTime: TimeInterval) -> String {
		let hours = Int(accumulatedTime) / 3600
		let minutes = Int(accumulatedTime) / 60 % 60
		let seconds = Int(accumulatedTime) % 60
		return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
	}
		
}

struct TimerTabView_Previews: PreviewProvider {
	static var previews: some View {
		TimerTabView()
	}
}
