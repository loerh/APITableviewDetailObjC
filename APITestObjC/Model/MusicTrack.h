//
//  MusicTrack.h
//  APITestObjC
//
//  Created by Laurent Meert on 13/03/2018.
//  Copyright © 2018 Laurent Meert. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Holds metadata for an iTunes Music Track.
 */
@interface MusicTrack : NSObject

/// The track title
@property NSString* title;

/// The track duration
@property NSNumber* duration;

/**
 Basic initialiser.
 */
- (id) initWithTitle: (NSString*) title
            duration: (NSNumber*) duration;

@end
