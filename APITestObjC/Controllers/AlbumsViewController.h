//
//  ViewController.h
//  APITestObjC
//
//  Created by Laurent Meert on 08/03/2018.
//  Copyright © 2018 Laurent Meert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "APIManager.h"
#import "MusicAlbumTableViewCell.h"
#import "DetailViewController.h"

/**
 The View Controller that contains the data for fetched iTunes Music Albums.
 */
@interface AlbumsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

/// The table view holding the
@property (weak, nonatomic) IBOutlet UITableView *albumsTableView;

/// The albums data to show in the table view
@property (nonatomic, strong) NSMutableArray<MusicAlbum*>* albums;

/// The selected row by the user, if any
@property NSNumber* selectedRow;

/// The activity indicator for albums list when data is loading
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *albumsActivityIndicator;

@end

