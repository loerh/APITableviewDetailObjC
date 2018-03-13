//
//  MusicAlbumTableViewCell.h
//  APITestObjC
//
//  Created by Laurent Meert on 13/03/2018.
//  Copyright © 2018 Laurent Meert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MusicAlbum.h"
#import "APIManager.h"

/**
 The table view cell containing the details for an iTunes Music album.
 */
@interface MusicAlbumTableViewCell : UITableViewCell

/// The image view for the artwork thumbnail
@property (weak, nonatomic) IBOutlet UIImageView *albumImageView;

/// The label for the album name
@property (weak, nonatomic) IBOutlet UILabel *albumNameLabel;

/// The label for the artist name
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;

- (void)setupWithMusicAlbum: (MusicAlbum*)musicAlbum;

@end
