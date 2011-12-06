//
//  RSSItem.h
//  Shopshire App
//
//  Created by Thomas Wilson on 05/12/2011.
//  Copyright (c) 2011 aberystwyth university. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSSItem : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *itemDiscription;
@property (nonatomic, retain) NSURL *link;
@property (nonatomic, retain) NSString *catagory;

-(id)init;

@end
