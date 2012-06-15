/*
 * cocos2d for iPhone: http://www.cocos2d-iphone.org
 *
 * Copyright (c) 2012 .KEXTDEV
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#import "Cocos2dMultiView.h"
#import "CCDirectorDisplayLinkMultiView.h"

@implementation Cocos2dMultiView

+ (id)viewWithFrame:(CGRect)frame displayIndex:(int)displayIndex sharegroup:(EAGLSharegroup *)sharegroup;
{
    return [[self alloc] initWithFrame:frame displayIndex:displayIndex sharegroup:sharegroup];
}

- (id)initWithFrame:(CGRect)frame displayIndex:(int)displayIndex sharegroup:(EAGLSharegroup *)sharegroup;
{

    self = [super initWithFrame:frame];
    if (self)
    {
        [self setupDirector:displayIndex];
        [self setupView:sharegroup];
        
        glView.directorIndex = displayIndex;
        
        [director setOpenGLView:glView];
        
        [self addSubview:glView];
    }
    return self;
}

- (void)setupDirector:(int)displayIndex;
{
    director = [CCDirectorDisplayLinkMultiView switchDirector:displayIndex];
    
    [director setDeviceOrientation:kCCDeviceOrientationPortrait];
    [director setDisplayFPS:YES];
    [director setAnimationInterval:1.0/60];

    if( ! [director enableRetinaDisplay:YES] )
        CCLOG(@"Retina Display Not supported");

    // cocos2d common
    
    [CCFileUtils setiPhoneRetinaDisplaySuffix:@"-hd"];
    [CCFileUtils setiPadSuffix:@"-ipad"];
    [CCFileUtils setiPadRetinaDisplaySuffix:@"-ipadhd"];
}

- (void)setupView:(EAGLSharegroup *)sharegroup;
{
    glView = [EAGLMultiView viewWithFrame:[self bounds]
                                       pixelFormat:kEAGLColorFormatRGB565
                                       depthFormat:0 /* GL_DEPTH_COMPONENT24_OES */
                                preserveBackbuffer:NO
                                        sharegroup:sharegroup
                                     multiSampling:NO
                                   numberOfSamples:0
                           ];
}

- (EAGLSharegroup *)sharegroup;
{
    return glView.context.sharegroup;
}

- (CCDirector *)switchDirector;
{
    return [CCDirectorDisplayLinkMultiView switchDirector:glView.directorIndex];
}

@end
