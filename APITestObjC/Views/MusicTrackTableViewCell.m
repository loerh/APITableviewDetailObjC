//
//  MusicTrackTableViewCell.m
//  APITestObjC
//
//  Created by Laurent Meert on 13/03/2018.
//  Copyright © 2018 Laurent Meert. All rights reserved.
//

#import "MusicTrackTableViewCell.h"

@implementation MusicTrackTableViewCell

- (void)setupWithMusicTrack:(MusicTrack *)musicTrack {
    [self.trackTitleLabel setText:musicTrack.title];
    
    int secondsDuration = (int) musicTrack.duration.floatValue / 1000.0;
    int seconds = secondsDuration % 60;
    int minutes = secondsDuration / 60.0;
    
    NSString* text = [NSString stringWithFormat:@"%d:%d", minutes, seconds];
    [self.trackDurationLabel setText:text];
}

@end
