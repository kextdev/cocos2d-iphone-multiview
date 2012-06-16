cocos2d-iphone-multiview
========================

Cocos2d iPhone multiple views (Example)

Required cocos2d v1.1.0-beta2b

1. Add files to your project
2. Copy-paste CCDirector+MultiView switchDirector selector to CCDirector
3. Try BGCocos2dMultiView like:

        BGCocos2dMultiView *multiView1 = [[BGCocos2dMultiView alloc] initWithFrame:CGRectMake(0, 0, 500, 500) displayIndex:0 sharegroup:nil];
        BGCocos2dMultiView *multiView2 = [[BGCocos2dMultiView alloc] initWithFrame:CGRectMake(0, 500, 500, 300) displayIndex:1 sharegroup:multiView1.sharegroup];

        [self.view addSubview:multiView1];
        [self.view addSubview:multiView2];
        
        [multiView1 run];
        [multiView2 run];

3.1 *** GL sharegroup - single textures for all views (for fps_images.png)

Note: DirectorIOS/CCDirectorDisplayLink is default director.
 CCDirectorDisplayLinkMultiView don't restore GL context. 
 switchDirector must call before any access to sharedDirector.
 not all EAGL methods tested for use switchDirector, example how to use it in EAGLMultiView.
