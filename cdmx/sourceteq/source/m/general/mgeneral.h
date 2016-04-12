#import <Foundation/Foundation.h>

// analytics

typedef NS_ENUM(NSUInteger, ga_screen)
{
    ga_screen_stats,
    ga_screen_options,
    ga_screen_options_contact,
    ga_screen_store,
    ga_screen_play,
    ga_screen_play_finish
};

typedef NS_ENUM(NSUInteger, ga_event)
{
    ga_event_purchase,
    ga_event_rate,
    ga_event_review,
    ga_event_email,
    ga_event_message
};

typedef NS_ENUM(NSUInteger, ga_action)
{
    ga_action_optin
};