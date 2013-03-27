    //
	  //  MGPreferencePanel.m
	  //  MGPreferencePanel
	  //
	  //  Edited by Michael on 03/27/12.
	  //  Copyleft 2003-2013 MOApp Software Manufactory.
  	//
    // License?
    // Do What The Fuck You Want To Public License, Version 2.



#define WINDOW_TOOLBAR_HEIGHT 78

#import "MGPreferencePanel.h"

	// All you have to do is to edit the titles and images
    // You may want to use own XIB and NSWindowController instead

NSString * const AppTitle = @"My Awesome App";

NSString * const View1ItemTitle = @"View 1";
NSString * const View1ItemIdentifier = @"View1ItemIdentifier";
NSString * const View1IconImageName = @"View1Icon";

NSString * const View2ItemTitle = @"View 2";
NSString * const View2ItemIdentifier = @"View2ItemIdentifier";
NSString * const View2IconImageName = @"View2Icon";

NSString * const View3ItemTitle = @"View 3";
NSString * const View3ItemIdentifier = @"View3ItemIdentifier";
NSString * const View3IconImageName = @"View3Icon";

NSString * const View4ItemTitle = @"View 4";
NSString * const View4ItemIdentifier = @"View4ItemIdentifier";
NSString * const View4IconImageName = @"View4Icon";


@implementation MGPreferencePanel

@synthesize view1, view2, view3, view4;
@synthesize contentView;
@synthesize window;


#pragma mark -
#pragma mark INIT | AWAKE


- (id) init {
    
	if (self = [super init]) {
			//
	}	
	
	return self;
}



- (void) awakeFromNib {
    
	[self mapViewsToToolbar];
	[self firstPane];
	[window center];
}



#pragma mark -
#pragma mark MAP | CHANGE


- (void) mapViewsToToolbar {
	
    NSToolbar *toolbar = [window toolbar];
	if (toolbar == nil) {        
		toolbar = [[NSToolbar alloc] initWithIdentifier: [NSString stringWithFormat: @"%@.mgpreferencepanel.toolbar", AppTitle]];
	}
	
    [toolbar setAllowsUserCustomization: NO];
    [toolbar setAutosavesConfiguration: NO];
    [toolbar setDisplayMode: NSToolbarDisplayModeIconAndLabel];
    
	[toolbar setDelegate: self]; 
	
	[window setToolbar: toolbar];	
	[window setTitle: View1ItemTitle];
	
	if ([toolbar respondsToSelector: @selector(setSelectedItemIdentifier:)]) {
		[toolbar setSelectedItemIdentifier: View1ItemIdentifier];
	}	
}



- (IBAction) changePanes: (id) sender {
    
	NSView *view = nil;
	
	switch ([sender tag]) 	{
		case 0:
			[window setTitle: View1ItemTitle];
			view = view1;
			break;
		case 1:
			[window setTitle: View2ItemTitle];
			view = view2;
			break;
		case 2:
			[window setTitle: View3ItemTitle];
			view = view3;
			break;
		case 3:
			[window setTitle: View4ItemTitle];
			view = view4;
			break;
		default:
			break;
	}
	
	NSRect windowFrame = [window frame];
	windowFrame.size.height = [view frame].size.height + WINDOW_TOOLBAR_HEIGHT;
	windowFrame.size.width = [view frame].size.width;
	windowFrame.origin.y = NSMaxY([window frame]) - ([view frame].size.height + WINDOW_TOOLBAR_HEIGHT);
	
	if ([[contentView subviews] count] != 0) {
		[[[contentView subviews] objectAtIndex:0] removeFromSuperview];
	}
	
	[window setFrame: windowFrame display: YES animate: YES];
	[contentView setFrame: [view frame]];
	[contentView addSubview: view];	
}



#pragma mark -
#pragma mark FIRST PANE


- (void) firstPane {
    
	NSView *view = nil;
	view = view1;
	
	NSRect windowFrame = [window frame];
	windowFrame.size.height = [view frame].size.height + WINDOW_TOOLBAR_HEIGHT;
	windowFrame.size.width = [view frame].size.width;
	windowFrame.origin.y = NSMaxY([window frame]) - ([view frame].size.height + WINDOW_TOOLBAR_HEIGHT);
	
	if ([[contentView subviews] count] != 0) {
		[[[contentView subviews] objectAtIndex:0] removeFromSuperview];
	}
	
	[window setFrame: windowFrame display: YES animate: YES];
	[contentView setFrame: [view frame]];
	[contentView addSubview: view];	
}



#pragma mark -
#pragma mark DEFAULT | ALLOWED | SELECTABLE


- (NSArray *) toolbarDefaultItemIdentifiers: (NSToolbar *) toolbar {
    
    return [NSArray arrayWithObjects:
			View1ItemIdentifier,
			View2ItemIdentifier,
			View3ItemIdentifier,
			View4ItemIdentifier,	
			nil];
}

- (NSArray *) toolbarAllowedItemIdentifiers: (NSToolbar *) toolbar {
    
    return [NSArray arrayWithObjects:
			View1ItemIdentifier,
			View2ItemIdentifier,
			View3ItemIdentifier,
			View4ItemIdentifier,	
			NSToolbarSeparatorItemIdentifier,
			NSToolbarSpaceItemIdentifier,
			NSToolbarFlexibleSpaceItemIdentifier,
			nil];
}


- (NSArray*) toolbarSelectableItemIdentifiers: (NSToolbar*) toolbar {
    
	return [NSArray arrayWithObjects:
			View1ItemIdentifier,
			View2ItemIdentifier,
			View3ItemIdentifier,
			View4ItemIdentifier,	
			nil];
}



#pragma mark -
#pragma mark ITEM FOR IDENTIFIER


- (NSToolbarItem*)toolbar: (NSToolbar*) toolbar itemForItemIdentifier: (NSString *) itemIdentifier willBeInsertedIntoToolbar: (BOOL) willBeInsertedIntoToolbar {
    
	NSToolbarItem *item = nil;
	
    if ([itemIdentifier isEqualToString: View1ItemIdentifier]) {
		
        item = [[NSToolbarItem alloc] initWithItemIdentifier: itemIdentifier];
        [item setPaletteLabel: View1ItemTitle];
        [item setLabel: View1ItemTitle];
        [item setImage: [NSImage imageNamed: View1IconImageName]];
		[item setAction: @selector(changePanes:)];
		[item setTag: 0];
    }
	else if ([itemIdentifier isEqualToString: View2ItemIdentifier]) {
		
        item = [[NSToolbarItem alloc] initWithItemIdentifier: itemIdentifier];
        [item setPaletteLabel: View2ItemTitle];
        [item setLabel: View2ItemTitle];
        [item setImage:[NSImage imageNamed: View2IconImageName]];
		[item setAction: @selector(changePanes:)];
		[item setTag: 1];
    }
	else if ([itemIdentifier isEqualToString: View3ItemIdentifier]) {
		
        item = [[NSToolbarItem alloc] initWithItemIdentifier: itemIdentifier];
        [item setPaletteLabel: View3ItemTitle];
        [item setLabel: View3ItemTitle];
        [item setImage: [NSImage imageNamed: View3IconImageName]];
		[item setAction: @selector(changePanes:)];
		[item setTag: 2];
    }
	else if ([itemIdentifier isEqualToString: View4ItemIdentifier]) {
		
        item = [[NSToolbarItem alloc] initWithItemIdentifier: itemIdentifier];
        [item setPaletteLabel: View4ItemTitle];
        [item setLabel: View4ItemTitle];
        [item setImage: [NSImage imageNamed: View4IconImageName]];
		[item setAction: @selector(changePanes:)];
		[item setTag: 3];
    }
	
	return item;
}

@end
