	//
	//  MGPreferencePanel.h
	//  MGPreferencePanel
	//
	//  Edited by Michael on 03/27/12.
	//  Copyleft 2003-2013 MOApp Software Manufactory.
	//
	// License?
	// Do What The Fuck You Want To Public License, Version 2.


#import <Cocoa/Cocoa.h>

@interface MGPreferencePanel : NSObject <NSToolbarDelegate> 

@property (assign) IBOutlet NSView *view1;
@property (assign) IBOutlet NSView *view2;
@property (assign) IBOutlet NSView *view3;
@property (assign) IBOutlet NSView *view4;
@property (assign) IBOutlet NSView *contentView;
@property (assign) IBOutlet NSWindow *window;


- (void) mapViewsToToolbar;
- (void) firstPane;
- (IBAction) changePanes: (id) sender;

@end
