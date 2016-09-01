//
//  IMDBTrailerDataModel.h
//  MovieTime
//
//  Created by Marius Ilie on 31/08/2016.
//  Copyright © 2016 Marius Ilie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IMDBTrailerDataModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *videoURl;
@property (nonatomic, strong) NSString *duration;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSDictionary *qualities;

@end
