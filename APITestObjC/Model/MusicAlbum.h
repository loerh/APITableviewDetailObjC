//
//  MusicAlbum.h
//  APITestObjC
//
//  Created by Laurent Meert on 13/03/2018.
//  Copyright © 2018 Laurent Meert. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Holds metadata for an iTunes Music Album.
 */
@interface MusicAlbum : NSObject

/// The album ID
@property NSNumber* albumID;

/// The name of the album
@property NSString* name;

/// The name of the artist
@property NSString* artistName;

/// The image thumbnail for that album
@property NSString* imageThumbnail;

/**
 Basic initialiser.
 - parameter name: The name of the album.
 - parameter artistName: The name of the artist for this album.
 - parameter imageThumbnail: The image thumbnail URL of this album.
 */
- (id) initWithAlbumID: (NSNumber*)albumID
                  name: (NSString*)name
            artistName: (NSString*)artistName
        imageThumbnail: (NSString*)imageThumbnail;
@end
