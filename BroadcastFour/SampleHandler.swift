//
//  SampleHandler.swift
//  BroadcastFour
//
//  Created by Shawn O'Connor on 6/22/22.
//

import ReplayKit

class SampleHandler: RPBroadcastSampleHandler {

    override func broadcastStarted(withSetupInfo setupInfo: [String : NSObject]?) {
        // User has requested to start the broadcast. Setup info from the UI extension can be supplied but optional. 
    }
    
    override func broadcastPaused() {
        // User has requested to pause the broadcast. Samples will stop being delivered.
    }
    
    override func broadcastResumed() {
        // User has requested to resume the broadcast. Samples delivery will resume.
    }
    
    override func broadcastFinished() {
        // User has requested to finish the broadcast.
    }
    
    override func processSampleBuffer(_ sampleBuffer: CMSampleBuffer, with sampleBufferType: RPSampleBufferType) {
        let error = NSError(domain: "Broadcast", code: -1, userInfo: [NSLocalizedFailureReasonErrorKey: "This error message should only appear for BroadcastFour"])
        self.finishBroadcastWithError(error)
        switch sampleBufferType {
        case RPSampleBufferType.video:
            // Handle video sample buffer
            break
        case RPSampleBufferType.audioApp:
            // Handle audio sample buffer for app audio
            break
        case RPSampleBufferType.audioMic:
            // Handle audio sample buffer for mic audio
            break
        @unknown default:
            // Handle other sample buffer types
            fatalError("Unknown type of sample buffer")
        }
    }
}