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
@property (nonatomic, retain) NSMutableArray *categories;
@property (nonatomic, retain) NSString *auther;
@property (nonatomic, retain) NSURL *comments;
@property (nonatomic, retain) NSDate *pubDate;
@property (nonatomic, retain) NSString *source;

@property (nonatomic, retain) NSDictionary *attributes;

-(id)init;

@end
