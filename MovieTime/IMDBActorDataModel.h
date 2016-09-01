//
//  IMDBActorDataModel.h
//  MovieTime
//
//  Created by Marius Ilie on 30/08/2016.
//  Copyright © 2016 Marius Ilie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IMDBActorDataModel : NSObject

@property (strong, nonatomic) NSString *actorId;
@property (strong, nonatomic) NSString *actorName;
@property (strong, nonatomic) NSString *character;
@property (strong, nonatomic) NSString *urlCharacter;
@property (strong, nonatomic) NSString *urlProfile;
@property (strong, nonatomic) NSString *urlPhoto;
@property (strong, nonatomic) NSString *main;

@end
