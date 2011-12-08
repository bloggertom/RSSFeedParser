//
//  HTMLToPlainTextTranslator.h
//  RSSFeedReader
//
//  Created by Thomas Wilson on 07/12/2011.
//  Copyright (c) 2011 aberystwyth university. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMLUnescaper : NSObject

- (NSMutableString *)xmlSimpleUnescapeString:(NSMutableString *)thisString;

@end
