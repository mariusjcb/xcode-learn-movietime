//
//  AppDelegate.h
//  MovieTime
//
//  Created by Marius Ilie on 30/08/2016.
//  Copyright © 2016 Marius Ilie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

