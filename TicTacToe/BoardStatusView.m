//
//  BoardStatusView.m
//  TicTacToe
//
//  Created by PartyMan on 2/16/13.
//  Copyright (c) 2013 PartyMan. All rights reserved.
//

#import "BoardStatusView.h"
#import "PlayerController.h"
#import "Player.h"
#import "MessageTypes.h"

@interface BoardStatusView()

@property (strong, nonatomic) PlayerController *playerController;
@property UIImageView *playerCharacterImage;
@property UIImageView *playerSymbolImage;
@property UILabel *playerNameLabel;
@property UILabel *message;

@end

@implementation BoardStatusView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id) init{
    
    CGRect frame = CGRectMake(0,0,320,60);
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        _playerController = [PlayerController getPlayerController];
        
        _playerCharacterImage = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,60,60)];
        _playerSymbolImage = [[UIImageView alloc] initWithFrame:CGRectMake(260,0,60,60)];
        _playerNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 0, 190, 60)];
        _playerNameLabel.backgroundColor = [UIColor clearColor];
        
        self.backgroundColor = [UIColor colorWithRed:240.0f/255.0f green:240.0f/255.0f blue:240.0f/255.0f alpha:1];
        
        [self addSubview:self.playerCharacterImage];
        [self addSubview:self.playerSymbolImage];
        [self addSubview:self.playerNameLabel];
        
    }
    return self;
    
}

- (void) sendMessageToActivePlayer:(NSString *)messageContent{
    
    Player *player = _playerController.getActivePlayer;
    
    self.playerCharacterImage.image = player.character;
    self.playerSymbolImage.image = player.symbol;
    
    if([messageContent isEqualToString:PLAYER_TURN]){
        
        self.playerNameLabel.text = [NSString stringWithFormat:@"%@: Your turn", player.name];
        
    }else if ([messageContent isEqualToString:PLAYER_WIN]){
        self.backgroundColor = [UIColor greenColor];
        self.playerNameLabel.text = [NSString stringWithFormat:@"%@: You won!!!", player.name];
    }else if ([messageContent isEqualToString:GAME_DRAW]){
        self.playerCharacterImage.image = [self.players[0] character];
        self.playerSymbolImage.image = [self.players[1] character];
        self.playerNameLabel.text = [NSString stringWithFormat:@"Game Draw"];
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
