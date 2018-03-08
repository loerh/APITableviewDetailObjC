//
//  APIManager.h
//  APITestObjC
//
//  Created by Laurent Meert on 08/03/2018.
//  Copyright © 2018 Laurent Meert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Client.h"

@interface APIManager : NSObject

+(instancetype _Nonnull ) sharedInstance;

typedef void (^requestCompletionBlock) (NSData*_Nullable);

typedef void (^requestClientsBlock) (NSMutableArray<Client *>*_Nullable);

- (void)fetchDataWithBaseURL:(NSString*_Nullable) baseURL
                  completion: (requestCompletionBlock _Nullable ) requestCompletionBlock;

- (void)fetchClientsWithCompletion: (requestClientsBlock _Nullable ) completion;

@end
