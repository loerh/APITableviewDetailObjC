//
//  Client.h
//  APITestObjC
//
//  Created by Laurent Meert on 08/03/2018.
//  Copyright © 2018 Laurent Meert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Client : NSObject

@property (nonatomic, strong) NSNumber* clientID;

@property (nonatomic, strong) NSString* clientName;

- (id) initWithClientID: (NSNumber*)clientID
             clientName: (NSString*)clientName;

@end
