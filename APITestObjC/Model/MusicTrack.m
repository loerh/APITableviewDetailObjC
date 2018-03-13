//
//  MusicTrack.m
//  APITestObjC
//
//  Created by Laurent Meert on 13/03/2018.
//  Copyright © 2018 Laurent Meert. All rights reserved.
//

#import "MusicTrack.h"

@implementation MusicTrack

/**
 Basic initialiser.
 */
- (id) initWithTitle: (NSString*) title
            duration: (NSNumber*) duration {
    self = [super init];
    
    if (self) {
        self.title = title;
        self.duration = duration;
    }
    
    return self;
}

@end
