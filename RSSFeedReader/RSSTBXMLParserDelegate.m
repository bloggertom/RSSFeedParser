//
//  RSSTBXMLParserDelegate.m
//  RSSFeedReader
//
//  Created by Thomas Wilson on 07/12/2011.
//  Copyright (c) 2011 aberystwyth university. All rights reserved.
//

#import "RSSTBXMLParserDelegate.h"

@implementation RSSTBXMLParserDelegate

@synthesize parser;
@synthesize url;
@synthesize unescaper;
@synthesize currentItem;
@synthesize currentArray;

-(id)init{
    return [self initWithURL:@""];
}

-(id)initWithURL:(NSString *)thisURL{
    self = [super init];
    url = [[NSURL alloc]initWithString:thisURL];
    //parser = [[TBXML alloc]initWithURL:thisURL];
    return self;
}

-(NSMutableArray *) getRSSArray;{
    currentArray = [[NSMutableArray alloc]init];
    if ([url.absoluteString isEqualToString:@""]) {
        NSLog(@"No URL set in delegate");
        return false;
    }
    parser = [[TBXML alloc] initWithURL:self.url];
    unescaper = [[XMLUnescaper alloc]init];
    if (parser.rootXMLElement) {
        [self parseElements:parser.rootXMLElement];
    }else{
        NSLog(@"Parser Couldn't find Root element");
    }
    
    return currentArray;
}
-(void)parseElements:(TBXMLElement *)element{
    do {
        if (element->firstChild){
            [self parseElements:element->firstChild];
        }
        if ([[TBXML elementName:element] isEqualToString:@"item"]) {
            TBXMLElement *title = [TBXML childElementNamed:@"title" parentElement:element];
            TBXMLElement *description = [TBXML childElementNamed:@"description" parentElement:element];
            TBXMLElement *iurl = [TBXML childElementNamed:@"link" parentElement:element];
            TBXMLElement *catagory = [TBXML childElementNamed:@"catagory" parentElement:element];
            
            //NSLog(@"init item");
            currentItem = [[RSSItem alloc]init];
           // NSLog(@"getting title text");
            currentItem.title = [unescaper xmlSimpleUnescapeString:[NSMutableString stringWithString:[TBXML textForElement:title]]];
           // NSLog(@"getting description text");
            currentItem.itemDiscription = [unescaper xmlSimpleUnescapeString:[NSMutableString stringWithString:[TBXML textForElement:description]]];
         //   NSLog(@"getting link text");
            currentItem.link = [NSURL URLWithString:[TBXML textForElement:iurl]];
          //  NSLog(@"getting catagory text");
            currentItem.catagory = [unescaper xmlSimpleUnescapeString:[NSMutableString stringWithString:[TBXML textForElement:catagory]]];
            
            [currentArray addObject:currentItem];
            currentItem = nil;
        }
        


        
    }while ((element = element->nextSibling));
}



@end
