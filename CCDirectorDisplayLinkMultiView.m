//
//  CCDirectorDisplayLinkMultiView.m
//  BottleGame
//
//  Created by Viktor Kozub on 16.06.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CCDirectorDisplayLinkMultiView.h"

@implementation CCDirectorDisplayLinkMultiView

- (void)drawScene
{
    [EAGLContext setCurrentContext:openGLView_.context];

    [super drawScene];
}

@end
