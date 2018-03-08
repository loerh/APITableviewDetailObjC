//
//  Client.m
//  APITestObjC
//
//  Created by Laurent Meert on 08/03/2018.
//  Copyright © 2018 Laurent Meert. All rights reserved.
//

#import "Client.h"

@implementation Client

- (instancetype)initWithClientID:(NSNumber*)clientID clientName:(NSString*)clientName {
    self = [super init];
    if (self) {
        self.clientID = clientID;
        self.clientName = clientName;
    }
    return self;
}

@end
