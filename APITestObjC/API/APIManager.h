//
//  APIManager.h
//  APITestObjC
//
//  Created by Laurent Meert on 08/03/2018.
//  Copyright © 2018 Laurent Meert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MusicAlbum.h"
#import "MusicTrack.h"

/**
 The API Manager deals with all API calls, parses JSON and returns proper objects based on models.
 */
@interface APIManager : NSObject

/// The shared instance of the API Manager
+(instancetype _Nonnull ) sharedInstance;

/// A completion block for a generic API request
typedef void (^RequestCompletionBlock) (NSData* _Nullable);

/// A completion block for albums request
typedef void (^RequestAlbumsBlock) (NSMutableArray<MusicAlbum *>*_Nullable);

/// A completion block for tracks request
typedef void (^RequestTracksBlock) (NSMutableArray<MusicTrack*>* _Nullable);

/// A completion block for image request
typedef void (^RequestImageBlock) (NSData* _Nullable);

/**
 Fetches generically data.
 - parameter baseURL:
 */
- (void)fetchDataWithURL:(NSString* _Nullable) url
                  completion: (RequestCompletionBlock _Nullable) requestCompletionBlock;

- (void)fetchAlbumsWithCompletion: (RequestAlbumsBlock _Nullable) completion;

- (void)fetchTracksWithAlbumID: (NSNumber* _Nonnull) albumID
                   completion: (RequestTracksBlock _Nullable) completion;

- (void)fetchImageWithURL:(NSString* _Nonnull) imageURL
               completion:(RequestImageBlock _Nullable) completion;

@end
