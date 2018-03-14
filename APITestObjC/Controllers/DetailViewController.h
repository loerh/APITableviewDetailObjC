//
//  DetailViewController.h
//  APITestObjC
//
//  Created by Laurent Meert on 13/03/2018.
//  Copyright © 2018 Laurent Meert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MusicAlbum.h"
#import "MusicTrack.h"
#import "MusicTrackTableViewCell.h"
#import "APIManager.h"

/**
 The detail view controller of a music album, along with its list of tracks.
 */
@interface DetailViewController : UIViewController <UITableViewDataSource>

/// The image view of the album
@property (weak, nonatomic) IBOutlet UIImageView *albumImageView;

/// The album name label of the album
@property (weak, nonatomic) IBOutlet UILabel *albumNameLabel;

/// The album artist label of the album
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;

/// The table view that holds music tracks
@property (weak, nonatomic) IBOutlet UITableView *tracksTableView;

/// The MusicAlbum object that is being passed within prepareForSegue:
@property MusicAlbum* musicAlbum;

/// The list of tracks that populate the track table view
@property (nonatomic, strong) NSMutableArray<MusicTrack*>* tracks;

/**
 Sets up IBOutlets for the passed MusicAlbum object.
 */
- (void) setupAlbumOutlet;

@end
