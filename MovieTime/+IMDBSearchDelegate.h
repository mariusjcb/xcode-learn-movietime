//
//  IMDBMoviesDelegate.h
//  MovieTime
//
//  Created by Marius Ilie on 31/08/2016.
//  Copyright © 2016 Marius Ilie. All rights reserved.
//

#import <Foundation/Foundation.h>
#define API_TOKEN @"cc09b5cf-e1a7-44b5-a71f-8593b8069674";
#define API_URI @"http://www.myapifilms.com/imdb/idIMDB?format=json&language=en-us";

@protocol IMDBSearchDelegate <NSObject>

- (void)receivedJSONWithData:(NSData *)jsonObject;
- (void)fetchingJSONFailedWithError:(NSError *)error;

@end
