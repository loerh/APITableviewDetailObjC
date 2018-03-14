//
//  MusicTrackTableViewCell.h
//  APITestObjC
//
//  Created by Laurent Meert on 13/03/2018.
//  Copyright © 2018 Laurent Meert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MusicTrack.h"

/**
 The table view cell that holds and presents information about a MusicTrack object.
 */
@interface MusicTrackTableViewCell : UITableViewCell

/// The label of track title
@property (weak, nonatomic) IBOutlet UILabel *trackTitleLabel;

/// The label of track duration
@property (weak, nonatomic) IBOutlet UILabel *trackDurationLabel;

/**
 Sets up the cell.
 - parameter: musicTrack: The MusicTrack object that is used to populated and configure this cell.
 */
- (void)setupWithMusicTrack: (MusicTrack*)musicTrack;

@end
