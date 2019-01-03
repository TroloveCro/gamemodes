/*
														________________________________________
														
														Basic Roleplay :: Red County :: Aprezt
														________________________________________

	Map:
	>> Red County
	Scripter(s):
	>> Aprezt
	Script Version:
	>> U1
	
	Thanks to Kush'is. Y_INI Tutorial :)
*/

/* Server Includes */
#include <a_samp>
#include <streamer>
#include <zcmd>
#include <foreach>
#include <sscanf2>
#include <YSI\y_ini>

/* Server Colors */
#define COLOR_PURPLE    0xC2A2DAAA
#define COLOR_GRAD2  	0xBFC0C2FF
#define COLOR_GRAD1 	0xB4B5B7FF
#define COLOR_GRAD2 	0xBFC0C2FF
#define COLOR_GREY 		0xAFAFAFAA
#define COLOR_GRAD3 	0xCBCCCEFF
#define COLOR_LIGHTBLUE 0x006FDD96
#define COLOR_GRAD4 	0xD8D8D8FF
#define COLOR_FADE 		0xC8C8C8C8
#define COLOR_FADE2 	0xC8C8C8C8
#define COLOR_FADE3 	0xAAAAAAAA
#define COLOR_FADE4 	0x8C8C8C8C
#define COLOR_YELLOW 	0xDABB3E00
#define COLOR_FADE5 	0x6E6E6E6E
#define COLOR_GRAD5 	0xE3E3E3FF
#define COLOR_FADE1 	0xE6E6E6E6
#define COLOR_GRAD6 	0xF0F0F0FF
#define TEAM_HIT_COLOR 	0xFFFFFF00

/* Server Defines */
#define PATH "Accounts/%s.ini"
#define SECONDS(%1) ((%1)*(1000))
#define ALTCOMMAND:%1->%2;           \
COMMAND:%1(playerid, params[])   \
return cmd_%2(playerid, params);
#define function%0(%1) forward%0(%1); public%0(%1)

/* SERVER SIDE CASH */
#define GivePlayerCash(%0,%1) SetPVarInt(%0,"Money",GetPlayerCash(%0)+%1),GivePlayerMoney(%0,%1)
#define ResetPlayerCash(%0) SetPVarInt(%0,"Money",0), ResetPlayerMoney(%0)
#define GetPlayerCash(%0) GetPVarInt(%0,"Money")

/* DIALOGS */
#define DIALOG_REGISTER   1
#define DIALOG_LOGIN      2
#define	DIALOG_AGE        3
#define DIALOG_SEX        4
#define MAX_OBJ 500

// PRESSED(keys)
#define PRESSED(%0) \
	(((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))

forward ClearChat(playerid);

/* ENUMS */
enum pInfo
{
    pPass,
    pCash,
    pAdmin,
    pSex,
    pAge,
   	Float:pPos_x,
	Float:pPos_y,
	Float:pPos_z,
	pSkin,
	pTeam,
	pAccent,
	//
	pSlot1ID,
	pSlot1Amount,
	//
	pSlot2ID,
	pSlot2Amount,
	//
	pSlot3ID,
	pSlot3Amount,
	//
	pSlot4ID,
	pSlot4Amount,
	//
	pSlot5ID,
	pSlot5Amount,
	//
	pSlot6ID,
	pSlot6Amount,
	//
	pSlot7ID,
	pSlot7Amount,
	//
    pSlot8ID,
	pSlot8Amount,
	//
	pSlot9ID,
	pSlot9Amount,
	//
	pSlot10ID,
	pSlot10Amount,
	//
	pSlot11ID,
	pSlot11Amount,
	//
	pSlot12ID,
	pSlot12Amount,
	//
	pSlot13ID,
	pSlot13Amount,
	//
	pSlot14ID,
	pSlot14Amount,
	//
	pSlot15ID,
	pSlot15Amount,
	//
	pSlot16ID,
	pSlot16Amount,
	//
	pSlot17ID,
	pSlot17Amount,
	//
	pSlot18ID,
	pSlot18Amount,
	//
	pSlot19ID,
	pSlot19Amount,
	//
	pSlot20ID,
	pSlot20Amount,
	//
    pSlot21ID,
	pSlot21Amount,
	//
	pSlot22ID,
	pSlot22Amount,
	//
	pSlot23ID,
	pSlot23Amount,
	//
	pSlot24ID,
	pSlot24Amount,
	//
	pSlot25ID,
	pSlot25Amount,
	//
	pSlot26ID,
	pSlot26Amount,
	//
	pSlot27ID,
	pSlot27Amount,
	//
	pSlot28ID,
	pSlot28Amount,
	//
	pSlot29ID,
	pSlot29Amount,
	//
	pSlot30ID,
	pSlot30Amount,
	pInventoryStats
	
}
new PlayerInfo[MAX_PLAYERS][pInfo];
new SumID = 0;
new OpenedPage[MAX_PLAYERS] = 0;
forward CreateCells(playerid);
forward DestroyCells(playerid);
new IsCellsCreated[MAX_PLAYERS] = 0;
//Cells TextDraws -------------------------------->

new Text:Textdraw0;
new Text:Textdraw1;
new Text:Textdraw2;
new Text:Textdraw3;
new Text:Textdraw4;
new Text:Textdraw6;
new Text:Textdraw7;
new Text:Textdraw8;
new Text:Textdraw9;
new Text:Textdraw10;
new Text:Textdraw11;
new Text:Textdraw12;
new Text:Textdraw13;
new Text:Textdraw14;
new Text:Textdraw15;
new Text:Textdraw16;
new Text:Textdraw17;
new Text:Textdraw18;
new Text:Textdraw19;
new Text:Textdraw20;
new Text:Textdraw21;
new Text:Textdraw22;
new Text:Textdraw23;
new Text:Textdraw24;
new Text:Textdraw25;
new Text:Textdraw26;
new Text:Textdraw27;
new Text:Textdraw28;
new Text:Textdraw29;
new Text:Textdraw30;
new Text:Textdraw31;
new Text:Textdraw32;
new Text:Textdraw33;
new Text:Textdraw34;
new Text:Textdraw35;
new Text:Textdraw36;
new Text:Textdraw37;
new Text:Textdraw38;
new Text:Textdraw39;
new Text:Textdraw40;
new Text:Textdraw41;
new Text:Textdraw42;
new Text:Textdraw43;
new Text:Textdraw44;
new Text:Textdraw45;
new Text:Textdraw46;
new Text:Textdraw47;
new Text:Textdraw48;
new Text:Textdraw49;
new Text:Textdraw50;
new Text:Textdraw51;
new Text:Textdraw52;
new Text:Textdraw53;
new Text:Textdraw56;
new Text:Textdraw57;

// Enc Cells TextDraws --------------------------->

/* <--------------------------------------------> */

enum IInfo
{
	IObjectId,
	Idata[2],
	ItemID,
	Text3D:Item3Dtext,
	Float:Item_pos[3]
}
new ItemInfo[MAX_OBJ][IInfo];

/* <---------------------------------------------> */
main()
{
    print(" ");
    print(" ");
    print("- Basic Roleplay GameMode Loaded -");
    print(" ");
    print(" Script: Aprezt");
}
new
	noooc = 0,
	Logged[ MAX_PLAYERS ],
	gOoc[ MAX_PLAYERS ]
;
public DestroyCells(playerid)
{
    IsCellsCreated[playerid] = 0;
	TextDrawHideForPlayer(playerid, Textdraw0);
	TextDrawHideForPlayer(playerid, Textdraw1);
	TextDrawHideForPlayer(playerid, Textdraw2);
	TextDrawHideForPlayer(playerid, Textdraw3);
	TextDrawHideForPlayer(playerid, Textdraw4);
	TextDrawHideForPlayer(playerid, Textdraw6);
	TextDrawHideForPlayer(playerid, Textdraw7);
	TextDrawHideForPlayer(playerid, Textdraw8);
	TextDrawHideForPlayer(playerid, Textdraw9);
	TextDrawHideForPlayer(playerid, Textdraw10);
	TextDrawHideForPlayer(playerid, Textdraw11);
	TextDrawHideForPlayer(playerid, Textdraw12);
	TextDrawHideForPlayer(playerid, Textdraw13);
	TextDrawHideForPlayer(playerid, Textdraw14);
	TextDrawHideForPlayer(playerid, Textdraw15);
	TextDrawHideForPlayer(playerid, Textdraw16);
	TextDrawHideForPlayer(playerid, Textdraw17);
	TextDrawHideForPlayer(playerid, Textdraw18);
	TextDrawHideForPlayer(playerid, Textdraw19);
	TextDrawHideForPlayer(playerid, Textdraw20);
	TextDrawHideForPlayer(playerid, Textdraw21);
	TextDrawHideForPlayer(playerid, Textdraw22);
	TextDrawHideForPlayer(playerid, Textdraw23);
	TextDrawHideForPlayer(playerid, Textdraw24);
	TextDrawHideForPlayer(playerid, Textdraw25);
	TextDrawHideForPlayer(playerid, Textdraw26);
	TextDrawHideForPlayer(playerid, Textdraw27);
	TextDrawHideForPlayer(playerid, Textdraw28);
	TextDrawHideForPlayer(playerid, Textdraw29);
	TextDrawHideForPlayer(playerid, Textdraw30);
	TextDrawHideForPlayer(playerid, Textdraw31);
	TextDrawHideForPlayer(playerid, Textdraw32);
	TextDrawHideForPlayer(playerid, Textdraw33);
	TextDrawHideForPlayer(playerid, Textdraw34);
	TextDrawHideForPlayer(playerid, Textdraw35);
	TextDrawHideForPlayer(playerid, Textdraw36);
	TextDrawHideForPlayer(playerid, Textdraw37);
	TextDrawHideForPlayer(playerid, Textdraw38);
	TextDrawHideForPlayer(playerid, Textdraw39);
	TextDrawHideForPlayer(playerid, Textdraw40);
	TextDrawHideForPlayer(playerid, Textdraw41);
	TextDrawHideForPlayer(playerid, Textdraw42);
	TextDrawHideForPlayer(playerid, Textdraw43);
	TextDrawHideForPlayer(playerid, Textdraw44);
	TextDrawHideForPlayer(playerid, Textdraw45);
	TextDrawHideForPlayer(playerid, Textdraw46);
	TextDrawHideForPlayer(playerid, Textdraw47);
	TextDrawHideForPlayer(playerid, Textdraw48);
	TextDrawHideForPlayer(playerid, Textdraw49);
	TextDrawHideForPlayer(playerid, Textdraw50);
	TextDrawHideForPlayer(playerid, Textdraw51);
	TextDrawHideForPlayer(playerid, Textdraw52);
	TextDrawHideForPlayer(playerid, Textdraw53);
	TextDrawHideForPlayer(playerid, Textdraw56);
	TextDrawHideForPlayer(playerid, Textdraw57);
	return 1;
}
public CreateCells(playerid)
{
    IsCellsCreated[playerid] = 1;
	TextDrawShowForPlayer(playerid, Textdraw0);
	TextDrawShowForPlayer(playerid, Textdraw1);
	TextDrawShowForPlayer(playerid, Textdraw2);
	TextDrawShowForPlayer(playerid, Textdraw3);
	TextDrawShowForPlayer(playerid, Textdraw4);
	TextDrawShowForPlayer(playerid, Textdraw6);
	TextDrawShowForPlayer(playerid, Textdraw7);
	TextDrawShowForPlayer(playerid, Textdraw8);
	TextDrawShowForPlayer(playerid, Textdraw9);
	TextDrawShowForPlayer(playerid, Textdraw10);
	TextDrawShowForPlayer(playerid, Textdraw11);
	TextDrawShowForPlayer(playerid, Textdraw12);
	TextDrawShowForPlayer(playerid, Textdraw13);
	TextDrawShowForPlayer(playerid, Textdraw14);
	TextDrawShowForPlayer(playerid, Textdraw15);
	TextDrawShowForPlayer(playerid, Textdraw16);
	TextDrawShowForPlayer(playerid, Textdraw17);
	TextDrawShowForPlayer(playerid, Textdraw18);
	TextDrawShowForPlayer(playerid, Textdraw19);
	TextDrawShowForPlayer(playerid, Textdraw20);
	TextDrawShowForPlayer(playerid, Textdraw21);
	TextDrawShowForPlayer(playerid, Textdraw22);
	TextDrawShowForPlayer(playerid, Textdraw23);
	TextDrawShowForPlayer(playerid, Textdraw24);
	TextDrawShowForPlayer(playerid, Textdraw25);
	TextDrawShowForPlayer(playerid, Textdraw26);
	TextDrawShowForPlayer(playerid, Textdraw27);
	TextDrawShowForPlayer(playerid, Textdraw28);
	TextDrawShowForPlayer(playerid, Textdraw29);
	TextDrawShowForPlayer(playerid, Textdraw30);
	TextDrawShowForPlayer(playerid, Textdraw31);
	TextDrawShowForPlayer(playerid, Textdraw32);
	TextDrawShowForPlayer(playerid, Textdraw33);
	TextDrawShowForPlayer(playerid, Textdraw34);
	TextDrawShowForPlayer(playerid, Textdraw35);
	TextDrawShowForPlayer(playerid, Textdraw36);
	TextDrawShowForPlayer(playerid, Textdraw37);
	TextDrawShowForPlayer(playerid, Textdraw38);
	TextDrawShowForPlayer(playerid, Textdraw39);
	TextDrawShowForPlayer(playerid, Textdraw40);
	TextDrawShowForPlayer(playerid, Textdraw41);
	TextDrawShowForPlayer(playerid, Textdraw42);
	TextDrawShowForPlayer(playerid, Textdraw43);
	TextDrawShowForPlayer(playerid, Textdraw44);
	TextDrawShowForPlayer(playerid, Textdraw45);
	TextDrawShowForPlayer(playerid, Textdraw46);
	TextDrawShowForPlayer(playerid, Textdraw47);
	TextDrawShowForPlayer(playerid, Textdraw48);
	TextDrawShowForPlayer(playerid, Textdraw49);
	TextDrawShowForPlayer(playerid, Textdraw50);
	TextDrawShowForPlayer(playerid, Textdraw51);
	TextDrawShowForPlayer(playerid, Textdraw52);
	TextDrawShowForPlayer(playerid, Textdraw53);
	TextDrawShowForPlayer(playerid, Textdraw56);
	TextDrawShowForPlayer(playerid, Textdraw57);
	return 1;
}
stock RestartInventory(playerid)
{
    PlayerInfo[ playerid ][ pSlot1ID ] = 0;
    PlayerInfo[ playerid ][ pSlot2ID ] = 0;
    PlayerInfo[ playerid ][ pSlot3ID ] = 0;
    PlayerInfo[ playerid ][ pSlot4ID ] = 0;
    PlayerInfo[ playerid ][ pSlot5ID ] = 0;
    PlayerInfo[ playerid ][ pSlot6ID ] = 0;
    PlayerInfo[ playerid ][ pSlot7ID ] = 0;
    PlayerInfo[ playerid ][ pSlot8ID ] = 0;
    PlayerInfo[ playerid ][ pSlot9ID ] = 0;
    PlayerInfo[ playerid ][ pSlot10ID ] = 0;
    PlayerInfo[ playerid ][ pSlot11ID ] = 0;
    PlayerInfo[ playerid ][ pSlot12ID ] = 0;
    PlayerInfo[ playerid ][ pSlot13ID ] = 0;
    PlayerInfo[ playerid ][ pSlot14ID ] = 0;
    PlayerInfo[ playerid ][ pSlot15ID ] = 0;
    PlayerInfo[ playerid ][ pSlot16ID ] = 0;
    PlayerInfo[ playerid ][ pSlot17ID ] = 0;
    PlayerInfo[ playerid ][ pSlot18ID ] = 0;
    PlayerInfo[ playerid ][ pSlot19ID ] = 0;
    PlayerInfo[ playerid ][ pSlot20ID ] = 0;
    PlayerInfo[ playerid ][ pSlot21ID ] = 0;
    PlayerInfo[ playerid ][ pSlot22ID ] = 0;
	PlayerInfo[ playerid ][ pSlot23ID ] = 0;
	PlayerInfo[ playerid ][ pSlot24ID ] = 0;
	PlayerInfo[ playerid ][ pSlot25ID ] = 0;
	PlayerInfo[ playerid ][ pSlot26ID ] = 0;
	PlayerInfo[ playerid ][ pSlot27ID ] = 0;
	PlayerInfo[ playerid ][ pSlot28ID ] = 0;
	PlayerInfo[ playerid ][ pSlot29ID ] = 0;
	PlayerInfo[ playerid ][ pSlot30ID ] = 0;
	
	//-------------------------------------------

    PlayerInfo[ playerid ][ pSlot1Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot2Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot3Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot4Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot5Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot6Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot7Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot8Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot9Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot10Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot11Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot12Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot13Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot14Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot15Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot16Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot17Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot18Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot19Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot20Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot21Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot22Amount ] = 0;
	PlayerInfo[ playerid ][ pSlot23Amount ] = 0;
	PlayerInfo[ playerid ][ pSlot24Amount ] = 0;
	PlayerInfo[ playerid ][ pSlot25Amount ] = 0;
	PlayerInfo[ playerid ][ pSlot26Amount ] = 0;
	PlayerInfo[ playerid ][ pSlot27Amount ] = 0;
	PlayerInfo[ playerid ][ pSlot28Amount ] = 0;
	PlayerInfo[ playerid ][ pSlot29Amount ] = 0;
	PlayerInfo[ playerid ][ pSlot30Amount ] = 0;
	
	return 1;
}
public OnPlayerConnect(playerid)
{
    gOoc[ playerid ] = 0; Logged[ playerid ] = 0;
    // Reset stats!
    PlayerInfo[ playerid ][ pCash ] = 0;
    PlayerInfo[ playerid ][ pAdmin ] = 0;
    PlayerInfo[ playerid ][ pSex ] = 0;
    PlayerInfo[ playerid ][ pAge ] = 0;
    PlayerInfo[ playerid ][ pPos_x ] = 0.0;
    PlayerInfo[ playerid ][ pPos_y ] = 0.0;
    PlayerInfo[ playerid ][ pPos_z ] = 0.0;
    PlayerInfo[ playerid ][ pSkin ] = 0;
    PlayerInfo[ playerid ][ pTeam ] = 0;
    PlayerInfo[ playerid ][ pAccent ] = 0;
    RestartInventory(playerid);

    if(fexist(UserPath(playerid)))
    {
        INI_ParseFile(UserPath(playerid), "LoadUser_%s", .bExtra = true, .extra = playerid);
        ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_INPUT,"Basic Roleplay","Type your password below to login:","Login","Quit");
    }
    else
    {
        ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_INPUT,"Basic Roleplay","Type your password below to register a new account:","Register","Quit");
    }
    return 1;
}
public OnGameModeExit()
{
	TextDrawHideForAll(Textdraw0);
	TextDrawDestroy(Textdraw0);
	TextDrawHideForAll(Textdraw1);
	TextDrawDestroy(Textdraw1);
	TextDrawHideForAll(Textdraw2);
	TextDrawDestroy(Textdraw2);
	TextDrawHideForAll(Textdraw3);
	TextDrawDestroy(Textdraw3);
	TextDrawHideForAll(Textdraw4);
	TextDrawDestroy(Textdraw4);
	TextDrawHideForAll(Textdraw6);
	TextDrawDestroy(Textdraw6);
	TextDrawHideForAll(Textdraw7);
	TextDrawDestroy(Textdraw7);
	TextDrawHideForAll(Textdraw8);
	TextDrawDestroy(Textdraw8);
	TextDrawHideForAll(Textdraw9);
	TextDrawDestroy(Textdraw9);
	TextDrawHideForAll(Textdraw10);
	TextDrawDestroy(Textdraw10);
	TextDrawHideForAll(Textdraw11);
	TextDrawDestroy(Textdraw11);
	TextDrawHideForAll(Textdraw12);
	TextDrawDestroy(Textdraw12);
	TextDrawHideForAll(Textdraw13);
	TextDrawDestroy(Textdraw13);
	TextDrawHideForAll(Textdraw14);
	TextDrawDestroy(Textdraw14);
	TextDrawHideForAll(Textdraw15);
	TextDrawDestroy(Textdraw15);
	TextDrawHideForAll(Textdraw16);
	TextDrawDestroy(Textdraw16);
	TextDrawHideForAll(Textdraw17);
	TextDrawDestroy(Textdraw17);
	TextDrawHideForAll(Textdraw18);
	TextDrawDestroy(Textdraw18);
	TextDrawHideForAll(Textdraw19);
	TextDrawDestroy(Textdraw19);
	TextDrawHideForAll(Textdraw20);
	TextDrawDestroy(Textdraw20);
	TextDrawHideForAll(Textdraw21);
	TextDrawDestroy(Textdraw21);
	TextDrawHideForAll(Textdraw22);
	TextDrawDestroy(Textdraw22);
	TextDrawHideForAll(Textdraw23);
	TextDrawDestroy(Textdraw23);
	TextDrawHideForAll(Textdraw24);
	TextDrawDestroy(Textdraw24);
	TextDrawHideForAll(Textdraw25);
	TextDrawDestroy(Textdraw25);
	TextDrawHideForAll(Textdraw26);
	TextDrawDestroy(Textdraw26);
	TextDrawHideForAll(Textdraw27);
	TextDrawDestroy(Textdraw27);
	TextDrawHideForAll(Textdraw28);
	TextDrawDestroy(Textdraw28);
	TextDrawHideForAll(Textdraw29);
	TextDrawDestroy(Textdraw29);
	TextDrawHideForAll(Textdraw30);
	TextDrawDestroy(Textdraw30);
	TextDrawHideForAll(Textdraw31);
	TextDrawDestroy(Textdraw31);
	TextDrawHideForAll(Textdraw32);
	TextDrawDestroy(Textdraw32);
	TextDrawHideForAll(Textdraw33);
	TextDrawDestroy(Textdraw33);
	TextDrawHideForAll(Textdraw34);
	TextDrawDestroy(Textdraw34);
	TextDrawHideForAll(Textdraw35);
	TextDrawDestroy(Textdraw35);
	TextDrawHideForAll(Textdraw36);
	TextDrawDestroy(Textdraw36);
	TextDrawHideForAll(Textdraw37);
	TextDrawDestroy(Textdraw37);
	TextDrawHideForAll(Textdraw38);
	TextDrawDestroy(Textdraw38);
	TextDrawHideForAll(Textdraw39);
	TextDrawDestroy(Textdraw39);
	TextDrawHideForAll(Textdraw40);
	TextDrawDestroy(Textdraw40);
	TextDrawHideForAll(Textdraw41);
	TextDrawDestroy(Textdraw41);
	TextDrawHideForAll(Textdraw42);
	TextDrawDestroy(Textdraw42);
	TextDrawHideForAll(Textdraw43);
	TextDrawDestroy(Textdraw43);
	TextDrawHideForAll(Textdraw44);
	TextDrawDestroy(Textdraw44);
	TextDrawHideForAll(Textdraw45);
	TextDrawDestroy(Textdraw45);
	TextDrawHideForAll(Textdraw46);
	TextDrawDestroy(Textdraw46);
	TextDrawHideForAll(Textdraw47);
	TextDrawDestroy(Textdraw47);
	TextDrawHideForAll(Textdraw48);
	TextDrawDestroy(Textdraw48);
	TextDrawHideForAll(Textdraw49);
	TextDrawDestroy(Textdraw49);
	TextDrawHideForAll(Textdraw50);
	TextDrawDestroy(Textdraw50);
	TextDrawHideForAll(Textdraw51);
	TextDrawDestroy(Textdraw51);
	TextDrawHideForAll(Textdraw52);
	TextDrawDestroy(Textdraw52);
	TextDrawHideForAll(Textdraw53);
	TextDrawDestroy(Textdraw53);
	TextDrawHideForAll(Textdraw56);
	TextDrawDestroy(Textdraw56);
	TextDrawHideForAll(Textdraw57);
	TextDrawDestroy(Textdraw57);
	return 1;
}
public OnGameModeInit()
{
	/* <-------------------------------------------> */
	AddPlayerClass(21,-2382.0168,-582.0441,132.1172,125.2504,0,0,0,0,0,0);
	AddPlayerClass(59,-2382.0168,-582.0441,132.1172,125.2504,0,0,0,0,0,0);
	/* <-------------------------------------------> */
	ShowPlayerMarkers(0);
	ShowNameTags(1);
	DisableInteriorEnterExits();
	EnableStuntBonusForAll(0);
	SetNameTagDrawDistance(10.0);
	// =========== TIMERS ===========
	SetTimer("MoneyUpdate",1000,1);
	SetTimer("SaveAccounts", SECONDS(13), 1);
	//CreateItem(itemid, Float:Xpos, Float:Ypos, Float:Zpos, ItemTypeID, ItemAmount)
	CreateItems();
	//
	
	Textdraw0 = TextDrawCreate(323.000000, 125.000000, "~n~");
	TextDrawBackgroundColor(Textdraw0, 255);
	TextDrawFont(Textdraw0, 1);
	TextDrawLetterSize(Textdraw0, 0.790000, 1.699998);
	TextDrawColor(Textdraw0, -1);
	TextDrawSetOutline(Textdraw0, 0);
	TextDrawSetProportional(Textdraw0, 1);
	TextDrawSetShadow(Textdraw0, 1);
	TextDrawUseBox(Textdraw0, 1);
	TextDrawBoxColor(Textdraw0, 255);
	TextDrawTextSize(Textdraw0, 225.000000, 0.000000);
	TextDrawSetSelectable(Textdraw0, 0);

	Textdraw1 = TextDrawCreate(638.000000, 110.000000, "~n~~n~~n~");
	TextDrawBackgroundColor(Textdraw1, 255);
	TextDrawFont(Textdraw1, 1);
	TextDrawLetterSize(Textdraw1, 0.310000, 12.299998);
	TextDrawColor(Textdraw1, -1);
	TextDrawSetOutline(Textdraw1, 0);
	TextDrawSetProportional(Textdraw1, 1);
	TextDrawSetShadow(Textdraw1, 1);
	TextDrawUseBox(Textdraw1, 1);
	TextDrawBoxColor(Textdraw1, 0x00000040);
	TextDrawTextSize(Textdraw1, 222.000000, 70.000000);
	TextDrawSetSelectable(Textdraw1, 0);

	Textdraw2 = TextDrawCreate(248.000000, 142.000000, "Page number 1");
	TextDrawBackgroundColor(Textdraw2, 255);
	TextDrawFont(Textdraw2, 1);
	TextDrawLetterSize(Textdraw2, 0.469999, 1.100000);
	TextDrawColor(Textdraw2, -1);
	TextDrawSetOutline(Textdraw2, 0);
	TextDrawSetProportional(Textdraw2, 1);
	TextDrawSetShadow(Textdraw2, 1);
	TextDrawSetSelectable(Textdraw2, 0);

	Textdraw3 = TextDrawCreate(637.000000, 110.000000, "~n~");
	TextDrawBackgroundColor(Textdraw3, 255);
	TextDrawFont(Textdraw3, 1);
	TextDrawLetterSize(Textdraw3, 0.720000, 0.699998);
	TextDrawColor(Textdraw3, -1);
	TextDrawSetOutline(Textdraw3, 0);
	TextDrawSetProportional(Textdraw3, 1);
	TextDrawSetShadow(Textdraw3, 1);
	TextDrawUseBox(Textdraw3, 1);
	TextDrawBoxColor(Textdraw3, 255);
	TextDrawTextSize(Textdraw3, 222.000000, 0.000000);
	TextDrawSetSelectable(Textdraw3, 0);

	Textdraw4 = TextDrawCreate(225.000000, 119.000000, "Inventory");
	TextDrawBackgroundColor(Textdraw4, 255);
	TextDrawFont(Textdraw4, 1);
	TextDrawLetterSize(Textdraw4, 0.610000, 2.099998);
	TextDrawColor(Textdraw4, -905969409);
	TextDrawSetOutline(Textdraw4, 0);
	TextDrawSetProportional(Textdraw4, 1);
	TextDrawSetShadow(Textdraw4, 1);
	TextDrawSetSelectable(Textdraw4, 0);

	Textdraw6 = TextDrawCreate(230.000000, 191.000000, "~n~");
	TextDrawBackgroundColor(Textdraw6, 255);
	TextDrawFont(Textdraw6, 1);
	TextDrawLetterSize(Textdraw6, 0.500000, -0.200000);
	TextDrawColor(Textdraw6, -1);
	TextDrawSetOutline(Textdraw6, 0);
	TextDrawSetProportional(Textdraw6, 1);
	TextDrawSetShadow(Textdraw6, 1);
	TextDrawUseBox(Textdraw6, 1);
	TextDrawBoxColor(Textdraw6, 255);
	TextDrawTextSize(Textdraw6, 306.000000, 0.000000);
	TextDrawSetSelectable(Textdraw6, 0);

	Textdraw7 = TextDrawCreate(230.000000, 254.000000, "~n~");
	TextDrawBackgroundColor(Textdraw7, 255);
	TextDrawFont(Textdraw7, 1);
	TextDrawLetterSize(Textdraw7, 0.500000, -0.200000);
	TextDrawColor(Textdraw7, -1);
	TextDrawSetOutline(Textdraw7, 0);
	TextDrawSetProportional(Textdraw7, 1);
	TextDrawSetShadow(Textdraw7, 1);
	TextDrawUseBox(Textdraw7, 1);
	TextDrawBoxColor(Textdraw7, 255);
	TextDrawTextSize(Textdraw7, 306.000000, 0.000000);
	TextDrawSetSelectable(Textdraw7, 0);

	Textdraw8 = TextDrawCreate(395.000000, 191.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw8, 255);
	TextDrawFont(Textdraw8, 1);
	TextDrawLetterSize(Textdraw8, 0.500000, -0.100000);
	TextDrawColor(Textdraw8, -1);
	TextDrawSetOutline(Textdraw8, 0);
	TextDrawSetProportional(Textdraw8, 1);
	TextDrawSetShadow(Textdraw8, 1);
	TextDrawUseBox(Textdraw8, 1);
	TextDrawBoxColor(Textdraw8, 255);
	TextDrawTextSize(Textdraw8, 312.000000, 0.000000);
	TextDrawSetSelectable(Textdraw8, 0);

	Textdraw9 = TextDrawCreate(395.000000, 254.000000, "~n~");
	TextDrawBackgroundColor(Textdraw9, 255);
	TextDrawFont(Textdraw9, 1);
	TextDrawLetterSize(Textdraw9, 0.500000, -0.200000);
	TextDrawColor(Textdraw9, -1);
	TextDrawSetOutline(Textdraw9, 0);
	TextDrawSetProportional(Textdraw9, 1);
	TextDrawSetShadow(Textdraw9, 1);
	TextDrawUseBox(Textdraw9, 1);
	TextDrawBoxColor(Textdraw9, 255);
	TextDrawTextSize(Textdraw9, 313.000000, 0.000000);
	TextDrawSetSelectable(Textdraw9, 0);

	Textdraw10 = TextDrawCreate(230.000000, 191.000000, "~n~");
	TextDrawBackgroundColor(Textdraw10, 255);
	TextDrawFont(Textdraw10, 1);
	TextDrawLetterSize(Textdraw10, 0.500000, 6.499999);
	TextDrawColor(Textdraw10, -1);
	TextDrawSetOutline(Textdraw10, 0);
	TextDrawSetProportional(Textdraw10, 1);
	TextDrawSetShadow(Textdraw10, 1);
	TextDrawUseBox(Textdraw10, 1);
	TextDrawBoxColor(Textdraw10, 80);
	TextDrawTextSize(Textdraw10, 306.000000, 0.000000);
	TextDrawSetSelectable(Textdraw10, 0);

	Textdraw11 = TextDrawCreate(395.000000, 191.000000, "~n~");
	TextDrawBackgroundColor(Textdraw11, 255);
	TextDrawFont(Textdraw11, 1);
	TextDrawLetterSize(Textdraw11, 0.500000, 6.800000);
	TextDrawColor(Textdraw11, -1);
	TextDrawSetOutline(Textdraw11, 0);
	TextDrawSetProportional(Textdraw11, 1);
	TextDrawSetShadow(Textdraw11, 1);
	TextDrawUseBox(Textdraw11, 1);
	TextDrawBoxColor(Textdraw11, 80);
	TextDrawTextSize(Textdraw11, 312.000000, 0.000000);
	TextDrawSetSelectable(Textdraw11, 0);

	Textdraw12 = TextDrawCreate(476.000000, 191.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw12, 255);
	TextDrawFont(Textdraw12, 1);
	TextDrawLetterSize(Textdraw12, 0.500000, -0.100000);
	TextDrawColor(Textdraw12, -1);
	TextDrawSetOutline(Textdraw12, 0);
	TextDrawSetProportional(Textdraw12, 1);
	TextDrawSetShadow(Textdraw12, 1);
	TextDrawUseBox(Textdraw12, 1);
	TextDrawBoxColor(Textdraw12, 255);
	TextDrawTextSize(Textdraw12, 396.000000, 0.000000);
	TextDrawSetSelectable(Textdraw12, 0);

	Textdraw13 = TextDrawCreate(476.000000, 254.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw13, 255);
	TextDrawFont(Textdraw13, 1);
	TextDrawLetterSize(Textdraw13, 0.500000, -0.100000);
	TextDrawColor(Textdraw13, -1);
	TextDrawSetOutline(Textdraw13, 0);
	TextDrawSetProportional(Textdraw13, 1);
	TextDrawSetShadow(Textdraw13, 1);
	TextDrawUseBox(Textdraw13, 1);
	TextDrawBoxColor(Textdraw13, 255);
	TextDrawTextSize(Textdraw13, 396.000000, 0.000000);
	TextDrawSetSelectable(Textdraw13, 0);

	Textdraw14 = TextDrawCreate(476.000000, 191.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw14, 255);
	TextDrawFont(Textdraw14, 1);
	TextDrawLetterSize(Textdraw14, 0.500000, 3.299998);
	TextDrawColor(Textdraw14, -1);
	TextDrawSetOutline(Textdraw14, 0);
	TextDrawSetProportional(Textdraw14, 1);
	TextDrawSetShadow(Textdraw14, 1);
	TextDrawUseBox(Textdraw14, 1);
	TextDrawBoxColor(Textdraw14, 80);
	TextDrawTextSize(Textdraw14, 396.000000, 0.000000);
	TextDrawSetSelectable(Textdraw14, 0);

	Textdraw15 = TextDrawCreate(559.000000, 191.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw15, 255);
	TextDrawFont(Textdraw15, 1);
	TextDrawLetterSize(Textdraw15, 0.500000, -0.100000);
	TextDrawColor(Textdraw15, -1);
	TextDrawSetOutline(Textdraw15, 0);
	TextDrawSetProportional(Textdraw15, 1);
	TextDrawSetShadow(Textdraw15, 1);
	TextDrawUseBox(Textdraw15, 1);
	TextDrawBoxColor(Textdraw15, 255);
	TextDrawTextSize(Textdraw15, 479.000000, 0.000000);
	TextDrawSetSelectable(Textdraw15, 0);

	Textdraw16 = TextDrawCreate(559.000000, 254.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw16, 255);
	TextDrawFont(Textdraw16, 1);
	TextDrawLetterSize(Textdraw16, 0.500000, -0.100000);
	TextDrawColor(Textdraw16, -1);
	TextDrawSetOutline(Textdraw16, 0);
	TextDrawSetProportional(Textdraw16, 1);
	TextDrawSetShadow(Textdraw16, 1);
	TextDrawUseBox(Textdraw16, 1);
	TextDrawBoxColor(Textdraw16, 255);
	TextDrawTextSize(Textdraw16, 479.000000, 0.000000);
	TextDrawSetSelectable(Textdraw16, 0);

	Textdraw17 = TextDrawCreate(559.000000, 191.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw17, 255);
	TextDrawFont(Textdraw17, 1);
	TextDrawLetterSize(Textdraw17, 0.500000, 3.299998);
	TextDrawColor(Textdraw17, -1);
	TextDrawSetOutline(Textdraw17, 0);
	TextDrawSetProportional(Textdraw17, 1);
	TextDrawSetShadow(Textdraw17, 1);
	TextDrawUseBox(Textdraw17, 1);
	TextDrawBoxColor(Textdraw17, 80);
	TextDrawTextSize(Textdraw17, 479.000000, 0.000000);
	TextDrawSetSelectable(Textdraw17, 0);

	Textdraw18 = TextDrawCreate(636.000000, 254.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw18, 255);
	TextDrawFont(Textdraw18, 1);
	TextDrawLetterSize(Textdraw18, 0.500000, -0.100000);
	TextDrawColor(Textdraw18, -1);
	TextDrawSetOutline(Textdraw18, 0);
	TextDrawSetProportional(Textdraw18, 1);
	TextDrawSetShadow(Textdraw18, 1);
	TextDrawUseBox(Textdraw18, 1);
	TextDrawBoxColor(Textdraw18, 255);
	TextDrawTextSize(Textdraw18, 561.000000, 0.000000);
	TextDrawSetSelectable(Textdraw18, 0);

	Textdraw19 = TextDrawCreate(636.000000, 191.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw19, 255);
	TextDrawFont(Textdraw19, 1);
	TextDrawLetterSize(Textdraw19, 0.500000, -0.100000);
	TextDrawColor(Textdraw19, -1);
	TextDrawSetOutline(Textdraw19, 0);
	TextDrawSetProportional(Textdraw19, 1);
	TextDrawSetShadow(Textdraw19, 1);
	TextDrawUseBox(Textdraw19, 1);
	TextDrawBoxColor(Textdraw19, 255);
	TextDrawTextSize(Textdraw19, 561.000000, 0.000000);
	TextDrawSetSelectable(Textdraw19, 0);

	Textdraw20 = TextDrawCreate(636.000000, 191.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw20, 255);
	TextDrawFont(Textdraw20, 1);
	TextDrawLetterSize(Textdraw20, 0.400000, 3.299999);
	TextDrawColor(Textdraw20, -1);
	TextDrawSetOutline(Textdraw20, 0);
	TextDrawSetProportional(Textdraw20, 1);
	TextDrawSetShadow(Textdraw20, 1);
	TextDrawUseBox(Textdraw20, 1);
	TextDrawBoxColor(Textdraw20, 80);
	TextDrawTextSize(Textdraw20, 561.000000, 2.000000);
	TextDrawSetSelectable(Textdraw20, 0);

	Textdraw21 = TextDrawCreate(230.000000, 262.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw21, 255);
	TextDrawFont(Textdraw21, 1);
	TextDrawLetterSize(Textdraw21, 0.500000, -0.100000);
	TextDrawColor(Textdraw21, -1);
	TextDrawSetOutline(Textdraw21, 0);
	TextDrawSetProportional(Textdraw21, 1);
	TextDrawSetShadow(Textdraw21, 1);
	TextDrawUseBox(Textdraw21, 1);
	TextDrawBoxColor(Textdraw21, 255);
	TextDrawTextSize(Textdraw21, 306.000000, -1.000000);
	TextDrawSetSelectable(Textdraw21, 0);

	Textdraw22 = TextDrawCreate(395.000000, 262.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw22, 255);
	TextDrawFont(Textdraw22, 1);
	TextDrawLetterSize(Textdraw22, 1.120000, -0.100000);
	TextDrawColor(Textdraw22, -1);
	TextDrawSetOutline(Textdraw22, 0);
	TextDrawSetProportional(Textdraw22, 1);
	TextDrawSetShadow(Textdraw22, 1);
	TextDrawUseBox(Textdraw22, 1);
	TextDrawBoxColor(Textdraw22, 255);
	TextDrawTextSize(Textdraw22, 313.000000, -1.000000);
	TextDrawSetSelectable(Textdraw22, 0);

	Textdraw23 = TextDrawCreate(476.000000, 262.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw23, 255);
	TextDrawFont(Textdraw23, 1);
	TextDrawLetterSize(Textdraw23, 1.120000, -0.100000);
	TextDrawColor(Textdraw23, -1);
	TextDrawSetOutline(Textdraw23, 0);
	TextDrawSetProportional(Textdraw23, 1);
	TextDrawSetShadow(Textdraw23, 1);
	TextDrawUseBox(Textdraw23, 1);
	TextDrawBoxColor(Textdraw23, 255);
	TextDrawTextSize(Textdraw23, 396.000000, -1.000000);
	TextDrawSetSelectable(Textdraw23, 0);

	Textdraw24 = TextDrawCreate(560.000000, 263.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw24, 255);
	TextDrawFont(Textdraw24, 1);
	TextDrawLetterSize(Textdraw24, 1.120000, -0.100000);
	TextDrawColor(Textdraw24, -1);
	TextDrawSetOutline(Textdraw24, 0);
	TextDrawSetProportional(Textdraw24, 1);
	TextDrawSetShadow(Textdraw24, 1);
	TextDrawUseBox(Textdraw24, 1);
	TextDrawBoxColor(Textdraw24, 255);
	TextDrawTextSize(Textdraw24, 479.000000, -11.000000);
	TextDrawSetSelectable(Textdraw24, 0);

	Textdraw25 = TextDrawCreate(636.000000, 262.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw25, 255);
	TextDrawFont(Textdraw25, 1);
	TextDrawLetterSize(Textdraw25, 1.120000, -0.100000);
	TextDrawColor(Textdraw25, -1);
	TextDrawSetOutline(Textdraw25, 0);
	TextDrawSetProportional(Textdraw25, 1);
	TextDrawSetShadow(Textdraw25, 1);
	TextDrawUseBox(Textdraw25, 1);
	TextDrawBoxColor(Textdraw25, 255);
	TextDrawTextSize(Textdraw25, 561.000000, -11.000000);
	TextDrawSetSelectable(Textdraw25, 0);

	Textdraw26 = TextDrawCreate(230.000000, 262.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw26, 255);
	TextDrawFont(Textdraw26, 1);
	TextDrawLetterSize(Textdraw26, 0.500000, 3.799998);
	TextDrawColor(Textdraw26, -1);
	TextDrawSetOutline(Textdraw26, 0);
	TextDrawSetProportional(Textdraw26, 1);
	TextDrawSetShadow(Textdraw26, 1);
	TextDrawUseBox(Textdraw26, 1);
	TextDrawBoxColor(Textdraw26, 80);
	TextDrawTextSize(Textdraw26, 306.000000, -1.000000);
	TextDrawSetSelectable(Textdraw26, 0);

	Textdraw27 = TextDrawCreate(395.000000, 262.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw27, 255);
	TextDrawFont(Textdraw27, 1);
	TextDrawLetterSize(Textdraw27, 0.500000, 3.799998);
	TextDrawColor(Textdraw27, -1);
	TextDrawSetOutline(Textdraw27, 0);
	TextDrawSetProportional(Textdraw27, 1);
	TextDrawSetShadow(Textdraw27, 1);
	TextDrawUseBox(Textdraw27, 1);
	TextDrawBoxColor(Textdraw27, 80);
	TextDrawTextSize(Textdraw27, 313.000000, -1.000000);
	TextDrawSetSelectable(Textdraw27, 0);

	Textdraw28 = TextDrawCreate(476.000000, 262.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw28, 255);
	TextDrawFont(Textdraw28, 1);
	TextDrawLetterSize(Textdraw28, 0.500000, 3.799998);
	TextDrawColor(Textdraw28, -1);
	TextDrawSetOutline(Textdraw28, 0);
	TextDrawSetProportional(Textdraw28, 1);
	TextDrawSetShadow(Textdraw28, 1);
	TextDrawUseBox(Textdraw28, 1);
	TextDrawBoxColor(Textdraw28, 80);
	TextDrawTextSize(Textdraw28, 396.000000, -1.000000);
	TextDrawSetSelectable(Textdraw28, 0);

	Textdraw29 = TextDrawCreate(560.000000, 262.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw29, 255);
	TextDrawFont(Textdraw29, 1);
	TextDrawLetterSize(Textdraw29, 0.500000, 3.799998);
	TextDrawColor(Textdraw29, -1);
	TextDrawSetOutline(Textdraw29, 0);
	TextDrawSetProportional(Textdraw29, 1);
	TextDrawSetShadow(Textdraw29, 1);
	TextDrawUseBox(Textdraw29, 1);
	TextDrawBoxColor(Textdraw29, 80);
	TextDrawTextSize(Textdraw29, 479.000000, -1.000000);
	TextDrawSetSelectable(Textdraw29, 0);

	Textdraw30 = TextDrawCreate(636.000000, 262.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw30, 255);
	TextDrawFont(Textdraw30, 1);
	TextDrawLetterSize(Textdraw30, 0.500000, 3.799998);
	TextDrawColor(Textdraw30, -1);
	TextDrawSetOutline(Textdraw30, 0);
	TextDrawSetProportional(Textdraw30, 1);
	TextDrawSetShadow(Textdraw30, 1);
	TextDrawUseBox(Textdraw30, 1);
	TextDrawBoxColor(Textdraw30, 80);
	TextDrawTextSize(Textdraw30, 561.000000, -1.000000);
	TextDrawSetSelectable(Textdraw30, 0);

	Textdraw31 = TextDrawCreate(636.000000, 332.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw31, 255);
	TextDrawFont(Textdraw31, 1);
	TextDrawLetterSize(Textdraw31, 1.120000, -0.100000);
	TextDrawColor(Textdraw31, -1);
	TextDrawSetOutline(Textdraw31, 0);
	TextDrawSetProportional(Textdraw31, 1);
	TextDrawSetShadow(Textdraw31, 1);
	TextDrawUseBox(Textdraw31, 1);
	TextDrawBoxColor(Textdraw31, 255);
	TextDrawTextSize(Textdraw31, 561.000000, -11.000000);
	TextDrawSetSelectable(Textdraw31, 0);

	Textdraw32 = TextDrawCreate(560.000000, 332.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw32, 255);
	TextDrawFont(Textdraw32, 1);
	TextDrawLetterSize(Textdraw32, 1.120000, -0.100000);
	TextDrawColor(Textdraw32, -1);
	TextDrawSetOutline(Textdraw32, 0);
	TextDrawSetProportional(Textdraw32, 1);
	TextDrawSetShadow(Textdraw32, 1);
	TextDrawUseBox(Textdraw32, 1);
	TextDrawBoxColor(Textdraw32, 255);
	TextDrawTextSize(Textdraw32, 479.000000, -11.000000);
	TextDrawSetSelectable(Textdraw32, 0);

	Textdraw33 = TextDrawCreate(401.000000, 332.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw33, 255);
	TextDrawFont(Textdraw33, 1);
	TextDrawLetterSize(Textdraw33, 1.120000, -0.100000);
	TextDrawColor(Textdraw33, -1);
	TextDrawSetOutline(Textdraw33, 0);
	TextDrawSetProportional(Textdraw33, 1);
	TextDrawSetShadow(Textdraw33, 1);
	TextDrawUseBox(Textdraw33, 1);
	TextDrawBoxColor(Textdraw33, 255);
	TextDrawTextSize(Textdraw33, 471.000000, -11.000000);
	TextDrawSetSelectable(Textdraw33, 0);

	Textdraw34 = TextDrawCreate(318.000000, 332.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw34, 255);
	TextDrawFont(Textdraw34, 1);
	TextDrawLetterSize(Textdraw34, 1.120000, -0.100000);
	TextDrawColor(Textdraw34, -1);
	TextDrawSetOutline(Textdraw34, 0);
	TextDrawSetProportional(Textdraw34, 1);
	TextDrawSetShadow(Textdraw34, 1);
	TextDrawUseBox(Textdraw34, 1);
	TextDrawBoxColor(Textdraw34, 255);
	TextDrawTextSize(Textdraw34, 390.000000, -11.000000);
	TextDrawSetSelectable(Textdraw34, 0);

	Textdraw35 = TextDrawCreate(230.000000, 332.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw35, 255);
	TextDrawFont(Textdraw35, 1);
	TextDrawLetterSize(Textdraw35, 1.120000, -0.100000);
	TextDrawColor(Textdraw35, -1);
	TextDrawSetOutline(Textdraw35, 0);
	TextDrawSetProportional(Textdraw35, 1);
	TextDrawSetShadow(Textdraw35, 1);
	TextDrawUseBox(Textdraw35, 1);
	TextDrawBoxColor(Textdraw35, 255);
	TextDrawTextSize(Textdraw35, 306.000000, -11.000000);
	TextDrawSetSelectable(Textdraw35, 0);

	Textdraw36 = TextDrawCreate(230.000000, 340.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw36, 255);
	TextDrawFont(Textdraw36, 1);
	TextDrawLetterSize(Textdraw36, 1.120000, -0.100000);
	TextDrawColor(Textdraw36, -1);
	TextDrawSetOutline(Textdraw36, 0);
	TextDrawSetProportional(Textdraw36, 1);
	TextDrawSetShadow(Textdraw36, 1);
	TextDrawUseBox(Textdraw36, 1);
	TextDrawBoxColor(Textdraw36, 255);
	TextDrawTextSize(Textdraw36, 306.000000, -11.000000);
	TextDrawSetSelectable(Textdraw36, 0);

	Textdraw37 = TextDrawCreate(395.000000, 340.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw37, 255);
	TextDrawFont(Textdraw37, 1);
	TextDrawLetterSize(Textdraw37, 1.120000, -0.100000);
	TextDrawColor(Textdraw37, -1);
	TextDrawSetOutline(Textdraw37, 0);
	TextDrawSetProportional(Textdraw37, 1);
	TextDrawSetShadow(Textdraw37, 1);
	TextDrawUseBox(Textdraw37, 1);
	TextDrawBoxColor(Textdraw37, 255);
	TextDrawTextSize(Textdraw37, 313.000000, -11.000000);
	TextDrawSetSelectable(Textdraw37, 0);

	Textdraw38 = TextDrawCreate(476.000000, 340.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw38, 255);
	TextDrawFont(Textdraw38, 1);
	TextDrawLetterSize(Textdraw38, 1.120000, -0.100000);
	TextDrawColor(Textdraw38, -1);
	TextDrawSetOutline(Textdraw38, 0);
	TextDrawSetProportional(Textdraw38, 1);
	TextDrawSetShadow(Textdraw38, 1);
	TextDrawUseBox(Textdraw38, 1);
	TextDrawBoxColor(Textdraw38, 255);
	TextDrawTextSize(Textdraw38, 396.000000, -11.000000);
	TextDrawSetSelectable(Textdraw38, 0);

	Textdraw39 = TextDrawCreate(560.000000, 340.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw39, 255);
	TextDrawFont(Textdraw39, 1);
	TextDrawLetterSize(Textdraw39, 1.120000, -0.100000);
	TextDrawColor(Textdraw39, -1);
	TextDrawSetOutline(Textdraw39, 0);
	TextDrawSetProportional(Textdraw39, 1);
	TextDrawSetShadow(Textdraw39, 1);
	TextDrawUseBox(Textdraw39, 1);
	TextDrawBoxColor(Textdraw39, 255);
	TextDrawTextSize(Textdraw39, 479.000000, -11.000000);
	TextDrawSetSelectable(Textdraw39, 0);

	Textdraw40 = TextDrawCreate(636.000000, 340.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw40, 255);
	TextDrawFont(Textdraw40, 1);
	TextDrawLetterSize(Textdraw40, 1.120000, -0.100000);
	TextDrawColor(Textdraw40, -1);
	TextDrawSetOutline(Textdraw40, 0);
	TextDrawSetProportional(Textdraw40, 1);
	TextDrawSetShadow(Textdraw40, 1);
	TextDrawUseBox(Textdraw40, 1);
	TextDrawBoxColor(Textdraw40, 255);
	TextDrawTextSize(Textdraw40, 561.000000, -11.000000);
	TextDrawSetSelectable(Textdraw40, 0);

	Textdraw41 = TextDrawCreate(230.000000, 340.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw41, 255);
	TextDrawFont(Textdraw41, 1);
	TextDrawLetterSize(Textdraw41, 1.120000, 3.799999);
	TextDrawColor(Textdraw41, -1);
	TextDrawSetOutline(Textdraw41, 0);
	TextDrawSetProportional(Textdraw41, 1);
	TextDrawSetShadow(Textdraw41, 1);
	TextDrawUseBox(Textdraw41, 1);
	TextDrawBoxColor(Textdraw41, 80);
	TextDrawTextSize(Textdraw41, 306.000000, -7.000000);
	TextDrawSetSelectable(Textdraw41, 0);

	Textdraw42 = TextDrawCreate(395.000000, 340.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw42, 255);
	TextDrawFont(Textdraw42, 1);
	TextDrawLetterSize(Textdraw42, 1.120000, 3.799999);
	TextDrawColor(Textdraw42, -1);
	TextDrawSetOutline(Textdraw42, 0);
	TextDrawSetProportional(Textdraw42, 1);
	TextDrawSetShadow(Textdraw42, 1);
	TextDrawUseBox(Textdraw42, 1);
	TextDrawBoxColor(Textdraw42, 80);
	TextDrawTextSize(Textdraw42, 313.000000, -7.000000);
	TextDrawSetSelectable(Textdraw42, 0);

	Textdraw43 = TextDrawCreate(476.000000, 340.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw43, 255);
	TextDrawFont(Textdraw43, 1);
	TextDrawLetterSize(Textdraw43, 1.620000, 3.799999);
	TextDrawColor(Textdraw43, -1);
	TextDrawSetOutline(Textdraw43, 0);
	TextDrawSetProportional(Textdraw43, 1);
	TextDrawSetShadow(Textdraw43, 1);
	TextDrawUseBox(Textdraw43, 1);
	TextDrawBoxColor(Textdraw43, 80);
	TextDrawTextSize(Textdraw43, 396.000000, -7.000000);
	TextDrawSetSelectable(Textdraw43, 0);

	Textdraw44 = TextDrawCreate(560.000000, 340.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw44, 255);
	TextDrawFont(Textdraw44, 1);
	TextDrawLetterSize(Textdraw44, 1.620000, 3.799999);
	TextDrawColor(Textdraw44, -1);
	TextDrawSetOutline(Textdraw44, 0);
	TextDrawSetProportional(Textdraw44, 1);
	TextDrawSetShadow(Textdraw44, 1);
	TextDrawUseBox(Textdraw44, 1);
	TextDrawBoxColor(Textdraw44, 80);
	TextDrawTextSize(Textdraw44, 479.000000, -7.000000);
	TextDrawSetSelectable(Textdraw44, 0);

	Textdraw45 = TextDrawCreate(636.000000, 340.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw45, 255);
	TextDrawFont(Textdraw45, 1);
	TextDrawLetterSize(Textdraw45, 1.620000, 3.799999);
	TextDrawColor(Textdraw45, -1);
	TextDrawSetOutline(Textdraw45, 0);
	TextDrawSetProportional(Textdraw45, 1);
	TextDrawSetShadow(Textdraw45, 1);
	TextDrawUseBox(Textdraw45, 1);
	TextDrawBoxColor(Textdraw45, 80);
	TextDrawTextSize(Textdraw45, 561.000000, -7.000000);
	TextDrawSetSelectable(Textdraw45, 0);

	Textdraw46 = TextDrawCreate(636.000000, 410.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw46, 255);
	TextDrawFont(Textdraw46, 1);
	TextDrawLetterSize(Textdraw46, 1.120000, -0.100000);
	TextDrawColor(Textdraw46, -1);
	TextDrawSetOutline(Textdraw46, 0);
	TextDrawSetProportional(Textdraw46, 1);
	TextDrawSetShadow(Textdraw46, 1);
	TextDrawUseBox(Textdraw46, 1);
	TextDrawBoxColor(Textdraw46, 255);
	TextDrawTextSize(Textdraw46, 561.000000, -11.000000);
	TextDrawSetSelectable(Textdraw46, 0);

	Textdraw47 = TextDrawCreate(484.000000, 410.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw47, 255);
	TextDrawFont(Textdraw47, 1);
	TextDrawLetterSize(Textdraw47, 1.120000, -0.100000);
	TextDrawColor(Textdraw47, -1);
	TextDrawSetOutline(Textdraw47, 0);
	TextDrawSetProportional(Textdraw47, 1);
	TextDrawSetShadow(Textdraw47, 1);
	TextDrawUseBox(Textdraw47, 1);
	TextDrawBoxColor(Textdraw47, 255);
	TextDrawTextSize(Textdraw47, 555.000000, -11.000000);
	TextDrawSetSelectable(Textdraw47, 0);

	Textdraw48 = TextDrawCreate(401.000000, 410.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw48, 255);
	TextDrawFont(Textdraw48, 1);
	TextDrawLetterSize(Textdraw48, 1.120000, -0.100000);
	TextDrawColor(Textdraw48, -1);
	TextDrawSetOutline(Textdraw48, 0);
	TextDrawSetProportional(Textdraw48, 1);
	TextDrawSetShadow(Textdraw48, 1);
	TextDrawUseBox(Textdraw48, 1);
	TextDrawBoxColor(Textdraw48, 255);
	TextDrawTextSize(Textdraw48, 471.000000, -11.000000);
	TextDrawSetSelectable(Textdraw48, 0);

	Textdraw49 = TextDrawCreate(318.000000, 410.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw49, 255);
	TextDrawFont(Textdraw49, 1);
	TextDrawLetterSize(Textdraw49, 1.120000, -0.100000);
	TextDrawColor(Textdraw49, -1);
	TextDrawSetOutline(Textdraw49, 0);
	TextDrawSetProportional(Textdraw49, 1);
	TextDrawSetShadow(Textdraw49, 1);
	TextDrawUseBox(Textdraw49, 1);
	TextDrawBoxColor(Textdraw49, 255);
	TextDrawTextSize(Textdraw49, 390.000000, -11.000000);
	TextDrawSetSelectable(Textdraw49, 0);

	Textdraw50 = TextDrawCreate(230.000000, 410.000000, "~n~~n~");
	TextDrawBackgroundColor(Textdraw50, 255);
	TextDrawFont(Textdraw50, 1);
	TextDrawLetterSize(Textdraw50, 1.120000, -0.100000);
	TextDrawColor(Textdraw50, -1);
	TextDrawSetOutline(Textdraw50, 0);
	TextDrawSetProportional(Textdraw50, 1);
	TextDrawSetShadow(Textdraw50, 1);
	TextDrawUseBox(Textdraw50, 1);
	TextDrawBoxColor(Textdraw50, 255);
	TextDrawTextSize(Textdraw50, 306.000000, -11.000000);
	TextDrawSetSelectable(Textdraw50, 0);

	Textdraw51 = TextDrawCreate(525.000000, 421.000000, "Next page >");
	TextDrawBackgroundColor(Textdraw51, 255);
	TextDrawFont(Textdraw51, 1);
	TextDrawLetterSize(Textdraw51, 0.500000, 1.399999);
	TextDrawColor(Textdraw51, -1);
	TextDrawSetOutline(Textdraw51, 0);
	TextDrawSetProportional(Textdraw51, 1);
	TextDrawSetShadow(Textdraw51, 1);
	TextDrawSetSelectable(Textdraw51, 0);

	Textdraw52 = TextDrawCreate(228.000000, 421.000000, "< Previous page");
	TextDrawBackgroundColor(Textdraw52, 255);
	TextDrawFont(Textdraw52, 1);
	TextDrawLetterSize(Textdraw52, 0.500000, 1.399999);
	TextDrawColor(Textdraw52, -1);
	TextDrawSetOutline(Textdraw52, 0);
	TextDrawSetProportional(Textdraw52, 1);
	TextDrawSetShadow(Textdraw52, 1);
	TextDrawSetSelectable(Textdraw52, 0);

	Textdraw53 = TextDrawCreate(419.000000, 164.000000, "You don't know how to use inventory?~n~Type /help command and read instructions!");
	TextDrawBackgroundColor(Textdraw53, 255);
	TextDrawFont(Textdraw53, 1);
	TextDrawLetterSize(Textdraw53, 0.300000, 1.000000);
	TextDrawColor(Textdraw53, -1);
	TextDrawSetOutline(Textdraw53, 0);
	TextDrawSetProportional(Textdraw53, 1);
	TextDrawSetShadow(Textdraw53, 1);
	TextDrawSetSelectable(Textdraw53, 0);

	Textdraw56 = TextDrawCreate(620.000000, 118.000000, "x");
	TextDrawBackgroundColor(Textdraw56, 255);
	TextDrawFont(Textdraw56, 1);
	TextDrawLetterSize(Textdraw56, 0.619998, 1.399999);
	TextDrawColor(Textdraw56, -16776961);
	TextDrawSetOutline(Textdraw56, 0);
	TextDrawSetProportional(Textdraw56, 1);
	TextDrawSetShadow(Textdraw56, 1);
	TextDrawSetSelectable(Textdraw56, 0);

	Textdraw57 = TextDrawCreate(591.000000, 121.000000, "Exit");
	TextDrawBackgroundColor(Textdraw57, 255);
	TextDrawFont(Textdraw57, 1);
	TextDrawLetterSize(Textdraw57, 0.500000, 1.000000);
	TextDrawColor(Textdraw57, -1);
	TextDrawSetOutline(Textdraw57, 0);
	TextDrawSetProportional(Textdraw57, 1);
	TextDrawSetShadow(Textdraw57, 1);
	TextDrawSetSelectable(Textdraw57, 0);

	
	//
	//* ------------------------------------- Testing objects ------------
	AddStaticVehicleEx(428,1953.5999800,-1765.9000200,13.8000000,240.0000000,38,55,1500); //Securicar
	AddStaticVehicleEx(456,1953.6999500,-1771.1999500,14.2000000,270.0000000,54,65,1500); //Yankee
	AddStaticVehicleEx(609,1953.1999500,-1775.1999500,13.7000000,284.0000000,37,37,1500); //Boxville
	AddStaticVehicleEx(433,1953.0000000,-1778.9000200,13.7000000,290.0000000,95,10,1500); //Barracks
	AddStaticVehicleEx(490,1956.8000500,-1762.0000000,14.0000000,220.0000000,-1,-1,1500); //FBI Rancher
	AddStaticVehicleEx(401,1953.1999500,-1784.0000000,13.3000000,280.0000000,77,98,1500); //Bravura
	AddStaticVehicleEx(404,1953.0999800,-1787.0000000,13.3000000,260.0000000,43,62,1500); //Perrenial
	AddStaticVehicleEx(470,1953.1999500,-1790.6999500,13.9000000,76.0000000,95,10,1500); //Patriot
	AddStaticVehicleEx(500,1947.6999500,-1783.4000200,13.2000000,260.0000000,38,55,1500); //Mesa
	AddStaticVehicleEx(424,1947.9000200,-1786.5999800,13.4000000,272.0000000,215,142,1500); //BF Injection
	AddStaticVehicleEx(431,1938.8000500,-1780.5000000,14.5000000,0.0000000,116,29,1500); //Bus
	AddStaticVehicleEx(557,1947.1999500,-1777.3000500,13.9000000,180.0000000,245,245,1500); //Monster B
	AddStaticVehicleEx(568,1957.0000000,-1782.8000500,13.3000000,202.0000000,42,119,1500); //Bandito
	AddStaticVehicleEx(425,1964.8000500,-2356.1001000,14.5000000,0.0000000,95,10,1500); //Hunter
	AddStaticVehicleEx(490,2338.1001000,-1675.4000200,14.0000000,230.0000000,-1,-1,1500); //FBI Rancher
	AddStaticVehicleEx(428,2345.8000500,-1696.9000200,13.6000000,0.0000000,38,55,1500); //Securicar
	CreateDynamicObject(2672,2489.6001000,-1651.1999500,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(1)
	CreateDynamicObject(2672,2485.5000000,-1652.0999800,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(2)
	CreateDynamicObject(2672,2508.6999500,-1650.4000200,13.1000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(3)
	CreateDynamicObject(2672,2514.3000500,-1655.5999800,13.2000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(4)
	CreateDynamicObject(2672,2509.6999500,-1661.5999800,12.9000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(5)
	CreateDynamicObject(2672,2505.1001000,-1677.0999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(6)
	CreateDynamicObject(2672,2508.6001000,-1669.1999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(7)
	CreateDynamicObject(2672,2481.3000500,-1682.0999800,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(8)
	CreateDynamicObject(2672,2492.5000000,-1686.1999500,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(9)
	CreateDynamicObject(2672,2506.0000000,-1688.0000000,12.9000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(10)
	CreateDynamicObject(2672,2509.6001000,-1686.0000000,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(11)
	CreateDynamicObject(2672,2509.6001000,-1686.0000000,12.9000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(12)
	CreateDynamicObject(2672,2471.8999000,-1669.4000200,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(13)
	CreateDynamicObject(2672,2466.3999000,-1669.1999500,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(14)
	CreateDynamicObject(2672,2467.1001000,-1674.0000000,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(15)
	CreateDynamicObject(2672,2464.8000500,-1683.5999800,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(16)
	CreateDynamicObject(2672,2459.0000000,-1685.9000200,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(17)
	CreateDynamicObject(2672,2462.0000000,-1669.9000200,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(18)
	CreateDynamicObject(2672,2455.6999500,-1677.6999500,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(19)
	CreateDynamicObject(2672,2488.8000500,-1673.0000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(20)
	CreateDynamicObject(2672,2486.6001000,-1665.0999800,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(21)
	CreateDynamicObject(2672,2486.6001000,-1665.1999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(22)
	CreateDynamicObject(13591,2449.6001000,-1672.3000500,12.8000000,0.0000000,0.0000000,0.0000000); //object(kickcar28)(1)
	CreateDynamicObject(3594,2445.8000500,-1663.5000000,12.8000000,0.0000000,0.0000000,346.0000000); //object(la_fuckcar1)(1)
	CreateDynamicObject(3594,2454.3999000,-1657.4000200,12.8000000,0.0000000,0.0000000,47.9980000); //object(la_fuckcar1)(2)
	CreateDynamicObject(3594,2471.6999500,-1664.6999500,12.8000000,0.0000000,0.0000000,317.9940000); //object(la_fuckcar1)(3)
	CreateDynamicObject(3594,2472.8000500,-1655.5999800,12.8000000,0.0000000,0.0000000,87.9940000); //object(la_fuckcar1)(4)
	CreateDynamicObject(3594,2485.8999000,-1655.5999800,12.8000000,0.0000000,0.0000000,95.9900000); //object(la_fuckcar1)(5)
	CreateDynamicObject(3594,2508.0000000,-1666.5000000,12.8000000,0.0000000,0.0000000,13.9880000); //object(la_fuckcar1)(6)
	CreateDynamicObject(18249,2478.1999500,-1681.0999800,8.1000000,0.0000000,0.0000000,242.0000000); //object(cuntwjunk05)(1)
	CreateDynamicObject(1464,2481.5000000,-1689.4000200,13.7000000,0.0000000,0.0000000,0.0000000); //object(dyn_scaffold_3)(1)
	CreateDynamicObject(1218,2496.8999000,-1687.8000500,13.0000000,0.0000000,0.0000000,0.0000000); //object(barrel1)(1)
	CreateDynamicObject(1218,2497.8000500,-1687.5999800,13.0000000,0.0000000,0.0000000,0.0000000); //object(barrel1)(2)
	CreateDynamicObject(1218,2498.6999500,-1687.4000200,13.0000000,0.0000000,0.0000000,0.0000000); //object(barrel1)(3)
	CreateDynamicObject(1218,2499.6001000,-1687.1999500,13.0000000,0.0000000,0.0000000,0.0000000); //object(barrel1)(4)
	CreateDynamicObject(3461,2497.0000000,-1691.5000000,17.7000000,270.0000000,180.0000000,180.0000000); //object(tikitorch01_lvs)(1)
	CreateDynamicObject(3461,2491.5000000,-1691.5000000,17.7000000,270.0000000,179.9950000,179.9950000); //object(tikitorch01_lvs)(2)
	CreateDynamicObject(3461,2494.1001000,-1689.5000000,11.7000000,360.0000000,0.0000000,30.0000000); //object(tikitorch01_lvs)(3)
	CreateDynamicObject(3461,2492.8000500,-1693.4000200,11.9000000,359.9950000,0.0000000,29.9980000); //object(tikitorch01_lvs)(4)
	CreateDynamicObject(3461,2495.6001000,-1691.5999800,11.9000000,359.9950000,0.0000000,29.9980000); //object(tikitorch01_lvs)(5)
	CreateDynamicObject(3461,2463.5000000,-1693.3000500,13.7000000,270.0000000,180.6960000,180.6960000); //object(tikitorch01_lvs)(6)
	CreateDynamicObject(3461,2465.8000500,-1692.8000500,13.7000000,270.0000000,180.6920000,180.6920000); //object(tikitorch01_lvs)(7)
	CreateDynamicObject(3461,2467.0000000,-1693.1999500,13.7000000,270.0000000,180.6920000,158.6920000); //object(tikitorch01_lvs)(8)
	CreateDynamicObject(3461,2454.8999000,-1693.1999500,13.4000000,273.6050000,56.3400000,28.2870000); //object(tikitorch01_lvs)(9)
	CreateDynamicObject(3461,2453.8000500,-1692.8000500,13.4000000,273.6040000,56.3380000,58.2840000); //object(tikitorch01_lvs)(10)
	CreateDynamicObject(3461,2452.3000500,-1693.1999500,13.4000000,273.5980000,56.3320000,78.2820000); //object(tikitorch01_lvs)(11)
	CreateDynamicObject(3524,2462.0000000,-1648.5999800,15.4000000,0.0000000,0.0000000,0.0000000); //object(skullpillar01_lvs)(1)
	CreateDynamicObject(3524,2476.8000500,-1648.5999800,15.4000000,0.0000000,0.0000000,0.0000000); //object(skullpillar01_lvs)(2)
	CreateDynamicObject(3877,2438.1001000,-1651.3000500,14.2000000,0.0000000,0.0000000,0.0000000); //object(sf_rooflite)(1)
	CreateDynamicObject(3877,2438.1999500,-1656.6999500,14.0000000,0.0000000,0.0000000,0.0000000); //object(sf_rooflite)(2)
	CreateDynamicObject(3877,2437.8999000,-1661.8000500,14.0000000,0.0000000,0.0000000,0.0000000); //object(sf_rooflite)(3)
	CreateDynamicObject(3877,2437.8999000,-1667.0000000,14.2000000,0.0000000,0.0000000,0.0000000); //object(sf_rooflite)(4)
	CreateDynamicObject(971,2435.3000500,-1650.0000000,12.5000000,0.0000000,0.0000000,75.0000000); //object(subwaygate)(1)
	CreateDynamicObject(971,2434.1999500,-1668.1999500,12.5000000,0.0000000,0.0000000,104.9980000); //object(subwaygate)(2)
	CreateDynamicObject(971,2435.3999000,-1676.9000200,12.5000000,0.0000000,0.0000000,90.9960000); //object(subwaygate)(3)
	CreateDynamicObject(971,2435.6001000,-1641.3000500,12.5000000,0.0000000,0.0000000,97.9980000); //object(subwaygate)(4)
	CreateDynamicObject(971,2436.6999500,-1632.9000200,12.5000000,0.0000000,0.0000000,68.2480000); //object(subwaygate)(5)
	CreateDynamicObject(979,2427.3000500,-1659.6999500,13.2000000,0.0000000,0.0000000,70.0000000); //object(sub_roadleft)(1)
	CreateDynamicObject(983,2540.6999500,-1713.0000000,13.2000000,0.0000000,0.0000000,0.0000000); //object(fenceshit3)(1)
	CreateDynamicObject(983,2522.1999500,-1722.1999500,13.2000000,0.0000000,0.0000000,270.0000000); //object(fenceshit3)(2)
	CreateDynamicObject(1237,2425.0000000,-1664.5999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(strtbarrier01)(1)
	CreateDynamicObject(1237,2428.1001000,-1654.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(strtbarrier01)(2)
	CreateDynamicObject(1407,2430.5000000,-1653.6999500,13.4000000,0.0000000,0.0000000,0.0000000); //object(dyn_f_r_wood_1)(1)
	CreateDynamicObject(1407,2429.1001000,-1664.1999500,13.4000000,0.0000000,0.0000000,180.0000000); //object(dyn_f_r_wood_1)(2)
	CreateDynamicObject(1411,2437.1001000,-1653.5999800,14.1000000,0.0000000,0.0000000,0.0000000); //object(dyn_mesh_1)(1)
	CreateDynamicObject(1424,2436.3000500,-1657.6999500,12.9000000,0.0000000,0.0000000,60.0000000); //object(dyn_roadbarrier_2)(1)
	CreateDynamicObject(1424,2436.1001000,-1660.4000200,12.9000000,0.0000000,0.0000000,109.9960000); //object(dyn_roadbarrier_2)(2)
	CreateDynamicObject(1447,2460.5000000,-1668.8000500,13.8000000,0.0000000,0.0000000,180.0000000); //object(dyn_mesh_4)(1)
	CreateDynamicObject(1447,2455.1999500,-1668.8000500,13.8000000,0.0000000,0.0000000,179.9950000); //object(dyn_mesh_4)(2)
	CreateDynamicObject(1447,2445.6001000,-1668.9000200,13.8000000,0.0000000,0.0000000,179.9950000); //object(dyn_mesh_4)(3)
	CreateDynamicObject(1447,2440.3000500,-1668.9000200,13.8000000,0.0000000,0.0000000,179.9950000); //object(dyn_mesh_4)(4)
	CreateDynamicObject(929,2533.5000000,-1665.6999500,15.1000000,0.0000000,0.0000000,0.0000000); //object(generator)(1)
	CreateDynamicObject(3287,2532.6001000,-1646.5999800,17.2000000,0.0000000,0.0000000,0.0000000); //object(cxrf_oiltank)(1)
	CreateDynamicObject(944,2488.8000500,-1683.0999800,13.2000000,0.0000000,0.0000000,0.0000000); //object(packing_carates04)(1)
	CreateDynamicObject(942,2529.1001000,-1669.9000200,16.6000000,0.0000000,0.0000000,0.0000000); //object(cj_df_unit_2)(1)
	CreateDynamicObject(935,2507.6001000,-1662.0000000,13.0000000,0.0000000,0.0000000,0.0000000); //object(cj_drum)(1)
	CreateDynamicObject(935,2506.8999000,-1661.0999800,13.0000000,0.0000000,0.0000000,0.0000000); //object(cj_drum)(2)
	CreateDynamicObject(935,2506.5000000,-1662.0000000,13.0000000,0.0000000,0.0000000,0.0000000); //object(cj_drum)(3)
	CreateDynamicObject(935,2505.8999000,-1661.0999800,13.0000000,0.0000000,0.0000000,0.0000000); //object(cj_drum)(4)
	CreateDynamicObject(935,2506.3000500,-1660.1999500,13.0000000,0.0000000,0.0000000,0.0000000); //object(cj_drum)(5)
	CreateDynamicObject(935,2504.8999000,-1661.3000500,13.0000000,0.0000000,0.0000000,0.0000000); //object(cj_drum)(6)
	CreateDynamicObject(2973,2505.8000500,-1651.4000200,12.6000000,0.0000000,0.0000000,0.0000000); //object(k_cargo2)(1)
	CreateDynamicObject(925,2523.6999500,-1664.9000200,15.2000000,0.0000000,0.0000000,0.0000000); //object(rack2)(1)
	CreateDynamicObject(1362,2486.8999000,-1679.6999500,12.9000000,0.0000000,0.0000000,0.0000000); //object(cj_firebin)(1)
	CreateDynamicObject(3461,2486.8000500,-1679.9000200,11.8000000,359.9950000,0.0000000,29.9980000); //object(tikitorch01_lvs)(12)
	CreateDynamicObject(1431,2484.1999500,-1677.3000500,12.9000000,0.0000000,0.0000000,26.0000000); //object(dyn_box_pile)(1)
	CreateDynamicObject(3577,2492.1001000,-1680.6999500,13.1000000,0.0000000,0.0000000,0.0000000); //object(dockcrates1_la)(1)
	CreateDynamicObject(16601,2474.8000500,-1715.0999800,17.2000000,0.0000000,0.0000000,0.0000000); //object(by_fuel07)(1)
	CreateDynamicObject(1483,2488.5000000,-1676.6999500,14.3000000,0.0000000,0.0000000,250.0000000); //object(dyn_garrage2)(1)
	CreateDynamicObject(3403,2527.0000000,-1667.3000500,17.2000000,0.0000000,0.0000000,0.0000000); //object(sw_logcover)(1)
	CreateDynamicObject(1458,2484.1001000,-1675.0999800,12.6000000,0.0000000,0.0000000,20.0000000); //object(dyn_cart)(1)
	CreateDynamicObject(1756,2486.1001000,-1676.5000000,12.3000000,0.0000000,0.0000000,0.0000000); //object(low_couch_4)(1)
	CreateDynamicObject(1756,2489.1001000,-1677.0999800,12.3000000,0.0000000,0.0000000,314.0000000); //object(low_couch_4)(2)
	CreateDynamicObject(941,2488.3000500,-1681.6999500,12.8000000,0.0000000,0.0000000,0.0000000); //object(cj_df_worktop_3)(1)
	CreateDynamicObject(647,2459.8999000,-1648.6999500,13.6000000,0.0000000,0.0000000,0.0000000); //object(new_bushsm)(1)
	CreateDynamicObject(647,2459.8994100,-1648.6992200,13.6000000,0.0000000,0.0000000,0.0000000); //object(new_bushsm)(2)
	CreateDynamicObject(647,2461.1999500,-1670.6999500,13.6000000,0.0000000,0.0000000,0.0000000); //object(new_bushsm)(3)
	CreateDynamicObject(647,2462.5000000,-1673.9000200,13.6000000,0.0000000,0.0000000,0.0000000); //object(new_bushsm)(4)
	CreateDynamicObject(647,2464.0000000,-1677.1999500,13.6000000,0.0000000,0.0000000,0.0000000); //object(new_bushsm)(5)
	CreateDynamicObject(647,2465.6999500,-1680.3000500,13.6000000,0.0000000,0.0000000,0.0000000); //object(new_bushsm)(6)
	CreateDynamicObject(801,2468.1001000,-1656.0999800,11.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush01)(1)
	CreateDynamicObject(801,2456.6999500,-1663.1999500,11.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush01)(3)
	CreateDynamicObject(801,2440.1999500,-1667.1999500,11.8000000,0.0000000,0.0000000,50.0000000); //object(genveg_bush01)(4)
	CreateDynamicObject(801,2437.6999500,-1649.8000500,11.8000000,0.0000000,0.0000000,9.9990000); //object(genveg_bush01)(5)
	CreateDynamicObject(801,2445.6001000,-1648.5000000,11.8000000,0.0000000,0.0000000,29.9980000); //object(genveg_bush01)(6)
	CreateDynamicObject(801,2481.8999000,-1676.0000000,11.8000000,0.0000000,0.0000000,29.9930000); //object(genveg_bush01)(7)
	CreateDynamicObject(801,2486.0000000,-1673.5000000,11.8000000,0.0000000,0.0000000,29.9930000); //object(genveg_bush01)(8)
	CreateDynamicObject(801,2511.3000500,-1682.0000000,11.8000000,0.0000000,0.0000000,29.9930000); //object(genveg_bush01)(9)
	CreateDynamicObject(801,2510.3000500,-1668.9000200,11.8000000,0.0000000,0.0000000,29.9930000); //object(genveg_bush01)(10)
	CreateDynamicObject(806,2464.0000000,-1667.9000200,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(1)
	CreateDynamicObject(806,2456.1001000,-1653.8000500,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(2)
	CreateDynamicObject(806,2438.6001000,-1661.4000200,16.1000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(3)
	CreateDynamicObject(806,2439.1999500,-1651.5000000,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(4)
	CreateDynamicObject(806,2428.8999000,-1664.6999500,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(5)
	CreateDynamicObject(806,2427.5000000,-1654.4000200,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(6)
	CreateDynamicObject(806,2504.8999000,-1668.5999800,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(7)
	CreateDynamicObject(806,2509.6001000,-1689.1999500,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(8)
	CreateDynamicObject(806,2506.8000500,-1653.8000500,16.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(9)
	CreateDynamicObject(806,2512.8999000,-1653.6999500,16.7000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(10)
	CreateDynamicObject(806,2514.5000000,-1664.0000000,16.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(11)
	CreateDynamicObject(806,2520.1001000,-1670.9000200,17.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(12)
	CreateDynamicObject(806,2492.3000500,-1648.0000000,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(13)
	CreateDynamicObject(806,2485.6001000,-1649.0000000,16.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(14)
	CreateDynamicObject(806,2503.6001000,-1650.4000200,16.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(15)
	CreateDynamicObject(806,2452.3999000,-1669.8000500,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(16)
	CreateDynamicObject(818,2471.6999500,-1718.5999800,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass02)(1)
	CreateDynamicObject(818,2466.0000000,-1717.6999500,16.3000000,0.0000000,0.0000000,60.0000000); //object(genveg_tallgrass02)(2)
	CreateDynamicObject(818,2461.1001000,-1719.8000500,16.3000000,0.0000000,0.0000000,279.9960000); //object(genveg_tallgrass02)(3)
	CreateDynamicObject(822,2446.3000500,-1707.4000200,13.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass06)(1)
	CreateDynamicObject(855,2495.1999500,-1677.9000200,12.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(1)
	CreateDynamicObject(855,2507.1001000,-1672.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(2)
	CreateDynamicObject(855,2494.8000500,-1656.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(3)
	CreateDynamicObject(1299,2419.0000000,-1658.1999500,12.8000000,0.0000000,0.0000000,40.0000000); //object(smashboxpile)(1)
	CreateDynamicObject(1299,2423.1001000,-1663.0000000,12.8000000,0.0000000,0.0000000,349.9960000); //object(smashboxpile)(2)
	CreateDynamicObject(1299,2410.3999000,-1656.0999800,12.8000000,0.0000000,0.0000000,49.9910000); //object(smashboxpile)(3)
	CreateDynamicObject(1299,2397.1001000,-1668.5999800,12.8000000,0.0000000,0.0000000,329.9880000); //object(smashboxpile)(4)
	CreateDynamicObject(2672,2400.0000000,-1651.9000200,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(23)
	CreateDynamicObject(2672,2397.6999500,-1659.1999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(24)
	CreateDynamicObject(2672,2416.3000500,-1662.0999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(25)
	CreateDynamicObject(2672,2425.8000500,-1655.9000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(26)
	CreateDynamicObject(2672,2394.1001000,-1651.1999500,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(27)
	CreateDynamicObject(2672,2386.3999000,-1655.5000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(28)
	CreateDynamicObject(2672,2387.6999500,-1657.0000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(29)
	CreateDynamicObject(2672,2384.8999000,-1655.9000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(30)
	CreateDynamicObject(2672,2385.6001000,-1657.8000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(31)
	CreateDynamicObject(2672,2386.0000000,-1667.5000000,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(32)
	CreateDynamicObject(2672,2383.8999000,-1667.0000000,12.9000000,0.0000000,0.0000000,60.0000000); //object(proc_rubbish_4)(33)
	CreateDynamicObject(2672,2376.3000500,-1658.5000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(34)
	CreateDynamicObject(2672,2375.0000000,-1660.0999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(35)
	CreateDynamicObject(2672,2368.0000000,-1652.5999800,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(36)
	CreateDynamicObject(2672,2363.6001000,-1663.0999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(37)
	CreateDynamicObject(2672,2359.1001000,-1659.5999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(38)
	CreateDynamicObject(2672,2355.5000000,-1656.0000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(39)
	CreateDynamicObject(2672,2354.0000000,-1662.5999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(40)
	CreateDynamicObject(2672,2358.8000500,-1651.5999800,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(41)
	CreateDynamicObject(3594,2359.7998000,-1658.5000000,13.0000000,0.0000000,0.0000000,319.9990000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2372.1999500,-1656.4000200,13.0000000,0.0000000,0.0000000,79.9990000); //object(la_fuckcar1)(8)
	CreateDynamicObject(3594,2391.0000000,-1662.0999800,13.0000000,0.0000000,0.0000000,109.9970000); //object(la_fuckcar1)(9)
	CreateDynamicObject(3594,2402.6999500,-1663.9000200,13.0000000,0.0000000,0.0000000,157.9950000); //object(la_fuckcar1)(10)
	CreateDynamicObject(13591,2348.1001000,-1664.3000500,12.6000000,0.0000000,0.0000000,40.0000000); //object(kickcar28)(2)
	CreateDynamicObject(2676,2344.5000000,-1671.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(1)
	CreateDynamicObject(2676,2347.6001000,-1659.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(2)
	CreateDynamicObject(2676,2333.1001000,-1662.3000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(3)
	CreateDynamicObject(2676,2344.6999500,-1656.0999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(4)
	CreateDynamicObject(2676,2334.0000000,-1655.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(5)
	CreateDynamicObject(853,2342.3999000,-1663.0999800,12.8000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_5)(1)
	CreateDynamicObject(852,2330.8999000,-1651.0000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_4)(1)
	CreateDynamicObject(850,2331.6999500,-1666.9000200,12.8000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_1)(1)
	CreateDynamicObject(850,2334.3999000,-1669.5000000,12.8000000,0.0000000,0.0000000,270.0000000); //object(cj_urb_rub_1)(2)
	CreateDynamicObject(3035,2333.8000500,-1655.0999800,13.1000000,0.0000000,0.0000000,0.0000000); //object(tmp_bin)(1)
	CreateDynamicObject(3035,2336.3999000,-1655.0999800,13.1000000,0.0000000,0.0000000,0.0000000); //object(tmp_bin)(2)
	CreateDynamicObject(3035,2348.8000500,-1655.1999500,13.1000000,0.0000000,0.0000000,0.0000000); //object(tmp_bin)(3)
	CreateDynamicObject(3006,2331.6001000,-1655.6999500,12.1000000,0.0000000,0.0000000,0.0000000); //object(smash_box_brk)(1)
	CreateDynamicObject(2907,2350.6001000,-1657.4000200,12.5000000,0.0000000,0.0000000,30.0000000); //object(kmb_deadtorso)(1)
	CreateDynamicObject(2907,2349.6001000,-1656.5999800,12.5000000,0.0000000,0.0000000,319.9980000); //object(kmb_deadtorso)(2)
	CreateDynamicObject(2907,2351.1999500,-1656.1999500,12.5000000,0.0000000,0.0000000,99.9930000); //object(kmb_deadtorso)(3)
	CreateDynamicObject(2906,2350.3000500,-1657.8000500,12.5000000,0.0000000,0.0000000,150.0000000); //object(kmb_deadarm)(1)
	CreateDynamicObject(2890,2372.3000500,-1643.0999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(kmb_skip)(1)
	CreateDynamicObject(1450,2337.8000500,-1656.0000000,13.0000000,0.0000000,0.0000000,50.2500000); //object(dyn_crate_3)(1)
	CreateDynamicObject(1441,2347.0000000,-1656.0000000,13.0000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile_4)(1)
	CreateDynamicObject(1439,2338.6999500,-1669.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(dyn_dumpster_1)(1)
	CreateDynamicObject(1438,2345.8999000,-1671.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile_2)(1)
	CreateDynamicObject(1431,2330.8000500,-1662.3000500,13.1000000,0.0000000,0.0000000,100.0000000); //object(dyn_box_pile)(2)
	CreateDynamicObject(1431,2330.5000000,-1655.4000200,13.1000000,0.0000000,0.0000000,79.9980000); //object(dyn_box_pile)(3)
	CreateDynamicObject(1430,2330.6001000,-1660.9000200,12.8000000,0.0000000,0.0000000,0.0000000); //object(cj_dump1_low01)(1)
	CreateDynamicObject(1358,2339.5000000,-1691.0000000,13.6000000,0.0000000,0.0000000,70.0000000); //object(cj_skip_rubbish)(1)
	CreateDynamicObject(1344,2338.8000500,-1686.5999800,13.2000000,0.0000000,0.0000000,90.0000000); //object(cj_dumpster2)(1)
	CreateDynamicObject(1344,2338.6999500,-1684.1999500,13.2000000,0.0000000,0.0000000,90.0000000); //object(cj_dumpster2)(2)
	CreateDynamicObject(1344,2338.6001000,-1681.8000500,13.2000000,0.0000000,0.0000000,90.0000000); //object(cj_dumpster2)(3)
	CreateDynamicObject(12957,2350.3000500,-1687.8000500,13.4000000,0.0000000,0.0000000,0.0000000); //object(sw_pickupwreck01)(1)
	CreateDynamicObject(1219,2363.3999000,-1684.5999800,14.3000000,90.0000000,180.0000000,90.0000000); //object(palette)(1)
	CreateDynamicObject(1219,2363.3999000,-1687.6999500,14.3000000,90.0000000,179.9950000,90.0000000); //object(palette)(2)
	CreateDynamicObject(1219,2363.3999000,-1677.5000000,14.3000000,90.0000000,179.9950000,90.0000000); //object(palette)(3)
	CreateDynamicObject(1219,2363.3999000,-1680.9000200,14.3000000,90.0000000,179.9950000,90.0000000); //object(palette)(4)
	CreateDynamicObject(1219,2372.3999000,-1689.5999800,14.3000000,90.0000000,179.9950000,180.0000000); //object(palette)(5)
	CreateDynamicObject(1219,2375.1999500,-1678.9000200,14.3000000,90.0000000,179.9950000,269.9950000); //object(palette)(6)
	CreateDynamicObject(923,2339.3000500,-1694.0999800,13.2000000,0.0000000,0.0000000,0.0000000); //object(packing_carates2)(1)
	CreateDynamicObject(2062,2340.6999500,-1693.0999800,12.9000000,0.0000000,0.0000000,0.0000000); //object(cj_oildrum2)(1)
	CreateDynamicObject(2062,2341.5000000,-1691.0000000,12.9000000,0.0000000,0.0000000,0.0000000); //object(cj_oildrum2)(2)
	CreateDynamicObject(2062,2341.6001000,-1692.5000000,12.9000000,0.0000000,0.0000000,0.0000000); //object(cj_oildrum2)(3)
	CreateDynamicObject(13591,2358.6999500,-1705.0000000,12.9000000,0.0000000,0.0000000,0.0000000); //object(kickcar28)(3)
	CreateDynamicObject(13591,2357.3000500,-1713.9000200,12.9000000,0.0000000,0.0000000,70.0000000); //object(kickcar28)(4)
	CreateDynamicObject(13591,2365.6001000,-1714.6999500,12.9000000,0.0000000,0.0000000,129.9990000); //object(kickcar28)(5)
	CreateDynamicObject(18248,2357.6999500,-1720.6999500,20.2000000,0.0000000,0.0000000,130.0000000); //object(cuntwjunk01)(1)
	CreateDynamicObject(3594,2355.3999000,-1716.4000200,23.2000000,36.0000000,0.0000000,0.0000000); //object(la_fuckcar1)(11)
	CreateDynamicObject(3594,2355.3994100,-1716.3994100,23.2000000,23.1580000,306.0720000,280.3630000); //object(la_fuckcar1)(12)
	CreateDynamicObject(18249,2333.0000000,-1712.5999800,8.1000000,0.0000000,0.0000000,0.0000000); //object(cuntwjunk05)(2)
	CreateDynamicObject(971,2370.1999500,-1723.1999500,13.0000000,0.0000000,0.0000000,0.0000000); //object(subwaygate)(6)
	CreateDynamicObject(971,2361.3000500,-1723.0999800,13.0000000,0.0000000,0.0000000,0.0000000); //object(subwaygate)(7)
	CreateDynamicObject(971,2353.6001000,-1726.0000000,13.0000000,0.0000000,0.0000000,42.0000000); //object(subwaygate)(8)
	CreateDynamicObject(997,2330.3999000,-1727.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(lhouse_barrier3)(1)
	CreateDynamicObject(3461,2326.1001000,-1684.6999500,15.1000000,90.0000000,179.3030000,280.6970000); //object(tikitorch01_lvs)(13)
	CreateDynamicObject(3461,2326.1001000,-1687.4000200,15.1000000,90.0000000,179.3020000,280.6950000); //object(tikitorch01_lvs)(14)
	CreateDynamicObject(3461,2324.6999500,-1682.3000500,13.9000000,90.0000000,179.3020000,280.6950000); //object(tikitorch01_lvs)(15)
	CreateDynamicObject(3461,2325.1999500,-1681.4000200,13.9000000,90.0000000,179.3020000,280.6950000); //object(tikitorch01_lvs)(16)
	CreateDynamicObject(3461,2322.3999000,-1679.1999500,13.2000000,90.0000000,179.3020000,280.6950000); //object(tikitorch01_lvs)(17)
	CreateDynamicObject(3461,2322.3999000,-1676.5999800,13.2000000,90.0000000,179.3020000,280.6950000); //object(tikitorch01_lvs)(18)
	CreateDynamicObject(3461,2324.6001000,-1643.0000000,14.3000000,0.0000000,88.0000000,276.0000000); //object(tikitorch01_lvs)(20)
	CreateDynamicObject(3461,2322.8000500,-1643.0000000,13.8000000,0.0000000,87.9950000,275.9990000); //object(tikitorch01_lvs)(21)
	CreateDynamicObject(3461,2321.1999500,-1643.0000000,14.0000000,0.0000000,87.9950000,275.9990000); //object(tikitorch01_lvs)(22)
	CreateDynamicObject(3461,2318.6999500,-1643.4000200,14.0000000,0.0000000,87.9950000,275.9990000); //object(tikitorch01_lvs)(23)
	CreateDynamicObject(3461,2317.1999500,-1643.4000200,14.0000000,0.0000000,87.9950000,275.9990000); //object(tikitorch01_lvs)(24)
	CreateDynamicObject(3461,2312.6001000,-1642.9000200,14.0000000,0.0000000,87.9950000,275.9990000); //object(tikitorch01_lvs)(25)
	CreateDynamicObject(3461,2311.5000000,-1642.4000200,14.0000000,0.0000000,87.9950000,235.9990000); //object(tikitorch01_lvs)(26)
	CreateDynamicObject(3461,2311.5000000,-1642.3994100,14.0000000,0.0000000,87.9900000,205.9970000); //object(tikitorch01_lvs)(27)
	CreateDynamicObject(3461,2310.6001000,-1639.6999500,14.0000000,0.0000000,87.9840000,205.9940000); //object(tikitorch01_lvs)(28)
	CreateDynamicObject(3461,2310.6001000,-1637.9000200,14.0000000,0.0000000,87.9840000,165.9940000); //object(tikitorch01_lvs)(29)
	CreateDynamicObject(3877,2337.1999500,-1653.0999800,14.1000000,0.0000000,0.0000000,0.0000000); //object(sf_rooflite)(5)
	CreateDynamicObject(3877,2348.5000000,-1653.0999800,14.1000000,0.0000000,0.0000000,0.0000000); //object(sf_rooflite)(6)
	CreateDynamicObject(761,2339.0000000,-1656.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(1)
	CreateDynamicObject(761,2353.5000000,-1662.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(2)
	CreateDynamicObject(806,2333.3999000,-1665.1999500,16.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(17)
	CreateDynamicObject(806,2331.3999000,-1653.0999800,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(18)
	CreateDynamicObject(806,2350.8000500,-1653.0999800,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(19)
	CreateDynamicObject(806,2348.1999500,-1668.9000200,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(20)
	CreateDynamicObject(806,2339.1001000,-1670.8000500,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(21)
	CreateDynamicObject(806,2357.0000000,-1683.1999500,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(22)
	CreateDynamicObject(806,2358.1001000,-1676.8000500,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(23)
	CreateDynamicObject(806,2356.3999000,-1673.0000000,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(24)
	CreateDynamicObject(806,2358.3000500,-1681.6999500,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(25)
	CreateDynamicObject(806,2339.8999000,-1688.1999500,16.1000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(26)
	CreateDynamicObject(806,2333.8000500,-1702.4000200,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(27)
	CreateDynamicObject(806,2351.0000000,-1716.5000000,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(28)
	CreateDynamicObject(806,2356.6001000,-1710.9000200,16.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(29)
	CreateDynamicObject(806,2352.5000000,-1698.9000200,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(30)
	CreateDynamicObject(806,2353.5000000,-1692.0999800,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(31)
	CreateDynamicObject(809,2330.8999000,-1670.0999800,11.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush13)(1)
	CreateDynamicObject(809,2331.6999500,-1674.0999800,11.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush13)(2)
	CreateDynamicObject(809,2331.1999500,-1683.5999800,11.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush13)(3)
	CreateDynamicObject(819,2329.6999500,-1718.9000200,12.9000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass03)(1)
	CreateDynamicObject(819,2313.8999000,-1719.0000000,12.9000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass03)(2)
	CreateDynamicObject(855,2347.8999000,-1713.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(4)
	CreateDynamicObject(855,2350.6001000,-1671.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(5)
	CreateDynamicObject(855,2328.6999500,-1671.5000000,12.9000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(6)
	CreateDynamicObject(855,2330.1999500,-1646.8000500,13.1000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(7)
	CreateDynamicObject(855,2330.5000000,-1640.0999800,13.6000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(8)
	CreateDynamicObject(3271,2348.8999000,-1740.5000000,12.3000000,0.0000000,0.0000000,100.0000000); //object(bonyrd_block3_)(1)
	CreateDynamicObject(3461,2331.1001000,-1745.9000200,14.1000000,0.0000000,0.0000000,0.0000000); //object(tikitorch01_lvs)(30)
	CreateDynamicObject(3461,2333.8000500,-1747.1999500,14.1000000,0.0000000,0.0000000,0.0000000); //object(tikitorch01_lvs)(31)
	CreateDynamicObject(3461,2342.1001000,-1746.0000000,11.3000000,0.0000000,0.0000000,0.0000000); //object(tikitorch01_lvs)(32)
	CreateDynamicObject(3461,2338.3999000,-1751.3000500,11.3000000,0.0000000,0.0000000,0.0000000); //object(tikitorch01_lvs)(33)
	CreateDynamicObject(3461,2361.1001000,-1748.1999500,11.3000000,0.0000000,0.0000000,0.0000000); //object(tikitorch01_lvs)(34)
	CreateDynamicObject(3461,2359.3000500,-1739.6999500,11.0000000,0.0000000,0.0000000,0.0000000); //object(tikitorch01_lvs)(35)
	CreateDynamicObject(3461,2365.6001000,-1738.1999500,11.0000000,0.0000000,0.0000000,0.0000000); //object(tikitorch01_lvs)(36)
	CreateDynamicObject(3461,2360.5000000,-1736.9000200,11.0000000,0.0000000,0.0000000,0.0000000); //object(tikitorch01_lvs)(37)
	CreateDynamicObject(3461,2346.6001000,-1738.8000500,11.0000000,0.0000000,0.0000000,0.0000000); //object(tikitorch01_lvs)(38)
	CreateDynamicObject(3461,2337.5000000,-1735.6999500,11.0000000,0.0000000,0.0000000,0.0000000); //object(tikitorch01_lvs)(39)
	CreateDynamicObject(16437,2237.1001000,-1731.5999800,14.2000000,0.0000000,0.0000000,90.0000000); //object(cn2_roadblock02)(1)
	CreateDynamicObject(4509,2252.5000000,-1748.6999500,15.0000000,0.0000000,0.0000000,180.0000000); //object(cuntw_roadblock05ld)(1)
	CreateDynamicObject(978,2225.3999000,-1742.5000000,13.3000000,0.0000000,0.0000000,90.0000000); //object(sub_roadright)(1)
	CreateDynamicObject(1422,2416.6001000,-1762.3000500,12.8000000,0.0000000,0.0000000,0.0000000); //object(dyn_roadbarrier_5)(1)
	CreateDynamicObject(1422,2412.8999000,-1762.8000500,12.8000000,0.0000000,0.0000000,60.0000000); //object(dyn_roadbarrier_5)(2)
	CreateDynamicObject(1422,2410.6001000,-1760.5999800,12.8000000,0.0000000,0.0000000,325.9960000); //object(dyn_roadbarrier_5)(3)
	CreateDynamicObject(1424,2410.1001000,-1766.0999800,12.9000000,0.0000000,0.0000000,0.0000000); //object(dyn_roadbarrier_2)(3)
	CreateDynamicObject(1424,2412.3000500,-1766.0999800,12.9000000,0.0000000,0.0000000,0.0000000); //object(dyn_roadbarrier_2)(4)
	CreateDynamicObject(1424,2414.6001000,-1765.9000200,12.9000000,0.0000000,0.0000000,0.0000000); //object(dyn_roadbarrier_2)(5)
	CreateDynamicObject(1424,2416.6999500,-1766.0999800,12.9000000,0.0000000,0.0000000,0.0000000); //object(dyn_roadbarrier_2)(6)
	CreateDynamicObject(1447,2421.3999000,-1766.3000500,13.8000000,0.0000000,0.0000000,0.0000000); //object(dyn_mesh_4)(5)
	CreateDynamicObject(979,2408.5000000,-1769.0000000,13.2000000,0.0000000,0.0000000,180.0000000); //object(sub_roadleft)(2)
	CreateDynamicObject(979,2418.5000000,-1769.0000000,13.2000000,0.0000000,0.0000000,179.9950000); //object(sub_roadleft)(3)
	CreateDynamicObject(1411,2416.3999000,-1714.6999500,14.4000000,0.0000000,0.0000000,0.0000000); //object(dyn_mesh_1)(2)
	CreateDynamicObject(1411,2411.1001000,-1714.5999800,14.3000000,0.0000000,0.0000000,0.0000000); //object(dyn_mesh_1)(3)
	CreateDynamicObject(1423,2506.1001000,-1733.9000200,13.1000000,0.0000000,0.0000000,264.0000000); //object(dyn_roadbarrier_4)(1)
	CreateDynamicObject(1423,2503.6001000,-1731.8000500,13.1000000,0.0000000,0.0000000,305.9960000); //object(dyn_roadbarrier_4)(2)
	CreateDynamicObject(1423,2506.1999500,-1729.0999800,13.1000000,0.0000000,0.0000000,255.9910000); //object(dyn_roadbarrier_4)(3)
	CreateDynamicObject(8877,2507.6001000,-1739.8000500,18.6000000,0.0000000,0.0000000,180.0000000); //object(vgsecnstrct10)(1)
	CreateDynamicObject(12986,2495.8999000,-1745.4000200,13.8000000,0.0000000,0.0000000,90.0000000); //object(sw_well1)(1)
	CreateDynamicObject(3066,2487.3999000,-1740.5999800,13.4000000,0.0000000,0.0000000,90.0000000); //object(ammotrn_obj)(1)
	CreateDynamicObject(925,2501.6001000,-1739.8000500,13.6000000,0.0000000,0.0000000,90.0000000); //object(rack2)(2)
	CreateDynamicObject(925,2503.3999000,-1739.8000500,13.6000000,0.0000000,0.0000000,90.0000000); //object(rack2)(3)
	CreateDynamicObject(1348,2491.1999500,-1738.5999800,13.2000000,0.0000000,0.0000000,0.0000000); //object(cj_o2tanks)(1)
	CreateDynamicObject(3577,2486.0000000,-1725.9000200,13.3000000,0.0000000,0.0000000,0.0000000); //object(dockcrates1_la)(2)
	CreateDynamicObject(13489,2495.8000500,-1751.8000500,14.9000000,0.0000000,0.0000000,90.0000000); //object(sw_fueldrum04)(1)
	CreateDynamicObject(16337,2513.1001000,-1739.0000000,12.5000000,0.0000000,0.0000000,270.0000000); //object(des_cranecontrol)(1)
	CreateDynamicObject(920,2495.1001000,-1741.4000200,13.0000000,0.0000000,0.0000000,110.0000000); //object(y_generator)(1)
	CreateDynamicObject(2649,2497.1001000,-1748.6999500,12.7000000,0.0000000,0.0000000,290.0000000); //object(cj_aircon2)(1)
	CreateDynamicObject(3214,2481.1999500,-1748.1999500,20.9000000,0.0000000,0.0000000,180.0000000); //object(quarry_crusher)(1)
	CreateDynamicObject(2653,2488.6001000,-1750.1999500,12.1000000,0.0000000,0.0000000,90.0000000); //object(cj_aircon3)(1)
	CreateDynamicObject(2653,2481.0000000,-1750.1999500,12.1000000,0.0000000,0.0000000,90.0000000); //object(cj_aircon3)(2)
	CreateDynamicObject(2653,2473.1999500,-1750.1999500,12.1000000,0.0000000,0.0000000,90.0000000); //object(cj_aircon3)(3)
	CreateDynamicObject(3872,2512.6992200,-1735.6992200,19.4000000,0.0000000,0.0000000,217.2490000); //object(ws_floodbeams)(1)
	CreateDynamicObject(2780,2480.8000500,-1747.4000200,27.1000000,0.0000000,0.0000000,0.0000000); //object(cj_smoke_mach)(1)
	CreateDynamicObject(3461,2468.0000000,-1742.5000000,14.1000000,0.0000000,0.0000000,0.0000000); //object(tikitorch01_lvs)(41)
	CreateDynamicObject(818,2502.3999000,-1744.0999800,15.9000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass02)(4)
	CreateDynamicObject(818,2502.6999500,-1750.6999500,15.9000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass02)(5)
	CreateDynamicObject(818,2504.8000500,-1758.0999800,15.9000000,0.0000000,0.0000000,60.0000000); //object(genveg_tallgrass02)(6)
	CreateDynamicObject(818,2489.8999000,-1757.5999800,15.9000000,0.0000000,0.0000000,109.9960000); //object(genveg_tallgrass02)(7)
	CreateDynamicObject(823,2473.0000000,-1741.9000200,13.9000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass07)(1)
	CreateDynamicObject(823,2488.8999000,-1744.8000500,12.6000000,0.0000000,0.0000000,30.0000000); //object(genveg_tallgrass07)(2)
	CreateDynamicObject(823,2488.6001000,-1752.9000200,12.6000000,0.0000000,0.0000000,29.9980000); //object(genveg_tallgrass07)(3)
	CreateDynamicObject(823,2502.5000000,-1747.9000200,12.6000000,0.0000000,0.0000000,31.9980000); //object(genveg_tallgrass07)(4)
	CreateDynamicObject(855,2503.1999500,-1727.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(10)
	CreateDynamicObject(855,2483.1999500,-1728.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(11)
	CreateDynamicObject(849,2384.8000500,-1729.4000200,12.7000000,0.0000000,0.0000000,60.0000000); //object(cj_urb_rub_3)(1)
	CreateDynamicObject(849,2370.8000500,-1736.0999800,12.7000000,0.0000000,0.0000000,359.9960000); //object(cj_urb_rub_3)(2)
	CreateDynamicObject(849,2352.6999500,-1728.6999500,12.7000000,0.0000000,0.0000000,279.9950000); //object(cj_urb_rub_3)(3)
	CreateDynamicObject(849,2335.3000500,-1728.6999500,12.7000000,0.0000000,0.0000000,331.9920000); //object(cj_urb_rub_3)(4)
	CreateDynamicObject(849,2315.1001000,-1749.1999500,12.7000000,0.0000000,0.0000000,21.9900000); //object(cj_urb_rub_3)(5)
	CreateDynamicObject(849,2275.1001000,-1728.8000500,12.7000000,0.0000000,0.0000000,301.9890000); //object(cj_urb_rub_3)(6)
	CreateDynamicObject(849,2253.6001000,-1735.5999800,12.7000000,0.0000000,0.0000000,11.9870000); //object(cj_urb_rub_3)(7)
	CreateDynamicObject(849,2269.3000500,-1756.9000200,12.9000000,0.0000000,0.0000000,13.9860000); //object(cj_urb_rub_3)(8)
	CreateDynamicObject(761,2288.5000000,-1737.5999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(3)
	CreateDynamicObject(761,2291.1001000,-1726.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(4)
	CreateDynamicObject(761,2319.1999500,-1737.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(5)
	CreateDynamicObject(761,2331.1001000,-1751.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(6)
	CreateDynamicObject(761,2340.3999000,-1759.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(7)
	CreateDynamicObject(761,2377.0000000,-1740.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(8)
	CreateDynamicObject(761,2396.3000500,-1755.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(9)
	CreateDynamicObject(761,2411.1001000,-1759.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(10)
	CreateDynamicObject(761,2414.8000500,-1760.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(11)
	CreateDynamicObject(761,2419.8000500,-1757.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(12)
	CreateDynamicObject(801,2405.0000000,-1740.5999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush01)(2)
	CreateDynamicObject(801,2407.3999000,-1721.5999800,12.4000000,0.0000000,0.0000000,270.0000000); //object(genveg_bush01)(11)
	CreateDynamicObject(801,2412.6999500,-1717.5000000,12.4000000,0.0000000,0.0000000,230.0000000); //object(genveg_bush01)(12)
	CreateDynamicObject(801,2396.8000500,-1721.6999500,12.4000000,0.0000000,0.0000000,179.9990000); //object(genveg_bush01)(13)
	CreateDynamicObject(801,2380.1999500,-1719.9000200,12.4000000,0.0000000,0.0000000,129.9950000); //object(genveg_bush01)(14)
	CreateDynamicObject(801,2379.5000000,-1736.6999500,12.2000000,0.0000000,0.0000000,129.9900000); //object(genveg_bush01)(15)
	CreateDynamicObject(801,2378.3999000,-1757.8000500,12.2000000,0.0000000,0.0000000,29.9900000); //object(genveg_bush01)(16)
	CreateDynamicObject(806,2382.8999000,-1728.3000500,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(32)
	CreateDynamicObject(806,2403.3000500,-1742.9000200,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(33)
	CreateDynamicObject(806,2404.8999000,-1760.0000000,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(34)
	CreateDynamicObject(806,2405.5000000,-1767.0999800,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(35)
	CreateDynamicObject(806,2379.3000500,-1759.0000000,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(36)
	CreateDynamicObject(806,2365.1999500,-1746.5000000,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(37)
	CreateDynamicObject(806,2332.3000500,-1752.9000200,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(38)
	CreateDynamicObject(806,2317.0000000,-1722.9000200,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(39)
	CreateDynamicObject(806,2303.3000500,-1716.4000200,17.1000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(40)
	CreateDynamicObject(806,2298.0000000,-1722.0999800,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(41)
	CreateDynamicObject(806,2276.6999500,-1727.8000500,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(42)
	CreateDynamicObject(806,2270.6001000,-1756.9000200,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(43)
	CreateDynamicObject(818,2300.6001000,-1706.9000200,16.0000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass02)(8)
	CreateDynamicObject(822,2323.5000000,-1701.9000200,12.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass06)(2)
	CreateDynamicObject(855,2421.3000500,-1779.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(9)
	CreateDynamicObject(855,2421.1999500,-1772.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(12)
	CreateDynamicObject(855,2425.3000500,-1772.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(13)
	CreateDynamicObject(855,2428.3999000,-1776.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(14)
	CreateDynamicObject(12957,2410.3000500,-1774.8000500,13.0000000,0.0000000,0.0000000,150.0000000); //object(sw_pickupwreck01)(2)
	CreateDynamicObject(12957,2418.3000500,-1782.6999500,13.0000000,0.0000000,0.0000000,209.9960000); //object(sw_pickupwreck01)(3)
	CreateDynamicObject(12957,2408.6999500,-1784.0000000,13.0000000,0.0000000,0.0000000,239.9960000); //object(sw_pickupwreck01)(4)
	CreateDynamicObject(942,2401.3000500,-1757.5999800,15.0000000,0.0000000,0.0000000,0.0000000); //object(cj_df_unit_2)(2)
	CreateDynamicObject(2677,2413.3000500,-1756.3000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(1)
	CreateDynamicObject(2677,2416.3000500,-1771.5999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(2)
	CreateDynamicObject(2677,2410.3999000,-1778.8000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(3)
	CreateDynamicObject(2677,2417.1001000,-1787.1999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(4)
	CreateDynamicObject(2677,2410.5000000,-1787.8000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(5)
	CreateDynamicObject(2677,2420.3999000,-1735.3000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(6)
	CreateDynamicObject(2677,2415.8000500,-1740.0000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(7)
	CreateDynamicObject(2677,2414.8000500,-1738.4000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(8)
	CreateDynamicObject(2677,2413.1001000,-1742.4000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(9)
	CreateDynamicObject(2677,2385.1999500,-1750.5999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(10)
	CreateDynamicObject(2677,2370.1999500,-1748.8000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(11)
	CreateDynamicObject(2677,2368.6999500,-1745.4000200,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(12)
	CreateDynamicObject(2677,2366.3000500,-1749.0999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(13)
	CreateDynamicObject(2677,2365.8000500,-1725.5999800,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(14)
	CreateDynamicObject(2677,2364.8000500,-1728.5000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(15)
	CreateDynamicObject(2677,2345.5000000,-1733.8000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(16)
	CreateDynamicObject(2677,2330.0000000,-1729.3000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(17)
	CreateDynamicObject(3594,2527.5000000,-1732.5999800,13.0000000,0.0000000,0.0000000,300.0000000); //object(la_fuckcar1)(13)
	CreateDynamicObject(3594,2547.3999000,-1734.1999500,13.0000000,0.0000000,0.0000000,239.9980000); //object(la_fuckcar1)(14)
	CreateDynamicObject(3594,2567.3999000,-1729.8000500,13.0000000,0.0000000,0.0000000,269.9960000); //object(la_fuckcar1)(15)
	CreateDynamicObject(3594,2558.8000500,-1731.4000200,13.0000000,0.0000000,0.0000000,299.9950000); //object(la_fuckcar1)(16)
	CreateDynamicObject(3594,2557.5000000,-1735.1999500,13.0000000,0.0000000,0.0000000,99.9930000); //object(la_fuckcar1)(17)
	CreateDynamicObject(3594,2597.0000000,-1734.0996100,12.7000000,356.9950000,0.0000000,229.9880000); //object(la_fuckcar1)(18)
	CreateDynamicObject(3594,2618.5000000,-1730.7998000,10.9000000,357.2480000,0.0000000,299.9870000); //object(la_fuckcar1)(19)
	CreateDynamicObject(2676,2590.6999500,-1729.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(6)
	CreateDynamicObject(2676,2573.1999500,-1731.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(7)
	CreateDynamicObject(2676,2552.1001000,-1731.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2522.3999000,-1733.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(9)
	CreateDynamicObject(2676,2532.1001000,-1729.4000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(10)
	CreateDynamicObject(13591,2527.8994100,-1746.3994100,12.6000000,0.0000000,0.0000000,59.9960000); //object(kickcar28)(6)
	CreateDynamicObject(18249,2519.6999500,-1768.0999800,9.1000000,0.0000000,0.0000000,0.0000000); //object(cuntwjunk05)(3)
	CreateDynamicObject(18249,2519.6999500,-1747.9000200,9.1000000,0.0000000,0.0000000,0.0000000); //object(cuntwjunk05)(4)
	CreateDynamicObject(926,2531.6999500,-1732.1999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(rubbish_box2)(1)
	CreateDynamicObject(926,2517.8999000,-1737.0000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(rubbish_box2)(2)
	CreateDynamicObject(926,2556.1001000,-1729.6999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(rubbish_box2)(3)
	CreateDynamicObject(926,2572.6001000,-1735.9000200,12.6000000,0.0000000,0.0000000,0.0000000); //object(rubbish_box2)(4)
	CreateDynamicObject(926,2574.6999500,-1730.4000200,12.6000000,0.0000000,0.0000000,0.0000000); //object(rubbish_box2)(5)
	CreateDynamicObject(910,2569.5000000,-1722.0999800,13.8000000,0.0000000,0.0000000,0.0000000); //object(bust_cabinet_4)(1)
	CreateDynamicObject(850,2540.8000500,-1733.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_1)(3)
	CreateDynamicObject(850,2524.6999500,-1739.5000000,12.5000000,0.0000000,0.0000000,40.0000000); //object(cj_urb_rub_1)(4)
	CreateDynamicObject(850,2529.6001000,-1754.4000200,12.5000000,0.0000000,0.0000000,96.0000000); //object(cj_urb_rub_1)(5)
	CreateDynamicObject(850,2514.1999500,-1729.3000500,12.5000000,0.0000000,0.0000000,95.9990000); //object(cj_urb_rub_1)(6)
	CreateDynamicObject(2971,2456.6999500,-1760.0000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(k_smashboxes)(1)
	CreateDynamicObject(2971,2454.6001000,-1759.8000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(k_smashboxes)(2)
	CreateDynamicObject(2971,2452.5000000,-1759.8000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(k_smashboxes)(3)
	CreateDynamicObject(1450,2449.1001000,-1759.0000000,13.2000000,0.0000000,0.0000000,0.0000000); //object(dyn_crate_3)(2)
	CreateDynamicObject(1441,2446.6001000,-1759.0000000,13.2000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile_4)(2)
	CreateDynamicObject(1439,2464.1999500,-1772.0000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(dyn_dumpster_1)(2)
	CreateDynamicObject(1431,2481.0000000,-1772.0999800,13.1000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile)(4)
	CreateDynamicObject(3594,2322.6001000,-1651.3000500,13.6000000,358.0000000,0.0000000,300.0000000); //object(la_fuckcar1)(20)
	CreateDynamicObject(3594,2316.0000000,-1659.2998000,13.5000000,0.0000000,0.0000000,349.9970000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2309.1992200,-1656.6992200,13.7000000,358.4950000,0.0000000,289.9950000); //object(la_fuckcar1)(22)
	CreateDynamicObject(3594,2287.1001000,-1658.9000200,14.4000000,0.0000000,0.0000000,239.9950000); //object(la_fuckcar1)(23)
	CreateDynamicObject(3594,2293.8000500,-1666.9000200,14.4000000,359.7450000,0.0000000,279.9950000); //object(la_fuckcar1)(24)
	CreateDynamicObject(13591,2228.1999500,-1650.1999500,14.7000000,0.0000000,0.0000000,0.0000000); //object(kickcar28)(7)
	CreateDynamicObject(18249,2245.1999500,-1666.4000200,9.7000000,0.0000000,0.0000000,252.0000000); //object(cuntwjunk05)(5)
	CreateDynamicObject(1415,2228.3999000,-1653.1999500,14.3000000,0.0000000,0.0000000,0.0000000); //object(dyn_dumpster)(1)
	CreateDynamicObject(1431,2232.0000000,-1651.6999500,14.8000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile)(5)
	CreateDynamicObject(1440,2231.3000500,-1648.5999800,14.8000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile_3)(1)
	CreateDynamicObject(1438,2224.8000500,-1654.3000500,14.3000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile_2)(2)
	CreateDynamicObject(1369,2230.5000000,-1653.1999500,14.9000000,0.0000000,0.0000000,0.0000000); //object(cj_wheelchair1)(1)
	CreateDynamicObject(1358,2222.6999500,-1646.3000500,15.6000000,0.0000000,0.0000000,0.0000000); //object(cj_skip_rubbish)(2)
	CreateDynamicObject(1349,2221.6001000,-1652.5000000,14.8000000,0.0000000,0.0000000,40.0000000); //object(cj_shtrolly)(1)
	CreateDynamicObject(1349,2220.8000500,-1650.4000200,14.8000000,0.0000000,0.0000000,339.9960000); //object(cj_shtrolly)(2)
	CreateDynamicObject(1349,2219.6001000,-1652.1999500,14.8000000,0.0000000,0.0000000,359.9940000); //object(cj_shtrolly)(3)
	CreateDynamicObject(1349,2221.3999000,-1655.0000000,14.8000000,0.0000000,0.0000000,39.9890000); //object(cj_shtrolly)(4)
	CreateDynamicObject(1347,2233.8000500,-1651.5000000,14.9000000,0.0000000,0.0000000,0.0000000); //object(cj_wastebin)(1)
	CreateDynamicObject(1344,2234.1001000,-1649.1999500,15.1000000,0.0000000,0.0000000,86.0000000); //object(cj_dumpster2)(4)
	CreateDynamicObject(1299,2242.8999000,-1652.1999500,14.7000000,0.0000000,0.0000000,0.0000000); //object(smashboxpile)(5)
	CreateDynamicObject(12957,2243.0000000,-1661.8000500,15.1000000,0.0000000,0.0000000,0.0000000); //object(sw_pickupwreck01)(5)
	CreateDynamicObject(1219,2253.8999000,-1643.0000000,15.8000000,90.0000000,179.9560000,172.0440000); //object(palette)(7)
	CreateDynamicObject(1219,2260.1001000,-1643.9000200,15.8000000,90.0000000,179.9510000,172.0400000); //object(palette)(8)
	CreateDynamicObject(1219,2246.8999000,-1638.0999800,16.6000000,90.0000000,179.9510000,160.5400000); //object(palette)(9)
	CreateDynamicObject(1219,2242.0000000,-1636.1999500,16.6000000,90.0000000,179.9450000,160.5380000); //object(palette)(10)
	CreateDynamicObject(922,2235.1999500,-1665.5999800,15.2000000,0.0000000,0.0000000,70.0000000); //object(packing_carates1)(1)
	CreateDynamicObject(2671,2245.8000500,-1655.0000000,14.3000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_3)(1)
	CreateDynamicObject(2671,2248.5000000,-1654.0999800,14.3000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_3)(2)
	CreateDynamicObject(2671,2249.3999000,-1654.4000200,14.3000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_3)(3)
	CreateDynamicObject(2671,2249.3000500,-1656.5999800,14.3000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_3)(4)
	CreateDynamicObject(2671,2249.5000000,-1658.1999500,14.3000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_3)(5)
	CreateDynamicObject(2671,2246.1999500,-1656.8000500,14.3000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_3)(6)
	CreateDynamicObject(2671,2234.3999000,-1654.0999800,14.3000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_3)(7)
	CreateDynamicObject(2671,2240.1999500,-1656.4000200,14.3000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_3)(8)
	CreateDynamicObject(2671,2240.8999000,-1656.0000000,14.3000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_3)(9)
	CreateDynamicObject(2671,2253.8999000,-1658.6999500,14.3000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_3)(10)
	CreateDynamicObject(2672,2252.8999000,-1655.8000500,14.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(42)
	CreateDynamicObject(2672,2247.3000500,-1658.4000200,14.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(43)
	CreateDynamicObject(2672,2246.0000000,-1653.5000000,14.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(44)
	CreateDynamicObject(2672,2247.8999000,-1652.6999500,14.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(45)
	CreateDynamicObject(2672,2250.6999500,-1658.8000500,14.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(46)
	CreateDynamicObject(2672,2243.8999000,-1655.6999500,14.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(47)
	CreateDynamicObject(2672,2250.6999500,-1650.0000000,14.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(48)
	CreateDynamicObject(2672,2244.1999500,-1646.4000200,14.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(49)
	CreateDynamicObject(2672,2248.5000000,-1648.0999800,14.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(50)
	CreateDynamicObject(2672,2255.1999500,-1650.6999500,14.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(51)
	CreateDynamicObject(2672,2259.6001000,-1651.0999800,14.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(52)
	CreateDynamicObject(2672,2257.6999500,-1647.5000000,14.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(53)
	CreateDynamicObject(2672,2240.3999000,-1646.9000200,14.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(54)
	CreateDynamicObject(2672,2238.6001000,-1644.5999800,14.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(55)
	CreateDynamicObject(2672,2234.6999500,-1644.0999800,14.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(56)
	CreateDynamicObject(2672,2231.1999500,-1646.3000500,14.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(57)
	CreateDynamicObject(2672,2229.3000500,-1642.5999800,14.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(58)
	CreateDynamicObject(2672,2229.3000500,-1642.5999800,14.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(59)
	CreateDynamicObject(12957,2247.5000000,-1652.5000000,14.9000000,0.0000000,0.0000000,120.0000000); //object(sw_pickupwreck01)(6)
	CreateDynamicObject(3593,2267.8000500,-1639.5000000,14.8000000,0.0000000,0.0000000,0.0000000); //object(la_fuckcar2)(1)
	CreateDynamicObject(960,2251.3000500,-1663.6999500,14.9000000,0.0000000,0.0000000,0.0000000); //object(cj_arm_crate)(1)
	CreateDynamicObject(926,2254.8999000,-1654.6999500,14.5000000,0.0000000,0.0000000,0.0000000); //object(rubbish_box2)(6)
	CreateDynamicObject(928,2241.1001000,-1653.4000200,14.5000000,0.0000000,0.0000000,0.0000000); //object(rubbish_box1)(1)
	CreateDynamicObject(3461,2276.8999000,-1639.0000000,15.8000000,82.0000000,180.0000000,180.0000000); //object(tikitorch01_lvs)(19)
	CreateDynamicObject(3461,2278.0000000,-1639.0999800,15.8000000,81.9960000,179.9950000,179.9950000); //object(tikitorch01_lvs)(40)
	CreateDynamicObject(3461,2282.1001000,-1639.0000000,15.1000000,81.9960000,179.9950000,179.9950000); //object(tikitorch01_lvs)(42)
	CreateDynamicObject(3461,2284.3999000,-1639.0999800,15.9000000,81.9960000,179.9950000,179.9950000); //object(tikitorch01_lvs)(43)
	CreateDynamicObject(3461,2285.3999000,-1639.4000200,15.9000000,81.9960000,179.9950000,279.9950000); //object(tikitorch01_lvs)(44)
	CreateDynamicObject(3461,2285.6001000,-1635.6999500,15.9000000,85.2460000,179.9910000,279.9960000); //object(tikitorch01_lvs)(45)
	CreateDynamicObject(3461,2285.5000000,-1629.3000500,15.9000000,85.2430000,179.9890000,279.9920000); //object(tikitorch01_lvs)(46)
	CreateDynamicObject(3461,2250.1999500,-1669.4000200,16.0000000,272.0000000,180.0000000,150.0000000); //object(tikitorch01_lvs)(47)
	CreateDynamicObject(3461,2252.5000000,-1669.9000200,16.0000000,272.0000000,179.9950000,149.9960000); //object(tikitorch01_lvs)(48)
	CreateDynamicObject(3461,2253.6001000,-1670.0999800,16.0000000,272.0000000,179.9950000,149.9960000); //object(tikitorch01_lvs)(49)
	CreateDynamicObject(3461,2244.1999500,-1668.5000000,16.0000000,272.0000000,179.9950000,149.9960000); //object(tikitorch01_lvs)(50)
	CreateDynamicObject(3461,2236.8000500,-1665.6999500,16.0000000,272.0000000,179.9950000,149.9960000); //object(tikitorch01_lvs)(51)
	CreateDynamicObject(3461,2233.6999500,-1651.5000000,13.9000000,0.0000000,0.0000000,0.0000000); //object(tikitorch01_lvs)(52)
	CreateDynamicObject(3877,2222.0000000,-1641.0999800,16.1000000,0.0000000,0.0000000,0.0000000); //object(sf_rooflite)(7)
	CreateDynamicObject(3877,2219.1999500,-1650.8000500,15.9000000,0.0000000,0.0000000,0.0000000); //object(sf_rooflite)(8)
	CreateDynamicObject(3877,2217.8000500,-1658.5000000,15.8000000,0.0000000,0.0000000,0.0000000); //object(sf_rooflite)(9)
	CreateDynamicObject(924,2217.8999000,-1708.0000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(fruitcrate3)(1)
	CreateDynamicObject(924,2214.6001000,-1707.9000200,12.6000000,0.0000000,0.0000000,0.0000000); //object(fruitcrate3)(2)
	CreateDynamicObject(924,2215.5000000,-1708.0999800,12.6000000,0.0000000,0.0000000,60.0000000); //object(fruitcrate3)(3)
	CreateDynamicObject(910,2221.6001000,-1708.5999800,13.7000000,0.0000000,0.0000000,270.0000000); //object(bust_cabinet_4)(2)
	CreateDynamicObject(853,2213.8000500,-1710.3000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_5)(2)
	CreateDynamicObject(850,2213.8000500,-1714.4000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_1)(7)
	CreateDynamicObject(849,2220.6999500,-1706.6999500,12.8000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_3)(9)
	CreateDynamicObject(3302,2216.3000500,-1704.5000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(cxrf_corpanel)(1)
	CreateDynamicObject(810,2221.0000000,-1710.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush14)(1)
	CreateDynamicObject(806,2222.3000500,-1709.5000000,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(44)
	CreateDynamicObject(806,2215.1001000,-1706.5000000,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(45)
	CreateDynamicObject(806,2223.1001000,-1698.8000500,16.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(46)
	CreateDynamicObject(806,2214.8999000,-1715.8000500,16.1000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(47)
	CreateDynamicObject(806,2225.5000000,-1646.5999800,18.1000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(48)
	CreateDynamicObject(806,2230.6999500,-1637.0999800,18.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(49)
	CreateDynamicObject(806,2234.3000500,-1632.3000500,18.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(50)
	CreateDynamicObject(806,2236.5000000,-1626.0000000,18.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(51)
	CreateDynamicObject(806,2238.6001000,-1624.0999800,18.6000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(52)
	CreateDynamicObject(806,2240.8000500,-1623.0999800,18.7000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(53)
	CreateDynamicObject(806,2239.6999500,-1621.0000000,18.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(54)
	CreateDynamicObject(806,2235.1999500,-1631.1999500,18.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(55)
	CreateDynamicObject(872,2233.1999500,-1689.9000200,12.8000000,0.0000000,0.0000000,0.0000000); //object(gen_tallgrsnew)(1)
	CreateDynamicObject(844,2221.6001000,-1752.4000200,13.3000000,0.0000000,0.0000000,0.0000000); //object(dead_tree_16)(1)
	CreateDynamicObject(844,2216.0000000,-1752.0000000,13.3000000,0.0000000,0.0000000,70.0000000); //object(dead_tree_16)(2)
	CreateDynamicObject(842,2219.8000500,-1756.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(dead_tree_14)(1)
	CreateDynamicObject(842,2217.6001000,-1755.5999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(dead_tree_14)(2)
	CreateDynamicObject(842,2219.3000500,-1753.4000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(dead_tree_14)(3)
	CreateDynamicObject(842,2215.6999500,-1756.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(dead_tree_14)(4)
	CreateDynamicObject(838,2227.6999500,-1761.0999800,15.4000000,0.0000000,0.0000000,320.0000000); //object(dead_tree_9)(1)
	CreateDynamicObject(837,2225.5000000,-1757.6999500,13.0000000,0.0000000,0.0000000,310.0000000); //object(dead_tree_1)(1)
	CreateDynamicObject(617,2234.3999000,-1761.9000200,10.1000000,0.0000000,0.0000000,0.0000000); //object(veg_treeb1)(1)
	CreateDynamicObject(621,2228.8994100,-1765.5996100,12.3000000,0.0000000,0.0000000,0.0000000); //object(veg_palm02)(1)
	CreateDynamicObject(629,2208.6999500,-1757.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(veg_palmkb5)(1)
	CreateDynamicObject(629,2208.8999000,-1776.9000200,12.3000000,0.0000000,0.0000000,0.0000000); //object(veg_palmkb5)(2)
	CreateDynamicObject(629,2209.1999500,-1796.5999800,12.3000000,0.0000000,0.0000000,0.0000000); //object(veg_palmkb5)(3)
	CreateDynamicObject(629,2209.1001000,-1818.9000200,12.3000000,0.0000000,0.0000000,0.0000000); //object(veg_palmkb5)(4)
	CreateDynamicObject(629,2209.8000500,-1835.1999500,12.3000000,0.0000000,0.0000000,0.0000000); //object(veg_palmkb5)(5)
	CreateDynamicObject(16092,2184.3000500,-1767.1999500,12.3000000,0.0000000,0.0000000,90.0000000); //object(des_pipestrut05)(1)
	CreateDynamicObject(939,2181.5000000,-1808.5999800,14.8000000,0.0000000,0.0000000,0.0000000); //object(cj_df_unit)(2)
	CreateDynamicObject(942,2175.8000500,-1808.5999800,14.8000000,0.0000000,0.0000000,0.0000000); //object(cj_df_unit_2)(3)
	CreateDynamicObject(18257,2177.1001000,-1794.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(crates)(1)
	CreateDynamicObject(925,2171.3999000,-1809.4000200,13.4000000,0.0000000,0.0000000,0.0000000); //object(rack2)(4)
	CreateDynamicObject(925,2168.5000000,-1809.4000200,13.4000000,0.0000000,0.0000000,0.0000000); //object(rack2)(5)
	CreateDynamicObject(925,2165.6999500,-1809.5000000,13.4000000,0.0000000,0.0000000,0.0000000); //object(rack2)(6)
	CreateDynamicObject(930,2169.6999500,-1808.0000000,12.8000000,0.0000000,0.0000000,0.0000000); //object(o2_bottles)(1)
	CreateDynamicObject(930,2167.0000000,-1808.1999500,12.8000000,0.0000000,0.0000000,0.0000000); //object(o2_bottles)(2)
	CreateDynamicObject(1431,2167.1001000,-1791.5000000,12.9000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile)(6)
	CreateDynamicObject(16337,2188.6999500,-1772.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(des_cranecontrol)(2)
	CreateDynamicObject(8877,2187.5000000,-1777.3000500,18.5000000,0.0000000,0.0000000,262.0000000); //object(vgsecnstrct10)(2)
	CreateDynamicObject(17055,2188.1001000,-1807.8000500,14.3000000,0.0000000,0.0000000,0.0000000); //object(cw_fueldrum03)(1)
	CreateDynamicObject(920,2177.1999500,-1805.3000500,12.9000000,0.0000000,0.0000000,320.0000000); //object(y_generator)(2)
	CreateDynamicObject(929,2157.3000500,-1808.4000200,13.3000000,0.0000000,0.0000000,0.0000000); //object(generator)(2)
	CreateDynamicObject(943,2178.3000500,-1794.0999800,13.1000000,0.0000000,0.0000000,100.0000000); //object(generator_low)(1)
	CreateDynamicObject(1353,2176.1001000,-1786.9000200,13.2000000,0.0000000,0.0000000,0.0000000); //object(cj_aircon)(1)
	CreateDynamicObject(1688,2162.3000500,-1809.4000200,13.4000000,0.0000000,0.0000000,0.0000000); //object(gen_roofbit2)(1)
	CreateDynamicObject(11292,2188.3999000,-1790.0000000,13.8000000,0.0000000,0.0000000,270.0000000); //object(gasstatiohut)(1)
	CreateDynamicObject(617,2172.1001000,-1720.0999800,12.9000000,0.0000000,0.0000000,0.0000000); //object(veg_treeb1)(2)
	CreateDynamicObject(621,2154.0000000,-1812.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(veg_palm02)(2)
	CreateDynamicObject(736,2092.8999000,-1712.8000500,23.8000000,0.0000000,0.0000000,0.0000000); //object(ceasertree01_lvs)(1)
	CreateDynamicObject(736,2094.8999000,-1706.1999500,23.7000000,0.0000000,0.0000000,0.0000000); //object(ceasertree01_lvs)(2)
	CreateDynamicObject(736,2096.3999000,-1701.0000000,23.7000000,0.0000000,0.0000000,0.0000000); //object(ceasertree01_lvs)(3)
	CreateDynamicObject(736,2098.3999000,-1694.0000000,23.8000000,0.0000000,0.0000000,0.0000000); //object(ceasertree01_lvs)(4)
	CreateDynamicObject(736,2099.6001000,-1686.5999800,23.7000000,0.0000000,0.0000000,0.0000000); //object(ceasertree01_lvs)(5)
	CreateDynamicObject(736,2100.3000500,-1679.9000200,23.8000000,0.0000000,0.0000000,0.0000000); //object(ceasertree01_lvs)(6)
	CreateDynamicObject(1438,2186.3000500,-1785.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile_2)(3)
	CreateDynamicObject(1441,2173.6999500,-1795.5999800,13.0000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile_4)(3)
	CreateDynamicObject(1439,2187.8999000,-1795.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(dyn_dumpster_1)(3)
	CreateDynamicObject(1372,2174.3000500,-1786.8000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(cj_dump2_low)(1)
	CreateDynamicObject(1369,2172.6001000,-1786.9000200,13.1000000,0.0000000,0.0000000,0.0000000); //object(cj_wheelchair1)(2)
	CreateDynamicObject(1358,2163.1001000,-1789.0999800,13.7000000,0.0000000,0.0000000,0.0000000); //object(cj_skip_rubbish)(3)
	CreateDynamicObject(1349,2172.1001000,-1807.5999800,12.9000000,0.0000000,0.0000000,0.0000000); //object(cj_shtrolly)(5)
	CreateDynamicObject(1347,2189.6999500,-1795.6999500,12.9000000,0.0000000,0.0000000,0.0000000); //object(cj_wastebin)(2)
	CreateDynamicObject(2676,2180.1999500,-1805.5999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(11)
	CreateDynamicObject(2676,2164.6001000,-1800.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(12)
	CreateDynamicObject(2676,2181.1001000,-1788.9000200,12.5000000,0.0000000,0.0000000,248.0000000); //object(proc_rubbish_8)(13)
	CreateDynamicObject(2676,2188.3000500,-1796.6999500,12.5000000,0.0000000,0.0000000,248.0000000); //object(proc_rubbish_8)(14)
	CreateDynamicObject(2676,2185.6001000,-1774.3000500,12.5000000,0.0000000,0.0000000,248.0000000); //object(proc_rubbish_8)(15)
	CreateDynamicObject(2677,2182.0000000,-1774.5000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(18)
	CreateDynamicObject(2677,2180.6999500,-1797.0999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(19)
	CreateDynamicObject(2677,2164.8999000,-1806.3000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(20)
	CreateDynamicObject(3594,2188.3000500,-1803.6999500,13.0000000,0.0000000,0.0000000,270.0000000); //object(la_fuckcar1)(25)
	CreateDynamicObject(917,2185.6001000,-1801.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(fruitcrate1)(1)
	CreateDynamicObject(911,2184.0000000,-1806.5000000,12.9000000,0.0000000,0.0000000,260.0000000); //object(bust_cabinet_1)(1)
	CreateDynamicObject(853,2176.1001000,-1796.1999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_5)(3)
	CreateDynamicObject(850,2188.3999000,-1800.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_1)(8)
	CreateDynamicObject(2971,2158.1001000,-1800.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(k_smashboxes)(4)
	CreateDynamicObject(1450,2186.1999500,-1789.5999800,13.0000000,0.0000000,0.0000000,270.0000000); //object(dyn_crate_3)(3)
	CreateDynamicObject(1440,2174.8000500,-1806.5000000,12.9000000,0.0000000,0.0000000,180.0000000); //object(dyn_box_pile_3)(2)
	CreateDynamicObject(3403,2159.8999000,-1796.6999500,15.4000000,0.0000000,0.0000000,270.0000000); //object(sw_logcover)(2)
	CreateDynamicObject(14875,2157.1999500,-1792.0999800,13.2000000,0.0000000,0.0000000,0.0000000); //object(kylie_hay1)(1)
	CreateDynamicObject(1412,2161.0000000,-1801.8000500,13.6000000,0.0000000,0.0000000,0.0000000); //object(dyn_mesh_2)(1)
	CreateDynamicObject(1412,2163.6999500,-1799.0999800,13.6000000,0.0000000,0.0000000,270.0000000); //object(dyn_mesh_2)(2)
	CreateDynamicObject(1412,2163.6999500,-1793.9000200,13.6000000,0.0000000,0.0000000,270.0000000); //object(dyn_mesh_2)(3)
	CreateDynamicObject(1412,2160.8999000,-1791.4000200,13.6000000,0.0000000,0.0000000,0.0000000); //object(dyn_mesh_2)(4)
	CreateDynamicObject(1424,2188.1001000,-1768.0000000,12.9000000,0.0000000,0.0000000,348.0000000); //object(dyn_roadbarrier_2)(7)
	CreateDynamicObject(1424,2186.6999500,-1769.6999500,12.9000000,0.0000000,0.0000000,47.9970000); //object(dyn_roadbarrier_2)(8)
	CreateDynamicObject(1766,2162.1999500,-1798.5000000,12.4000000,0.0000000,0.0000000,210.0000000); //object(med_couch_1)(1)
	CreateDynamicObject(1766,2162.6999500,-1794.8000500,12.4000000,0.0000000,0.0000000,269.9980000); //object(med_couch_1)(2)
	CreateDynamicObject(1766,2159.6999500,-1792.5000000,12.4000000,0.0000000,0.0000000,329.9950000); //object(med_couch_1)(3)
	CreateDynamicObject(1737,2156.1001000,-1794.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(med_dinning_5)(1)
	CreateDynamicObject(3461,2287.8999000,-1773.5000000,13.5000000,88.0000000,180.0000000,280.0000000); //object(tikitorch01_lvs)(53)
	CreateDynamicObject(3461,2288.3000500,-1773.4000200,17.5000000,87.9950000,179.9950000,279.9980000); //object(tikitorch01_lvs)(54)
	CreateDynamicObject(3461,2288.3000500,-1772.5999800,13.8000000,87.9950000,179.9950000,279.9980000); //object(tikitorch01_lvs)(55)
	CreateDynamicObject(3461,2288.1999500,-1774.0999800,13.8000000,87.9950000,179.9950000,279.9980000); //object(tikitorch01_lvs)(56)
	CreateDynamicObject(3461,2288.3000500,-1781.1999500,13.8000000,87.9950000,179.9950000,279.9980000); //object(tikitorch01_lvs)(57)
	CreateDynamicObject(3461,2288.3999000,-1782.6999500,13.8000000,87.9950000,179.9950000,279.9980000); //object(tikitorch01_lvs)(58)
	CreateDynamicObject(3461,2288.1999500,-1790.4000200,13.8000000,87.9950000,179.9950000,279.9980000); //object(tikitorch01_lvs)(59)
	CreateDynamicObject(3461,2288.1999500,-1790.4000200,18.0000000,87.9950000,179.9950000,279.9980000); //object(tikitorch01_lvs)(60)
	CreateDynamicObject(3594,2216.8999000,-1724.5000000,13.0000000,0.0000000,0.0000000,320.0000000); //object(la_fuckcar1)(26)
	CreateDynamicObject(3594,2222.1001000,-1733.9000200,13.0000000,0.0000000,0.0000000,249.9990000); //object(la_fuckcar1)(27)
	CreateDynamicObject(3594,2215.8000500,-1748.8000500,13.0000000,0.0000000,0.0000000,299.9940000); //object(la_fuckcar1)(28)
	CreateDynamicObject(3594,2210.8000500,-1737.9000200,13.0000000,0.0000000,0.0000000,239.9930000); //object(la_fuckcar1)(29)
	CreateDynamicObject(3594,2179.1999500,-1748.4000200,13.0000000,0.0000000,0.0000000,309.9910000); //object(la_fuckcar1)(30)
	CreateDynamicObject(3594,2182.1999500,-1731.9000200,13.0000000,0.0000000,0.0000000,3.9900000); //object(la_fuckcar1)(31)
	CreateDynamicObject(3594,2186.1999500,-1734.1999500,13.0000000,0.0000000,0.0000000,313.9880000); //object(la_fuckcar1)(32)
	CreateDynamicObject(3594,2188.1999500,-1706.8000500,13.0000000,0.0000000,0.0000000,153.9840000); //object(la_fuckcar1)(33)
	CreateDynamicObject(3594,2187.3999000,-1692.5000000,13.0000000,0.0000000,0.0000000,193.9790000); //object(la_fuckcar1)(34)
	CreateDynamicObject(3594,2189.8000500,-1680.4000200,13.3000000,356.5000000,0.0000000,143.9750000); //object(la_fuckcar1)(35)
	CreateDynamicObject(3594,2189.3999000,-1672.9000200,13.8000000,359.9950000,0.0000000,43.9700000); //object(la_fuckcar1)(36)
	CreateDynamicObject(3594,2202.5000000,-1636.5000000,14.9000000,0.0000000,0.0000000,0.0000000); //object(la_fuckcar1)(37)
	CreateDynamicObject(3594,2196.5000000,-1653.8000500,14.9000000,0.0000000,0.0000000,0.0000000); //object(la_fuckcar1)(38)
	CreateDynamicObject(3594,2188.3999000,-1637.9000200,14.9000000,0.0000000,0.0000000,260.0000000); //object(la_fuckcar1)(39)
	CreateDynamicObject(3594,2160.5000000,-1633.0000000,13.4000000,3.0000000,0.0000000,259.9970000); //object(la_fuckcar1)(40)
	CreateDynamicObject(3594,2144.1999500,-1626.1999500,12.9000000,2.9990000,0.0000000,259.9970000); //object(la_fuckcar1)(41)
	CreateDynamicObject(3594,2137.3000500,-1623.5000000,12.9000000,2.9990000,0.0000000,299.9970000); //object(la_fuckcar1)(42)
	CreateDynamicObject(3594,2116.3999000,-1615.0000000,12.9000000,2.9990000,0.0000000,299.9930000); //object(la_fuckcar1)(43)
	CreateDynamicObject(3594,2099.8000500,-1615.5000000,12.9000000,358.4990000,0.0000000,239.9930000); //object(la_fuckcar1)(44)
	CreateDynamicObject(3594,2088.3999000,-1607.0000000,12.9000000,358.4950000,0.0000000,299.9910000); //object(la_fuckcar1)(45)
	CreateDynamicObject(3594,2078.8000500,-1621.3000500,12.9000000,358.4950000,0.0000000,199.9870000); //object(la_fuckcar1)(46)
	CreateDynamicObject(3594,2082.5000000,-1640.0000000,12.9000000,358.4950000,0.0000000,299.9840000); //object(la_fuckcar1)(47)
	CreateDynamicObject(3594,2077.6001000,-1654.0999800,12.9000000,358.4950000,0.0000000,349.9820000); //object(la_fuckcar1)(48)
	CreateDynamicObject(3594,2085.7998000,-1662.0996100,12.9000000,358.4950000,0.0000000,299.9760000); //object(la_fuckcar1)(49)
	CreateDynamicObject(3594,2085.1001000,-1687.8000500,12.9000000,358.4950000,0.0000000,339.9760000); //object(la_fuckcar1)(50)
	CreateDynamicObject(3594,2084.8000500,-1745.9000200,12.9000000,358.4950000,0.0000000,29.9720000); //object(la_fuckcar1)(51)
	CreateDynamicObject(3594,2099.3000500,-1739.3000500,12.9000000,358.4950000,0.0000000,159.9710000); //object(la_fuckcar1)(52)
	CreateDynamicObject(3594,2083.8994100,-1755.3994100,12.9000000,358.4950000,0.0000000,259.9640000); //object(la_fuckcar1)(53)
	CreateDynamicObject(3594,2086.8999000,-1783.4000200,12.9000000,358.4950000,0.0000000,349.9640000); //object(la_fuckcar1)(54)
	CreateDynamicObject(3594,2080.3000500,-1793.0000000,12.9000000,358.4950000,0.0000000,29.9580000); //object(la_fuckcar1)(55)
	CreateDynamicObject(3594,2094.3999000,-1800.0000000,12.9000000,358.4950000,0.0000000,79.9540000); //object(la_fuckcar1)(56)
	CreateDynamicObject(2677,2197.3000500,-1700.9000200,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(21)
	CreateDynamicObject(2677,2199.6001000,-1702.9000200,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(22)
	CreateDynamicObject(2677,2203.1001000,-1708.4000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(23)
	CreateDynamicObject(2677,2198.8000500,-1712.9000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(24)
	CreateDynamicObject(2677,2199.1001000,-1725.0000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(25)
	CreateDynamicObject(2677,2203.3999000,-1731.1999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(26)
	CreateDynamicObject(2677,2201.3000500,-1730.6999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(27)
	CreateDynamicObject(2677,2201.6999500,-1727.5000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(28)
	CreateDynamicObject(2677,2185.1999500,-1731.4000200,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(29)
	CreateDynamicObject(2677,2178.8000500,-1730.0999800,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(30)
	CreateDynamicObject(2677,2183.3000500,-1745.9000200,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(31)
	CreateDynamicObject(2677,2174.3000500,-1759.5999800,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(32)
	CreateDynamicObject(2677,2175.8000500,-1745.3000500,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(33)
	CreateDynamicObject(2677,2192.3000500,-1756.9000200,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(34)
	CreateDynamicObject(2677,2163.8999000,-1756.8000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(35)
	CreateDynamicObject(2677,2167.3999000,-1751.6999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(36)
	CreateDynamicObject(2677,2147.0000000,-1749.8000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(37)
	CreateDynamicObject(2677,2132.6001000,-1753.5999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(38)
	CreateDynamicObject(2677,2132.3999000,-1750.9000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(39)
	CreateDynamicObject(2677,2134.3999000,-1752.4000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(40)
	CreateDynamicObject(2677,2114.1999500,-1753.1999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(41)
	CreateDynamicObject(2677,2113.3000500,-1759.8000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(42)
	CreateDynamicObject(2677,2112.1999500,-1764.8000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(43)
	CreateDynamicObject(2677,2117.1001000,-1766.8000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(44)
	CreateDynamicObject(2677,2118.6999500,-1771.0000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(45)
	CreateDynamicObject(2677,2111.8000500,-1772.8000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(46)
	CreateDynamicObject(2677,2122.8000500,-1759.0999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(47)
	CreateDynamicObject(2677,2125.8999000,-1755.5999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(48)
	CreateDynamicObject(2677,2096.6001000,-1744.3000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(49)
	CreateDynamicObject(2677,2090.6001000,-1749.8000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(50)
	CreateDynamicObject(2677,2086.1001000,-1754.0999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(51)
	CreateDynamicObject(2677,2086.8999000,-1760.0999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(52)
	CreateDynamicObject(2677,2084.6001000,-1783.1999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(53)
	CreateDynamicObject(2677,2078.8999000,-1788.6999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(54)
	CreateDynamicObject(2677,2103.8999000,-1724.8000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(55)
	CreateDynamicObject(2677,2108.6999500,-1699.4000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(56)
	CreateDynamicObject(2677,2106.6999500,-1702.6999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(57)
	CreateDynamicObject(2677,2113.1999500,-1709.1999500,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(58)
	CreateDynamicObject(2677,2084.1999500,-1693.0000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(59)
	CreateDynamicObject(2677,2081.6999500,-1692.5999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(60)
	CreateDynamicObject(2677,2077.3999000,-1734.6999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(61)
	CreateDynamicObject(2677,2081.3000500,-1663.9000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(62)
	CreateDynamicObject(2677,2088.1999500,-1658.4000200,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(63)
	CreateDynamicObject(2677,2080.1001000,-1650.6999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(64)
	CreateDynamicObject(2677,2085.1001000,-1635.9000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(65)
	CreateDynamicObject(2677,2082.1001000,-1623.5999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(66)
	CreateDynamicObject(2677,2087.8994100,-1610.2998000,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(67)
	CreateDynamicObject(2677,2096.3999000,-1616.8000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(68)
	CreateDynamicObject(2677,2111.5000000,-1616.6999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(69)
	CreateDynamicObject(2677,2128.3000500,-1623.0000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(70)
	CreateDynamicObject(2677,2148.3000500,-1628.4000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(71)
	CreateDynamicObject(2677,2147.0000000,-1629.5999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(72)
	CreateDynamicObject(2677,2149.3999000,-1630.5000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(73)
	CreateDynamicObject(2677,2149.6999500,-1620.5000000,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(74)
	CreateDynamicObject(2677,2140.6001000,-1617.5000000,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(75)
	CreateDynamicObject(2677,2112.5000000,-1607.1999500,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(76)
	CreateDynamicObject(2677,2114.1001000,-1607.5999800,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(77)
	CreateDynamicObject(2677,2110.5000000,-1606.1999500,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(78)
	CreateDynamicObject(2677,2090.6999500,-1585.3000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(79)
	CreateDynamicObject(2677,2094.8000500,-1579.4000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(80)
	CreateDynamicObject(2677,2090.1999500,-1572.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(81)
	CreateDynamicObject(2677,2092.3999000,-1567.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(82)
	CreateDynamicObject(2677,2094.8000500,-1568.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(83)
	CreateDynamicObject(2677,2094.6001000,-1572.4000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(84)
	CreateDynamicObject(2677,2089.1001000,-1583.0999800,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(85)
	CreateDynamicObject(2677,2093.3999000,-1599.9000200,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(86)
	CreateDynamicObject(2677,2093.6001000,-1595.8000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(87)
	CreateDynamicObject(2677,2102.6001000,-1583.3000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(88)
	CreateDynamicObject(2676,2067.1999500,-1619.5999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(16)
	CreateDynamicObject(2676,2074.5000000,-1628.5999800,12.7000000,0.0000000,0.0000000,50.0000000); //object(proc_rubbish_8)(17)
	CreateDynamicObject(2676,2074.5000000,-1664.0999800,12.7000000,0.0000000,0.0000000,49.9990000); //object(proc_rubbish_8)(18)
	CreateDynamicObject(2676,2082.0000000,-1668.0999800,12.5000000,0.0000000,0.0000000,49.9990000); //object(proc_rubbish_8)(19)
	CreateDynamicObject(2676,2080.6001000,-1655.8000500,12.5000000,0.0000000,0.0000000,49.9990000); //object(proc_rubbish_8)(20)
	CreateDynamicObject(2676,2080.6001000,-1717.5999800,12.5000000,0.0000000,0.0000000,49.9990000); //object(proc_rubbish_8)(21)
	CreateDynamicObject(2676,2071.3000500,-1754.6999500,12.5000000,0.0000000,0.0000000,109.9990000); //object(proc_rubbish_8)(22)
	CreateDynamicObject(2676,2082.2998000,-1714.5996100,12.5000000,0.0000000,0.0000000,109.9950000); //object(proc_rubbish_8)(23)
	CreateDynamicObject(2676,2073.5000000,-1753.4000200,12.5000000,0.0000000,0.0000000,109.9950000); //object(proc_rubbish_8)(24)
	CreateDynamicObject(2676,2122.6999500,-1752.6999500,12.5000000,0.0000000,0.0000000,109.9950000); //object(proc_rubbish_8)(25)
	CreateDynamicObject(2676,2070.6001000,-1770.8000500,12.7000000,0.0000000,0.0000000,109.9950000); //object(proc_rubbish_8)(26)
	CreateDynamicObject(2676,2074.3000500,-1769.3000500,12.7000000,0.0000000,0.0000000,189.9950000); //object(proc_rubbish_8)(27)
	CreateDynamicObject(2676,2071.8000500,-1766.4000200,12.7000000,0.0000000,0.0000000,143.9920000); //object(proc_rubbish_8)(28)
	CreateDynamicObject(855,2175.1999500,-1744.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(15)
	CreateDynamicObject(855,2188.3000500,-1762.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(16)
	CreateDynamicObject(855,2193.1001000,-1710.4000200,12.6000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(17)
	CreateDynamicObject(855,2195.6001000,-1684.6999500,13.0000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(18)
	CreateDynamicObject(855,2201.1001000,-1660.3000500,14.0000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(19)
	CreateDynamicObject(855,2196.1999500,-1679.3000500,13.1000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(20)
	CreateDynamicObject(855,2197.1001000,-1673.8000500,13.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(21)
	CreateDynamicObject(855,2198.8000500,-1668.0999800,13.7000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(22)
	CreateDynamicObject(855,2194.8999000,-1690.1999500,12.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(23)
	CreateDynamicObject(855,2194.8000500,-1695.5999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(24)
	CreateDynamicObject(855,2193.8999000,-1701.1999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(25)
	CreateDynamicObject(855,2193.6999500,-1706.5999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(26)
	CreateDynamicObject(855,2171.6001000,-1632.6999500,13.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(27)
	CreateDynamicObject(855,2184.8000500,-1646.8000500,14.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(28)
	CreateDynamicObject(855,2141.8000500,-1618.1999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(29)
	CreateDynamicObject(855,2105.0000000,-1615.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(30)
	CreateDynamicObject(855,2088.6999500,-1599.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(31)
	CreateDynamicObject(855,2095.3000500,-1600.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(32)
	CreateDynamicObject(855,2075.3000500,-1618.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(33)
	CreateDynamicObject(855,2072.3999000,-1642.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(34)
	CreateDynamicObject(855,2084.6999500,-1659.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(35)
	CreateDynamicObject(855,2074.0000000,-1681.4000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(36)
	CreateDynamicObject(855,2070.5000000,-1707.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(37)
	CreateDynamicObject(855,2072.8000500,-1744.5999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(38)
	CreateDynamicObject(855,2074.0000000,-1772.4000200,12.6000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(39)
	CreateDynamicObject(855,2095.8000500,-1785.5999800,12.6000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(40)
	CreateDynamicObject(855,2097.8999000,-1779.4000200,12.6000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(41)
	CreateDynamicObject(855,2099.3000500,-1771.1999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(42)
	CreateDynamicObject(855,2021.0999800,-1809.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(43)
	CreateDynamicObject(855,2095.6001000,-1828.4000200,12.6000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(44)
	CreateDynamicObject(855,2095.6001000,-1828.4000200,12.6000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(45)
	CreateDynamicObject(761,2084.3000500,-1786.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(13)
	CreateDynamicObject(761,2088.0000000,-1758.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(14)
	CreateDynamicObject(761,2097.6999500,-1744.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(15)
	CreateDynamicObject(761,2135.0000000,-1756.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(16)
	CreateDynamicObject(761,2156.6999500,-1750.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(17)
	CreateDynamicObject(761,2182.1001000,-1748.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(18)
	CreateDynamicObject(761,2182.0000000,-1736.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(19)
	CreateDynamicObject(761,2184.5000000,-1733.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(20)
	CreateDynamicObject(761,2183.6001000,-1729.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(21)
	CreateDynamicObject(761,2180.8000500,-1727.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(22)
	CreateDynamicObject(761,2209.3999000,-1746.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(23)
	CreateDynamicObject(761,2211.1001000,-1719.0999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(24)
	CreateDynamicObject(761,2211.6001000,-1715.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(25)
	CreateDynamicObject(761,2217.8000500,-1673.9000200,13.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(26)
	CreateDynamicObject(761,2215.3000500,-1672.5999800,13.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(27)
	CreateDynamicObject(761,2218.1001000,-1671.1999500,13.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(28)
	CreateDynamicObject(761,2192.3999000,-1661.5999800,13.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(29)
	CreateDynamicObject(761,2192.6999500,-1676.6999500,13.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(30)
	CreateDynamicObject(761,2189.8999000,-1676.5000000,13.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(31)
	CreateDynamicObject(761,2186.3000500,-1682.6999500,12.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(32)
	CreateDynamicObject(761,2188.0000000,-1669.5000000,13.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(33)
	CreateDynamicObject(761,2204.5000000,-1637.9000200,14.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(34)
	CreateDynamicObject(761,2201.0000000,-1640.0999800,14.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(35)
	CreateDynamicObject(761,2201.0000000,-1635.0999800,14.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(36)
	CreateDynamicObject(761,2191.6999500,-1640.3000500,14.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(37)
	CreateDynamicObject(761,2185.6001000,-1635.6999500,14.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(38)
	CreateDynamicObject(761,2185.3999000,-1639.1999500,14.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(39)
	CreateDynamicObject(761,2190.0000000,-1636.5000000,14.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(40)
	CreateDynamicObject(761,2158.1001000,-1630.5999800,12.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(41)
	CreateDynamicObject(761,2140.1999500,-1623.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(42)
	CreateDynamicObject(761,2141.1999500,-1627.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(43)
	CreateDynamicObject(761,2119.3000500,-1612.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(44)
	CreateDynamicObject(761,2120.6999500,-1614.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(45)
	CreateDynamicObject(761,2120.1001000,-1612.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(46)
	CreateDynamicObject(761,2117.8999000,-1609.5999800,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(47)
	CreateDynamicObject(761,2108.6001000,-1604.8000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(48)
	CreateDynamicObject(761,2097.1001000,-1612.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(49)
	CreateDynamicObject(761,2085.5996100,-1610.0996100,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(50)
	CreateDynamicObject(761,2086.3000500,-1603.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(51)
	CreateDynamicObject(761,2078.3000500,-1624.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(52)
	CreateDynamicObject(761,2075.5000000,-1624.4000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(53)
	CreateDynamicObject(761,2079.6999500,-1643.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(54)
	CreateDynamicObject(761,2076.6001000,-1650.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(55)
	CreateDynamicObject(761,2075.3000500,-1657.4000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(56)
	CreateDynamicObject(761,2082.5000000,-1665.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(57)
	CreateDynamicObject(761,2081.8999000,-1688.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(58)
	CreateDynamicObject(761,2084.3000500,-1683.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(59)
	CreateDynamicObject(761,2072.3000500,-1692.9000200,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(60)
	CreateDynamicObject(761,2085.0000000,-1743.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(61)
	CreateDynamicObject(761,2081.3999000,-1744.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(62)
	CreateDynamicObject(761,2081.0000000,-1753.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(63)
	CreateDynamicObject(761,2068.3999000,-1756.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(64)
	CreateDynamicObject(761,2069.8000500,-1745.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(65)
	CreateDynamicObject(761,2081.1999500,-1797.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(66)
	CreateDynamicObject(761,2091.8000500,-1802.5999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2092.5000000,-1830.5999800,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(68)
	CreateDynamicObject(761,2090.3999000,-1838.3000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(69)
	CreateDynamicObject(761,2090.8000500,-1832.6999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(70)
	CreateDynamicObject(761,2072.3999000,-1834.5000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(71)
	CreateDynamicObject(800,2117.5000000,-1718.5999800,15.1000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush07)(1)
	CreateDynamicObject(800,2118.3000500,-1713.5999800,15.1000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush07)(2)
	CreateDynamicObject(800,2124.1999500,-1721.0000000,15.1000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush07)(3)
	CreateDynamicObject(806,2089.1001000,-1742.4000200,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(56)
	CreateDynamicObject(806,2094.5000000,-1708.5999800,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(57)
	CreateDynamicObject(806,2094.1001000,-1715.6999500,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(58)
	CreateDynamicObject(806,2097.6001000,-1695.0999800,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(59)
	CreateDynamicObject(806,2096.1999500,-1672.6999500,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(60)
	CreateDynamicObject(806,2099.6001000,-1662.8000500,16.6000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(61)
	CreateDynamicObject(806,2094.1001000,-1661.8000500,16.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(62)
	CreateDynamicObject(806,2099.3999000,-1646.1999500,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(63)
	CreateDynamicObject(806,2094.8000500,-1631.9000200,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(64)
	CreateDynamicObject(806,2077.1992200,-1605.7998000,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(65)
	CreateDynamicObject(806,2107.6001000,-1607.5999800,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(66)
	CreateDynamicObject(806,2141.6001000,-1632.1999500,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(67)
	CreateDynamicObject(806,2173.5000000,-1640.1999500,17.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(68)
	CreateDynamicObject(806,2214.1001000,-1652.8000500,17.9000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(69)
	CreateDynamicObject(806,2193.1999500,-1693.6999500,16.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(70)
	CreateDynamicObject(806,2178.8999000,-1699.3000500,16.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(71)
	CreateDynamicObject(806,2168.0000000,-1707.0000000,18.1000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(72)
	CreateDynamicObject(806,2163.5000000,-1693.1999500,17.9000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(73)
	CreateDynamicObject(806,2164.8000500,-1695.5999800,17.9000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(74)
	CreateDynamicObject(806,2168.8999000,-1693.4000200,17.9000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(75)
	CreateDynamicObject(806,2171.6999500,-1684.5999800,17.6000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(76)
	CreateDynamicObject(806,2194.0000000,-1737.5999800,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(77)
	CreateDynamicObject(806,2194.3999000,-1721.9000200,16.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(78)
	CreateDynamicObject(910,2168.5000000,-1723.5000000,13.8000000,0.0000000,0.0000000,0.0000000); //object(bust_cabinet_4)(3)
	CreateDynamicObject(853,2148.3000500,-1728.3000500,12.9000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_5)(4)
	CreateDynamicObject(850,2129.8000500,-1728.8000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_1)(9)
	CreateDynamicObject(3035,2135.0000000,-1729.0000000,13.3000000,0.0000000,0.0000000,180.0000000); //object(tmp_bin)(4)
	CreateDynamicObject(3035,2137.8999000,-1728.9000200,13.3000000,0.0000000,0.0000000,179.9950000); //object(tmp_bin)(5)
	CreateDynamicObject(3035,2140.8000500,-1728.9000200,13.3000000,0.0000000,0.0000000,179.9950000); //object(tmp_bin)(6)
	CreateDynamicObject(2971,2150.0000000,-1724.1999500,12.5000000,0.0000000,0.0000000,40.0000000); //object(k_smashboxes)(5)
	CreateDynamicObject(2971,2146.6001000,-1723.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(k_smashboxes)(6)
	CreateDynamicObject(2971,2152.3000500,-1728.5000000,12.5000000,0.0000000,0.0000000,340.0000000); //object(k_smashboxes)(7)
	CreateDynamicObject(1440,2079.3999000,-1854.3000500,12.9000000,0.0000000,0.0000000,300.0000000); //object(dyn_box_pile_3)(3)
	CreateDynamicObject(1440,2082.0000000,-1840.4000200,12.9000000,0.0000000,0.0000000,19.9980000); //object(dyn_box_pile_3)(4)
	CreateDynamicObject(1440,2080.3000500,-1871.5999800,12.9000000,0.0000000,0.0000000,319.9950000); //object(dyn_box_pile_3)(5)
	CreateDynamicObject(1440,2086.8000500,-1890.8000500,12.9000000,0.0000000,0.0000000,19.9930000); //object(dyn_box_pile_3)(6)
	CreateDynamicObject(1440,2101.3999000,-1900.0999800,12.9000000,0.0000000,0.0000000,309.9900000); //object(dyn_box_pile_3)(7)
	CreateDynamicObject(1440,2076.3999000,-1926.4000200,12.9000000,0.0000000,0.0000000,249.9850000); //object(dyn_box_pile_3)(8)
	CreateDynamicObject(1440,2065.0000000,-1941.0999800,12.9000000,0.0000000,0.0000000,359.9830000); //object(dyn_box_pile_3)(9)
	CreateDynamicObject(1440,2084.8000500,-1935.9000200,12.9000000,0.0000000,0.0000000,69.9780000); //object(dyn_box_pile_3)(10)
	CreateDynamicObject(1440,2105.8999000,-1890.9000200,12.9000000,0.0000000,0.0000000,19.9770000); //object(dyn_box_pile_3)(11)
	CreateDynamicObject(1440,2109.6999500,-1899.0000000,12.9000000,0.0000000,0.0000000,219.9730000); //object(dyn_box_pile_3)(12)
	CreateDynamicObject(1440,2135.8999000,-1897.8000500,12.9000000,0.0000000,0.0000000,179.9680000); //object(dyn_box_pile_3)(13)
	CreateDynamicObject(1440,2160.1999500,-1892.0000000,12.9000000,0.0000000,0.0000000,261.9670000); //object(dyn_box_pile_3)(14)
	CreateDynamicObject(1440,2187.3000500,-1896.5999800,12.9000000,0.0000000,0.0000000,151.9640000); //object(dyn_box_pile_3)(15)
	CreateDynamicObject(1440,2224.1999500,-1899.8000500,12.9000000,0.0000000,0.0000000,201.9630000); //object(dyn_box_pile_3)(16)
	CreateDynamicObject(1440,2223.8000500,-1887.6999500,12.9000000,0.0000000,0.0000000,291.9620000); //object(dyn_box_pile_3)(17)
	CreateDynamicObject(1440,2214.6999500,-1861.8000500,12.9000000,0.0000000,0.0000000,91.9560000); //object(dyn_box_pile_3)(18)
	CreateDynamicObject(1440,2216.8999000,-1825.6999500,12.9000000,0.0000000,0.0000000,151.9560000); //object(dyn_box_pile_3)(19)
	CreateDynamicObject(1440,2219.3000500,-1798.3000500,12.9000000,0.0000000,0.0000000,91.9520000); //object(dyn_box_pile_3)(20)
	CreateDynamicObject(1440,2218.6999500,-1771.5999800,12.9000000,0.0000000,0.0000000,31.9500000); //object(dyn_box_pile_3)(21)
	CreateDynamicObject(3594,2215.3999000,-1767.3000500,13.0000000,0.0000000,0.0000000,320.0000000); //object(la_fuckcar1)(57)
	CreateDynamicObject(3594,2214.6001000,-1794.1999500,13.0000000,0.0000000,0.0000000,19.9990000); //object(la_fuckcar1)(58)
	CreateDynamicObject(3594,2219.1001000,-1819.9000200,13.0000000,0.0000000,0.0000000,329.9950000); //object(la_fuckcar1)(59)
	CreateDynamicObject(3594,2218.3999000,-1854.5999800,13.0000000,0.0000000,0.0000000,39.9910000); //object(la_fuckcar1)(60)
	CreateDynamicObject(3594,2222.1999500,-1879.3000500,13.0000000,0.0000000,0.0000000,359.9900000); //object(la_fuckcar1)(61)
	CreateDynamicObject(3594,2182.6001000,-1895.1999500,13.0000000,0.0000000,0.0000000,309.9890000); //object(la_fuckcar1)(62)
	CreateDynamicObject(3594,2155.1999500,-1892.1999500,13.0000000,0.0000000,0.0000000,249.9850000); //object(la_fuckcar1)(63)
	CreateDynamicObject(3594,2130.3000500,-1899.6999500,13.0000000,0.0000000,0.0000000,289.9830000); //object(la_fuckcar1)(64)
	CreateDynamicObject(3594,2104.6001000,-1898.5999800,13.0000000,0.0000000,0.0000000,237.9790000); //object(la_fuckcar1)(65)
	CreateDynamicObject(3594,2092.6999500,-1892.0999800,13.0000000,0.0000000,0.0000000,277.9750000); //object(la_fuckcar1)(66)
	CreateDynamicObject(3594,2081.5000000,-1921.1999500,13.0000000,0.0000000,0.0000000,227.9710000); //object(la_fuckcar1)(67)
	CreateDynamicObject(3594,2066.8000500,-1936.8000500,13.0000000,0.0000000,0.0000000,287.9660000); //object(la_fuckcar1)(68)
	CreateDynamicObject(3594,2054.0000000,-1930.5999800,13.0000000,0.0000000,0.0000000,227.9630000); //object(la_fuckcar1)(69)
	CreateDynamicObject(3594,2079.5000000,-1879.6999500,13.0000000,0.0000000,0.0000000,177.9610000); //object(la_fuckcar1)(70)
	CreateDynamicObject(3594,2081.0000000,-1830.0996100,13.0000000,0.0000000,0.0000000,237.9530000); //object(la_fuckcar1)(71)
	CreateDynamicObject(13591,2065.6001000,-1920.0000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(kickcar28)(8)
	CreateDynamicObject(13591,2054.6999500,-1916.5000000,12.7000000,0.0000000,0.0000000,50.0000000); //object(kickcar28)(9)
	CreateDynamicObject(13591,2061.6001000,-1910.9000200,12.7000000,0.0000000,0.0000000,139.9990000); //object(kickcar28)(10)
	CreateDynamicObject(2676,2083.8999000,-1927.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(29)
	CreateDynamicObject(2676,2058.8000500,-1931.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(30)
	CreateDynamicObject(2676,2080.8000500,-1905.5999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(31)
	CreateDynamicObject(2676,2098.8999000,-1897.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(32)
	CreateDynamicObject(2676,2131.8000500,-1896.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(33)
	CreateDynamicObject(2676,2159.5000000,-1894.9000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(34)
	CreateDynamicObject(2676,2184.1999500,-1897.5999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(35)
	CreateDynamicObject(2676,2221.3999000,-1886.0999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(36)
	CreateDynamicObject(2676,2218.5000000,-1910.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(37)
	CreateDynamicObject(2676,2216.3000500,-1859.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(38)
	CreateDynamicObject(2676,2220.3999000,-1825.5000000,12.3000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(39)
	CreateDynamicObject(2676,2218.3000500,-1794.0000000,12.3000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(40)
	CreateDynamicObject(2676,2220.6001000,-1769.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(41)
	CreateDynamicObject(2676,2214.1999500,-1762.4000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(42)
	CreateDynamicObject(2676,2079.6001000,-1845.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(43)
	CreateDynamicObject(2676,2079.1999500,-1826.0999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(44)
	CreateDynamicObject(2676,2081.8999000,-1874.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(45)
	CreateDynamicObject(2676,2087.8000500,-1893.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(46)
	CreateDynamicObject(761,2082.8999000,-1842.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(72)
	CreateDynamicObject(761,2077.6001000,-1854.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(73)
	CreateDynamicObject(761,2081.6001000,-1875.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(74)
	CreateDynamicObject(761,2088.0000000,-1893.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(75)
	CreateDynamicObject(761,2079.0000000,-1915.4000200,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(76)
	CreateDynamicObject(761,2069.5000000,-1913.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(77)
	CreateDynamicObject(761,2051.1999500,-1908.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(78)
	CreateDynamicObject(761,2053.3999000,-1911.4000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(79)
	CreateDynamicObject(761,2060.6001000,-1908.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(80)
	CreateDynamicObject(761,2059.5000000,-1922.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(81)
	CreateDynamicObject(761,2050.1999500,-1928.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(82)
	CreateDynamicObject(761,2059.0000000,-1934.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(83)
	CreateDynamicObject(761,2063.3000500,-1936.5000000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(84)
	CreateDynamicObject(761,2070.6999500,-1934.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(85)
	CreateDynamicObject(761,2085.6001000,-1933.8000500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(86)
	CreateDynamicObject(761,2082.8000500,-1936.5999800,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(87)
	CreateDynamicObject(761,2083.1999500,-1924.5999800,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(88)
	CreateDynamicObject(761,2097.1001000,-1893.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(89)
	CreateDynamicObject(761,2100.3000500,-1899.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(90)
	CreateDynamicObject(761,2104.8999000,-1906.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(91)
	CreateDynamicObject(761,2112.0000000,-1902.9000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(92)
	CreateDynamicObject(761,2114.6001000,-1898.1999500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(93)
	CreateDynamicObject(761,2125.3999000,-1891.0000000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(94)
	CreateDynamicObject(761,2135.1001000,-1899.8000500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(95)
	CreateDynamicObject(761,2159.1999500,-1890.8000500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(96)
	CreateDynamicObject(761,2178.3999000,-1897.6999500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(97)
	CreateDynamicObject(761,2181.6999500,-1893.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(98)
	CreateDynamicObject(761,2179.8999000,-1905.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(99)
	CreateDynamicObject(761,2190.3000500,-1904.5999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(100)
	CreateDynamicObject(761,2209.0000000,-1901.0999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(101)
	CreateDynamicObject(761,2222.0000000,-1903.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(102)
	CreateDynamicObject(761,2220.0000000,-1883.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2219.6999500,-1859.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(104)
	CreateDynamicObject(761,2218.1999500,-1827.6999500,12.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(105)
	CreateDynamicObject(761,2216.3999000,-1798.0999800,12.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(106)
	CreateDynamicObject(761,2217.1001000,-1774.0000000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(107)
	CreateDynamicObject(761,2229.1999500,-1686.5999800,-51.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(108)
	CreateDynamicObject(761,2216.3000500,-1754.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(109)
	CreateDynamicObject(761,2220.5000000,-1759.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(110)
	CreateDynamicObject(761,2229.3000500,-1748.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(111)
	CreateDynamicObject(761,2233.8999000,-1756.1999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(112)
	CreateDynamicObject(806,2214.8000500,-1790.0999800,16.0000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(79)
	CreateDynamicObject(806,2216.8999000,-1824.0000000,16.0000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(80)
	CreateDynamicObject(806,2210.0000000,-1865.6999500,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(81)
	CreateDynamicObject(806,2223.1999500,-1883.3000500,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(82)
	CreateDynamicObject(806,2225.1999500,-1903.5000000,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(83)
	CreateDynamicObject(806,2209.1999500,-1903.0000000,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(84)
	CreateDynamicObject(806,2186.8000500,-1895.0999800,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(85)
	CreateDynamicObject(806,2157.3000500,-1890.5999800,16.1000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(86)
	CreateDynamicObject(806,2130.1999500,-1901.9000200,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(87)
	CreateDynamicObject(806,2094.1999500,-1893.6999500,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(88)
	CreateDynamicObject(806,2081.5000000,-1881.4000200,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(89)
	CreateDynamicObject(806,2083.3000500,-1833.1999500,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(90)
	CreateDynamicObject(806,2072.8999000,-1821.3000500,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(91)
	CreateDynamicObject(818,2049.5000000,-1738.0999800,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass02)(9)
	CreateDynamicObject(928,2037.5000000,-1741.9000200,12.8000000,0.0000000,0.0000000,0.0000000); //object(rubbish_box1)(2)
	CreateDynamicObject(928,2037.0999800,-1740.5000000,12.8000000,0.0000000,0.0000000,320.0000000); //object(rubbish_box1)(3)
	CreateDynamicObject(928,2037.5999800,-1741.0000000,12.8000000,0.0000000,0.0000000,349.9990000); //object(rubbish_box1)(4)
	CreateDynamicObject(928,2038.1999500,-1741.6999500,12.8000000,0.0000000,0.0000000,39.9970000); //object(rubbish_box1)(5)
	CreateDynamicObject(853,2038.0999800,-1724.0000000,12.9000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_5)(5)
	CreateDynamicObject(854,2039.8000500,-1724.5999800,12.8000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_3b)(1)
	CreateDynamicObject(850,2045.0996100,-1725.8994100,12.7000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_1)(10)
	CreateDynamicObject(3035,2045.5999800,-1739.6999500,13.3000000,0.0000000,0.0000000,270.0000000); //object(tmp_bin)(7)
	CreateDynamicObject(3035,2045.6999500,-1737.4000200,13.3000000,0.0000000,0.0000000,270.0000000); //object(tmp_bin)(8)
	CreateDynamicObject(3035,2045.5000000,-1718.0999800,13.3000000,0.0000000,0.0000000,270.0000000); //object(tmp_bin)(9)
	CreateDynamicObject(3035,2045.5000000,-1715.9000200,13.3000000,0.0000000,0.0000000,270.0000000); //object(tmp_bin)(10)
	CreateDynamicObject(2971,2045.1992200,-1713.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(k_smashboxes)(8)
	CreateDynamicObject(2971,2045.1999500,-1735.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(k_smashboxes)(9)
	CreateDynamicObject(1450,2045.0999800,-1719.6999500,13.1000000,0.0000000,0.0000000,0.0000000); //object(dyn_crate_3)(5)
	CreateDynamicObject(1448,2037.5999800,-1725.9000200,12.6000000,0.0000000,0.0000000,0.0000000); //object(dyn_crate_1)(1)
	CreateDynamicObject(1448,2064.6001000,-1701.1999500,14.7000000,88.0000000,0.0000000,90.0000000); //object(dyn_crate_1)(2)
	CreateDynamicObject(1448,2064.6999500,-1700.0999800,14.7000000,87.9950000,0.0000000,90.0000000); //object(dyn_crate_1)(3)
	CreateDynamicObject(1448,2064.6999500,-1700.0999800,15.7000000,87.9950000,0.0000000,90.0000000); //object(dyn_crate_1)(4)
	CreateDynamicObject(1448,2064.6999500,-1701.1999500,15.7000000,87.9950000,0.0000000,90.0000000); //object(dyn_crate_1)(5)
	CreateDynamicObject(1441,2037.4000200,-1693.5999800,13.2000000,0.0000000,0.0000000,90.0000000); //object(dyn_box_pile_4)(4)
	CreateDynamicObject(1439,2037.5000000,-1705.3000500,12.6000000,0.0000000,0.0000000,90.0000000); //object(dyn_dumpster_1)(4)
	CreateDynamicObject(1438,2045.0000000,-1701.3000500,12.6000000,0.0000000,0.0000000,270.0000000); //object(dyn_box_pile_2)(4)
	CreateDynamicObject(1372,2044.9000200,-1703.1999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(cj_dump2_low)(2)
	CreateDynamicObject(1369,2039.1999500,-1726.9000200,13.2000000,0.0000000,0.0000000,30.0000000); //object(cj_wheelchair1)(3)
	CreateDynamicObject(1358,2044.0996100,-1692.0996100,13.8000000,0.0000000,0.0000000,0.0000000); //object(cj_skip_rubbish)(4)
	CreateDynamicObject(1763,2044.4000200,-1695.0000000,12.6000000,0.0000000,0.0000000,292.0000000); //object(low_couch_1)(1)
	CreateDynamicObject(1763,2042.0000000,-1694.0999800,12.6000000,0.0000000,0.0000000,355.9980000); //object(low_couch_1)(2)
	CreateDynamicObject(1763,2044.5999800,-1697.5999800,12.6000000,0.0000000,0.0000000,255.9950000); //object(low_couch_1)(3)
	CreateDynamicObject(2677,2042.5999800,-1696.1999500,12.9000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(89)
	CreateDynamicObject(2677,2041.6999500,-1660.4000200,12.8000000,0.0000000,0.0000000,39.9960000); //object(proc_rubbish_7)(90)
	CreateDynamicObject(2677,2038.1999500,-1703.0000000,12.9000000,0.0000000,0.0000000,319.9960000); //object(proc_rubbish_7)(91)
	CreateDynamicObject(2677,2043.4000200,-1716.3000500,12.9000000,0.0000000,0.0000000,319.9930000); //object(proc_rubbish_7)(92)
	CreateDynamicObject(2677,2038.0000000,-1728.1999500,12.9000000,0.0000000,0.0000000,19.9930000); //object(proc_rubbish_7)(93)
	CreateDynamicObject(2677,2044.5000000,-1732.9000200,12.9000000,0.0000000,0.0000000,329.9900000); //object(proc_rubbish_7)(94)
	CreateDynamicObject(2677,2044.5000000,-1732.8994100,12.9000000,0.0000000,0.0000000,329.9850000); //object(proc_rubbish_7)(95)
	CreateDynamicObject(1358,2044.6999500,-1659.5000000,13.8000000,0.0000000,0.0000000,270.0000000); //object(cj_skip_rubbish)(4)
	CreateDynamicObject(1358,2042.5999800,-1655.3000500,13.8000000,0.0000000,0.0000000,320.0000000); //object(cj_skip_rubbish)(4)
	CreateDynamicObject(2677,2042.0999800,-1657.8000500,12.8000000,0.0000000,0.0000000,39.9960000); //object(proc_rubbish_7)(90)
	CreateDynamicObject(2677,2044.8000500,-1663.9000200,12.9000000,0.0000000,0.0000000,39.9960000); //object(proc_rubbish_7)(90)
	CreateDynamicObject(2677,2038.9000200,-1655.5999800,12.9000000,0.0000000,0.0000000,39.9960000); //object(proc_rubbish_7)(90)
	CreateDynamicObject(2677,2044.4000200,-1649.8000500,12.9000000,0.0000000,0.0000000,39.9960000); //object(proc_rubbish_7)(90)
	CreateDynamicObject(2971,2044.9000200,-1652.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(k_smashboxes)(8)
	CreateDynamicObject(2971,2044.8000500,-1647.0000000,12.5000000,0.0000000,0.0000000,80.0000000); //object(k_smashboxes)(8)
	CreateDynamicObject(850,2044.6999500,-1643.5000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_1)(10)
	CreateDynamicObject(850,2041.0999800,-1642.0000000,12.7000000,0.0000000,0.0000000,140.0000000); //object(cj_urb_rub_1)(10)
	CreateDynamicObject(3594,2073.8000500,-1674.5000000,12.9000000,358.4950000,0.0000000,219.9760000); //object(la_fuckcar1)(49)
	CreateDynamicObject(3594,2054.5000000,-1670.8000500,12.9000000,358.4950000,0.0000000,279.9740000); //object(la_fuckcar1)(49)
	CreateDynamicObject(3594,2039.1999500,-1675.1999500,12.9000000,358.4950000,0.0000000,219.9700000); //object(la_fuckcar1)(49)
	CreateDynamicObject(3594,2008.8000500,-1669.0999800,12.9000000,358.4950000,0.0000000,229.9680000); //object(la_fuckcar1)(49)
	CreateDynamicObject(3594,2005.5999800,-1680.4000200,12.9000000,358.4950000,0.0000000,311.9660000); //object(la_fuckcar1)(49)
	CreateDynamicObject(3594,1999.1999500,-1647.1999500,12.9000000,358.4950000,0.0000000,181.9620000); //object(la_fuckcar1)(49)
	CreateDynamicObject(3594,2005.4000200,-1612.0999800,12.9000000,358.4950000,0.0000000,131.9610000); //object(la_fuckcar1)(49)
	CreateDynamicObject(3594,2002.3000500,-1617.5000000,12.9000000,358.4950000,0.0000000,265.9570000); //object(la_fuckcar1)(49)
	CreateDynamicObject(3594,2029.8000500,-1610.9000200,12.9000000,358.4950000,0.0000000,55.9520000); //object(la_fuckcar1)(49)
	CreateDynamicObject(3594,2044.5999800,-1604.5000000,12.9000000,358.4950000,0.0000000,115.9480000); //object(la_fuckcar1)(49)
	CreateDynamicObject(3594,2037.8000500,-1605.8000500,12.9000000,358.4950000,0.0000000,53.9440000); //object(la_fuckcar1)(49)
	CreateDynamicObject(3594,2064.3000500,-1613.0999800,12.9000000,358.4950000,0.0000000,113.9430000); //object(la_fuckcar1)(49)
	CreateDynamicObject(761,2068.6001000,-1613.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(50)
	CreateDynamicObject(761,2061.1999500,-1612.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(50)
	CreateDynamicObject(761,2040.3000500,-1604.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(50)
	CreateDynamicObject(761,2047.4000200,-1601.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(50)
	CreateDynamicObject(761,2033.6999500,-1604.0999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(50)
	CreateDynamicObject(761,2038.5999800,-1609.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(50)
	CreateDynamicObject(761,2032.0999800,-1614.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(50)
	CreateDynamicObject(761,2028.0999800,-1607.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(50)
	CreateDynamicObject(761,2009.1999500,-1611.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(50)
	CreateDynamicObject(761,2002.6999500,-1615.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(50)
	CreateDynamicObject(761,1998.3000500,-1615.4000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(50)
	CreateDynamicObject(761,2004.4000200,-1619.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(50)
	CreateDynamicObject(761,1997.5000000,-1643.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(50)
	CreateDynamicObject(761,1997.4000200,-1650.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(50)
	CreateDynamicObject(761,2012.8000500,-1644.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(50)
	CreateDynamicObject(761,2013.0000000,-1642.4000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(50)
	CreateDynamicObject(761,2012.9000200,-1639.0999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(50)
	CreateDynamicObject(761,2012.9000200,-1637.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(50)
	CreateDynamicObject(761,2013.5000000,-1635.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(50)
	CreateDynamicObject(761,2016.0000000,-1635.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(50)
	CreateDynamicObject(761,2005.3000500,-1667.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(50)
	CreateDynamicObject(761,2009.5000000,-1671.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(50)
	CreateDynamicObject(761,2039.1999500,-1677.9000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(50)
	CreateDynamicObject(761,2036.0000000,-1673.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(50)
	CreateDynamicObject(761,2051.1001000,-1669.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(50)
	CreateDynamicObject(761,2058.5000000,-1671.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(50)
	CreateDynamicObject(761,2069.6999500,-1672.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(50)
	CreateDynamicObject(761,2074.8999000,-1677.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(50)
	CreateDynamicObject(761,2006.3000500,-1681.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(50)
	CreateDynamicObject(761,2043.0999800,-1648.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(50)
	CreateDynamicObject(761,2042.8000500,-1657.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(50)
	CreateDynamicObject(1440,2042.5999800,-1607.9000200,12.8000000,0.0000000,0.0000000,26.0000000); //object(dyn_box_pile_3)(22)
	CreateDynamicObject(1440,2060.1001000,-1614.5999800,12.8000000,0.0000000,0.0000000,295.9990000); //object(dyn_box_pile_3)(23)
	CreateDynamicObject(1440,2005.4000200,-1615.1999500,12.8000000,0.0000000,0.0000000,35.9990000); //object(dyn_box_pile_3)(24)
	CreateDynamicObject(1440,1999.5999800,-1632.3000500,12.8000000,0.0000000,0.0000000,125.9970000); //object(dyn_box_pile_3)(25)
	CreateDynamicObject(1441,1998.5999800,-1633.0999800,13.0000000,0.0000000,0.0000000,310.0000000); //object(dyn_box_pile_4)(5)
	CreateDynamicObject(1441,2000.0999800,-1651.4000200,13.0000000,0.0000000,0.0000000,5.9960000); //object(dyn_box_pile_4)(6)
	CreateDynamicObject(1441,2006.8000500,-1670.0000000,13.0000000,0.0000000,0.0000000,315.9930000); //object(dyn_box_pile_4)(7)
	CreateDynamicObject(1441,2002.0000000,-1680.6999500,13.0000000,0.0000000,0.0000000,245.9890000); //object(dyn_box_pile_4)(8)
	CreateDynamicObject(1441,2036.8000500,-1675.3000500,13.0000000,0.0000000,0.0000000,315.9840000); //object(dyn_box_pile_4)(9)
	CreateDynamicObject(1438,2039.4000200,-1671.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile_2)(5)
	CreateDynamicObject(1438,2039.8000500,-1635.0999800,12.5000000,0.0000000,0.0000000,50.0000000); //object(dyn_box_pile_2)(6)
	CreateDynamicObject(1438,2041.4000200,-1635.9000200,12.5000000,0.0000000,0.0000000,309.9990000); //object(dyn_box_pile_2)(7)
	CreateDynamicObject(1415,2018.4000200,-1706.0999800,12.6000000,0.0000000,0.0000000,0.0000000); //object(dyn_dumpster)(2)
	CreateDynamicObject(1409,2016.8000500,-1702.0999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(cj_dump1_low)(1)
	CreateDynamicObject(1369,2013.5999800,-1692.9000200,13.2000000,0.0000000,0.0000000,240.0000000); //object(cj_wheelchair1)(4)
	CreateDynamicObject(1365,2014.0999800,-1684.5000000,13.7000000,0.0000000,0.0000000,0.0000000); //object(cj_big_skip1)(1)
	CreateDynamicObject(1349,2011.3000500,-1682.1999500,13.1000000,0.0000000,0.0000000,60.0000000); //object(cj_shtrolly)(6)
	CreateDynamicObject(1349,2011.5999800,-1686.3000500,13.1000000,0.0000000,0.0000000,109.9960000); //object(cj_shtrolly)(7)
	CreateDynamicObject(1349,2012.8000500,-1687.9000200,13.1000000,0.0000000,0.0000000,159.9950000); //object(cj_shtrolly)(8)
	CreateDynamicObject(1349,2011.0000000,-1688.0999800,13.1000000,0.0000000,0.0000000,59.9940000); //object(cj_shtrolly)(9)
	CreateDynamicObject(12957,2026.8000500,-1685.3000500,13.4000000,0.0000000,0.0000000,50.0000000); //object(sw_pickupwreck01)(7)
	CreateDynamicObject(1264,2012.6999500,-1682.5000000,13.0000000,0.0000000,0.0000000,0.0000000); //object(blackbag1)(1)
	CreateDynamicObject(1264,2013.6999500,-1682.4000200,13.0000000,0.0000000,0.0000000,60.0000000); //object(blackbag1)(2)
	CreateDynamicObject(1264,2014.5000000,-1681.4000200,13.0000000,0.0000000,0.0000000,9.9960000); //object(blackbag1)(3)
	CreateDynamicObject(2671,2004.5999800,-1672.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_3)(11)
	CreateDynamicObject(2671,2003.4000200,-1665.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_3)(12)
	CreateDynamicObject(2671,2002.1999500,-1646.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_3)(13)
	CreateDynamicObject(2671,2001.0000000,-1633.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_3)(14)
	CreateDynamicObject(2671,2008.3000500,-1614.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_3)(15)
	CreateDynamicObject(2671,2009.5999800,-1609.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_3)(16)
	CreateDynamicObject(2671,2039.1999500,-1610.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_3)(17)
	CreateDynamicObject(2671,2064.6001000,-1615.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_3)(18)
	CreateDynamicObject(2671,2069.5000000,-1605.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_3)(19)
	CreateDynamicObject(2671,2057.3000500,-1615.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_3)(20)
	CreateDynamicObject(2671,2043.9000200,-1628.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_3)(21)
	CreateDynamicObject(2671,2034.6999500,-1669.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_3)(22)
	CreateDynamicObject(2671,2025.3000500,-1673.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_3)(23)
	CreateDynamicObject(2674,2041.5000000,-1675.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_2)(1)
	CreateDynamicObject(2674,2041.1999500,-1633.5999800,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_2)(2)
	CreateDynamicObject(2674,2026.0000000,-1608.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_2)(3)
	CreateDynamicObject(2674,2000.9000200,-1614.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_2)(4)
	CreateDynamicObject(2674,1994.9000200,-1647.0999800,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_2)(5)
	CreateDynamicObject(2676,1994.4000200,-1627.3000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(47)
	CreateDynamicObject(2676,1994.3000500,-1677.4000200,12.7000000,0.0000000,0.0000000,300.0000000); //object(proc_rubbish_8)(48)
	CreateDynamicObject(2676,1993.9000200,-1690.3000500,12.7000000,0.0000000,0.0000000,359.9980000); //object(proc_rubbish_8)(49)
	CreateDynamicObject(2676,1994.1999500,-1707.6999500,12.7000000,0.0000000,0.0000000,59.9950000); //object(proc_rubbish_8)(50)
	CreateDynamicObject(2676,1999.9000200,-1707.0000000,12.5000000,0.0000000,0.0000000,99.9910000); //object(proc_rubbish_8)(51)
	CreateDynamicObject(2676,1998.6999500,-1733.9000200,12.5000000,0.0000000,0.0000000,159.9870000); //object(proc_rubbish_8)(52)
	CreateDynamicObject(2676,2004.3000500,-1690.0999800,12.5000000,0.0000000,0.0000000,209.9830000); //object(proc_rubbish_8)(53)
	CreateDynamicObject(2676,2004.2998000,-1690.0996100,12.5000000,0.0000000,0.0000000,209.9820000); //object(proc_rubbish_8)(54)
	CreateDynamicObject(2676,2001.0000000,-1736.5999800,12.5000000,0.0000000,0.0000000,291.9830000); //object(proc_rubbish_8)(55)
	CreateDynamicObject(2677,1998.6999500,-1737.0999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(100)
	CreateDynamicObject(13591,2014.0999800,-1740.0000000,12.8000000,0.0000000,0.0000000,50.0000000); //object(kickcar28)(11)
	CreateDynamicObject(18249,2022.1999500,-1761.5999800,8.9000000,0.0000000,0.0000000,270.0000000); //object(cuntwjunk05)(6)
	CreateDynamicObject(18249,2036.3000500,-1761.5000000,8.9000000,0.0000000,0.0000000,270.0000000); //object(cuntwjunk05)(7)
	CreateDynamicObject(18249,2054.0000000,-1762.1999500,8.9000000,0.0000000,0.0000000,270.0000000); //object(cuntwjunk05)(8)
	CreateDynamicObject(3594,2054.3999000,-1751.9000200,12.9000000,358.4950000,0.0000000,299.9640000); //object(la_fuckcar1)(53)
	CreateDynamicObject(3594,2035.1999500,-1750.5000000,12.9000000,358.4950000,0.0000000,249.9600000); //object(la_fuckcar1)(53)
	CreateDynamicObject(3594,2013.5000000,-1754.4000200,12.9000000,358.4950000,0.0000000,319.9550000); //object(la_fuckcar1)(53)
	CreateDynamicObject(3594,1988.0999800,-1750.1999500,12.9000000,358.4950000,0.0000000,249.9550000); //object(la_fuckcar1)(53)
	CreateDynamicObject(3594,1959.3000500,-1755.4000200,12.9000000,358.4950000,0.0000000,309.9500000); //object(la_fuckcar1)(53)
	CreateDynamicObject(3594,2065.1001000,-1809.0999800,13.0000000,0.0000000,0.0000000,267.9530000); //object(la_fuckcar1)(71)
	CreateDynamicObject(3594,2037.3000500,-1811.1999500,13.0000000,0.0000000,0.0000000,327.9510000); //object(la_fuckcar1)(71)
	CreateDynamicObject(3594,2018.4000200,-1805.1999500,13.0000000,0.0000000,0.0000000,277.9470000); //object(la_fuckcar1)(71)
	CreateDynamicObject(3594,2005.6999500,-1815.0000000,13.0000000,0.0000000,0.0000000,267.9430000); //object(la_fuckcar1)(71)
	CreateDynamicObject(3594,1967.8000500,-1813.6999500,13.0000000,0.0000000,0.0000000,207.9400000); //object(la_fuckcar1)(71)
	CreateDynamicObject(3594,1964.0000000,-1816.0999800,13.0000000,0.0000000,0.0000000,165.9380000); //object(la_fuckcar1)(71)
	CreateDynamicObject(2971,2052.8000500,-1749.6999500,12.4000000,0.0000000,0.0000000,40.0000000); //object(k_smashboxes)(12)
	CreateDynamicObject(2971,2016.6999500,-1754.3000500,12.4000000,0.0000000,0.0000000,313.9960000); //object(k_smashboxes)(13)
	CreateDynamicObject(2971,1960.0000000,-1758.0000000,12.4000000,0.0000000,0.0000000,309.9950000); //object(k_smashboxes)(14)
	CreateDynamicObject(2971,1963.4000200,-1811.0999800,12.4000000,0.0000000,0.0000000,309.9900000); //object(k_smashboxes)(15)
	CreateDynamicObject(2971,1966.0999800,-1817.8000500,12.4000000,0.0000000,0.0000000,319.9900000); //object(k_smashboxes)(16)
	CreateDynamicObject(1438,2001.3000500,-1813.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile_2)(8)
	CreateDynamicObject(1438,2045.5999800,-1803.8000500,13.9000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile_2)(9)
	CreateDynamicObject(1438,2048.6999500,-1803.5999800,13.9000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile_2)(10)
	CreateDynamicObject(1439,2051.0000000,-1802.9000200,13.9000000,0.0000000,0.0000000,0.0000000); //object(dyn_dumpster_1)(5)
	CreateDynamicObject(1431,2045.1999500,-1806.5999800,14.4000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile)(7)
	CreateDynamicObject(1431,2047.5000000,-1806.5999800,14.4000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile)(8)
	CreateDynamicObject(1369,2052.6999500,-1803.1999500,14.5000000,0.0000000,0.0000000,0.0000000); //object(cj_wheelchair1)(5)
	CreateDynamicObject(1349,2059.6001000,-1804.4000200,13.1000000,0.0000000,0.0000000,50.0000000); //object(cj_shtrolly)(10)
	CreateDynamicObject(1349,2061.0000000,-1805.4000200,13.1000000,0.0000000,0.0000000,359.9990000); //object(cj_shtrolly)(11)
	CreateDynamicObject(1349,2062.0000000,-1804.0000000,13.1000000,0.0000000,0.0000000,69.9950000); //object(cj_shtrolly)(12)
	CreateDynamicObject(12957,1968.9000200,-1802.0999800,13.4000000,0.0000000,0.0000000,0.0000000); //object(sw_pickupwreck01)(8)
	CreateDynamicObject(761,2061.3000500,-1810.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2044.3000500,-1807.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2050.6001000,-1807.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2037.5000000,-1814.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2034.0000000,-1813.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2030.6999500,-1820.9000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2010.0000000,-1813.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2015.1999500,-1807.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2022.8000500,-1806.0999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2022.5999800,-1803.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2001.4000200,-1815.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1965.5999800,-1809.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1962.5999800,-1813.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1964.8000500,-1819.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1968.9000200,-1798.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1971.0999800,-1803.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1958.5000000,-1758.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1961.4000200,-1756.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1961.1999500,-1751.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1983.9000200,-1750.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1988.0999800,-1752.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1991.0999800,-1753.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1992.4000200,-1742.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2013.8000500,-1737.3000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2011.0999800,-1738.4000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2015.0000000,-1744.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2010.0000000,-1756.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2014.9000200,-1756.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2018.0000000,-1753.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2031.0000000,-1750.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2039.4000200,-1751.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2032.0000000,-1747.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1971.1999500,-1822.0999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1970.4000200,-1827.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(855,1971.8000500,-1813.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(43)
	CreateDynamicObject(855,1969.4000200,-1795.0999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(43)
	CreateDynamicObject(855,1949.1999500,-1800.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(43)
	CreateDynamicObject(855,1961.5999800,-1746.9000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(43)
	CreateDynamicObject(855,2015.0999800,-1757.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(43)
	CreateDynamicObject(855,2049.8999000,-1751.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(43)
	CreateDynamicObject(855,2059.1999500,-1668.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(43)
	CreateDynamicObject(855,2035.1999500,-1671.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(43)
	CreateDynamicObject(855,2013.4000200,-1670.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(43)
	CreateDynamicObject(855,2005.1999500,-1677.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(43)
	CreateDynamicObject(855,2001.0000000,-1644.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(43)
	CreateDynamicObject(855,2007.9000200,-1615.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(43)
	CreateDynamicObject(855,2061.1999500,-1611.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(43)
	CreateDynamicObject(855,2085.1999500,-1611.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(43)
	CreateDynamicObject(855,1952.3000500,-1795.0999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(43)
	CreateDynamicObject(939,1917.4000200,-1787.9000200,14.8000000,0.0000000,0.0000000,0.0000000); //object(cj_df_unit)(1)
	CreateDynamicObject(939,1924.1999500,-1788.1999500,14.8000000,0.0000000,0.0000000,0.0000000); //object(cj_df_unit)(3)
	CreateDynamicObject(1558,1920.9000200,-1788.5999800,13.0000000,0.0000000,0.0000000,0.0000000); //object(cj_cardbrd_pickup)(1)
	CreateDynamicObject(1558,1920.4000200,-1790.1999500,13.0000000,0.0000000,0.0000000,50.0000000); //object(cj_cardbrd_pickup)(2)
	CreateDynamicObject(1558,1921.8000500,-1790.1999500,13.0000000,0.0000000,0.0000000,349.9990000); //object(cj_cardbrd_pickup)(3)
	CreateDynamicObject(2672,1923.5999800,-1791.4000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(60)
	CreateDynamicObject(2672,1945.0000000,-1782.8000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1938.1999500,-1768.0000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(62)
	CreateDynamicObject(2672,1936.5000000,-1769.5999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(63)
	CreateDynamicObject(2672,1944.0000000,-1767.5000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(64)
	CreateDynamicObject(2672,1959.1999500,-1807.8000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(65)
	CreateDynamicObject(2672,1961.9000200,-1822.6999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(66)
	CreateDynamicObject(2672,1960.1999500,-1821.8000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(67)
	CreateDynamicObject(2672,1986.1999500,-1811.4000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(68)
	CreateDynamicObject(2672,1982.3000500,-1814.0999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(69)
	CreateDynamicObject(2672,1990.5999800,-1813.0999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(70)
	CreateDynamicObject(2672,2023.4000200,-1815.0000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(71)
	CreateDynamicObject(2672,2036.4000200,-1808.6999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(72)
	CreateDynamicObject(2672,2147.0000000,-1794.0999800,-30.1000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(73)
	CreateDynamicObject(2672,2057.6999500,-1812.3000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(74)
	CreateDynamicObject(2672,2069.1999500,-1810.8000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(75)
	CreateDynamicObject(2672,2035.0999800,-1753.0999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(76)
	CreateDynamicObject(2672,2082.3999000,-1819.5999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(77)
	CreateDynamicObject(2672,1995.0000000,-1750.4000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(78)
	CreateDynamicObject(3594,2411.3000500,-1800.4000200,13.0000000,0.0000000,0.0000000,0.0000000); //object(la_fuckcar1)(72)
	CreateDynamicObject(3594,2414.8000500,-1838.6999500,13.0000000,0.0000000,0.0000000,300.0000000); //object(la_fuckcar1)(73)
	CreateDynamicObject(3594,2414.6999500,-1875.1999500,13.0000000,0.0000000,0.0000000,139.9980000); //object(la_fuckcar1)(74)
	CreateDynamicObject(3594,2416.3000500,-1880.0999800,13.0000000,0.0000000,0.0000000,179.9930000); //object(la_fuckcar1)(75)
	CreateDynamicObject(3594,2407.6001000,-1888.5000000,13.0000000,0.0000000,0.0000000,133.9890000); //object(la_fuckcar1)(76)
	CreateDynamicObject(3594,2412.1010000,-1907.9000000,13.0000000,0.0000000,0.0000000,13.9800000); //object(la_fuckcar1)(77)
	CreateDynamicObject(3594,2417.5996100,-1940.0000000,13.0000000,0.0000000,0.0000000,323.9760000); //object(la_fuckcar1)(78)
	CreateDynamicObject(3594,2430.8999000,-1931.0999800,13.0000000,0.0000000,0.0000000,73.9760000); //object(la_fuckcar1)(79)
	CreateDynamicObject(3594,2462.6001000,-1935.0999800,13.0000000,0.0000000,0.0000000,83.9710000); //object(la_fuckcar1)(80)
	CreateDynamicObject(3594,2492.3999000,-1939.5999800,13.0000000,0.0000000,0.0000000,157.9690000); //object(la_fuckcar1)(81)
	CreateDynamicObject(3594,2510.1999500,-1927.4000200,13.0000000,0.0000000,0.0000000,127.9670000); //object(la_fuckcar1)(82)
	CreateDynamicObject(3594,2555.0000000,-1934.0000000,13.0000000,0.0000000,0.0000000,247.9610000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2519.1999500,-1903.8000500,13.0000000,0.0000000,0.0000000,187.9610000); //object(la_fuckcar1)(84)
	CreateDynamicObject(3594,2514.8000500,-1871.4000200,13.0000000,0.0000000,0.0000000,149.9600000); //object(la_fuckcar1)(85)
	CreateDynamicObject(3594,2520.0000000,-1838.1999500,13.0000000,0.0000000,0.0000000,199.9580000); //object(la_fuckcar1)(86)
	CreateDynamicObject(3594,2517.8999000,-1808.9000200,13.0000000,0.0000000,0.0000000,139.9570000); //object(la_fuckcar1)(87)
	CreateDynamicObject(3594,2530.8999000,-1781.5999800,13.0000000,0.0000000,0.0000000,189.9550000); //object(la_fuckcar1)(88)
	CreateDynamicObject(3594,2523.0000000,-1763.5999800,13.0000000,0.0000000,0.0000000,339.9540000); //object(la_fuckcar1)(89)
	CreateDynamicObject(13591,2512.1999500,-1778.1999500,12.7000000,0.0000000,0.0000000,49.9960000); //object(kickcar28)(6)
	CreateDynamicObject(13591,2503.8999000,-1780.4000200,12.7000000,0.0000000,0.0000000,319.9930000); //object(kickcar28)(6)
	CreateDynamicObject(761,2410.3999000,-1796.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(113)
	CreateDynamicObject(761,2412.5000000,-1804.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(115)
	CreateDynamicObject(761,2405.0000000,-1804.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(116)
	CreateDynamicObject(761,2404.3000500,-1798.9000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(117)
	CreateDynamicObject(761,2404.3000500,-1791.5999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(118)
	CreateDynamicObject(761,2417.0000000,-1835.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(119)
	CreateDynamicObject(761,2411.3999000,-1839.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(120)
	CreateDynamicObject(761,2413.8000500,-1840.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(121)
	CreateDynamicObject(761,2411.8999000,-1876.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(122)
	CreateDynamicObject(761,2414.0000000,-1883.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(123)
	CreateDynamicObject(761,2416.6999500,-1884.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(124)
	CreateDynamicObject(761,2417.8000500,-1877.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(125)
	CreateDynamicObject(761,2418.1001000,-1873.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(126)
	CreateDynamicObject(761,2406.0000000,-1871.5999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(127)
	CreateDynamicObject(761,2405.3999000,-1869.0999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(128)
	CreateDynamicObject(761,2404.6001000,-1872.9000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(129)
	CreateDynamicObject(761,2422.0000000,-1872.9000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(130)
	CreateDynamicObject(761,2423.3999000,-1874.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(131)
	CreateDynamicObject(761,2422.1999500,-1879.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(132)
	CreateDynamicObject(761,2409.6999500,-1885.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(133)
	CreateDynamicObject(761,2403.8000500,-1889.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(134)
	CreateDynamicObject(761,2405.3000500,-1892.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(135)
	CreateDynamicObject(761,2409.5000000,-1889.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(136)
	CreateDynamicObject(761,2410.1001000,-1903.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(137)
	CreateDynamicObject(761,2413.1999500,-1903.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(138)
	CreateDynamicObject(761,2410.8000500,-1911.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(139)
	CreateDynamicObject(761,2426.6999500,-1930.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(140)
	CreateDynamicObject(761,2432.3000500,-1933.9000200,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(141)
	CreateDynamicObject(761,2428.1999500,-1928.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(142)
	CreateDynamicObject(761,2415.0000000,-1941.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(143)
	CreateDynamicObject(761,2417.8999000,-1936.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(144)
	CreateDynamicObject(761,2418.6999500,-1942.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(145)
	CreateDynamicObject(761,2419.3000500,-1944.4000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2405.1999500,-1931.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(147)
	CreateDynamicObject(761,2407.5000000,-1933.5000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(148)
	CreateDynamicObject(761,2401.5000000,-1921.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(149)
	CreateDynamicObject(761,2404.6999500,-1915.5999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(150)
	CreateDynamicObject(761,2397.8999000,-1890.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(151)
	CreateDynamicObject(761,2383.0000000,-1885.4000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(152)
	CreateDynamicObject(761,2370.0000000,-1888.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(153)
	CreateDynamicObject(761,2379.3000500,-1900.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(154)
	CreateDynamicObject(761,2379.6001000,-1915.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(155)
	CreateDynamicObject(761,2369.1001000,-1929.9000200,12.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(156)
	CreateDynamicObject(761,2380.0000000,-1940.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(157)
	CreateDynamicObject(761,2423.5000000,-1923.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(158)
	CreateDynamicObject(761,2405.8000500,-1947.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(159)
	CreateDynamicObject(761,2458.1001000,-1936.1999500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(160)
	CreateDynamicObject(761,2465.5000000,-1937.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(161)
	CreateDynamicObject(761,2466.8000500,-1933.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(162)
	CreateDynamicObject(761,2473.3999000,-1931.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(163)
	CreateDynamicObject(761,2475.8000500,-1923.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(164)
	CreateDynamicObject(761,2489.5000000,-1941.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(165)
	CreateDynamicObject(761,2493.0000000,-1935.8000500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(166)
	CreateDynamicObject(761,2495.3999000,-1937.9000200,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(167)
	CreateDynamicObject(761,2507.5000000,-1930.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(168)
	CreateDynamicObject(761,2513.3999000,-1928.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(169)
	CreateDynamicObject(761,2523.3999000,-1934.5999800,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(170)
	CreateDynamicObject(761,2530.8000500,-1938.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(171)
	CreateDynamicObject(761,2533.1001000,-1935.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2518.1999500,-1907.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(173)
	CreateDynamicObject(761,2520.6999500,-1906.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(174)
	CreateDynamicObject(761,2520.3999000,-1900.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(175)
	CreateDynamicObject(761,2513.8999000,-1874.9000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(176)
	CreateDynamicObject(761,2517.6999500,-1869.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(177)
	CreateDynamicObject(761,2515.3999000,-1868.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(178)
	CreateDynamicObject(761,2510.6999500,-1868.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(179)
	CreateDynamicObject(761,2523.0000000,-1859.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(180)
	CreateDynamicObject(761,2522.1999500,-1856.4000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(181)
	CreateDynamicObject(761,2521.0000000,-1858.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(182)
	CreateDynamicObject(761,2517.3999000,-1835.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(183)
	CreateDynamicObject(761,2521.1001000,-1842.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(184)
	CreateDynamicObject(761,2517.6001000,-1811.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(185)
	CreateDynamicObject(761,2520.8999000,-1808.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(186)
	CreateDynamicObject(761,2515.3000500,-1809.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(187)
	CreateDynamicObject(761,2528.3000500,-1805.9000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(188)
	CreateDynamicObject(761,2535.3999000,-1785.5999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(189)
	CreateDynamicObject(761,2560.6999500,-1759.9000200,0.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(190)
	CreateDynamicObject(761,2532.5000000,-1779.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(191)
	CreateDynamicObject(761,2532.0000000,-1785.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(192)
	CreateDynamicObject(761,2524.8000500,-1762.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(193)
	CreateDynamicObject(761,2530.1999500,-1744.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(194)
	CreateDynamicObject(761,2544.5000000,-1734.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(195)
	CreateDynamicObject(761,2530.6999500,-1733.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(196)
	CreateDynamicObject(761,2554.1001000,-1733.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(197)
	CreateDynamicObject(761,2571.3999000,-1731.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(198)
	CreateDynamicObject(761,2599.8000500,-1734.0999800,11.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2612.8000500,-1733.5999800,10.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(200)
	CreateDynamicObject(761,2622.0000000,-1731.5999800,10.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(201)
	CreateDynamicObject(761,2409.1999500,-1950.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(202)
	CreateDynamicObject(806,2418.6999500,-1838.3000500,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(92)
	CreateDynamicObject(806,2398.3999000,-1890.9000200,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(93)
	CreateDynamicObject(806,2413.6001000,-1911.5000000,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(94)
	CreateDynamicObject(806,2467.1001000,-1936.0999800,16.1000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(95)
	CreateDynamicObject(806,2532.2998000,-1934.5000000,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(96)
	CreateDynamicObject(806,2518.3999000,-1869.9000200,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(97)
	CreateDynamicObject(806,2529.1001000,-1778.0999800,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(98)
	CreateDynamicObject(806,2507.3000500,-1778.9000200,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(99)
	CreateDynamicObject(761,2516.1001000,-1779.4000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(203)
	CreateDynamicObject(761,2511.6999500,-1784.0999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(204)
	CreateDynamicObject(761,2507.8000500,-1781.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(205)
	CreateDynamicObject(761,2504.6001000,-1783.0999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(206)
	CreateDynamicObject(761,2501.8000500,-1782.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(207)
	CreateDynamicObject(761,2511.1001000,-1775.9000200,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(208)
	CreateDynamicObject(2676,2528.6999500,-1784.5999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2516.1001000,-1813.0999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2514.8999000,-1829.3000500,12.5000000,0.0000000,0.0000000,60.0000000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2517.8000500,-1831.1999500,12.5000000,0.0000000,0.0000000,319.9960000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2517.8999000,-1843.8000500,12.5000000,0.0000000,0.0000000,9.9930000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2517.0000000,-1873.6999500,12.5000000,0.0000000,0.0000000,9.9920000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2516.1001000,-1905.0999800,12.5000000,0.0000000,0.0000000,9.9920000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2523.8000500,-1939.5999800,12.7000000,0.0000000,0.0000000,79.9920000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2536.1001000,-1940.0999800,12.7000000,0.0000000,0.0000000,25.9910000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2510.6001000,-1930.8000500,12.5000000,0.0000000,0.0000000,65.9880000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2497.1999500,-1925.0999800,12.7000000,0.0000000,0.0000000,115.9840000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2492.0000000,-1932.6999500,12.5000000,0.0000000,0.0000000,115.9830000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2472.1999500,-1931.1999500,12.5000000,0.0000000,0.0000000,115.9830000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2464.3000500,-1932.0999800,12.5000000,0.0000000,0.0000000,175.9830000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2435.0000000,-1929.5999800,12.5000000,0.0000000,0.0000000,175.9790000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2425.8000500,-1930.8000500,12.5000000,0.0000000,0.0000000,245.9790000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2410.8000500,-1946.5999800,12.5000000,0.0000000,0.0000000,195.9780000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2395.6001000,-1922.8000500,12.5000000,0.0000000,0.0000000,265.9740000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2377.6001000,-1919.3000500,12.5000000,0.0000000,0.0000000,325.9740000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2369.8999000,-1902.1999500,12.5000000,0.0000000,0.0000000,275.9700000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2371.3999000,-1890.5000000,12.5000000,0.0000000,0.0000000,245.9660000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2415.6001000,-1899.1999500,12.5000000,0.0000000,0.0000000,265.9740000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2417.3000500,-1842.1999500,12.5000000,0.0000000,0.0000000,315.9740000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2411.0000000,-1880.3994100,12.5000000,0.0000000,0.0000000,315.9720000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2414.1999500,-1802.1999500,12.5000000,0.0000000,0.0000000,315.9720000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2407.8999000,-1819.3000500,12.7000000,0.0000000,0.0000000,315.9720000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(3461,2484.8999000,-1965.0999800,16.4000000,278.0000000,0.0000000,0.0000000); //object(tikitorch01_lvs)(61)
	CreateDynamicObject(3461,2479.6999500,-1964.8000500,16.4000000,277.9980000,0.0000000,0.0000000); //object(tikitorch01_lvs)(62)
	CreateDynamicObject(3461,2474.1999500,-1964.5000000,16.4000000,277.9980000,0.0000000,0.0000000); //object(tikitorch01_lvs)(63)
	CreateDynamicObject(3461,2476.3999000,-1964.5999800,16.4000000,277.9980000,0.0000000,0.0000000); //object(tikitorch01_lvs)(64)
	CreateDynamicObject(3461,2482.8999000,-1961.1999500,12.4000000,277.9980000,0.0000000,0.0000000); //object(tikitorch01_lvs)(65)
	CreateDynamicObject(3461,2485.3999000,-1961.3000500,12.4000000,277.9980000,0.0000000,0.0000000); //object(tikitorch01_lvs)(66)
	CreateDynamicObject(3461,2486.8999000,-1961.4000200,12.4000000,277.9980000,0.0000000,0.0000000); //object(tikitorch01_lvs)(67)
	CreateDynamicObject(3461,2479.3999000,-1961.0000000,12.4000000,277.9980000,0.0000000,0.0000000); //object(tikitorch01_lvs)(68)
	CreateDynamicObject(3461,2476.6001000,-1961.3000500,12.4000000,277.9980000,0.0000000,0.0000000); //object(tikitorch01_lvs)(69)
	CreateDynamicObject(3461,2476.6001000,-1961.3000500,12.4000000,277.9980000,0.0000000,0.0000000); //object(tikitorch01_lvs)(69)
	CreateDynamicObject(3461,2478.3000500,-1961.4000200,12.4000000,277.9980000,0.0000000,0.0000000); //object(tikitorch01_lvs)(70)
	CreateDynamicObject(3461,2491.6001000,-1961.1999500,12.4000000,277.9980000,0.0000000,0.0000000); //object(tikitorch01_lvs)(71)
	CreateDynamicObject(3461,2494.1001000,-1961.3000500,12.4000000,277.9980000,0.0000000,0.0000000); //object(tikitorch01_lvs)(72)
	CreateDynamicObject(3461,2495.3000500,-1961.4000200,12.4000000,277.9980000,0.0000000,0.0000000); //object(tikitorch01_lvs)(73)
	CreateDynamicObject(3461,2498.0000000,-1961.5999800,12.4000000,277.9980000,0.0000000,0.0000000); //object(tikitorch01_lvs)(74)
	CreateDynamicObject(3461,2500.5000000,-1961.6999500,12.4000000,277.9980000,0.0000000,0.0000000); //object(tikitorch01_lvs)(75)
	CreateDynamicObject(3461,2498.3000500,-1961.0999800,12.4000000,277.9980000,0.0000000,0.0000000); //object(tikitorch01_lvs)(76)
	CreateDynamicObject(3461,2500.8000500,-1961.1999500,12.4000000,277.9980000,0.0000000,0.0000000); //object(tikitorch01_lvs)(77)
	CreateDynamicObject(3461,2505.0000000,-1961.4000200,12.4000000,277.9980000,0.0000000,0.0000000); //object(tikitorch01_lvs)(78)
	CreateDynamicObject(3887,2450.5000000,-1914.1999500,19.7000000,0.0000000,0.0000000,90.0000000); //object(demolish4_sfxrf)(1)
	CreateDynamicObject(852,2474.6999500,-1954.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_4)(2)
	CreateDynamicObject(850,2479.1001000,-1953.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_1)(11)
	CreateDynamicObject(849,2483.5000000,-1952.0999800,12.7000000,0.0000000,0.0000000,90.0000000); //object(cj_urb_rub_3)(10)
	CreateDynamicObject(3006,2504.1999500,-1954.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(smash_box_brk)(2)
	CreateDynamicObject(3006,2503.0000000,-1952.1999500,12.4000000,0.0000000,0.0000000,50.0000000); //object(smash_box_brk)(3)
	CreateDynamicObject(1441,2494.1999500,-1954.8000500,13.1000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile_4)(10)
	CreateDynamicObject(1441,2496.1999500,-1952.3000500,13.1000000,0.0000000,0.0000000,310.0000000); //object(dyn_box_pile_4)(11)
	CreateDynamicObject(1441,2490.3000500,-1953.5000000,13.1000000,0.0000000,0.0000000,199.9960000); //object(dyn_box_pile_4)(12)
	CreateDynamicObject(1438,2502.1999500,-1944.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile_2)(11)
	CreateDynamicObject(1369,2483.0000000,-1944.6999500,13.1000000,0.0000000,0.0000000,0.0000000); //object(cj_wheelchair1)(6)
	CreateDynamicObject(3594,2414.3999000,-1980.8000500,13.0000000,0.0000000,0.0000000,303.9760000); //object(la_fuckcar1)(78)
	CreateDynamicObject(3594,2402.6992200,-1969.6992200,13.0000000,0.0000000,0.0000000,93.9720000); //object(la_fuckcar1)(78)
	CreateDynamicObject(3594,2416.3999000,-2014.0000000,13.0000000,0.0000000,0.0000000,43.9720000); //object(la_fuckcar1)(78)
	CreateDynamicObject(3594,2448.3999000,-2012.5000000,13.0000000,0.0000000,0.0000000,113.9670000); //object(la_fuckcar1)(78)
	CreateDynamicObject(3594,2471.6001000,-2007.5999800,13.0000000,0.0000000,0.0000000,263.9670000); //object(la_fuckcar1)(78)
	CreateDynamicObject(3594,2489.5000000,-2014.9000200,13.0000000,0.0000000,0.0000000,213.9630000); //object(la_fuckcar1)(78)
	CreateDynamicObject(3594,2516.1999500,-2004.5000000,13.0000000,0.0000000,0.0000000,303.9590000); //object(la_fuckcar1)(78)
	CreateDynamicObject(3594,2508.1001000,-2010.5999800,13.0000000,0.0000000,0.0000000,243.9530000); //object(la_fuckcar1)(78)
	CreateDynamicObject(3594,2393.3999000,-2009.1999500,13.0000000,0.0000000,0.0000000,273.9670000); //object(la_fuckcar1)(78)
	CreateDynamicObject(3594,2374.5000000,-2011.0999800,13.0000000,0.0000000,0.0000000,273.9660000); //object(la_fuckcar1)(78)
	CreateDynamicObject(3594,2410.3000500,-2037.9000200,13.0000000,0.0000000,0.0000000,353.9670000); //object(la_fuckcar1)(78)
	CreateDynamicObject(3594,2414.6999500,-2060.8000500,13.0000000,0.0000000,0.0000000,33.9630000); //object(la_fuckcar1)(78)
	CreateDynamicObject(3594,2410.6999500,-2074.5000000,13.0000000,0.0000000,0.0000000,173.9590000); //object(la_fuckcar1)(78)
	CreateDynamicObject(3594,2413.6999500,-2105.5000000,13.0000000,0.0000000,0.0000000,203.9580000); //object(la_fuckcar1)(78)
	CreateDynamicObject(3594,2419.6001000,-2143.6001000,13.0000000,0.0000000,0.0000000,89.9560000); //object(la_fuckcar1)(78)
	CreateDynamicObject(3594,2411.8000500,-2143.8999000,13.0000000,0.0000000,0.0000000,95.9510000); //object(la_fuckcar1)(78)
	CreateDynamicObject(3594,2404.3000500,-2142.3999000,13.0000000,0.0000000,0.0000000,245.9490000); //object(la_fuckcar1)(78)
	CreateDynamicObject(761,2411.1999500,-1980.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2414.3999000,-1979.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2418.0000000,-1978.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2405.1999500,-1971.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2400.6999500,-1963.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2399.0000000,-1970.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2398.1001000,-1981.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2395.1999500,-1976.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2416.6001000,-2011.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2418.8999000,-2016.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2404.8999000,-2023.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2423.8000500,-1998.6999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2444.8000500,-2012.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2442.1001000,-2020.0999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2451.3999000,-2013.0999800,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2461.6001000,-1999.9000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2468.6001000,-2008.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2474.8000500,-2006.3000500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2487.1999500,-2013.6999500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2488.5000000,-2018.0999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2490.8000500,-2014.5000000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2504.1999500,-2009.5000000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2509.8000500,-2013.3000500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2514.3999000,-2007.9000200,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2520.3000500,-2005.9000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2521.5000000,-2001.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2397.8000500,-2010.0000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2397.8999000,-2008.9000200,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2389.1999500,-2010.6999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2378.6001000,-2010.1999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2370.0000000,-2012.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2418.3999000,-1998.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2409.1999500,-2003.8000500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2412.3000500,-2034.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2408.1001000,-2039.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2414.8000500,-2058.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2415.0000000,-2063.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2409.3999000,-2070.1001000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2412.3000500,-2076.6001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2408.6001000,-2077.3999000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2399.3999000,-2069.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2391.6999500,-2090.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2411.3000500,-2104.1999500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2413.1999500,-2107.6999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2415.8999000,-2106.3999000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2414.1001000,-2103.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2407.8000500,-2144.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2416.0000000,-2142.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2422.0000000,-2141.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2406.3000500,-2141.8999000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2403.8000500,-2139.1999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2400.3999000,-2141.8000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(806,2451.3000500,-2009.8000500,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(93)
	CreateDynamicObject(806,2392.8999000,-1964.0999800,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(93)
	CreateDynamicObject(806,2403.3999000,-2015.9000200,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(93)
	CreateDynamicObject(806,2324.0000000,-1998.8000500,-25.0000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(93)
	CreateDynamicObject(806,2403.3999000,-2008.5999800,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(93)
	CreateDynamicObject(806,2408.5000000,-2034.5000000,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(93)
	CreateDynamicObject(806,2418.0000000,-2062.6999500,16.1000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(93)
	CreateDynamicObject(806,2412.1999500,-2106.5000000,16.1000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(93)
	CreateDynamicObject(806,2423.1999500,-2142.0000000,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(93)
	CreateDynamicObject(806,2416.0000000,-2144.3994100,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(93)
	CreateDynamicObject(806,2401.3999000,-2140.0000000,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(93)
	CreateDynamicObject(806,2518.1001000,-1998.5000000,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(93)
	CreateDynamicObject(806,2513.8000500,-2007.0999800,16.1000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(93)
	CreateDynamicObject(806,2494.0000000,-2026.3000500,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(93)
	CreateDynamicObject(1299,2415.6001000,-1983.6999500,12.8000000,0.0000000,0.0000000,30.0000000); //object(smashboxpile)(6)
	CreateDynamicObject(1299,2396.1999500,-1969.5999800,12.8000000,0.0000000,0.0000000,329.9980000); //object(smashboxpile)(7)
	CreateDynamicObject(1299,2412.1001000,-2037.5999800,12.8000000,0.0000000,0.0000000,353.9960000); //object(smashboxpile)(8)
	CreateDynamicObject(1299,2412.3000500,-2070.5000000,12.8000000,0.0000000,0.0000000,83.9960000); //object(smashboxpile)(9)
	CreateDynamicObject(1299,2420.6001000,-2139.8999000,12.9000000,0.0000000,0.0000000,83.9900000); //object(smashboxpile)(10)
	CreateDynamicObject(2672,2411.3000500,-2101.3999000,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(79)
	CreateDynamicObject(2672,2412.3000500,-2129.8000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(80)
	CreateDynamicObject(2672,2401.3999000,-2138.1001000,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(81)
	CreateDynamicObject(2672,2417.8000500,-2139.8000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(82)
	CreateDynamicObject(2672,2420.3000500,-2141.6001000,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(83)
	CreateDynamicObject(2672,2413.3999000,-2139.6999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(84)
	CreateDynamicObject(2672,2412.5000000,-2109.3000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(85)
	CreateDynamicObject(2672,2416.6999500,-2109.6999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(86)
	CreateDynamicObject(2672,2414.0000000,-2071.0000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(87)
	CreateDynamicObject(2672,2410.1001000,-2067.6999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(88)
	CreateDynamicObject(2672,2417.1001000,-2058.6001000,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(89)
	CreateDynamicObject(2672,2410.8000500,-2033.0000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(90)
	CreateDynamicObject(2672,2417.3000500,-2019.6999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(91)
	CreateDynamicObject(2672,2414.0000000,-1984.6999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(92)
	CreateDynamicObject(2672,2417.1999500,-1976.0000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(93)
	CreateDynamicObject(2672,2404.3000500,-1964.5000000,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(94)
	CreateDynamicObject(2672,2408.0000000,-1967.8000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(95)
	CreateDynamicObject(2672,2417.5000000,-1943.9000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(96)
	CreateDynamicObject(2672,2399.3999000,-1973.6999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(97)
	CreateDynamicObject(2672,2415.3000500,-2008.9000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(98)
	CreateDynamicObject(2672,2406.8000500,-2009.5999800,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(99)
	CreateDynamicObject(2672,2400.3999000,-2011.4000200,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(100)
	CreateDynamicObject(2672,2403.1001000,-2013.8000500,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(101)
	CreateDynamicObject(2672,2406.3999000,-2013.3000500,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(102)
	CreateDynamicObject(2672,2440.6001000,-2008.8000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(103)
	CreateDynamicObject(2672,2468.1999500,-2009.9000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(104)
	CreateDynamicObject(2672,2458.6999500,-2009.1999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(105)
	CreateDynamicObject(2672,2453.5000000,-2012.3000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(106)
	CreateDynamicObject(2672,2466.3000500,-2006.9000200,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(107)
	CreateDynamicObject(2672,2491.8000500,-2013.0000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(108)
	CreateDynamicObject(2672,2490.3999000,-2011.0999800,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(109)
	CreateDynamicObject(2672,2492.3000500,-2010.8000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(110)
	CreateDynamicObject(2672,2504.3000500,-2011.6999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(111)
	CreateDynamicObject(3866,2436.6001000,-2075.5000000,20.4000000,0.0000000,0.0000000,0.0000000); //object(demolish1_sfxrf)(1)
	CreateDynamicObject(3866,2436.3994100,-2108.2998000,20.4000000,0.0000000,0.0000000,0.0000000); //object(demolish1_sfxrf)(2)
	CreateDynamicObject(12991,2443.8994100,-2071.6992200,12.5000000,0.0000000,0.0000000,219.9960000); //object(sw_shack02)(1)
	CreateDynamicObject(16105,2456.3000500,-2073.6999500,14.8000000,0.0000000,0.0000000,42.0000000); //object(des_westrn11_04)(1)
	CreateDynamicObject(18259,2474.1999500,-2072.6999500,14.2000000,0.0000000,0.0000000,88.0000000); //object(logcabinn01)(1)
	CreateDynamicObject(971,2468.1001000,-2100.5000000,12.3000000,0.0000000,0.0000000,0.0000000); //object(subwaygate)(9)
	CreateDynamicObject(971,2453.0000000,-2100.8999000,12.7000000,0.0000000,0.0000000,0.0000000); //object(subwaygate)(12)
	CreateDynamicObject(991,2475.8999000,-2100.6001000,13.8000000,0.0000000,0.0000000,0.0000000); //object(bar_barriergate1)(1)
	CreateDynamicObject(991,2481.3000500,-2103.1001000,13.8000000,0.0000000,0.0000000,310.0000000); //object(bar_barriergate1)(2)
	CreateDynamicObject(991,2483.8000500,-2108.8999000,13.8000000,0.0000000,0.0000000,275.9960000); //object(bar_barriergate1)(3)
	CreateDynamicObject(991,2483.8000500,-2115.5000000,13.8000000,0.0000000,0.0000000,265.9930000); //object(bar_barriergate1)(4)
	CreateDynamicObject(991,2480.6999500,-2120.5000000,13.8000000,0.0000000,0.0000000,209.9900000); //object(bar_barriergate1)(5)
	CreateDynamicObject(991,2447.5000000,-2104.1001000,13.8000000,0.0000000,0.0000000,70.0000000); //object(bar_barriergate1)(6)
	CreateDynamicObject(991,2445.8999000,-2110.5000000,13.8000000,0.0000000,0.0000000,79.9990000); //object(bar_barriergate1)(7)
	CreateDynamicObject(991,2445.8999000,-2117.0000000,13.8000000,0.0000000,0.0000000,99.9970000); //object(bar_barriergate1)(8)
	CreateDynamicObject(991,2447.1001000,-2123.5000000,13.8000000,0.0000000,0.0000000,99.9920000); //object(bar_barriergate1)(9)
	CreateDynamicObject(997,2424.1001000,-2097.5000000,12.4000000,0.0000000,0.0000000,92.0000000); //object(lhouse_barrier3)(2)
	CreateDynamicObject(997,2424.0000000,-2089.6001000,12.4000000,0.0000000,0.0000000,92.0000000); //object(lhouse_barrier3)(3)
	CreateDynamicObject(1411,2452.6999500,-2097.8000500,14.2000000,0.0000000,0.0000000,180.0000000); //object(dyn_mesh_1)(4)
	CreateDynamicObject(1411,2467.1001000,-2097.8999000,14.2000000,0.0000000,0.0000000,179.9950000); //object(dyn_mesh_1)(5)
	CreateDynamicObject(1411,2472.3000500,-2097.8999000,14.2000000,0.0000000,0.0000000,179.9950000); //object(dyn_mesh_1)(6)
	CreateDynamicObject(1411,2477.5000000,-2097.8999000,14.2000000,0.0000000,0.0000000,179.9950000); //object(dyn_mesh_1)(7)
	CreateDynamicObject(1413,2439.3000500,-2085.1999500,13.8000000,0.0000000,0.0000000,0.0000000); //object(dyn_mesh_3)(1)
	CreateDynamicObject(1413,2444.6001000,-2085.1999500,13.8000000,0.0000000,0.0000000,0.0000000); //object(dyn_mesh_3)(2)
	CreateDynamicObject(1413,2455.1001000,-2085.0000000,13.8000000,0.0000000,0.0000000,0.0000000); //object(dyn_mesh_3)(3)
	CreateDynamicObject(1413,2459.8000500,-2083.3000500,13.8000000,0.0000000,0.0000000,40.0000000); //object(dyn_mesh_3)(4)
	CreateDynamicObject(1413,2462.3000500,-2079.0000000,13.8000000,0.0000000,0.0000000,79.9960000); //object(dyn_mesh_3)(5)
	CreateDynamicObject(1413,2461.8999000,-2073.8999000,13.8000000,0.0000000,0.0000000,110.2410000); //object(dyn_mesh_3)(6)
	CreateDynamicObject(1422,2422.3999000,-2085.8999000,12.8000000,0.0000000,0.0000000,90.0000000); //object(dyn_roadbarrier_5)(4)
	CreateDynamicObject(1423,2421.6999500,-2087.6999500,13.2000000,0.0000000,0.0000000,130.0000000); //object(dyn_roadbarrier_4)(4)
	CreateDynamicObject(1423,2418.8999000,-2096.6001000,13.1000000,0.0000000,0.0000000,51.9960000); //object(dyn_roadbarrier_4)(5)
	CreateDynamicObject(1424,2425.6001000,-2094.6001000,13.1000000,0.0000000,0.0000000,0.0000000); //object(dyn_roadbarrier_2)(9)
	CreateDynamicObject(1424,2428.8000500,-2094.8000500,13.1000000,0.0000000,0.0000000,0.0000000); //object(dyn_roadbarrier_2)(10)
	CreateDynamicObject(1424,2432.3999000,-2094.8000500,13.1000000,0.0000000,0.0000000,0.0000000); //object(dyn_roadbarrier_2)(11)
	CreateDynamicObject(1424,2425.8999000,-2089.1001000,13.1000000,0.0000000,0.0000000,0.0000000); //object(dyn_roadbarrier_2)(12)
	CreateDynamicObject(1424,2429.1001000,-2089.0000000,13.1000000,0.0000000,0.0000000,0.0000000); //object(dyn_roadbarrier_2)(13)
	CreateDynamicObject(1424,2433.8999000,-2088.8999000,13.1000000,0.0000000,0.0000000,0.0000000); //object(dyn_roadbarrier_2)(14)
	CreateDynamicObject(3276,2485.8000500,-2097.1999500,13.4000000,0.0000000,0.0000000,185.7500000); //object(cxreffencesld)(1)
	CreateDynamicObject(3276,2497.6001000,-2083.6999500,13.4000000,0.0000000,0.0000000,359.7460000); //object(cxreffencesld)(2)
	CreateDynamicObject(18255,2540.8999000,-2099.6999500,15.0000000,0.0000000,0.0000000,0.0000000); //object(cuntwjunk11)(1)
	CreateDynamicObject(910,2437.6001000,-2079.6001000,13.8000000,0.0000000,0.0000000,90.0000000); //object(bust_cabinet_4)(4)
	CreateDynamicObject(910,2437.6001000,-2082.0000000,13.8000000,0.0000000,0.0000000,90.0000000); //object(bust_cabinet_4)(5)
	CreateDynamicObject(850,2440.6999500,-2082.8999000,12.7000000,0.0000000,0.0000000,40.0000000); //object(cj_urb_rub_1)(12)
	CreateDynamicObject(2971,2448.1001000,-2071.0000000,12.5000000,0.0000000,0.0000000,40.0000000); //object(k_smashboxes)(10)
	CreateDynamicObject(2971,2442.5000000,-2071.8999000,12.5000000,0.0000000,0.0000000,39.9960000); //object(k_smashboxes)(11)
	CreateDynamicObject(1449,2443.6999500,-2075.6001000,13.1000000,0.0000000,0.0000000,342.0000000); //object(dyn_crate_2)(1)
	CreateDynamicObject(1442,2457.1999500,-2083.5000000,13.1000000,0.0000000,0.0000000,0.0000000); //object(dyn_firebin0)(1)
	CreateDynamicObject(1440,2456.3999000,-2077.6999500,13.1000000,0.0000000,0.0000000,40.0000000); //object(dyn_box_pile_3)(26)
	CreateDynamicObject(1440,2459.0000000,-2075.6001000,13.1000000,0.0000000,0.0000000,39.9960000); //object(dyn_box_pile_3)(27)
	CreateDynamicObject(1438,2452.1999500,-2073.0000000,12.5000000,0.0000000,0.0000000,222.0000000); //object(dyn_box_pile_2)(12)
	CreateDynamicObject(1415,2438.3000500,-2084.1999500,12.6000000,0.0000000,0.0000000,148.0000000); //object(dyn_dumpster)(3)
	CreateDynamicObject(1372,2438.8999000,-2086.1001000,12.7000000,0.0000000,0.0000000,0.0000000); //object(cj_dump2_low)(3)
	CreateDynamicObject(1372,2440.8999000,-2086.1001000,12.7000000,0.0000000,0.0000000,0.0000000); //object(cj_dump2_low)(4)
	CreateDynamicObject(1369,2431.8999000,-2087.6999500,13.2000000,0.0000000,0.0000000,310.0000000); //object(cj_wheelchair1)(7)
	CreateDynamicObject(1365,2437.0000000,-2095.8999000,13.7000000,0.0000000,0.0000000,180.0000000); //object(cj_big_skip1)(2)
	CreateDynamicObject(1358,2454.3000500,-2083.1999500,13.8000000,0.0000000,0.0000000,0.0000000); //object(cj_skip_rubbish)(5)
	CreateDynamicObject(1357,2453.1999500,-2081.3999000,12.8000000,0.0000000,0.0000000,0.0000000); //object(cj_fruitcrate3)(1)
	CreateDynamicObject(1349,2442.1001000,-2095.8999000,13.1000000,0.0000000,0.0000000,0.0000000); //object(cj_shtrolly)(13)
	CreateDynamicObject(1349,2441.0000000,-2094.8999000,13.1000000,0.0000000,0.0000000,70.0000000); //object(cj_shtrolly)(14)
	CreateDynamicObject(1349,2443.1001000,-2094.3999000,13.1000000,0.0000000,0.0000000,169.9990000); //object(cj_shtrolly)(15)
	CreateDynamicObject(1349,2443.8000500,-2096.3000500,13.1000000,0.0000000,0.0000000,229.9970000); //object(cj_shtrolly)(16)
	CreateDynamicObject(12957,2464.6001000,-2081.8999000,13.4000000,0.0000000,0.0000000,0.0000000); //object(sw_pickupwreck01)(9)
	CreateDynamicObject(942,2453.1001000,-2120.1001000,15.0000000,0.0000000,0.0000000,0.0000000); //object(cj_df_unit_2)(4)
	CreateDynamicObject(942,2475.3999000,-2119.8000500,15.0000000,0.0000000,0.0000000,0.0000000); //object(cj_df_unit_2)(5)
	CreateDynamicObject(939,2469.0000000,-2119.6999500,15.0000000,0.0000000,0.0000000,0.0000000); //object(cj_df_unit)(4)
	CreateDynamicObject(2062,2449.6001000,-2097.0000000,13.1000000,0.0000000,0.0000000,0.0000000); //object(cj_oildrum2)(4)
	CreateDynamicObject(2062,2450.6001000,-2096.8000500,13.1000000,0.0000000,0.0000000,0.0000000); //object(cj_oildrum2)(5)
	CreateDynamicObject(2062,2449.6999500,-2095.5000000,13.1000000,0.0000000,0.0000000,0.0000000); //object(cj_oildrum2)(6)
	CreateDynamicObject(2062,2448.5000000,-2096.6001000,13.1000000,0.0000000,0.0000000,0.0000000); //object(cj_oildrum2)(7)
	CreateDynamicObject(2062,2447.6999500,-2097.1001000,13.1000000,0.0000000,0.0000000,0.0000000); //object(cj_oildrum2)(8)
	CreateDynamicObject(2672,2458.5000000,-2095.8999000,12.9000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(112)
	CreateDynamicObject(2672,2461.8000500,-2088.5000000,12.9000000,0.0000000,0.0000000,80.0000000); //object(proc_rubbish_4)(113)
	CreateDynamicObject(2672,2451.6999500,-2095.1999500,12.9000000,0.0000000,0.0000000,79.9970000); //object(proc_rubbish_4)(114)
	CreateDynamicObject(2672,2436.0000000,-2087.6999500,12.9000000,0.0000000,0.0000000,149.9970000); //object(proc_rubbish_4)(115)
	CreateDynamicObject(2672,2427.0000000,-2095.8000500,12.9000000,0.0000000,0.0000000,149.9960000); //object(proc_rubbish_4)(116)
	CreateDynamicObject(2672,2451.8000500,-2078.1001000,12.9000000,0.0000000,0.0000000,79.9970000); //object(proc_rubbish_4)(117)
	CreateDynamicObject(2672,2461.1999500,-2076.3999000,12.9000000,0.0000000,0.0000000,129.9970000); //object(proc_rubbish_4)(118)
	CreateDynamicObject(2672,2457.0000000,-2068.8000500,12.9000000,0.0000000,0.0000000,129.9960000); //object(proc_rubbish_4)(119)
	CreateDynamicObject(2672,2449.3000500,-2073.5000000,12.9000000,0.0000000,0.0000000,189.9960000); //object(proc_rubbish_4)(120)
	CreateDynamicObject(2672,2439.3000500,-2071.8000500,12.9000000,0.0000000,0.0000000,189.9920000); //object(proc_rubbish_4)(121)
	CreateDynamicObject(2676,2433.1001000,-2091.3000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(56)
	CreateDynamicObject(2676,2441.1992200,-2079.8994100,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(57)
	CreateDynamicObject(2676,2464.0000000,-2118.3999000,12.7000000,0.0000000,0.0000000,70.0000000); //object(proc_rubbish_8)(58)
	CreateDynamicObject(2676,2468.8999000,-2116.6999500,12.7000000,0.0000000,0.0000000,149.9990000); //object(proc_rubbish_8)(59)
	CreateDynamicObject(2676,2474.6999500,-2117.6999500,12.7000000,0.0000000,0.0000000,279.9960000); //object(proc_rubbish_8)(60)
	CreateDynamicObject(2676,2451.1999500,-2118.1001000,12.7000000,0.0000000,0.0000000,329.9920000); //object(proc_rubbish_8)(61)
	CreateDynamicObject(3594,2459.5000000,-2085.6999500,13.1000000,0.0000000,0.0000000,312.0000000); //object(la_fuckcar1)(107)
	CreateDynamicObject(18246,2524.8000500,-2100.3000500,14.9000000,0.0000000,0.0000000,90.0000000); //object(cuntwjunk04)(1)
	CreateDynamicObject(18249,2488.5000000,-2086.6999500,8.3000000,0.0000000,0.0000000,6.0000000); //object(cuntwjunk05)(9)
	CreateDynamicObject(935,2456.3000500,-2120.1001000,13.1000000,0.0000000,0.0000000,0.0000000); //object(cj_drum)(7)
	CreateDynamicObject(935,2456.3000500,-2118.8000500,13.1000000,0.0000000,0.0000000,0.0000000); //object(cj_drum)(8)
	CreateDynamicObject(935,2457.1001000,-2119.6001000,13.1000000,0.0000000,0.0000000,0.0000000); //object(cj_drum)(9)
	CreateDynamicObject(935,2458.0000000,-2120.6999500,13.1000000,0.0000000,0.0000000,0.0000000); //object(cj_drum)(10)
	CreateDynamicObject(935,2459.1001000,-2120.6999500,13.1000000,0.0000000,0.0000000,0.0000000); //object(cj_drum)(11)
	CreateDynamicObject(935,2460.1999500,-2121.1001000,13.1000000,0.0000000,0.0000000,0.0000000); //object(cj_drum)(12)
	CreateDynamicObject(935,2458.1001000,-2119.6001000,13.1000000,0.0000000,0.0000000,0.0000000); //object(cj_drum)(13)
	CreateDynamicObject(925,2464.6999500,-2119.6999500,13.6000000,0.0000000,0.0000000,0.0000000); //object(rack2)(7)
	CreateDynamicObject(925,2447.8000500,-2106.3999000,13.6000000,0.0000000,0.0000000,74.0000000); //object(rack2)(8)
	CreateDynamicObject(925,2447.1001000,-2109.3000500,13.6000000,0.0000000,0.0000000,79.9980000); //object(rack2)(9)
	CreateDynamicObject(930,2448.3000500,-2110.8999000,13.0000000,0.0000000,0.0000000,40.0000000); //object(o2_bottles)(3)
	CreateDynamicObject(13025,2472.3000500,-2104.8999000,14.8000000,0.0000000,0.0000000,0.0000000); //object(sw_fueldrum01)(1)
	CreateDynamicObject(1759,2449.6001000,-2073.1999500,12.5000000,0.0000000,0.0000000,310.0000000); //object(low_single_1)(1)
	CreateDynamicObject(2063,2445.6999500,-2084.6001000,13.5000000,0.0000000,0.0000000,0.0000000); //object(cj_greenshelves)(1)
	CreateDynamicObject(1421,2441.6999500,-2074.3000500,13.3000000,0.0000000,0.0000000,310.0000000); //object(dyn_boxes)(1)
	CreateDynamicObject(1645,2435.3999000,-2068.6999500,12.9000000,0.0000000,0.0000000,4.0000000); //object(lounge_wood_up)(1)
	CreateDynamicObject(1645,2433.6999500,-2068.8000500,12.9000000,0.0000000,0.0000000,3.9990000); //object(lounge_wood_up)(2)
	CreateDynamicObject(1645,2432.1001000,-2068.8000500,12.9000000,0.0000000,0.0000000,3.9990000); //object(lounge_wood_up)(3)
	CreateDynamicObject(2676,2431.1001000,-2070.6999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(57)
	CreateDynamicObject(2676,2427.1001000,-2076.5000000,12.7000000,0.0000000,0.0000000,90.0000000); //object(proc_rubbish_8)(57)
	CreateDynamicObject(941,2429.8000500,-2067.5000000,13.0000000,0.0000000,0.0000000,0.0000000); //object(cj_df_worktop_3)(2)
	CreateDynamicObject(1763,2446.6999500,-2074.6001000,12.5000000,0.0000000,0.0000000,40.0000000); //object(low_couch_1)(4)
	CreateDynamicObject(3279,2429.3000500,-2074.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(a51_spottower)(1)
	CreateDynamicObject(3279,2429.6001000,-2106.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(a51_spottower)(2)
	CreateDynamicObject(761,2425.3999000,-2087.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2432.1001000,-2095.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2437.0000000,-2086.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2442.8999000,-2086.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2445.1999500,-2095.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2464.8999000,-2098.8999000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2456.8000500,-2098.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2453.6999500,-2097.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2467.1001000,-2102.3999000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2470.8000500,-2108.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2478.5000000,-2107.6001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2477.8000500,-2101.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2479.1999500,-2098.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2481.0000000,-2097.3999000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2475.5000000,-2085.1001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2479.3999000,-2084.3000500,12.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2482.8000500,-2084.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2484.6999500,-2087.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2466.3000500,-2083.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2461.8000500,-2085.3000500,12.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2458.3000500,-2088.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2455.8999000,-2086.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2450.8000500,-2070.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2455.5000000,-2070.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2457.1001000,-2082.3999000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2460.6999500,-2074.1001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2438.5000000,-2078.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2437.6001000,-2110.6001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2428.5000000,-2100.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(761,2441.1001000,-2098.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(146)
	CreateDynamicObject(3594,2365.3000500,-1974.1999500,13.0000000,0.0000000,0.0000000,243.9720000); //object(la_fuckcar1)(78)
	CreateDynamicObject(3594,2327.5000000,-1970.9000200,13.0000000,0.0000000,0.0000000,293.9680000); //object(la_fuckcar1)(78)
	CreateDynamicObject(3594,2303.1999500,-1973.6999500,13.0000000,0.0000000,0.0000000,243.9670000); //object(la_fuckcar1)(78)
	CreateDynamicObject(3594,2316.3999000,-1944.0999800,13.0000000,0.0000000,0.0000000,193.9620000); //object(la_fuckcar1)(78)
	CreateDynamicObject(3594,2314.3000500,-1894.4000200,13.0000000,0.0000000,0.0000000,223.9580000); //object(la_fuckcar1)(78)
	CreateDynamicObject(3594,2311.3000500,-1918.5999800,13.0000000,0.0000000,0.0000000,13.9560000); //object(la_fuckcar1)(78)
	CreateDynamicObject(3594,2271.3000500,-1893.6999500,13.0000000,0.0000000,0.0000000,283.9530000); //object(la_fuckcar1)(78)
	CreateDynamicObject(3594,2290.8000500,-1897.6999500,13.0000000,0.0000000,0.0000000,33.9470000); //object(la_fuckcar1)(78)
	CreateDynamicObject(3594,2232.1001000,-1895.5000000,13.0000000,0.0000000,0.0000000,223.9470000); //object(la_fuckcar1)(78)
	CreateDynamicObject(3594,2220.5000000,-1906.9000200,13.0000000,0.0000000,0.0000000,313.9450000); //object(la_fuckcar1)(78)
	CreateDynamicObject(3594,2208.6999500,-1928.1999500,13.0000000,0.0000000,0.0000000,15.9400000); //object(la_fuckcar1)(78)
	CreateDynamicObject(3594,2222.1999500,-1954.6999500,13.0000000,0.0000000,0.0000000,335.9360000); //object(la_fuckcar1)(78)
	CreateDynamicObject(3594,2213.6001000,-1967.5000000,13.0000000,0.0000000,0.0000000,55.9340000); //object(la_fuckcar1)(78)
	CreateDynamicObject(3594,2217.8000500,-1979.3000500,13.0000000,0.0000000,0.0000000,135.9310000); //object(la_fuckcar1)(78)
	CreateDynamicObject(3594,2257.3999000,-1973.6999500,13.0000000,0.0000000,0.0000000,105.9280000); //object(la_fuckcar1)(78)
	CreateDynamicObject(761,2225.1999500,-1888.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2228.0000000,-1893.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2231.8000500,-1898.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2236.3000500,-1896.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2217.5000000,-1907.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2222.5000000,-1907.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2210.1999500,-1931.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2206.6999500,-1929.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2209.3999000,-1924.9000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2222.8999000,-1950.5999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2219.3000500,-1956.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2220.8999000,-1958.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2212.1999500,-1963.9000200,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2211.3999000,-1967.5000000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2214.0000000,-1970.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2215.6999500,-1979.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2216.6001000,-1982.6999500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2220.6999500,-1979.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2233.6999500,-1967.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2236.6999500,-1963.5999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2234.0000000,-1964.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2253.6999500,-1975.3000500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2259.6001000,-1971.9000200,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2261.8999000,-1974.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2298.6999500,-1973.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2300.8999000,-1975.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2299.8000500,-1982.0000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2303.8000500,-1983.0999800,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2305.6001000,-1972.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2324.1999500,-1974.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2330.1999500,-1972.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2326.3999000,-1969.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2361.1001000,-1973.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2357.5000000,-1985.4000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2344.1001000,-1987.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2340.6001000,-1992.9000200,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2394.5000000,-1969.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2370.0000000,-1974.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2371.3999000,-1970.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2369.5000000,-1964.5999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2316.1001000,-1948.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2318.3999000,-1943.5999800,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2314.3000500,-1940.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2313.3999000,-1921.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2309.0000000,-1915.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2310.1001000,-1922.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2306.8999000,-1918.1999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2318.0000000,-1896.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2313.8999000,-1896.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2291.5000000,-1895.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2294.3999000,-1899.5000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2291.5000000,-1901.5000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2289.5000000,-1899.5000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2274.6001000,-1891.8000500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2267.5000000,-1892.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2264.3999000,-1884.4000200,13.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2253.8000500,-1884.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2248.1001000,-1889.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2244.1001000,-1904.5999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(761,2231.5000000,-1892.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(103)
	CreateDynamicObject(806,2234.3999000,-1894.0000000,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(83)
	CreateDynamicObject(806,2269.0000000,-1895.5999800,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(83)
	CreateDynamicObject(806,2288.3000500,-1895.0999800,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(83)
	CreateDynamicObject(806,2313.1999500,-1890.8000500,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(83)
	CreateDynamicObject(806,2304.5000000,-1945.4000200,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(83)
	CreateDynamicObject(806,2323.3999000,-1948.3000500,16.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(83)
	CreateDynamicObject(806,2324.1001000,-1969.5000000,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(83)
	CreateDynamicObject(806,2307.3999000,-1974.8000500,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(83)
	CreateDynamicObject(806,2277.1999500,-1964.1999500,16.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(83)
	CreateDynamicObject(806,2253.6999500,-1973.0999800,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(83)
	CreateDynamicObject(806,2217.6001000,-1968.1999500,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(83)
	CreateDynamicObject(806,2220.1001000,-1976.0000000,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(83)
	CreateDynamicObject(806,2211.1999500,-1930.0999800,16.1000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(83)
	CreateDynamicObject(806,2219.8000500,-1909.5000000,16.1000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(83)
	CreateDynamicObject(2676,2221.3999000,-1901.4000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(37)
	CreateDynamicObject(2676,2208.1999500,-1933.4000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(37)
	CreateDynamicObject(2676,2221.6001000,-1960.5999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(37)
	CreateDynamicObject(2676,2253.8999000,-1972.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(37)
	CreateDynamicObject(2676,2221.1001000,-1984.9000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(37)
	CreateDynamicObject(2676,2211.8000500,-1983.1999500,12.5000000,0.0000000,0.0000000,140.0000000); //object(proc_rubbish_8)(37)
	CreateDynamicObject(2676,2216.3000500,-1976.5000000,12.5000000,0.0000000,0.0000000,199.9990000); //object(proc_rubbish_8)(37)
	CreateDynamicObject(2676,2235.3000500,-1966.0999800,12.7000000,0.0000000,0.0000000,201.9950000); //object(proc_rubbish_8)(37)
	CreateDynamicObject(2676,2215.0000000,-1965.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(37)
	CreateDynamicObject(2676,2301.3999000,-1970.4000200,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(37)
	CreateDynamicObject(2676,2317.1001000,-1962.1999500,12.6000000,0.0000000,0.0000000,102.0000000); //object(proc_rubbish_8)(37)
	CreateDynamicObject(2676,2327.8000500,-1973.9000200,12.6000000,0.0000000,0.0000000,211.9970000); //object(proc_rubbish_8)(37)
	CreateDynamicObject(2676,2347.6999500,-1985.8000500,12.6000000,0.0000000,0.0000000,151.9920000); //object(proc_rubbish_8)(37)
	CreateDynamicObject(2676,2346.6999500,-1990.0999800,12.6000000,0.0000000,0.0000000,221.9900000); //object(proc_rubbish_8)(37)
	CreateDynamicObject(2676,2349.8999000,-1991.1999500,12.6000000,0.0000000,0.0000000,321.9900000); //object(proc_rubbish_8)(37)
	CreateDynamicObject(2676,2346.5000000,-1993.6999500,12.6000000,0.0000000,0.0000000,41.9870000); //object(proc_rubbish_8)(37)
	CreateDynamicObject(2676,2361.5000000,-1975.5999800,12.6000000,0.0000000,0.0000000,17.9840000); //object(proc_rubbish_8)(37)
	CreateDynamicObject(2676,2366.3999000,-1964.5999800,12.7000000,0.0000000,0.0000000,97.9790000); //object(proc_rubbish_8)(37)
	CreateDynamicObject(2676,2387.6999500,-1973.4000200,12.6000000,0.0000000,0.0000000,177.9760000); //object(proc_rubbish_8)(37)
	CreateDynamicObject(2676,2387.3000500,-1970.5000000,12.6000000,0.0000000,0.0000000,257.9730000); //object(proc_rubbish_8)(37)
	CreateDynamicObject(2676,2234.3999000,-1892.5999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(37)
	CreateDynamicObject(2676,2271.6001000,-1896.9000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(37)
	CreateDynamicObject(2676,2290.8000500,-1893.4000200,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(37)
	CreateDynamicObject(2676,2311.5000000,-1894.5999800,12.6000000,0.0000000,0.0000000,140.0000000); //object(proc_rubbish_8)(37)
	CreateDynamicObject(2676,2309.3000500,-1899.6999500,12.6000000,0.0000000,0.0000000,239.9990000); //object(proc_rubbish_8)(37)
	CreateDynamicObject(2676,2315.0000000,-1918.1999500,12.6000000,0.0000000,0.0000000,319.9960000); //object(proc_rubbish_8)(37)
	CreateDynamicObject(2676,2317.1001000,-1937.1999500,12.6000000,0.0000000,0.0000000,279.9930000); //object(proc_rubbish_8)(37)
	CreateDynamicObject(2676,2306.3999000,-1936.6999500,12.7000000,0.0000000,0.0000000,359.9920000); //object(proc_rubbish_8)(37)
	CreateDynamicObject(2676,2306.6999500,-1946.5000000,12.7000000,0.0000000,0.0000000,59.9890000); //object(proc_rubbish_8)(37)
	CreateDynamicObject(2676,2310.6001000,-1957.0000000,12.5000000,0.0000000,0.0000000,59.9850000); //object(proc_rubbish_8)(37)
	CreateDynamicObject(3461,2263.6001000,-1880.0000000,16.2000000,88.0000000,0.0000000,0.0000000); //object(tikitorch01_lvs)(79)
	CreateDynamicObject(3461,2264.1001000,-1880.0000000,13.6000000,87.9950000,0.0000000,0.0000000); //object(tikitorch01_lvs)(80)
	CreateDynamicObject(3461,2264.1001000,-1880.0000000,13.6000000,87.9950000,0.0000000,0.0000000); //object(tikitorch01_lvs)(81)
	CreateDynamicObject(3594,2528.1992200,-1935.0996100,13.0000000,0.0000000,0.0000000,247.9610000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2586.6001000,-1929.5999800,13.0000000,0.0000000,0.0000000,87.9610000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2616.1999500,-1933.5000000,13.0000000,0.0000000,0.0000000,127.9570000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2640.1001000,-1931.8000500,13.0000000,0.0000000,0.0000000,57.9520000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2671.8000500,-1934.5999800,13.0000000,0.0000000,0.0000000,97.9470000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2712.3000500,-1931.5999800,13.0000000,0.0000000,0.0000000,57.9430000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2717.3999000,-1954.9000200,13.0000000,0.0000000,0.0000000,357.9420000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2713.5000000,-1974.5000000,13.0000000,0.0000000,0.0000000,307.9400000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2720.0996100,-1990.1992200,13.0000000,0.0000000,0.0000000,47.9330000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2706.0000000,-2000.0000000,13.0000000,0.0000000,0.0000000,287.9330000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2670.8000500,-2003.4000200,13.0000000,0.0000000,0.0000000,217.9300000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2686.1001000,-2012.4000200,13.1000000,0.0000000,0.0000000,327.9250000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2715.8000500,-2033.0000000,13.0000000,0.0000000,0.0000000,327.9300000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2711.0000000,-2051.0000000,13.0000000,0.0000000,0.0000000,27.9250000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2693.3000500,-2050.0000000,13.0000000,354.2500000,0.0000000,267.9220000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2684.8999000,-2048.6999500,13.6000000,354.3050000,8.0400000,328.7210000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2660.6999500,-2048.3999000,18.5000000,348.2550000,2.0390000,278.3290000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2636.0000000,-2050.6001000,21.4000000,357.4940000,1.9970000,328.0000000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2613.6001000,-2048.8999000,22.9000000,2.4870000,1.9940000,27.8230000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2580.3000500,-2048.6001000,24.2000000,357.2360000,1.9890000,328.0050000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2548.5000000,-2051.0000000,24.7000000,357.2310000,1.9890000,68.0020000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2509.8000500,-2047.0999800,24.6000000,357.2260000,1.9830000,290.0000000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2467.1999500,-2056.1999500,24.0000000,359.2250000,1.9750000,289.9260000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2459.3999000,-2054.3000500,23.8000000,359.2200000,1.9720000,39.9240000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2464.8000500,-2052.3999000,23.8000000,359.2200000,1.9670000,329.9190000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2470.5000000,-2051.1999500,23.8000000,359.2200000,1.9610000,29.9140000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2473.8999000,-2054.6001000,23.8000000,359.2200000,1.9560000,319.9100000); //object(la_fuckcar1)(83)
	CreateDynamicObject(1383,2496.6001000,-2089.6999500,45.1000000,0.0000000,0.0000000,0.0000000); //object(twrcrane_m_04)(1)
	CreateDynamicObject(1384,2496.5000000,-2089.8000500,77.4000000,0.0000000,0.0000000,32.0000000); //object(twrcrane_m_01)(1)
	CreateDynamicObject(3594,2421.6001000,-2046.6999500,21.4000000,3.9670000,1.9600000,279.7480000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2399.6999500,-2051.8999000,18.4000000,345.4770000,2.0150000,100.3860000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2385.1001000,-2048.6001000,15.2000000,0.4460000,15.9480000,189.7510000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2355.1999500,-2046.6999500,13.1000000,356.7130000,359.9460000,99.8740000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2332.8999000,-2051.8000500,13.0000000,0.0000000,0.0000000,270.0000000); //object(la_fuckcar1)(122)
	CreateDynamicObject(3594,2306.3999000,-2056.5000000,13.0000000,0.0000000,0.0000000,308.0000000); //object(la_fuckcar1)(123)
	CreateDynamicObject(3594,2292.1001000,-2071.6001000,13.0000000,0.0000000,0.0000000,357.9960000); //object(la_fuckcar1)(124)
	CreateDynamicObject(3594,2275.6999500,-2086.1999500,13.0000000,0.0000000,0.0000000,297.9950000); //object(la_fuckcar1)(125)
	CreateDynamicObject(3594,2263.1999500,-2056.6001000,13.0000000,0.0000000,0.0000000,237.9930000); //object(la_fuckcar1)(126)
	CreateDynamicObject(3594,2245.5000000,-2045.6999500,13.0000000,0.0000000,0.0000000,217.9910000); //object(la_fuckcar1)(127)
	CreateDynamicObject(3594,2228.0000000,-2023.9000200,13.0000000,0.0000000,0.0000000,267.9910000); //object(la_fuckcar1)(128)
	CreateDynamicObject(3594,2214.0000000,-2006.4000200,13.0000000,0.0000000,0.0000000,177.9900000); //object(la_fuckcar1)(129)
	CreateDynamicObject(3594,2268.5000000,-2097.5000000,13.2000000,356.5000000,0.0000000,297.9930000); //object(la_fuckcar1)(130)
	CreateDynamicObject(3594,2237.1999500,-2118.8000500,13.1000000,0.0000000,0.0000000,317.9950000); //object(la_fuckcar1)(131)
	CreateDynamicObject(3594,2206.0996100,-2168.1992200,13.0000000,0.0000000,0.0000000,197.9900000); //object(la_fuckcar1)(132)
	CreateDynamicObject(3594,2204.6001000,-2148.0000000,13.2000000,0.0000000,0.0000000,297.9900000); //object(la_fuckcar1)(133)
	CreateDynamicObject(3594,2223.0996100,-2143.0996100,13.0000000,0.0000000,0.0000000,107.9900000); //object(la_fuckcar1)(134)
	CreateDynamicObject(3594,2201.1999500,-2167.3000500,13.0000000,0.0000000,0.0000000,107.9900000); //object(la_fuckcar1)(135)
	CreateDynamicObject(3594,2182.8000500,-2145.6001000,13.0000000,0.0000000,0.0000000,227.9900000); //object(la_fuckcar1)(136)
	CreateDynamicObject(3594,2149.3000500,-2123.3999000,13.0000000,0.0000000,0.0000000,307.9880000); //object(la_fuckcar1)(137)
	CreateDynamicObject(3594,2143.1001000,-2122.3000500,13.0000000,0.0000000,0.0000000,67.9850000); //object(la_fuckcar1)(138)
	CreateDynamicObject(3594,2107.6999500,-2108.1001000,13.0000000,0.0000000,0.0000000,273.9830000); //object(la_fuckcar1)(139)
	CreateDynamicObject(3594,2066.5000000,-2111.1999500,13.0000000,0.0000000,0.0000000,213.9830000); //object(la_fuckcar1)(140)
	CreateDynamicObject(3594,2001.3000500,-2107.6999500,13.0000000,0.0000000,0.0000000,273.9810000); //object(la_fuckcar1)(141)
	CreateDynamicObject(3594,2024.5999800,-2117.0000000,13.0000000,0.0000000,0.0000000,73.9770000); //object(la_fuckcar1)(142)
	CreateDynamicObject(3594,1971.3000500,-2110.6001000,13.0000000,0.0000000,0.0000000,333.9730000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1963.6999500,-2082.8000500,13.0000000,0.0000000,0.0000000,183.9730000); //object(la_fuckcar1)(144)
	CreateDynamicObject(3594,1954.9000200,-2056.8000500,13.0000000,0.0000000,0.0000000,243.9720000); //object(la_fuckcar1)(145)
	CreateDynamicObject(3594,1977.8000500,-2061.6001000,13.0000000,0.0000000,0.0000000,123.9680000); //object(la_fuckcar1)(146)
	CreateDynamicObject(3594,1964.0000000,-2021.8000500,13.0000000,0.0000000,0.0000000,173.9640000); //object(la_fuckcar1)(147)
	CreateDynamicObject(3594,1960.5999800,-1986.8000500,13.0000000,0.0000000,0.0000000,213.9630000); //object(la_fuckcar1)(148)
	CreateDynamicObject(3594,1956.3000500,-1938.0999800,13.0000000,0.0000000,0.0000000,213.9590000); //object(la_fuckcar1)(149)
	CreateDynamicObject(3594,1968.9000200,-1935.9000200,13.0000000,0.0000000,0.0000000,133.9590000); //object(la_fuckcar1)(150)
	CreateDynamicObject(3594,1949.8000500,-1929.6999500,13.0000000,0.0000000,0.0000000,263.9560000); //object(la_fuckcar1)(151)
	CreateDynamicObject(3594,1997.0000000,-1929.9000200,13.0000000,0.0000000,0.0000000,83.9560000); //object(la_fuckcar1)(152)
	CreateDynamicObject(3594,2022.0000000,-1934.1999500,13.0000000,0.0000000,0.0000000,133.9520000); //object(la_fuckcar1)(153)
	CreateDynamicObject(3594,1963.8000500,-1915.4000200,13.0000000,0.0000000,0.0000000,173.9560000); //object(la_fuckcar1)(154)
	CreateDynamicObject(3594,1960.1999500,-1889.6999500,13.0000000,0.0000000,0.0000000,233.9520000); //object(la_fuckcar1)(155)
	CreateDynamicObject(3594,1960.0000000,-1864.5999800,13.0000000,0.0000000,0.0000000,163.9480000); //object(la_fuckcar1)(156)
	CreateDynamicObject(3594,1963.6999500,-1835.6999500,13.0000000,0.0000000,0.0000000,215.9430000); //object(la_fuckcar1)(157)
	CreateDynamicObject(761,2552.6999500,-1930.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2557.1999500,-1932.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2555.8999000,-1936.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2582.1999500,-1930.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2590.6001000,-1931.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2582.3000500,-1928.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2614.1999500,-1932.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2613.6001000,-1933.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2612.1999500,-1935.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2639.6999500,-1940.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2641.3999000,-1925.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2650.0000000,-1926.5999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2650.3000500,-1934.1999500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2636.3999000,-1931.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2675.6999500,-1932.6999500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2668.1001000,-1935.5000000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2674.8999000,-1936.3000500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2684.1999500,-1938.9000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2696.3999000,-1924.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2717.1001000,-1925.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2702.8999000,-1926.4000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2706.5000000,-1933.0000000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2708.8999000,-1931.0000000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2714.6999500,-1931.1999500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2704.6999500,-1940.9000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2715.6001000,-1952.5000000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2719.0000000,-1952.8000500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2718.8000500,-1959.8000500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2704.6001000,-1967.4000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2715.1999500,-1970.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2710.8999000,-1973.5000000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2712.8999000,-1977.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2747.6999500,-1990.3000500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2720.1992200,-1993.0996100,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2717.3000500,-1990.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2708.1999500,-1997.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2703.1001000,-2002.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2708.0000000,-2001.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2702.6999500,-1998.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2673.6999500,-2004.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2672.8999000,-2002.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2667.3999000,-2001.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2649.1999500,-1994.9000200,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2643.8999000,-2000.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2650.3999000,-2010.6999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2688.3999000,-2012.1999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2683.3000500,-2013.5000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2686.1001000,-2010.3000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2715.3999000,-2030.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2712.5000000,-2035.5000000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2718.1001000,-2033.4000200,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2711.6999500,-2048.3999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2713.6999500,-2052.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2709.8000500,-2052.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2708.1001000,-2048.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2695.3999000,-2047.9000200,12.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2699.8999000,-2040.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2690.3000500,-2051.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2687.5000000,-2048.3999000,12.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2664.3999000,-2046.5000000,17.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2664.1001000,-2050.1001000,17.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2656.8000500,-2049.6001000,18.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2654.3999000,-2043.1999500,19.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2638.8000500,-2050.0000000,20.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2636.6001000,-2053.0000000,20.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2631.0000000,-2044.8000500,21.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2614.6999500,-2046.5999800,22.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2612.3999000,-2044.5000000,22.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2603.3000500,-2054.6001000,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2580.8000500,-2051.6999500,23.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2582.8999000,-2048.3000500,23.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2581.6999500,-2042.0000000,23.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2552.0000000,-2051.3999000,24.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2547.6001000,-2048.6001000,24.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2542.1999500,-2047.1999500,24.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2539.3999000,-2055.3000500,24.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2512.6001000,-2048.3000500,24.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2516.3000500,-2043.9000200,24.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2506.8999000,-2046.1999500,24.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2478.0000000,-2054.8999000,23.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2472.8999000,-2052.3999000,23.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2465.6999500,-2054.1999500,23.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2467.8000500,-2048.1999500,23.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2461.8000500,-2053.3999000,23.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2456.0000000,-2051.8000500,22.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2461.8999000,-2043.5999800,23.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2424.6001000,-2044.5999800,21.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2418.1001000,-2048.6001000,20.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2418.6001000,-2045.4000200,20.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2399.1001000,-2049.8000500,17.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2396.5000000,-2050.8000500,17.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2386.6001000,-2046.1999500,14.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2386.8999000,-2050.1999500,15.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2383.3999000,-2048.3999000,14.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2382.5000000,-2112.3000500,-44.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2375.8999000,-2053.6001000,13.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2353.6001000,-2044.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2358.8999000,-2045.4000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2351.3000500,-2048.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2350.6999500,-2054.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2346.8000500,-2058.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2351.0000000,-2057.3999000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2350.3999000,-2040.4000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2347.8999000,-2040.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2336.8999000,-2050.8999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2333.6001000,-2053.6001000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2330.3000500,-2050.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2309.1999500,-2056.8999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2303.6001000,-2056.1999500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2306.1999500,-2059.1001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2293.6999500,-2070.1001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2290.1001000,-2073.1001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2290.5000000,-2067.6001000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2276.1001000,-2083.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2264.5000000,-2060.1001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2266.1001000,-2055.8999000,13.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2248.8999000,-2046.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2239.3000500,-2048.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2244.5000000,-2051.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2243.1999500,-2038.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2230.1001000,-2022.5000000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2224.1999500,-2024.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2226.0000000,-2021.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2215.8999000,-2007.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2211.8000500,-2007.5999800,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2212.8000500,-2002.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2271.5000000,-2086.8999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2266.8000500,-2096.1999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2271.6999500,-2098.3000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2239.3000500,-2118.8000500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2237.6001000,-2121.1999500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2237.0000000,-2116.1001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2222.0000000,-2141.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2226.1999500,-2141.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2219.8000500,-2145.6001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2207.8000500,-2144.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2203.3999000,-2150.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2208.8999000,-2148.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2204.0000000,-2164.1001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2208.3999000,-2169.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2199.5000000,-2166.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2204.6001000,-2169.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2199.5000000,-2175.6001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2198.3999000,-2179.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2187.1001000,-2146.8999000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2182.5000000,-2142.6001000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2178.6001000,-2146.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2166.0000000,-2144.8999000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2173.1999500,-2133.3000500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2151.5000000,-2123.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2146.6001000,-2128.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2152.6001000,-2120.1001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2147.1999500,-2122.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2140.3999000,-2119.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2138.0000000,-2122.5000000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2134.6999500,-2120.5000000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2112.1001000,-2106.6001000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2106.0000000,-2110.3000500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2103.3999000,-2105.8000500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2069.1001000,-2112.1001000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2067.3000500,-2107.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2067.6001000,-2115.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2063.3000500,-2109.3999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2065.3000500,-2113.1999500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2029.5000000,-2116.6001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2024.0000000,-2114.3999000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2022.3000500,-2118.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2003.4000200,-2109.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1999.0000000,-2106.1999500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1998.4000200,-2109.6001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2013.0000000,-2100.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1996.3000500,-2100.1001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1974.5000000,-2109.3999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1972.6999500,-2106.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1968.1999500,-2112.8999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1961.6999500,-2085.3999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1967.1999500,-2089.1999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1966.8000500,-2078.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1962.6999500,-2075.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1957.1999500,-2055.8999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1954.5000000,-2053.6001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1953.5000000,-2059.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1958.0999800,-2061.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1959.0999800,-2057.1001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1974.0999800,-2061.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1977.4000200,-2059.6001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1985.5000000,-2064.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1979.9000200,-2066.3999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1979.0999800,-2063.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1961.5999800,-2025.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1966.0000000,-2021.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1962.5000000,-2019.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1960.1999500,-1989.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1957.8000500,-1985.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1962.6999500,-1986.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1960.5000000,-1982.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1956.9000200,-1942.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1964.5999800,-1938.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1971.9000200,-1936.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1951.5000000,-1931.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1948.1999500,-1927.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1953.3000500,-1928.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1969.5999800,-1933.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1971.0999800,-1927.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1984.6999500,-1936.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1994.8000500,-1931.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1998.5000000,-1932.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1996.0999800,-1928.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2001.0999800,-1928.5999800,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2019.4000200,-1934.3000500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2020.6999500,-1938.0000000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2024.4000200,-1935.0000000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2042.1999500,-1933.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2040.8000500,-1935.8000500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2040.3000500,-1932.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1962.0000000,-1919.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1962.9000200,-1911.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1965.5000000,-1915.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1957.5999800,-1889.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1960.6999500,-1892.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1964.5000000,-1891.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1970.3000500,-1890.9000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1961.3000500,-1866.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1957.1999500,-1867.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1962.8000500,-1861.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1962.5999800,-1837.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1960.1999500,-1833.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1964.6999500,-1832.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,1969.5999800,-1837.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(2676,2549.1001000,-1933.8000500,12.5000000,0.0000000,0.0000000,115.9830000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2592.6001000,-1929.4000200,12.5000000,0.0000000,0.0000000,115.9830000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2611.3000500,-1934.6999500,12.5000000,0.0000000,0.0000000,215.9830000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2635.3999000,-1929.4000200,12.5000000,0.0000000,0.0000000,215.9800000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2670.1999500,-1932.0000000,12.5000000,0.0000000,0.0000000,175.9800000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2715.6999500,-1928.9000200,12.5000000,0.0000000,0.0000000,175.9790000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2708.1001000,-1938.0000000,12.4000000,0.0000000,0.0000000,175.9790000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2714.3999000,-1956.4000200,12.5000000,0.0000000,0.0000000,245.9790000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2712.6001000,-1970.3000500,12.5000000,0.0000000,0.0000000,295.9780000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2717.1999500,-1985.9000200,12.5000000,0.0000000,0.0000000,15.9770000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2700.1001000,-2001.3000500,12.5000000,0.0000000,0.0000000,75.9740000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2690.6999500,-2011.0000000,12.7000000,0.0000000,0.0000000,75.9700000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2681.1001000,-2011.5999800,12.7000000,0.0000000,0.0000000,155.9700000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2675.5000000,-2002.8000500,12.5000000,0.0000000,0.0000000,219.9670000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2667.6999500,-2004.0999800,12.5000000,0.0000000,0.0000000,289.9630000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2714.8000500,-2028.5999800,12.5000000,0.0000000,0.0000000,219.9630000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2709.1001000,-2043.3000500,12.5000000,0.0000000,0.0000000,219.9630000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2714.0000000,-2048.1001000,12.6000000,0.0000000,0.0000000,279.9630000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2721.8000500,-2051.5000000,12.6000000,0.0000000,0.0000000,359.9590000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2718.5000000,-2044.5999800,12.6000000,0.0000000,0.0000000,89.9560000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2698.6001000,-2051.5000000,12.6000000,0.0000000,0.0000000,89.9510000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2699.6999500,-2046.6999500,12.6000000,0.0000000,0.0000000,183.9510000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2590.6999500,-2047.6999500,23.4000000,0.0000000,0.0000000,219.9630000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2570.3999000,-2048.1001000,24.0000000,0.0000000,0.0000000,219.9630000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2566.3000500,-2047.5999800,24.0000000,0.0000000,0.0000000,309.9630000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2516.3000500,-2046.5999800,24.2000000,0.0000000,0.0000000,249.9570000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2568.0000000,-2050.3994100,24.0000000,0.0000000,0.0000000,249.9550000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2545.6999500,-2047.1999500,24.2000000,0.0000000,0.0000000,249.9550000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2474.1999500,-2050.0000000,23.6000000,0.0000000,0.0000000,249.9550000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2462.6999500,-2050.3999000,23.3000000,0.0000000,0.0000000,249.9550000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2351.0000000,-2050.3000500,12.5000000,0.0000000,0.0000000,249.9550000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2331.3000500,-2048.0000000,12.5000000,0.0000000,0.0000000,339.9550000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2325.1999500,-2051.3999000,12.5000000,0.0000000,0.0000000,239.9500000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2312.5000000,-2054.6001000,12.5000000,0.0000000,0.0000000,339.9470000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2294.8000500,-2066.5000000,12.6000000,0.0000000,0.0000000,61.9440000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2290.5000000,-2086.3000500,12.6000000,0.0000000,0.0000000,61.9410000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2290.1001000,-2082.3999000,12.6000000,0.0000000,0.0000000,141.9410000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2284.3999000,-2088.1999500,12.6000000,0.0000000,0.0000000,231.9380000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2277.8000500,-2080.6001000,12.6000000,0.0000000,0.0000000,291.9380000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2261.1999500,-2058.5000000,12.6000000,0.0000000,0.0000000,1.9340000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2259.6999500,-2053.1001000,12.6000000,0.0000000,0.0000000,41.9340000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2246.8000500,-2043.5000000,12.6000000,0.0000000,0.0000000,111.9290000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2232.3000500,-2028.1999500,12.6000000,0.0000000,0.0000000,173.9290000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2230.8000500,-2031.0000000,12.6000000,0.0000000,0.0000000,223.9250000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2220.3000500,-2017.0000000,12.6000000,0.0000000,0.0000000,223.9230000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2217.8999000,-2005.5000000,12.6000000,0.0000000,0.0000000,333.9230000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2242.1001000,-2117.6999500,12.4000000,0.0000000,0.0000000,333.9180000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2240.3999000,-2114.0000000,12.6000000,0.0000000,0.0000000,333.9180000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2218.6999500,-2145.6999500,12.5000000,0.0000000,0.0000000,333.9180000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2210.1001000,-2150.3999000,12.5000000,0.0000000,0.0000000,63.9130000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2201.6001000,-2163.6999500,12.5000000,0.0000000,0.0000000,155.9180000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2203.1001000,-2170.3000500,12.6000000,0.0000000,0.0000000,235.9180000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2181.6001000,-2149.1999500,12.6000000,0.0000000,0.0000000,235.9150000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2187.6999500,-2149.6001000,12.6000000,0.0000000,0.0000000,305.9150000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2154.1999500,-2122.8000500,12.5000000,0.0000000,0.0000000,305.9140000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2145.1001000,-2119.3000500,12.5000000,0.0000000,0.0000000,5.9140000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2121.1001000,-2112.3000500,12.5000000,0.0000000,0.0000000,5.9110000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2111.6999500,-2110.1001000,12.5000000,0.0000000,0.0000000,95.9110000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2100.8999000,-2107.6999500,12.5000000,0.0000000,0.0000000,45.9050000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2070.3999000,-2108.8000500,12.5000000,0.0000000,0.0000000,45.9010000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2061.5000000,-2107.1999500,12.5000000,0.0000000,0.0000000,85.9010000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2052.6999500,-2113.1001000,12.5000000,0.0000000,0.0000000,165.8970000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2027.3000500,-2113.8000500,12.5000000,0.0000000,0.0000000,215.8940000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2013.1999500,-2107.3000500,12.6000000,0.0000000,0.0000000,165.8920000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1999.0999800,-2110.6001000,12.6000000,0.0000000,0.0000000,225.8880000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1993.9000200,-2107.1001000,12.6000000,0.0000000,0.0000000,325.8840000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1975.4000200,-2111.3000500,12.6000000,0.0000000,0.0000000,325.8820000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1966.9000200,-2107.6001000,12.5000000,0.0000000,0.0000000,25.8820000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1961.5000000,-2113.0000000,12.5000000,0.0000000,0.0000000,105.8780000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1963.6999500,-2099.8999000,12.5000000,0.0000000,0.0000000,165.8750000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1959.5999800,-2093.8999000,12.5000000,0.0000000,0.0000000,245.8720000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1964.0000000,-2071.5000000,12.5000000,0.0000000,0.0000000,355.8690000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1959.8000500,-2059.1999500,12.5000000,0.0000000,0.0000000,75.8640000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1971.8000500,-2063.3000500,12.5000000,0.0000000,0.0000000,175.8610000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1977.0999800,-2066.0000000,12.5000000,0.0000000,0.0000000,175.8580000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1953.4000200,-2050.5000000,12.5000000,0.0000000,0.0000000,175.8580000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1964.4000200,-2027.0000000,12.5000000,0.0000000,0.0000000,175.8580000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1958.8000500,-2013.0999800,12.5000000,0.0000000,0.0000000,265.8580000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1963.4000200,-2012.5999800,12.5000000,0.0000000,0.0000000,315.8530000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1960.5000000,-1991.4000200,12.5000000,0.0000000,0.0000000,315.8510000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1968.9000200,-1990.5000000,12.7000000,0.0000000,0.0000000,25.8510000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1969.0000000,-1987.4000200,12.7000000,0.0000000,0.0000000,65.8510000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1969.0000000,-1981.1999500,12.7000000,0.0000000,0.0000000,155.8470000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1963.3000500,-1975.1999500,12.5000000,0.0000000,0.0000000,155.8470000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1961.5999800,-1958.5999800,13.0000000,0.0000000,0.0000000,155.8470000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1963.5999800,-1955.4000200,12.9000000,0.0000000,0.0000000,245.8470000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1961.3000500,-1954.3000500,12.9000000,0.0000000,0.0000000,305.8410000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1960.1999500,-1940.0000000,12.5000000,0.0000000,0.0000000,305.8370000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1966.6999500,-1934.8000500,12.5000000,0.0000000,0.0000000,45.8370000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1954.6999500,-1932.1999500,12.5000000,0.0000000,0.0000000,115.8350000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1996.9000200,-1939.6999500,12.5000000,0.0000000,0.0000000,115.8340000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2003.1999500,-1931.6999500,12.5000000,0.0000000,0.0000000,205.8340000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2023.5000000,-1938.5999800,12.5000000,0.0000000,0.0000000,255.8290000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2043.4000200,-1936.3000500,12.5000000,0.0000000,0.0000000,305.8280000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2050.6001000,-1930.5000000,12.5000000,0.0000000,0.0000000,305.8260000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2050.5996100,-1930.5000000,12.5000000,0.0000000,0.0000000,305.8260000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1960.9000200,-1914.6999500,12.5000000,0.0000000,0.0000000,115.8340000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1963.5999800,-1888.5000000,12.5000000,0.0000000,0.0000000,115.8340000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1959.8000500,-1892.6999500,12.5000000,0.0000000,0.0000000,115.8340000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1958.5000000,-1861.5999800,12.5000000,0.0000000,0.0000000,115.8340000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1960.8000500,-1869.8000500,12.5000000,0.0000000,0.0000000,115.8340000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1963.9000200,-1840.9000200,12.5000000,0.0000000,0.0000000,185.8340000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1958.3000500,-1825.4000200,12.5000000,0.0000000,0.0000000,275.8340000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1960.1999500,-1813.9000200,12.5000000,0.0000000,0.0000000,5.8340000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(3594,1959.3000500,-2133.3000500,13.0000000,0.0000000,0.0000000,3.9730000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1948.4000200,-2136.8000500,13.1000000,0.0000000,0.0000000,293.9720000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1948.0000000,-2128.0000000,13.1000000,0.0000000,0.0000000,243.9670000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1948.1999500,-2120.5000000,13.1000000,0.0000000,0.0000000,275.9620000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1942.5000000,-2114.8999000,13.1000000,0.0000000,0.0000000,305.9600000); //object(la_fuckcar1)(143)
	CreateDynamicObject(1299,1938.3000500,-2111.3000500,13.2000000,0.0000000,0.0000000,0.0000000); //object(smashboxpile)(11)
	CreateDynamicObject(1299,1936.1999500,-2111.0000000,13.2000000,0.0000000,0.0000000,30.0000000); //object(smashboxpile)(12)
	CreateDynamicObject(12957,1947.9000200,-2105.3999000,13.3000000,0.0000000,0.0000000,50.0000000); //object(sw_pickupwreck01)(10)
	CreateDynamicObject(1219,1941.5000000,-2121.0000000,12.9000000,0.0000000,0.0000000,0.0000000); //object(palette)(11)
	CreateDynamicObject(1219,1943.8000500,-2123.6001000,12.9000000,0.0000000,0.0000000,50.0000000); //object(palette)(12)
	CreateDynamicObject(1558,1926.5000000,-2113.3999000,13.2000000,0.0000000,0.0000000,30.0000000); //object(cj_cardbrd_pickup)(4)
	CreateDynamicObject(1558,1925.6999500,-2118.5000000,13.2000000,0.0000000,0.0000000,340.0000000); //object(cj_cardbrd_pickup)(5)
	CreateDynamicObject(1558,1926.1999500,-2116.8000500,13.2000000,0.0000000,0.0000000,50.0000000); //object(cj_cardbrd_pickup)(6)
	CreateDynamicObject(2673,1941.9000200,-2112.3999000,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_5)(1)
	CreateDynamicObject(2673,1941.1999500,-2110.3000500,12.8000000,0.0000000,0.0000000,130.0000000); //object(proc_rubbish_5)(2)
	CreateDynamicObject(2674,1951.0000000,-2117.3000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_2)(6)
	CreateDynamicObject(2674,1952.1999500,-2106.6999500,12.6000000,0.0000000,0.0000000,40.0000000); //object(proc_rubbish_2)(7)
	CreateDynamicObject(2674,1953.5000000,-2107.5000000,12.6000000,0.0000000,0.0000000,359.9960000); //object(proc_rubbish_2)(8)
	CreateDynamicObject(2674,1954.3000500,-2106.1999500,12.6000000,0.0000000,0.0000000,69.9950000); //object(proc_rubbish_2)(9)
	CreateDynamicObject(2674,1953.0999800,-2104.6999500,12.6000000,0.0000000,0.0000000,149.9940000); //object(proc_rubbish_2)(10)
	CreateDynamicObject(2676,1945.5999800,-2135.3999000,12.7000000,0.0000000,0.0000000,40.0000000); //object(proc_rubbish_8)(62)
	CreateDynamicObject(2676,1949.9000200,-2125.6999500,12.7000000,0.0000000,0.0000000,99.9960000); //object(proc_rubbish_8)(63)
	CreateDynamicObject(2676,1946.1999500,-2115.3999000,12.7000000,0.0000000,0.0000000,199.9920000); //object(proc_rubbish_8)(64)
	CreateDynamicObject(2677,1941.0999800,-2112.3999000,13.0000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(96)
	CreateDynamicObject(2677,1936.5999800,-2092.0000000,12.9000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(97)
	CreateDynamicObject(2677,1939.1999500,-2089.3000500,12.9000000,0.0000000,0.0000000,50.0000000); //object(proc_rubbish_7)(98)
	CreateDynamicObject(2677,1936.4000200,-2084.3999000,12.9000000,0.0000000,0.0000000,359.9990000); //object(proc_rubbish_7)(99)
	CreateDynamicObject(13591,1944.0000000,-2148.0000000,13.0000000,359.7500000,0.0000000,40.0000000); //object(kickcar28)(12)
	CreateDynamicObject(18249,1971.5999800,-2147.3000500,8.2000000,0.0000000,343.2500000,0.0000000); //object(cuntwjunk05)(10)
	CreateDynamicObject(18249,1971.5999800,-2129.8000500,8.2000000,0.0000000,343.2460000,0.0000000); //object(cuntwjunk05)(11)
	CreateDynamicObject(1763,1940.6999500,-2134.1999500,12.6000000,0.0000000,0.0000000,90.0000000); //object(low_couch_1)(5)
	CreateDynamicObject(1763,1941.3000500,-2131.6999500,12.6000000,0.0000000,0.0000000,30.0000000); //object(low_couch_1)(6)
	CreateDynamicObject(760,1944.5999800,-2145.1001000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_bush_small_1)(1)
	CreateDynamicObject(760,1941.8000500,-2153.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_bush_small_1)(2)
	CreateDynamicObject(760,1938.0999800,-2149.8000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_bush_small_1)(3)
	CreateDynamicObject(760,1948.4000200,-2145.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_bush_small_1)(4)
	CreateDynamicObject(760,1951.0000000,-2133.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_bush_small_1)(5)
	CreateDynamicObject(760,1946.5000000,-2124.6001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_bush_small_1)(6)
	CreateDynamicObject(760,1952.1999500,-2118.6999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_bush_small_1)(7)
	CreateDynamicObject(759,1947.5000000,-2103.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_bush_large_1)(1)
	CreateDynamicObject(761,1945.3000500,-2111.5000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(114)
	CreateDynamicObject(761,1950.9000200,-2127.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(209)
	CreateDynamicObject(761,1939.9000200,-2147.1001000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(210)
	CreateDynamicObject(761,1947.5000000,-2143.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(211)
	CreateDynamicObject(761,1946.8000500,-2139.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(212)
	CreateDynamicObject(761,1944.5000000,-2135.8999000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(213)
	CreateDynamicObject(761,1944.4000200,-2128.1001000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(214)
	CreateDynamicObject(761,1935.9000200,-2077.1001000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(215)
	CreateDynamicObject(806,1946.8000500,-2105.5000000,17.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(100)
	CreateDynamicObject(806,1946.6999500,-2147.5000000,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(101)
	CreateDynamicObject(818,1933.3000500,-2073.8000500,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass02)(10)
	CreateDynamicObject(3594,1967.9000200,-2162.1999500,13.0000000,0.0000000,0.0000000,53.9720000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1969.0000000,-2175.3999000,13.0000000,0.0000000,0.0000000,123.9700000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1954.0000000,-2174.8999000,13.0000000,0.0000000,0.0000000,251.9700000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1928.6992200,-2166.6992200,13.0000000,0.0000000,0.0000000,263.9690000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1991.0999800,-2167.1999500,13.0000000,0.0000000,0.0000000,113.9700000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2022.6999500,-2166.3000500,13.0000000,0.0000000,0.0000000,53.9670000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2057.5000000,-2168.3999000,13.0000000,0.0000000,0.0000000,103.9650000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2093.5000000,-2187.0000000,13.1000000,0.0000000,0.0000000,53.9640000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2120.3999000,-2196.0000000,13.0000000,0.0000000,0.0000000,93.9590000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2134.8000500,-2219.8000500,13.0000000,0.0000000,0.0000000,13.9550000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2157.6001000,-2209.1999500,13.0000000,0.0000000,0.0000000,123.9530000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2172.6999500,-2194.1001000,13.0000000,0.0000000,0.0000000,175.9480000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2189.3000500,-2179.1001000,13.0000000,0.0000000,0.0000000,105.9460000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2114.3999000,-2246.0000000,13.0000000,0.0000000,0.0000000,333.9530000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2097.8000500,-2275.3999000,13.0000000,0.0000000,0.0000000,3.9510000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2101.8000500,-2301.3000500,13.0000000,0.0000000,0.0000000,53.9500000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2099.1999500,-2322.1001000,13.0000000,0.0000000,0.0000000,3.9480000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2125.6001000,-2327.1999500,13.0000000,0.0000000,0.0000000,73.9440000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2158.1001000,-2341.8000500,13.0000000,0.0000000,0.0000000,113.9430000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2196.1001000,-2383.8999000,13.0000000,0.0000000,0.0000000,123.9350000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2191.3999000,-2367.3999000,13.0000000,0.0000000,0.0000000,343.9350000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2180.6001000,-2374.1001000,13.0000000,0.0000000,0.0000000,133.9320000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2209.3000500,-2340.1999500,13.0000000,0.0000000,0.0000000,123.9320000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2243.3000500,-2311.3000500,13.0000000,0.0000000,0.0000000,173.9310000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2263.8999000,-2293.1999500,13.0000000,0.0000000,0.0000000,163.9300000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2279.5000000,-2277.1001000,13.0000000,0.0000000,0.0000000,133.9270000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2217.3999000,-2184.6999500,13.0000000,0.0000000,0.0000000,17.9900000); //object(la_fuckcar1)(132)
	CreateDynamicObject(3594,2230.1001000,-2198.1001000,13.0000000,0.0000000,0.0000000,67.9900000); //object(la_fuckcar1)(132)
	CreateDynamicObject(3594,2253.8999000,-2221.6999500,13.0000000,0.0000000,0.0000000,17.9890000); //object(la_fuckcar1)(132)
	CreateDynamicObject(3594,2268.5000000,-2236.0000000,13.0000000,0.0000000,0.0000000,77.9850000); //object(la_fuckcar1)(132)
	CreateDynamicObject(761,1969.3000500,-2166.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(216)
	CreateDynamicObject(761,1968.0999800,-2160.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(217)
	CreateDynamicObject(761,1987.8000500,-2166.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(218)
	CreateDynamicObject(761,1995.1999500,-2168.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(219)
	CreateDynamicObject(761,2020.4000200,-2166.6001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(220)
	CreateDynamicObject(761,2051.3999000,-2168.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(221)
	CreateDynamicObject(761,2042.1999500,-2173.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(222)
	CreateDynamicObject(761,2044.0000000,-2170.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(223)
	CreateDynamicObject(761,2073.8000500,-2161.1001000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(224)
	CreateDynamicObject(761,2087.0000000,-2162.1001000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(225)
	CreateDynamicObject(761,2080.6999500,-2161.3999000,12.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(226)
	CreateDynamicObject(761,2088.8999000,-2185.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(227)
	CreateDynamicObject(761,2092.0000000,-2183.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(228)
	CreateDynamicObject(761,2097.3999000,-2188.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(229)
	CreateDynamicObject(761,2118.1001000,-2193.8999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(230)
	CreateDynamicObject(761,2122.1999500,-2198.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(231)
	CreateDynamicObject(761,2113.8999000,-2201.8999000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(232)
	CreateDynamicObject(761,2130.6001000,-2217.3999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(233)
	CreateDynamicObject(761,2135.8000500,-2216.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(234)
	CreateDynamicObject(761,2133.3000500,-2222.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(235)
	CreateDynamicObject(761,2156.8000500,-2212.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(236)
	CreateDynamicObject(761,2158.3999000,-2206.3999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(237)
	CreateDynamicObject(761,2162.6999500,-2208.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(238)
	CreateDynamicObject(761,2143.1001000,-2208.6001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(239)
	CreateDynamicObject(761,2171.1001000,-2198.1001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(240)
	CreateDynamicObject(761,2171.1999500,-2191.8999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(241)
	CreateDynamicObject(761,2175.3999000,-2191.6001000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(242)
	CreateDynamicObject(761,2185.1999500,-2178.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(243)
	CreateDynamicObject(761,2174.1999500,-2180.1001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(244)
	CreateDynamicObject(761,2177.3000500,-2182.3000500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(245)
	CreateDynamicObject(761,2118.1001000,-2243.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(246)
	CreateDynamicObject(761,2114.3999000,-2249.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(247)
	CreateDynamicObject(761,2112.6001000,-2245.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(248)
	CreateDynamicObject(761,2101.6001000,-2298.3999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(249)
	CreateDynamicObject(761,2100.1001000,-2274.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(250)
	CreateDynamicObject(761,2097.0000000,-2318.1001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(251)
	CreateDynamicObject(761,2120.1999500,-2325.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(252)
	CreateDynamicObject(761,2103.6999500,-2309.3999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(253)
	CreateDynamicObject(761,2099.1001000,-2301.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(254)
	CreateDynamicObject(761,2096.6999500,-2279.8999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(255)
	CreateDynamicObject(761,2101.6001000,-2325.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(256)
	CreateDynamicObject(761,2128.1999500,-2330.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(257)
	CreateDynamicObject(761,2131.3000500,-2326.8999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(258)
	CreateDynamicObject(761,2154.8000500,-2340.6001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(259)
	CreateDynamicObject(761,2160.8999000,-2343.6001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(260)
	CreateDynamicObject(761,2155.5000000,-2344.8999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(261)
	CreateDynamicObject(761,2190.5000000,-2364.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(262)
	CreateDynamicObject(761,2184.6001000,-2368.3999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(263)
	CreateDynamicObject(761,2182.1001000,-2369.8999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(264)
	CreateDynamicObject(761,2178.3999000,-2377.6001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2188.1001000,-2375.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(266)
	CreateDynamicObject(761,2208.5000000,-2343.3999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(267)
	CreateDynamicObject(761,2211.3999000,-2336.3999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(268)
	CreateDynamicObject(761,2241.3000500,-2312.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(269)
	CreateDynamicObject(761,2246.3000500,-2309.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(270)
	CreateDynamicObject(761,2261.1999500,-2294.3999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(271)
	CreateDynamicObject(761,2266.3999000,-2289.6001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(272)
	CreateDynamicObject(761,2279.6999500,-2279.6001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(273)
	CreateDynamicObject(761,2279.6001000,-2274.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(274)
	CreateDynamicObject(761,2283.6001000,-2275.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(275)
	CreateDynamicObject(761,2275.8999000,-2279.3999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(276)
	CreateDynamicObject(761,2270.8000500,-2238.8999000,12.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(277)
	CreateDynamicObject(761,2267.1999500,-2233.3999000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(278)
	CreateDynamicObject(761,2271.8999000,-2234.6001000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(279)
	CreateDynamicObject(761,2255.8999000,-2219.5000000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(280)
	CreateDynamicObject(761,2253.3999000,-2225.6001000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(281)
	CreateDynamicObject(761,2233.6999500,-2197.8000500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(282)
	CreateDynamicObject(761,2227.0000000,-2198.3999000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(283)
	CreateDynamicObject(761,2231.1001000,-2201.3000500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(284)
	CreateDynamicObject(761,2218.0000000,-2180.3000500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(285)
	CreateDynamicObject(761,2225.6999500,-2178.1001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(286)
	CreateDynamicObject(761,2229.1999500,-2184.1001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(287)
	CreateDynamicObject(761,2225.0000000,-2184.3999000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(288)
	CreateDynamicObject(761,2216.0000000,-2186.3000500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(289)
	CreateDynamicObject(761,2220.5000000,-2187.8999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(290)
	CreateDynamicObject(2676,2219.8000500,-2185.0000000,12.5000000,0.0000000,0.0000000,63.9130000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2230.1999500,-2195.1999500,12.5000000,0.0000000,0.0000000,63.9130000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2250.6999500,-2221.1001000,12.5000000,0.0000000,0.0000000,113.9130000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2246.6999500,-2223.1999500,12.7000000,0.0000000,0.0000000,143.9120000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2255.8000500,-2233.1001000,12.7000000,0.0000000,0.0000000,193.9100000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2263.0000000,-2228.3999000,12.5000000,0.0000000,0.0000000,193.9090000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2286.8999000,-2256.8999000,12.6000000,0.0000000,0.0000000,193.9090000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2294.3999000,-2253.1001000,12.6000000,0.0000000,0.0000000,253.9090000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2285.8999000,-2263.3999000,12.6000000,0.0000000,0.0000000,303.9050000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2283.1999500,-2273.3000500,12.6000000,0.0000000,0.0000000,353.9040000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2275.3999000,-2277.1999500,12.6000000,0.0000000,0.0000000,53.9030000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2268.3000500,-2288.6999500,12.6000000,0.0000000,0.0000000,113.8990000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2251.8999000,-2301.0000000,12.6000000,0.0000000,0.0000000,113.8950000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2248.3999000,-2308.1001000,12.6000000,0.0000000,0.0000000,183.8950000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2240.6001000,-2316.8999000,12.6000000,0.0000000,0.0000000,183.8950000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2223.8000500,-2326.6001000,12.6000000,0.0000000,0.0000000,213.8950000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2211.6999500,-2342.1999500,12.6000000,0.0000000,0.0000000,253.8930000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2158.6001000,-2345.3999000,12.5000000,0.0000000,0.0000000,303.8890000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2189.3999000,-2372.1001000,12.6000000,0.0000000,0.0000000,53.8870000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2185.8999000,-2374.8999000,12.5000000,0.0000000,0.0000000,103.8810000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2187.6992200,-2366.3994100,12.6000000,0.0000000,0.0000000,303.8870000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2155.1999500,-2338.5000000,12.5000000,0.0000000,0.0000000,353.8870000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2128.0000000,-2324.3999000,12.5000000,0.0000000,0.0000000,313.8860000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2102.6001000,-2322.6999500,12.5000000,0.0000000,0.0000000,3.8850000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2101.8000500,-2306.1999500,12.5000000,0.0000000,0.0000000,73.8840000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2098.8999000,-2295.6999500,12.5000000,0.0000000,0.0000000,123.8830000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2101.3999000,-2277.0000000,12.5000000,0.0000000,0.0000000,73.8820000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2117.1999500,-2247.6001000,12.5000000,0.0000000,0.0000000,133.8780000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2120.3000500,-2239.8999000,12.5000000,0.0000000,0.0000000,213.8740000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2137.8999000,-2219.3999000,12.5000000,0.0000000,0.0000000,293.8710000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2154.1999500,-2213.6001000,12.5000000,0.0000000,0.0000000,303.8680000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2154.8000500,-2207.5000000,12.5000000,0.0000000,0.0000000,33.8650000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2174.6001000,-2189.3999000,12.5000000,0.0000000,0.0000000,353.8650000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2190.5000000,-2175.3999000,12.5000000,0.0000000,0.0000000,43.8640000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2118.8999000,-2198.5000000,12.5000000,0.0000000,0.0000000,123.8630000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2116.1999500,-2192.0000000,12.5000000,0.0000000,0.0000000,65.8600000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2105.5000000,-2187.1001000,12.5000000,0.0000000,0.0000000,125.8580000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2095.1001000,-2185.0000000,12.5000000,0.0000000,0.0000000,125.8540000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2078.6999500,-2174.8999000,12.5000000,0.0000000,0.0000000,175.8540000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2077.8999000,-2171.5000000,12.5000000,0.0000000,0.0000000,235.8530000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2081.6999500,-2172.1001000,12.5000000,0.0000000,0.0000000,295.8490000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2060.1999500,-2170.3000500,12.5000000,0.0000000,0.0000000,5.8450000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2063.0000000,-2166.8999000,12.5000000,0.0000000,0.0000000,65.8450000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2054.0000000,-2165.6001000,12.5000000,0.0000000,0.0000000,115.8410000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2025.0999800,-2165.1999500,12.5000000,0.0000000,0.0000000,115.8400000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2018.1999500,-2167.0000000,12.5000000,0.0000000,0.0000000,235.8400000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1990.3000500,-2164.6001000,12.5000000,0.0000000,0.0000000,235.8380000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,1993.5999800,-2169.3999000,12.5000000,0.0000000,0.0000000,355.8380000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(971,1931.5000000,-2662.6992200,8.1000000,0.0000000,0.0000000,270.0000000); //object(subwaygate)(10)
	CreateDynamicObject(971,1931.3000500,-2677.6001000,8.1000000,0.0000000,0.0000000,270.0000000); //object(subwaygate)(11)
	CreateDynamicObject(971,1931.4000200,-2692.8000500,8.1000000,0.0000000,0.0000000,270.0000000); //object(subwaygate)(13)
	CreateDynamicObject(1413,1931.4000200,-2679.3999000,6.4000000,0.0000000,0.0000000,90.0000000); //object(dyn_mesh_3)(7)
	CreateDynamicObject(1413,1931.5000000,-2675.8999000,6.2000000,0.0000000,0.0000000,90.0000000); //object(dyn_mesh_3)(8)
	CreateDynamicObject(1413,1931.5000000,-2675.8999000,8.7000000,0.0000000,0.0000000,90.0000000); //object(dyn_mesh_3)(9)
	CreateDynamicObject(1413,1931.5000000,-2679.3999000,8.7000000,0.0000000,0.0000000,90.0000000); //object(dyn_mesh_3)(10)
	CreateDynamicObject(1413,1931.5000000,-2679.3999000,11.4000000,0.0000000,0.0000000,90.0000000); //object(dyn_mesh_3)(11)
	CreateDynamicObject(1413,1931.4000200,-2675.8000500,11.4000000,0.0000000,0.0000000,90.0000000); //object(dyn_mesh_3)(12)
	CreateDynamicObject(1413,1931.5999800,-2664.3999000,6.3000000,0.0000000,0.0000000,90.0000000); //object(dyn_mesh_3)(13)
	CreateDynamicObject(1413,1931.5999800,-2664.3999000,8.0000000,0.0000000,0.0000000,90.0000000); //object(dyn_mesh_3)(14)
	CreateDynamicObject(1413,1931.5999800,-2664.3999000,10.2000000,0.0000000,0.0000000,90.0000000); //object(dyn_mesh_3)(15)
	CreateDynamicObject(1413,1931.4000200,-2691.0000000,6.1000000,0.0000000,0.0000000,90.0000000); //object(dyn_mesh_3)(16)
	CreateDynamicObject(1413,1931.4000200,-2691.0000000,8.4000000,0.0000000,0.0000000,90.0000000); //object(dyn_mesh_3)(17)
	CreateDynamicObject(1413,1931.4000200,-2691.0000000,10.7000000,0.0000000,0.0000000,90.0000000); //object(dyn_mesh_3)(18)
	CreateDynamicObject(1413,1931.3000500,-2684.5000000,10.6000000,0.0000000,0.0000000,90.0000000); //object(dyn_mesh_3)(19)
	CreateDynamicObject(1413,1931.4000200,-2688.1001000,10.6000000,0.0000000,0.0000000,90.0000000); //object(dyn_mesh_3)(20)
	CreateDynamicObject(1413,1931.3994100,-2673.0996100,10.6000000,0.0000000,0.0000000,90.0000000); //object(dyn_mesh_3)(21)
	CreateDynamicObject(1413,1931.5000000,-2669.1001000,10.6000000,0.0000000,0.0000000,90.0000000); //object(dyn_mesh_3)(22)
	CreateDynamicObject(1424,1933.3000500,-2673.3999000,5.6000000,0.0000000,0.0000000,270.0000000); //object(dyn_roadbarrier_2)(15)
	CreateDynamicObject(1424,1933.6999500,-2666.3999000,5.6000000,0.0000000,0.0000000,250.0000000); //object(dyn_roadbarrier_2)(16)
	CreateDynamicObject(1424,1934.1999500,-2681.1999500,5.6000000,0.0000000,0.0000000,249.9990000); //object(dyn_roadbarrier_2)(17)
	CreateDynamicObject(1424,1933.8000500,-2688.1999500,5.6000000,0.0000000,0.0000000,309.9990000); //object(dyn_roadbarrier_2)(18)
	CreateDynamicObject(778,1935.8000500,-2676.3000500,4.4000000,0.0000000,0.0000000,0.0000000); //object(elmred_hism)(1)
	CreateDynamicObject(761,1934.1999500,-2675.6999500,5.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(292)
	CreateDynamicObject(761,1934.0000000,-2664.3000500,5.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(293)
	CreateDynamicObject(761,1933.5000000,-2679.0000000,5.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(295)
	CreateDynamicObject(761,1934.0999800,-2689.8000500,5.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(297)
	CreateDynamicObject(761,1933.1999500,-2691.3999000,5.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(298)
	CreateDynamicObject(806,1935.0000000,-2690.8999000,9.1000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(103)
	CreateDynamicObject(806,1933.7998000,-2675.2998000,9.0000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(104)
	CreateDynamicObject(818,1942.2998000,-2677.0996100,9.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass02)(11)
	CreateDynamicObject(1413,1928.8000500,-2665.1999500,6.2000000,0.0000000,0.0000000,0.0000000); //object(dyn_mesh_3)(23)
	CreateDynamicObject(1413,1923.5000000,-2665.1001000,6.2000000,0.0000000,0.0000000,0.0000000); //object(dyn_mesh_3)(24)
	CreateDynamicObject(1413,1918.1999500,-2665.1001000,6.2000000,0.0000000,0.0000000,0.0000000); //object(dyn_mesh_3)(25)
	CreateDynamicObject(1413,1928.6999500,-2674.8999000,6.2000000,0.0000000,0.0000000,180.0000000); //object(dyn_mesh_3)(26)
	CreateDynamicObject(1413,1923.5000000,-2674.8999000,6.2000000,0.0000000,0.0000000,179.9950000); //object(dyn_mesh_3)(27)
	CreateDynamicObject(1413,1918.1999500,-2674.8000500,6.2000000,0.0000000,0.0000000,179.9950000); //object(dyn_mesh_3)(28)
	CreateDynamicObject(1447,1913.3994100,-2673.0996100,6.2000000,0.0000000,0.0000000,139.9990000); //object(dyn_mesh_4)(6)
	CreateDynamicObject(1447,1913.5000000,-2666.6001000,6.2000000,0.0000000,0.0000000,31.9990000); //object(dyn_mesh_4)(7)
	CreateDynamicObject(1447,1928.6999500,-2681.6001000,6.2000000,0.0000000,0.0000000,350.0000000); //object(dyn_mesh_4)(8)
	CreateDynamicObject(1447,1928.8000500,-2688.8000500,6.2000000,0.0000000,0.0000000,189.9970000); //object(dyn_mesh_4)(9)
	CreateDynamicObject(1424,1914.5999800,-2667.6999500,5.6000000,0.0000000,0.0000000,30.0000000); //object(dyn_roadbarrier_2)(19)
	CreateDynamicObject(1424,1914.5000000,-2672.1999500,5.6000000,0.0000000,0.0000000,119.9970000); //object(dyn_roadbarrier_2)(20)
	CreateDynamicObject(18255,1884.1999500,-2674.6999500,5.9000000,0.0000000,0.0000000,270.0000000); //object(cuntwjunk11)(2)
	CreateDynamicObject(18255,1886.3000500,-2679.6001000,5.9000000,0.0000000,0.0000000,90.5000000); //object(cuntwjunk11)(3)
	CreateDynamicObject(1413,1916.0000000,-2677.1999500,6.2000000,0.0000000,0.0000000,115.4950000); //object(dyn_mesh_3)(29)
	CreateDynamicObject(1413,1916.0000000,-2677.1999500,8.6000000,0.0000000,0.0000000,115.4940000); //object(dyn_mesh_3)(30)
	CreateDynamicObject(1413,1916.0000000,-2677.1999500,11.1000000,0.0000000,0.0000000,115.4940000); //object(dyn_mesh_3)(31)
	CreateDynamicObject(3406,1927.0999800,-2678.5000000,11.2000000,0.0000000,0.0000000,0.0000000); //object(cxref_woodjetty)(1)
	CreateDynamicObject(3406,1927.1999500,-2676.3999000,11.2000000,0.0000000,0.0000000,0.0000000); //object(cxref_woodjetty)(2)
	CreateDynamicObject(971,1575.0999800,-2666.8000500,8.5000000,0.0000000,0.0000000,270.0000000); //object(subwaygate)(14)
	CreateDynamicObject(971,1575.0999800,-2675.8999000,8.5000000,0.0000000,0.0000000,270.0000000); //object(subwaygate)(15)
	CreateDynamicObject(971,1575.0999800,-2685.3000500,8.5000000,0.0000000,0.0000000,270.0000000); //object(subwaygate)(16)
	CreateDynamicObject(971,1575.0000000,-2695.1001000,8.5000000,0.0000000,0.0000000,270.0000000); //object(subwaygate)(17)
	CreateDynamicObject(1413,1575.0000000,-2665.0000000,6.5000000,0.0000000,0.0000000,270.0000000); //object(dyn_mesh_3)(32)
	CreateDynamicObject(1413,1575.0000000,-2665.0000000,8.8000000,0.0000000,0.0000000,270.0000000); //object(dyn_mesh_3)(33)
	CreateDynamicObject(1413,1575.0000000,-2665.0000000,11.1000000,0.0000000,0.0000000,270.0000000); //object(dyn_mesh_3)(34)
	CreateDynamicObject(1413,1575.0999800,-2670.3000500,11.1000000,0.0000000,0.0000000,270.0000000); //object(dyn_mesh_3)(35)
	CreateDynamicObject(1413,1575.0999800,-2670.3000500,8.7000000,0.0000000,0.0000000,270.0000000); //object(dyn_mesh_3)(36)
	CreateDynamicObject(1413,1575.0999800,-2670.3000500,6.2000000,0.0000000,0.0000000,270.0000000); //object(dyn_mesh_3)(37)
	CreateDynamicObject(1413,1575.0999800,-2675.6001000,6.2000000,0.0000000,0.0000000,270.0000000); //object(dyn_mesh_3)(38)
	CreateDynamicObject(1413,1575.0999800,-2675.6001000,8.7000000,0.0000000,0.0000000,270.0000000); //object(dyn_mesh_3)(39)
	CreateDynamicObject(1413,1575.0999800,-2675.6001000,11.1000000,0.0000000,0.0000000,270.0000000); //object(dyn_mesh_3)(40)
	CreateDynamicObject(1413,1575.0999800,-2680.3999000,6.6000000,0.0000000,0.0000000,270.0000000); //object(dyn_mesh_3)(41)
	CreateDynamicObject(1413,1575.0999800,-2680.3999000,9.2000000,0.0000000,0.0000000,270.0000000); //object(dyn_mesh_3)(42)
	CreateDynamicObject(1413,1575.0999800,-2680.3999000,11.6000000,0.0000000,0.0000000,270.0000000); //object(dyn_mesh_3)(43)
	CreateDynamicObject(1413,1575.0999800,-2685.5000000,6.1000000,0.0000000,0.0000000,270.0000000); //object(dyn_mesh_3)(44)
	CreateDynamicObject(1413,1575.0999800,-2685.5000000,8.5000000,0.0000000,0.0000000,270.0000000); //object(dyn_mesh_3)(45)
	CreateDynamicObject(1413,1575.0999800,-2685.5000000,10.9000000,0.0000000,0.0000000,270.0000000); //object(dyn_mesh_3)(46)
	CreateDynamicObject(1413,1575.0000000,-2690.5000000,10.9000000,0.0000000,0.0000000,270.0000000); //object(dyn_mesh_3)(47)
	CreateDynamicObject(1413,1575.0000000,-2690.5000000,8.6000000,0.0000000,0.0000000,270.0000000); //object(dyn_mesh_3)(48)
	CreateDynamicObject(1413,1575.0000000,-2690.5000000,5.9000000,0.0000000,0.0000000,270.0000000); //object(dyn_mesh_3)(49)
	CreateDynamicObject(853,1910.3000500,-2673.0000000,5.3000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_5)(6)
	CreateDynamicObject(853,1924.9000200,-2688.1999500,5.3000000,0.0000000,0.0000000,90.0000000); //object(cj_urb_rub_5)(7)
	CreateDynamicObject(850,1916.3000500,-2681.8000500,5.0000000,0.0000000,0.0000000,300.0000000); //object(cj_urb_rub_1)(13)
	CreateDynamicObject(850,1906.0000000,-2688.6001000,5.0000000,0.0000000,0.0000000,61.9980000); //object(cj_urb_rub_1)(14)
	CreateDynamicObject(850,1910.0999800,-2666.5000000,5.0000000,0.0000000,0.0000000,111.9960000); //object(cj_urb_rub_1)(15)
	CreateDynamicObject(850,1899.8000500,-2670.6001000,5.0000000,0.0000000,0.0000000,173.9950000); //object(cj_urb_rub_1)(16)
	CreateDynamicObject(3035,1894.0999800,-2673.1001000,5.7000000,0.0000000,0.0000000,0.0000000); //object(tmp_bin)(11)
	CreateDynamicObject(3035,1891.8000500,-2673.1999500,5.7000000,0.0000000,0.0000000,0.0000000); //object(tmp_bin)(12)
	CreateDynamicObject(3035,1889.5000000,-2673.1999500,5.6000000,0.0000000,0.0000000,0.0000000); //object(tmp_bin)(13)
	CreateDynamicObject(3005,1895.8000500,-2672.3999000,4.9000000,0.0000000,0.0000000,0.0000000); //object(smash_box_stay)(1)
	CreateDynamicObject(2971,1886.9000200,-2672.8000500,4.9000000,0.0000000,0.0000000,0.0000000); //object(k_smashboxes)(17)
	CreateDynamicObject(1777,1879.8000500,-2665.5000000,5.7000000,0.0000000,0.0000000,0.0000000); //object(cj_cooker1)(1)
	CreateDynamicObject(1462,1881.0000000,-2666.1999500,4.9000000,0.0000000,0.0000000,100.0000000); //object(dyn_woodpile)(1)
	CreateDynamicObject(1450,1880.1999500,-2666.8000500,5.5000000,0.0000000,0.0000000,275.0000000); //object(dyn_crate_3)(4)
	CreateDynamicObject(1441,1877.6999500,-2665.5000000,5.5000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile_4)(13)
	CreateDynamicObject(1440,1875.3000500,-2673.5000000,5.4000000,0.0000000,0.0000000,180.0000000); //object(dyn_box_pile_3)(28)
	CreateDynamicObject(1439,1869.5999800,-2665.6999500,4.9000000,0.0000000,0.0000000,0.0000000); //object(dyn_dumpster_1)(6)
	CreateDynamicObject(1439,1867.6999500,-2667.8000500,4.9000000,0.0000000,0.0000000,90.0000000); //object(dyn_dumpster_1)(7)
	CreateDynamicObject(1438,1856.9000200,-2673.0000000,4.9000000,0.0000000,0.0000000,170.0000000); //object(dyn_box_pile_2)(13)
	CreateDynamicObject(1431,1865.8000500,-2668.6999500,5.4000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile)(9)
	CreateDynamicObject(1415,1860.4599600,-2665.6345200,4.9672300,0.0000000,0.0000000,0.0000000); //object(dyn_dumpster)(4)
	CreateDynamicObject(1369,1858.4000200,-2666.8999000,5.5000000,0.0000000,0.0000000,32.0000000); //object(cj_wheelchair1)(8)
	CreateDynamicObject(1365,1848.6999500,-2673.1999500,6.0000000,0.0000000,0.0000000,0.0000000); //object(cj_big_skip1)(3)
	CreateDynamicObject(1358,1841.5000000,-2666.6001000,6.1000000,0.0000000,0.0000000,0.0000000); //object(cj_skip_rubbish)(6)
	CreateDynamicObject(1299,1837.5000000,-2667.5000000,5.3000000,0.0000000,0.0000000,0.0000000); //object(smashboxpile)(13)
	CreateDynamicObject(12957,1835.0999800,-2673.1999500,5.6000000,0.0000000,0.0000000,122.0000000); //object(sw_pickupwreck01)(11)
	CreateDynamicObject(1265,1837.5999800,-2672.8999000,5.3000000,0.0000000,0.0000000,0.0000000); //object(blackbag2)(1)
	CreateDynamicObject(1265,1837.9000200,-2671.6999500,5.3000000,0.0000000,0.0000000,90.0000000); //object(blackbag2)(2)
	CreateDynamicObject(939,1848.5999800,-2666.1999500,7.3000000,0.0000000,0.0000000,0.0000000); //object(cj_df_unit)(5)
	CreateDynamicObject(1365,1874.1999500,-2687.1999500,6.0000000,0.0000000,0.0000000,0.0000000); //object(cj_big_skip1)(4)
	CreateDynamicObject(1415,1860.0000000,-2680.8999000,5.0000000,0.0000000,0.0000000,0.0000000); //object(dyn_dumpster)(6)
	CreateDynamicObject(1415,1857.4000200,-2680.6001000,5.0000000,0.0000000,0.0000000,0.0000000); //object(dyn_dumpster)(7)
	CreateDynamicObject(1369,1861.6999500,-2681.1001000,5.5000000,0.0000000,0.0000000,31.9980000); //object(cj_wheelchair1)(9)
	CreateDynamicObject(1369,1878.3000500,-2688.3999000,5.5000000,0.0000000,0.0000000,131.9980000); //object(cj_wheelchair1)(10)
	CreateDynamicObject(939,1854.8000500,-2688.8999000,7.3000000,0.0000000,0.0000000,0.0000000); //object(cj_df_unit)(6)
	CreateDynamicObject(1299,1849.5999800,-2689.1999500,5.3000000,0.0000000,0.0000000,0.0000000); //object(smashboxpile)(14)
	CreateDynamicObject(1299,1860.0999800,-2689.0000000,5.3000000,0.0000000,0.0000000,80.0000000); //object(smashboxpile)(15)
	CreateDynamicObject(1358,1845.3000500,-2686.5000000,6.1000000,0.0000000,0.0000000,288.0000000); //object(cj_skip_rubbish)(7)
	CreateDynamicObject(1431,1869.5999800,-2680.6001000,5.4000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile)(10)
	CreateDynamicObject(1431,1871.0000000,-2681.3999000,5.4000000,0.0000000,0.0000000,50.0000000); //object(dyn_box_pile)(11)
	CreateDynamicObject(1439,1878.6999500,-2686.8000500,4.9000000,0.0000000,0.0000000,140.0000000); //object(dyn_dumpster_1)(8)
	CreateDynamicObject(1440,1885.5000000,-2689.1001000,5.4000000,0.0000000,0.0000000,179.9950000); //object(dyn_box_pile_3)(29)
	CreateDynamicObject(1441,1882.8000500,-2680.6999500,5.5000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile_4)(15)
	CreateDynamicObject(942,1890.4000200,-2681.3999000,7.3000000,0.0000000,0.0000000,0.0000000); //object(cj_df_unit_2)(6)
	CreateDynamicObject(942,1900.9000200,-2688.5000000,7.3000000,0.0000000,0.0000000,0.0000000); //object(cj_df_unit_2)(7)
	CreateDynamicObject(1572,1897.0999800,-2687.6001000,5.5000000,0.0000000,0.0000000,0.0000000); //object(cj_air_trolly)(1)
	CreateDynamicObject(1572,1894.1999500,-2687.8999000,5.5000000,0.0000000,0.0000000,60.0000000); //object(cj_air_trolly)(2)
	CreateDynamicObject(1572,1891.4000200,-2688.3000500,5.5000000,0.0000000,0.0000000,19.9960000); //object(cj_air_trolly)(3)
	CreateDynamicObject(1558,1894.0999800,-2681.1999500,5.5000000,0.0000000,0.0000000,0.0000000); //object(cj_cardbrd_pickup)(7)
	CreateDynamicObject(1558,1895.5999800,-2680.8000500,5.5000000,0.0000000,0.0000000,50.0000000); //object(cj_cardbrd_pickup)(8)
	CreateDynamicObject(1558,1894.0999800,-2682.8000500,5.5000000,0.0000000,0.0000000,149.9990000); //object(cj_cardbrd_pickup)(9)
	CreateDynamicObject(2672,1901.6999500,-2682.1999500,5.2000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(122)
	CreateDynamicObject(2672,1879.9000200,-2687.6999500,5.1000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(123)
	CreateDynamicObject(2672,1863.0000000,-2681.8999000,5.1000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(124)
	CreateDynamicObject(2672,1847.4000200,-2685.3999000,5.1000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(125)
	CreateDynamicObject(2672,1844.5999800,-2667.6001000,5.1000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(126)
	CreateDynamicObject(2672,1862.9000200,-2672.5000000,5.2000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(127)
	CreateDynamicObject(2672,1865.5000000,-2667.1999500,5.2000000,0.0000000,0.0000000,70.0000000); //object(proc_rubbish_4)(128)
	CreateDynamicObject(2672,1877.4000200,-2672.5000000,5.2000000,0.0000000,0.0000000,69.9990000); //object(proc_rubbish_4)(129)
	CreateDynamicObject(2672,1882.3000500,-2667.1001000,5.2000000,0.0000000,0.0000000,69.9990000); //object(proc_rubbish_4)(130)
	CreateDynamicObject(2674,1891.8000500,-2683.3999000,4.9000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_2)(11)
	CreateDynamicObject(2674,1884.5000000,-2681.8999000,4.9000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_2)(12)
	CreateDynamicObject(2676,1916.6999500,-2688.1999500,5.1000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(65)
	CreateDynamicObject(2676,1912.0000000,-2682.3999000,5.1000000,0.0000000,0.0000000,66.0000000); //object(proc_rubbish_8)(66)
	CreateDynamicObject(12957,1817.8000500,-2687.6001000,5.6000000,0.0000000,0.0000000,261.9980000); //object(sw_pickupwreck01)(12)
	CreateDynamicObject(1447,1827.0000000,-2664.8999000,6.2000000,0.0000000,0.0000000,75.9990000); //object(dyn_mesh_4)(6)
	CreateDynamicObject(1447,1826.4000200,-2675.5000000,6.2000000,0.0000000,0.0000000,125.9980000); //object(dyn_mesh_4)(6)
	CreateDynamicObject(1447,1826.8000500,-2680.1001000,6.2000000,0.0000000,0.0000000,65.9970000); //object(dyn_mesh_4)(6)
	CreateDynamicObject(1447,1827.1999500,-2690.1999500,6.2000000,0.0000000,0.0000000,115.9950000); //object(dyn_mesh_4)(6)
	CreateDynamicObject(2676,1827.5999800,-2672.8000500,5.0000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(68)
	CreateDynamicObject(2676,1822.5000000,-2682.3000500,5.0000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(69)
	CreateDynamicObject(2676,1810.0999800,-2670.5000000,5.0000000,0.0000000,0.0000000,70.0000000); //object(proc_rubbish_8)(70)
	CreateDynamicObject(2676,1804.3000500,-2687.6001000,5.0000000,0.0000000,0.0000000,119.9990000); //object(proc_rubbish_8)(71)
	CreateDynamicObject(2676,1790.4000200,-2672.6001000,5.0000000,0.0000000,0.0000000,119.9980000); //object(proc_rubbish_8)(72)
	CreateDynamicObject(13591,1797.3000500,-2668.6001000,5.1000000,0.0000000,0.0000000,0.0000000); //object(kickcar28)(13)
	CreateDynamicObject(13591,1782.5999800,-2669.0000000,5.2000000,0.0000000,0.0000000,150.0000000); //object(kickcar28)(14)
	CreateDynamicObject(18249,1792.3000500,-2677.5000000,1.1000000,0.0000000,0.0000000,90.0000000); //object(cuntwjunk05)(12)
	CreateDynamicObject(18253,1806.1999500,-2690.8000500,6.7000000,0.0000000,0.0000000,270.0000000); //object(cuntwjunk09)(1)
	CreateDynamicObject(952,1811.5000000,-2686.0000000,6.2000000,0.0000000,0.0000000,270.0000000); //object(generator_big_d)(1)
	CreateDynamicObject(928,1801.4000200,-2685.5000000,5.1000000,0.0000000,0.0000000,0.0000000); //object(rubbish_box1)(6)
	CreateDynamicObject(926,1800.0000000,-2686.3999000,5.1000000,0.0000000,0.0000000,50.0000000); //object(rubbish_box2)(7)
	CreateDynamicObject(910,1800.9000200,-2680.8000500,6.1000000,0.0000000,0.0000000,0.0000000); //object(bust_cabinet_4)(6)
	CreateDynamicObject(2971,1797.3000500,-2688.3000500,4.9000000,0.0000000,0.0000000,0.0000000); //object(k_smashboxes)(18)
	CreateDynamicObject(2971,1798.1999500,-2681.8999000,4.9000000,0.0000000,0.0000000,50.0000000); //object(k_smashboxes)(19)
	CreateDynamicObject(2676,1741.3000500,-2666.6999500,5.0000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(73)
	CreateDynamicObject(2676,1794.1999500,-2687.6001000,5.0000000,0.0000000,0.0000000,80.0000000); //object(proc_rubbish_8)(74)
	CreateDynamicObject(1372,1785.1999500,-2680.6001000,4.9000000,0.0000000,0.0000000,0.0000000); //object(cj_dump2_low)(5)
	CreateDynamicObject(1372,1783.5999800,-2680.5000000,4.9000000,0.0000000,0.0000000,0.0000000); //object(cj_dump2_low)(6)
	CreateDynamicObject(1369,1782.0999800,-2688.8000500,5.5000000,0.0000000,0.0000000,140.0000000); //object(cj_wheelchair1)(11)
	CreateDynamicObject(1370,1784.0000000,-2688.8999000,5.4000000,0.0000000,0.0000000,0.0000000); //object(cj_flame_drum)(1)
	CreateDynamicObject(1358,1778.0000000,-2681.8999000,6.1000000,0.0000000,0.0000000,0.0000000); //object(cj_skip_rubbish)(8)
	CreateDynamicObject(976,1770.3000500,-2668.5000000,4.9000000,0.0000000,0.0000000,282.0000000); //object(phils_compnd_gate)(1)
	CreateDynamicObject(976,1770.3000500,-2668.3999000,4.9000000,0.0000000,0.0000000,51.9970000); //object(phils_compnd_gate)(2)
	CreateDynamicObject(976,1772.0999800,-2686.5000000,4.9000000,0.0000000,0.0000000,255.9970000); //object(phils_compnd_gate)(3)
	CreateDynamicObject(1407,1771.6999500,-2688.6001000,5.7000000,0.0000000,0.0000000,70.0000000); //object(dyn_f_r_wood_1)(3)
	CreateDynamicObject(1413,1780.4000200,-2677.8000500,6.3000000,0.0000000,0.0000000,0.0000000); //object(dyn_mesh_3)(50)
	CreateDynamicObject(1413,1775.0000000,-2677.6999500,6.3000000,0.0000000,0.0000000,0.0000000); //object(dyn_mesh_3)(51)
	CreateDynamicObject(1424,1771.8000500,-2685.3999000,5.4000000,0.0000000,0.0000000,0.0000000); //object(dyn_roadbarrier_2)(21)
	CreateDynamicObject(1424,1770.9000200,-2685.5000000,5.4000000,0.0000000,0.0000000,110.0000000); //object(dyn_roadbarrier_2)(22)
	CreateDynamicObject(1424,1770.5999800,-2682.1999500,5.4000000,0.0000000,0.0000000,69.9950000); //object(dyn_roadbarrier_2)(23)
	CreateDynamicObject(16337,1765.5000000,-2687.8000500,4.9000000,0.0000000,0.0000000,270.0000000); //object(des_cranecontrol)(3)
	CreateDynamicObject(16088,1750.4000200,-2685.1001000,5.1000000,0.0000000,0.0000000,0.0000000); //object(des_pipestrut01)(1)
	CreateDynamicObject(16088,1750.4000200,-2669.8999000,5.1000000,0.0000000,0.0000000,0.0000000); //object(des_pipestrut01)(2)
	CreateDynamicObject(920,1748.3000500,-2678.6999500,5.6000000,0.0000000,0.0000000,0.0000000); //object(y_generator)(3)
	CreateDynamicObject(934,1741.0999800,-2686.8999000,6.2000000,0.0000000,0.0000000,0.0000000); //object(generator_big)(1)
	CreateDynamicObject(934,1737.6999500,-2686.5000000,6.2000000,0.0000000,0.0000000,0.0000000); //object(generator_big)(2)
	CreateDynamicObject(934,1734.5000000,-2686.6001000,6.2000000,0.0000000,0.0000000,0.0000000); //object(generator_big)(3)
	CreateDynamicObject(1353,1731.5000000,-2674.5000000,5.6000000,0.0000000,0.0000000,0.0000000); //object(cj_aircon)(2)
	CreateDynamicObject(1353,1729.5999800,-2674.5000000,5.6000000,0.0000000,0.0000000,0.0000000); //object(cj_aircon)(3)
	CreateDynamicObject(1688,1737.8000500,-2665.8000500,5.9000000,0.0000000,0.0000000,0.0000000); //object(gen_roofbit2)(2)
	CreateDynamicObject(1688,1733.3000500,-2665.8999000,5.9000000,0.0000000,0.0000000,0.0000000); //object(gen_roofbit2)(3)
	CreateDynamicObject(2649,1743.3000500,-2664.1001000,5.4000000,0.0000000,0.0000000,269.7500000); //object(cj_aircon2)(2)
	CreateDynamicObject(3214,1717.4000200,-2670.6999500,12.9000000,0.0000000,0.0000000,90.0000000); //object(quarry_crusher)(2)
	CreateDynamicObject(3287,1713.4000200,-2687.8999000,9.6000000,0.0000000,0.0000000,90.0000000); //object(cxrf_oiltank)(2)
	CreateDynamicObject(3675,1720.0000000,-2687.8999000,11.7000000,0.0000000,0.0000000,0.0000000); //object(laxrf_refinerypipe)(1)
	CreateDynamicObject(16309,1701.6999500,-2687.8000500,4.5000000,0.0000000,0.0000000,0.0000000); //object(des_quarrybelt11)(1)
	CreateDynamicObject(16342,1699.5999800,-2670.1001000,8.1000000,0.0000000,0.0000000,0.0000000); //object(dam_genturbine04)(1)
	CreateDynamicObject(16342,1679.1999500,-2670.6001000,8.1000000,0.0000000,0.0000000,0.0000000); //object(dam_genturbine04)(2)
	CreateDynamicObject(16342,1655.0999800,-2669.8999000,8.1000000,0.0000000,0.0000000,0.0000000); //object(dam_genturbine04)(3)
	CreateDynamicObject(16666,1659.6999500,-2684.6001000,4.8000000,0.0000000,0.0000000,90.0000000); //object(a51_machines)(1)
	CreateDynamicObject(930,1674.4000200,-2673.8999000,5.3000000,0.0000000,0.0000000,0.0000000); //object(o2_bottles)(4)
	CreateDynamicObject(930,1673.0999800,-2674.0000000,5.3000000,0.0000000,0.0000000,0.0000000); //object(o2_bottles)(5)
	CreateDynamicObject(931,1671.1999500,-2673.0000000,5.9000000,0.0000000,0.0000000,0.0000000); //object(rack3)(1)
	CreateDynamicObject(931,1663.4000200,-2673.8999000,5.9000000,0.0000000,0.0000000,0.0000000); //object(rack3)(2)
	CreateDynamicObject(1689,1645.0999800,-2687.8000500,6.1000000,0.0000000,0.0000000,0.0000000); //object(gen_roofbit3)(1)
	CreateDynamicObject(3287,1666.6999500,-2662.3999000,9.4000000,0.0000000,0.0000000,0.0000000); //object(cxrf_oiltank)(4)
	CreateDynamicObject(2676,1717.6999500,-2670.8000500,5.0000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(75)
	CreateDynamicObject(2676,1704.6999500,-2672.1999500,5.0000000,0.0000000,0.0000000,110.0000000); //object(proc_rubbish_8)(76)
	CreateDynamicObject(2676,1684.1999500,-2687.0000000,5.0000000,0.0000000,0.0000000,109.9950000); //object(proc_rubbish_8)(77)
	CreateDynamicObject(2676,1662.5999800,-2683.8999000,5.0000000,0.0000000,0.0000000,109.9950000); //object(proc_rubbish_8)(78)
	CreateDynamicObject(2676,1670.5000000,-2667.6999500,5.0000000,0.0000000,0.0000000,109.9950000); //object(proc_rubbish_8)(79)
	CreateDynamicObject(2676,1660.1999500,-2672.1001000,5.0000000,0.0000000,0.0000000,109.9950000); //object(proc_rubbish_8)(80)
	CreateDynamicObject(2676,1650.3000500,-2686.3999000,5.0000000,0.0000000,0.0000000,159.9950000); //object(proc_rubbish_8)(81)
	CreateDynamicObject(761,1869.0999800,-2681.8999000,4.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(294)
	CreateDynamicObject(761,1857.4000200,-2687.0000000,4.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(296)
	CreateDynamicObject(761,1829.8000500,-2678.5000000,5.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(299)
	CreateDynamicObject(761,1839.6999500,-2668.8999000,4.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(300)
	CreateDynamicObject(761,1858.1999500,-2665.6999500,4.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(301)
	CreateDynamicObject(761,1867.4000200,-2665.8000500,4.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(302)
	CreateDynamicObject(761,1882.0000000,-2665.8000500,4.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(303)
	CreateDynamicObject(761,1888.9000200,-2671.6001000,4.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(304)
	CreateDynamicObject(761,1896.4000200,-2673.8000500,4.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(305)
	CreateDynamicObject(761,1912.5999800,-2665.5000000,4.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(306)
	CreateDynamicObject(761,1771.5999800,-2668.8000500,4.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(307)
	CreateDynamicObject(761,1781.4000200,-2667.1001000,4.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(308)
	CreateDynamicObject(761,1786.5000000,-2673.3000500,4.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(309)
	CreateDynamicObject(761,1788.9000200,-2668.8999000,4.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(310)
	CreateDynamicObject(761,1780.0999800,-2683.1001000,4.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(311)
	CreateDynamicObject(761,1782.1999500,-2679.1999500,5.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(312)
	CreateDynamicObject(761,1763.5000000,-2689.3999000,4.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(313)
	CreateDynamicObject(761,1767.4000200,-2687.1001000,4.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(314)
	CreateDynamicObject(761,1752.8000500,-2691.5000000,5.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(315)
	CreateDynamicObject(761,1752.5999800,-2678.6999500,5.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(316)
	CreateDynamicObject(761,1797.0999800,-2686.6001000,4.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(317)
	CreateDynamicObject(761,1802.9000200,-2680.3000500,4.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(318)
	CreateDynamicObject(761,1800.3000500,-2670.0000000,4.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(319)
	CreateDynamicObject(761,1825.3000500,-2663.6999500,5.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(320)
	CreateDynamicObject(761,1826.5000000,-2677.0000000,5.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(321)
	CreateDynamicObject(761,1823.5000000,-2678.8999000,5.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(322)
	CreateDynamicObject(761,1820.5999800,-2689.0000000,4.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(323)
	CreateDynamicObject(3594,2186.7998000,-2371.5000000,13.0000000,0.0000000,0.0000000,63.9350000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2219.1001000,-2359.0000000,13.0000000,0.0000000,0.0000000,183.9310000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2215.6001000,-2356.1001000,13.0000000,0.0000000,0.0000000,123.9280000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2246.6999500,-2329.8000500,13.0000000,0.0000000,0.0000000,153.9260000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2263.1001000,-2311.0000000,13.0000000,0.0000000,0.0000000,113.9240000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2287.1999500,-2299.0000000,13.0000000,0.0000000,0.0000000,213.9230000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2279.0000000,-2299.1001000,13.0000000,0.0000000,0.0000000,263.9200000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2283.8000500,-2301.5000000,13.0000000,0.0000000,0.0000000,173.9190000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2302.5000000,-2319.3999000,13.0000000,0.0000000,0.0000000,13.9140000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2321.3994100,-2330.6992200,13.0000000,0.0000000,0.0000000,73.9000000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2303.6001000,-2356.3000500,13.0000000,0.0000000,0.0000000,293.9050000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2277.8000500,-2378.3000500,13.0000000,0.0000000,0.0000000,333.9010000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2273.1001000,-2396.3999000,13.0000000,0.0000000,0.0000000,293.8960000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2251.6001000,-2406.0000000,13.0000000,0.0000000,0.0000000,323.8950000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2237.8999000,-2424.6001000,13.0000000,0.0000000,0.0000000,353.8930000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2223.0000000,-2448.8999000,13.0000000,0.0000000,0.0000000,303.8920000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2226.0000000,-2466.8999000,13.0000000,0.0000000,0.0000000,3.8870000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2222.5000000,-2466.8000500,13.0000000,0.0000000,0.0000000,33.8840000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2222.0000000,-2490.3999000,13.0000000,0.0000000,0.0000000,33.8820000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2226.6999500,-2491.1001000,13.0000000,0.0000000,0.0000000,343.8820000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2196.8994100,-2493.5000000,13.0000000,0.0000000,0.0000000,59.8750000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2227.6999500,-2525.5000000,13.0000000,0.0000000,0.0000000,349.8750000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2222.3999000,-2549.1001000,13.0000000,0.0000000,0.0000000,19.8690000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2227.3999000,-2569.6001000,13.0000000,0.0000000,0.0000000,327.8690000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2222.6999500,-2599.5000000,13.0000000,0.0000000,0.0000000,7.8650000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2225.0000000,-2631.1001000,13.0000000,0.0000000,0.0000000,47.8610000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2230.5000000,-2654.1001000,13.0000000,0.0000000,0.0000000,7.8560000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2258.3000500,-2665.3000500,13.0000000,0.0000000,0.0000000,89.8550000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2281.1001000,-2660.1999500,13.0000000,0.0000000,0.0000000,121.8520000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2322.5000000,-2663.3999000,13.0000000,0.0000000,0.0000000,51.8490000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2361.5000000,-2666.1999500,13.0000000,0.0000000,0.0000000,121.8440000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2392.3999000,-2660.6999500,13.0000000,0.0000000,0.0000000,71.8440000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2419.3999000,-2665.5000000,13.0000000,0.0000000,0.0000000,111.8400000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2423.6999500,-2662.6001000,13.0000000,0.0000000,0.0000000,251.8350000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2463.3000500,-2662.5000000,13.0000000,0.0000000,0.0000000,151.8340000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2482.8000500,-2649.3000500,13.0000000,0.0000000,0.0000000,191.8310000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2481.6001000,-2612.0000000,13.0000000,0.0000000,0.0000000,1.8270000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2488.5000000,-2587.3000500,13.0000000,0.0000000,0.0000000,171.8240000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2483.7998000,-2552.2998000,13.0000000,0.0000000,0.0000000,211.8160000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2483.8999000,-2519.6999500,13.0000000,0.0000000,0.0000000,151.8160000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2516.1001000,-2502.0000000,13.0000000,0.0000000,0.0000000,201.8150000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2547.5996100,-2505.0000000,13.0000000,0.0000000,0.0000000,141.8120000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2542.3000500,-2505.5000000,13.0000000,0.0000000,0.0000000,211.8120000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2335.0000000,-2329.1001000,13.0000000,0.0000000,0.0000000,125.9050000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2356.6999500,-2301.8000500,13.0000000,0.0000000,0.0000000,155.9030000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2393.3999000,-2271.3999000,13.0000000,0.0000000,0.0000000,113.9010000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2396.0000000,-2263.3000500,13.0000000,0.0000000,0.0000000,183.9010000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2402.5000000,-2262.1999500,13.0000000,0.0000000,0.0000000,63.9000000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2401.5000000,-2256.6001000,13.0000000,0.0000000,0.0000000,123.8960000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2425.6001000,-2232.8999000,13.0000000,0.0000000,0.0000000,143.8930000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2461.8000500,-2230.0000000,13.0000000,0.0000000,0.0000000,103.8880000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2526.6001000,-2230.1001000,13.0000000,0.0000000,0.0000000,53.8870000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2568.3000500,-2225.1999500,13.0000000,0.0000000,0.0000000,143.8820000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2578.6001000,-2228.1001000,13.0000000,0.0000000,0.0000000,53.8770000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2601.3000500,-2227.3000500,13.0000000,0.0000000,0.0000000,113.8710000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2570.8999000,-2507.0000000,13.0000000,0.0000000,0.0000000,91.8120000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2602.3999000,-2500.8999000,13.0000000,0.0000000,0.0000000,201.8070000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2607.6001000,-2502.1001000,13.0000000,0.0000000,0.0000000,281.8020000); //object(la_fuckcar1)(143)
	CreateDynamicObject(761,2217.1001000,-2357.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2220.8000500,-2361.1001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2218.6999500,-2352.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2211.1001000,-2356.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2200.5000000,-2383.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2194.3000500,-2382.3999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2199.1001000,-2379.8999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2243.8999000,-2332.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2249.3000500,-2329.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2264.6001000,-2308.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2261.3999000,-2306.1001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2266.6999500,-2313.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2281.6999500,-2301.6001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2282.6999500,-2297.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2286.3000500,-2294.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2285.6999500,-2301.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2290.3000500,-2302.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2300.8000500,-2322.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2300.3000500,-2318.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2304.1999500,-2319.1001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2320.0000000,-2328.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2322.6999500,-2329.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2318.0000000,-2332.3999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2333.8999000,-2337.8999000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2315.6001000,-2356.8999000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2318.6999500,-2349.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2337.5000000,-2325.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2336.3999000,-2330.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2331.1001000,-2330.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2353.8999000,-2305.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2356.8999000,-2305.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2356.8999000,-2297.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2395.8000500,-2268.8999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2392.1001000,-2273.8999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2393.8999000,-2264.6001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2397.3000500,-2259.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2399.1001000,-2262.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2405.1999500,-2262.6001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2405.6001000,-2256.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2425.8999000,-2235.6999500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2425.3000500,-2230.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2429.3000500,-2231.3999000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2460.1001000,-2228.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2464.1001000,-2231.6001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2464.8000500,-2227.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2484.6001000,-2240.1001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2483.6999500,-2247.6001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2524.5000000,-2230.6001000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2524.6001000,-2223.8000500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2522.3000500,-2225.0000000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2536.1001000,-2231.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2566.0000000,-2225.6001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2572.1999500,-2223.1999500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2575.6999500,-2228.3000500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2579.8000500,-2225.6999500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2581.3999000,-2230.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2599.0000000,-2229.6999500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2599.0000000,-2226.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2604.8999000,-2227.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2590.6001000,-2219.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2561.8999000,-2238.8999000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2555.3999000,-2239.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2539.8000500,-2240.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2432.8000500,-2255.6001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2431.0000000,-2250.1001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2301.5000000,-2358.8999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2304.6999500,-2354.1001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2306.8000500,-2357.6001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2279.3999000,-2380.3999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2279.6999500,-2374.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2279.6999500,-2377.8999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2270.6999500,-2395.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2277.0000000,-2396.8999000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2274.3000500,-2394.1001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2251.1001000,-2403.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2251.1001000,-2409.6001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2255.3000500,-2404.3999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2239.8999000,-2422.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2235.8000500,-2425.8999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2237.3999000,-2419.6001000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2223.3999000,-2446.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2220.0000000,-2447.6001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2219.5000000,-2442.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2223.6999500,-2450.8999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2224.0000000,-2466.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2222.3000500,-2470.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2227.3999000,-2471.1001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2218.3000500,-2469.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2231.3000500,-2468.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2224.6001000,-2490.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2218.8999000,-2487.3999000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2229.6001000,-2488.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2227.6001000,-2494.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2197.8000500,-2496.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2193.6999500,-2493.8999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2194.5000000,-2489.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2225.6001000,-2526.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2229.8999000,-2523.8999000,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2226.6001000,-2529.6001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2223.3999000,-2546.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2219.6999500,-2545.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2223.3999000,-2553.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2224.5000000,-2570.1001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2229.8999000,-2570.6001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2219.1001000,-2575.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2220.8000500,-2598.1001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2221.6999500,-2603.8999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2224.5000000,-2598.1001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2225.1999500,-2629.6001000,12.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2227.3999000,-2630.8999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2222.8000500,-2631.6001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2228.6001000,-2651.8999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2228.6001000,-2656.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2232.0000000,-2653.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2229.0000000,-2664.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2241.0000000,-2677.1001000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2235.6999500,-2676.8999000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2256.0000000,-2666.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2262.0000000,-2664.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2260.1999500,-2667.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2268.3999000,-2658.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2278.3999000,-2663.5000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2277.3000500,-2659.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2283.8000500,-2661.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2318.8999000,-2663.8999000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2314.8999000,-2669.1999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2321.0000000,-2659.6001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2325.0000000,-2657.5000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2323.3999000,-2666.8999000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2358.6999500,-2665.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2356.0000000,-2669.3000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2363.3999000,-2663.3999000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2362.3999000,-2667.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2390.3000500,-2662.1001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2420.1001000,-2663.1999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2415.6999500,-2668.3000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2420.3999000,-2659.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2422.0000000,-2666.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2463.1999500,-2659.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2462.1001000,-2666.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2460.5000000,-2663.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2484.8000500,-2652.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2481.1999500,-2649.6001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2484.3000500,-2642.3999000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2497.0000000,-2653.3000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2483.6001000,-2611.1001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2483.5000000,-2613.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2479.5000000,-2615.3000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2486.1001000,-2589.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2490.6001000,-2586.8000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2488.6999500,-2591.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2483.1001000,-2555.1001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2485.1001000,-2549.6999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2481.0000000,-2551.1001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2484.3000500,-2522.1001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2481.0000000,-2521.8999000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2487.1001000,-2518.0000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2513.5000000,-2500.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2518.6001000,-2505.3999000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2514.5000000,-2504.8000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2541.1001000,-2507.3999000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2540.8000500,-2501.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2544.8999000,-2505.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2550.3000500,-2501.8999000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2573.1001000,-2505.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2576.5000000,-2498.1001000,12.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2599.3999000,-2499.1001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2601.3999000,-2503.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2605.1999500,-2504.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2610.8000500,-2499.8999000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(3620,2426.8000500,-2419.1999500,15.1000000,48.0000000,0.0000000,220.0000000); //object(redockrane_las)(1)
	CreateDynamicObject(3461,2434.3000500,-2432.6999500,11.0000000,0.0000000,0.0000000,0.0000000); //object(tikitorch01_lvs)(82)
	CreateDynamicObject(3461,2434.8000500,-2428.1999500,20.0000000,322.0000000,90.0000000,182.0000000); //object(tikitorch01_lvs)(83)
	CreateDynamicObject(917,2434.0000000,-2433.6001000,12.8000000,0.0000000,0.0000000,0.0000000); //object(fruitcrate1)(2)
	CreateDynamicObject(910,2434.3999000,-2434.6999500,13.9000000,0.0000000,0.0000000,0.0000000); //object(bust_cabinet_4)(7)
	CreateDynamicObject(853,2440.1001000,-2434.8000500,13.0000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_5)(8)
	CreateDynamicObject(850,2436.5000000,-2437.5000000,12.8000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_1)(17)
	CreateDynamicObject(850,2446.5000000,-2435.6999500,12.7000000,0.0000000,0.0000000,110.0000000); //object(cj_urb_rub_1)(18)
	CreateDynamicObject(3035,2450.0000000,-2431.8000500,13.4000000,0.0000000,0.0000000,0.0000000); //object(tmp_bin)(14)
	CreateDynamicObject(3035,2447.0000000,-2431.3999000,13.4000000,0.0000000,0.0000000,300.0000000); //object(tmp_bin)(15)
	CreateDynamicObject(2971,2437.6999500,-2433.5000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(k_smashboxes)(20)
	CreateDynamicObject(2971,2443.5000000,-2433.6001000,12.6000000,0.0000000,0.0000000,80.0000000); //object(k_smashboxes)(21)
	CreateDynamicObject(2676,2286.0000000,-2304.1999500,12.5000000,0.0000000,0.0000000,103.8810000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2305.8000500,-2323.6001000,12.5000000,0.0000000,0.0000000,103.8810000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2339.3000500,-2358.3999000,12.5000000,0.0000000,0.0000000,103.8760000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2339.3000500,-2326.1001000,12.5000000,0.0000000,0.0000000,103.8810000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2359.5000000,-2296.6999500,12.5000000,0.0000000,0.0000000,103.8810000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2391.6001000,-2265.3000500,12.5000000,0.0000000,0.0000000,103.8810000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2397.1999500,-2273.8000500,12.7000000,0.0000000,0.0000000,103.8810000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2423.5000000,-2237.8000500,12.5000000,0.0000000,0.0000000,213.8810000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2404.1992200,-2259.0000000,12.5000000,0.0000000,0.0000000,213.8760000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2404.1992200,-2259.0000000,12.5000000,0.0000000,0.0000000,213.8760000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2433.8999000,-2231.3000500,12.5000000,0.0000000,0.0000000,263.8760000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2456.6001000,-2229.8999000,12.5000000,0.0000000,0.0000000,263.8750000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2475.3000500,-2223.6001000,12.5000000,0.0000000,0.0000000,313.8750000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2480.0000000,-2224.0000000,12.5000000,0.0000000,0.0000000,353.8740000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2520.6999500,-2229.1001000,12.5000000,0.0000000,0.0000000,353.8700000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2531.5000000,-2229.3999000,12.5000000,0.0000000,0.0000000,73.8700000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2563.6999500,-2225.3000500,12.5000000,0.0000000,0.0000000,73.8670000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2575.6999500,-2230.3000500,12.5000000,0.0000000,0.0000000,153.8670000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2621.3999000,-2219.6001000,12.7000000,0.0000000,0.0000000,203.8640000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2603.8994100,-2229.8994100,12.5000000,0.0000000,0.0000000,203.8620000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2624.6999500,-2237.0000000,12.7000000,0.0000000,0.0000000,203.8620000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2464.1001000,-2234.3000500,12.7000000,0.0000000,0.0000000,203.8620000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2381.1001000,-2264.5000000,12.7000000,0.0000000,0.0000000,203.8620000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2303.8999000,-2359.5000000,12.5000000,0.0000000,0.0000000,203.8620000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2283.1999500,-2374.1999500,12.6000000,0.0000000,0.0000000,203.8620000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2273.1999500,-2391.6999500,12.6000000,0.0000000,0.0000000,203.8620000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2258.8000500,-2401.1999500,12.6000000,0.0000000,0.0000000,203.8620000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2253.8999000,-2409.1999500,12.6000000,0.0000000,0.0000000,273.8620000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2242.3999000,-2419.3999000,12.6000000,0.0000000,0.0000000,273.8620000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2233.8999000,-2424.6001000,12.6000000,0.0000000,0.0000000,353.8620000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2224.8999000,-2444.5000000,12.6000000,0.0000000,0.0000000,353.8590000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2221.6999500,-2453.3999000,12.6000000,0.0000000,0.0000000,293.8590000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2223.6999500,-2485.8999000,12.6000000,0.0000000,0.0000000,293.8570000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2218.1001000,-2492.0000000,12.6000000,0.0000000,0.0000000,333.8570000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2202.5000000,-2493.0000000,12.6000000,0.0000000,0.0000000,43.8530000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2225.8000500,-2523.1001000,12.6000000,0.0000000,0.0000000,83.8520000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2222.0000000,-2543.3999000,12.6000000,0.0000000,0.0000000,143.8480000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2221.8000500,-2555.1999500,12.6000000,0.0000000,0.0000000,93.8440000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2228.6999500,-2573.5000000,12.6000000,0.0000000,0.0000000,133.8400000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2224.1001000,-2575.3999000,12.6000000,0.0000000,0.0000000,93.8350000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2223.0000000,-2593.6001000,12.6000000,0.0000000,0.0000000,153.8340000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2226.1001000,-2627.1999500,12.6000000,0.0000000,0.0000000,203.8310000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2227.6999500,-2649.8999000,12.6000000,0.0000000,0.0000000,203.8290000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2229.1001000,-2657.3999000,12.6000000,0.0000000,0.0000000,273.8290000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2253.1001000,-2664.8999000,12.6000000,0.0000000,0.0000000,333.8290000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2276.5000000,-2662.6001000,12.7000000,0.0000000,0.0000000,333.8250000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2253.0996100,-2664.8994100,12.6000000,0.0000000,0.0000000,333.8250000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2314.8999000,-2662.3000500,12.7000000,0.0000000,0.0000000,333.8250000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2315.6999500,-2663.0000000,12.6000000,0.0000000,0.0000000,333.8250000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2356.3999000,-2663.8000500,12.7000000,0.0000000,0.0000000,43.8250000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2388.6001000,-2662.8000500,12.7000000,0.0000000,0.0000000,103.8240000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2416.8000500,-2663.3999000,12.7000000,0.0000000,0.0000000,153.8210000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2459.1999500,-2665.6001000,12.7000000,0.0000000,0.0000000,211.8200000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2466.6001000,-2665.6999500,12.7000000,0.0000000,0.0000000,211.8160000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2485.8999000,-2648.0000000,12.7000000,0.0000000,0.0000000,261.8160000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2482.6001000,-2643.1999500,12.7000000,0.0000000,0.0000000,301.8150000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2485.8999000,-2616.8000500,12.7000000,0.0000000,0.0000000,21.8110000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2484.1999500,-2586.6999500,12.7000000,0.0000000,0.0000000,21.8080000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2486.5000000,-2557.0000000,12.7000000,0.0000000,0.0000000,91.8080000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2477.3999000,-2554.8000500,12.8000000,0.0000000,0.0000000,141.8070000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2471.5000000,-2548.1001000,12.8000000,0.0000000,0.0000000,211.8060000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2486.1999500,-2523.6999500,12.7000000,0.0000000,0.0000000,91.8070000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2485.1001000,-2513.6001000,12.7000000,0.0000000,0.0000000,171.8070000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2511.3000500,-2504.1999500,12.7000000,0.0000000,0.0000000,211.8040000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2538.0000000,-2504.8999000,12.7000000,0.0000000,0.0000000,281.8000000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2544.0000000,-2501.8999000,12.7000000,0.0000000,0.0000000,331.7990000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2568.0000000,-2504.5000000,12.7000000,0.0000000,0.0000000,11.7980000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2602.8999000,-2505.5000000,12.7000000,0.0000000,0.0000000,41.7940000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2599.1999500,-2502.6999500,12.7000000,0.0000000,0.0000000,91.7920000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2635.8000500,-2506.0000000,12.7000000,0.0000000,0.0000000,91.7910000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2633.1001000,-2501.6999500,12.7000000,0.0000000,0.0000000,141.7910000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(1413,2637.1999500,-2499.1999500,13.8000000,0.0000000,0.0000000,298.0000000); //object(dyn_mesh_3)(52)
	CreateDynamicObject(1413,2637.1999500,-2508.8999000,13.8000000,0.0000000,0.0000000,247.9990000); //object(dyn_mesh_3)(53)
	CreateDynamicObject(1424,2638.5000000,-2502.6001000,13.2000000,0.0000000,0.0000000,150.0000000); //object(dyn_roadbarrier_2)(24)
	CreateDynamicObject(1424,2640.1001000,-2506.6999500,13.2000000,0.0000000,0.0000000,90.0000000); //object(dyn_roadbarrier_2)(25)
	CreateDynamicObject(1424,2640.8000500,-2503.8000500,13.2000000,0.0000000,0.0000000,99.9960000); //object(dyn_roadbarrier_2)(26)
	CreateDynamicObject(1413,2657.1999500,-2500.1999500,13.8000000,0.0000000,0.0000000,267.9990000); //object(dyn_mesh_3)(54)
	CreateDynamicObject(1413,2656.1999500,-2508.3000500,13.8000000,0.0000000,0.0000000,297.9950000); //object(dyn_mesh_3)(55)
	CreateDynamicObject(3594,2172.3000500,-2493.3999000,13.0000000,0.0000000,0.0000000,9.8750000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2158.8999000,-2506.1001000,13.0000000,0.0000000,0.0000000,79.8710000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2158.6001000,-2493.1999500,13.0000000,0.0000000,0.0000000,129.8710000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2162.0000000,-2496.1001000,13.0000000,0.0000000,0.0000000,169.8690000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2158.3999000,-2539.6001000,13.0000000,0.0000000,0.0000000,359.8650000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2159.3000500,-2554.5000000,13.0000000,0.0000000,0.0000000,39.8630000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2154.6001000,-2593.8999000,13.0000000,0.0000000,0.0000000,343.8580000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2172.1999500,-2595.1001000,13.0000000,0.0000000,0.0000000,125.8560000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2174.5000000,-2565.3999000,13.0000000,0.0000000,0.0000000,165.8540000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2176.3999000,-2559.8999000,13.0000000,0.0000000,0.0000000,215.8500000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2173.0000000,-2538.3000500,13.0000000,0.0000000,0.0000000,185.8480000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2156.5000000,-2637.1001000,13.0000000,0.0000000,0.0000000,295.8540000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2122.1001000,-2646.3000500,13.0000000,0.0000000,0.0000000,355.8510000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2117.6001000,-2672.3999000,13.0000000,0.0000000,0.0000000,285.8470000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2120.1999500,-2667.3000500,13.0000000,0.0000000,0.0000000,325.8420000); //object(la_fuckcar1)(143)
	CreateDynamicObject(1299,2115.6001000,-2670.1999500,12.8000000,0.0000000,0.0000000,0.0000000); //object(smashboxpile)(16)
	CreateDynamicObject(1299,2121.1001000,-2641.8999000,13.0000000,0.0000000,0.0000000,40.0000000); //object(smashboxpile)(17)
	CreateDynamicObject(1299,2157.6001000,-2590.3000500,12.8000000,0.0000000,0.0000000,39.9960000); //object(smashboxpile)(18)
	CreateDynamicObject(1299,2173.5000000,-2561.3999000,12.8000000,0.0000000,0.0000000,39.9960000); //object(smashboxpile)(19)
	CreateDynamicObject(1299,2158.6001000,-2496.8000500,12.8000000,0.0000000,0.0000000,126.4960000); //object(smashboxpile)(20)
	CreateDynamicObject(1299,2175.6001000,-2494.3999000,12.8000000,0.0000000,0.0000000,184.4910000); //object(smashboxpile)(21)
	CreateDynamicObject(761,2174.8000500,-2492.8999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2163.0000000,-2491.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2156.1001000,-2493.3999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2159.5000000,-2498.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2156.8999000,-2503.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2160.3000500,-2508.3999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2170.8000500,-2536.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2174.6001000,-2542.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2173.0000000,-2558.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2171.8999000,-2566.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2177.0000000,-2563.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2157.5000000,-2591.8999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2156.0000000,-2587.8999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2152.1001000,-2596.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2169.1999500,-2594.3999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2175.0000000,-2595.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2180.1999500,-2597.1001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2174.6001000,-2602.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2123.6001000,-2641.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2119.6001000,-2647.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2118.6001000,-2641.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2119.8000500,-2664.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2114.3000500,-2670.3999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2119.8000500,-2674.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2120.8999000,-2669.6001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2158.1999500,-2638.3999000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2152.1001000,-2637.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2153.3000500,-2640.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2157.0000000,-2634.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2160.3000500,-2543.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2162.0000000,-2554.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(2672,2162.6001000,-2558.1999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(131)
	CreateDynamicObject(2672,2172.0000000,-2563.0000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(132)
	CreateDynamicObject(2672,2160.3999000,-2501.0000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(133)
	CreateDynamicObject(2672,2174.3000500,-2497.5000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(134)
	CreateDynamicObject(2672,2195.3999000,-2496.1001000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(135)
	CreateDynamicObject(2672,2170.1999500,-2489.1999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(136)
	CreateDynamicObject(2672,2159.3000500,-2489.3000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(137)
	CreateDynamicObject(2672,2156.5000000,-2537.3000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(138)
	CreateDynamicObject(2672,2161.5000000,-2535.8000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(139)
	CreateDynamicObject(2672,2177.3000500,-2556.1999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(140)
	CreateDynamicObject(2672,2173.0000000,-2591.5000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(141)
	CreateDynamicObject(2672,2167.6999500,-2602.3000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(142)
	CreateDynamicObject(2672,2156.3999000,-2596.3999000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(143)
	CreateDynamicObject(2672,2150.1001000,-2606.0000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(144)
	CreateDynamicObject(2672,2155.3000500,-2634.3000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(145)
	CreateDynamicObject(2672,2156.6001000,-2639.6001000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(146)
	CreateDynamicObject(2672,2147.3000500,-2641.8999000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(147)
	CreateDynamicObject(2672,2125.3000500,-2644.3000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(148)
	CreateDynamicObject(2672,2123.3000500,-2639.1999500,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(149)
	CreateDynamicObject(2672,2118.3999000,-2643.3000500,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(150)
	CreateDynamicObject(2672,2117.1999500,-2667.1999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(151)
	CreateDynamicObject(2672,2114.3999000,-2675.3999000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(152)
	CreateDynamicObject(2672,2066.3000500,-2681.6001000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(153)
	CreateDynamicObject(2672,2076.1001000,-2682.8999000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(154)
	CreateDynamicObject(2672,2082.1001000,-2669.1001000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(155)
	CreateDynamicObject(2672,2083.6001000,-2664.8999000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(156)
	CreateDynamicObject(2672,2077.8999000,-2665.8000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(157)
	CreateDynamicObject(2672,2080.1001000,-2670.1001000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(158)
	CreateDynamicObject(2672,2080.3000500,-2666.8000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(159)
	CreateDynamicObject(4517,2588.5000000,-2385.0000000,14.2000000,0.0000000,0.0000000,226.0000000); //object(cn2_roadblock04ld)(1)
	CreateDynamicObject(3594,2616.3000500,-2389.6999500,13.3000000,0.0000000,0.0000000,211.8160000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2606.5000000,-2401.8999000,13.0000000,0.0000000,0.0000000,251.8160000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2597.1999500,-2410.1999500,13.1000000,0.0000000,0.0000000,1.8120000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2593.5000000,-2426.3000500,13.0000000,0.0000000,0.0000000,61.8070000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2596.1999500,-2423.5000000,13.0000000,0.0000000,0.0000000,31.8040000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2562.3999000,-2389.0000000,13.0000000,0.0000000,0.0000000,231.8000000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2537.3999000,-2370.6999500,13.0000000,0.0000000,0.0000000,273.7950000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2514.5000000,-2386.3000500,13.0000000,0.0000000,0.0000000,353.7900000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2489.3000500,-2414.8000500,13.0000000,0.0000000,0.0000000,303.7870000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2462.5000000,-2436.1999500,13.0000000,0.0000000,0.0000000,13.7830000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2436.0000000,-2450.6999500,13.0000000,0.0000000,0.0000000,263.7820000); //object(la_fuckcar1)(143)
	CreateDynamicObject(761,2438.6999500,-2449.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2432.0000000,-2451.6001000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2461.0000000,-2438.6001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2463.3000500,-2431.8999000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2465.1999500,-2438.1001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2474.8000500,-2437.5000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2480.1001000,-2431.8000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2464.8999000,-2422.6999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2472.8999000,-2411.8999000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2486.3999000,-2418.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2498.8000500,-2416.8000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2484.3000500,-2410.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2513.0000000,-2384.3999000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2517.1001000,-2396.1001000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2500.8999000,-2384.1001000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2507.3000500,-2380.6001000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2535.1999500,-2368.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2547.1999500,-2365.3999000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2535.6999500,-2379.6001000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2541.5000000,-2398.1999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2560.3999000,-2384.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2563.6999500,-2392.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2579.8999000,-2394.1001000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2574.0000000,-2416.3000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2566.3999000,-2423.3000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2594.8999000,-2413.5000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2590.3999000,-2426.8999000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2596.1001000,-2429.6001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2599.0000000,-2426.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2597.1001000,-2420.3999000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2595.1999500,-2425.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2597.8000500,-2406.1001000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2603.1001000,-2398.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2612.8000500,-2388.3999000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2619.0000000,-2390.6999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2617.3000500,-2394.1999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2596.6001000,-2381.6001000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(761,2584.3000500,-2393.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(265)
	CreateDynamicObject(2676,2326.5000000,-2331.5000000,12.5000000,0.0000000,0.0000000,103.8760000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2342.5996100,-2356.3994100,12.5000000,0.0000000,0.0000000,93.8760000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2363.8000500,-2375.0000000,12.5000000,0.0000000,0.0000000,143.8730000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2366.6999500,-2386.0000000,12.5000000,0.0000000,0.0000000,203.8710000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2391.1001000,-2402.8000500,12.5000000,0.0000000,0.0000000,153.8680000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2431.8999000,-2446.6999500,12.6000000,0.0000000,0.0000000,257.8640000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2449.8999000,-2445.3000500,12.6000000,0.0000000,0.0000000,297.8600000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2462.8000500,-2441.1999500,12.6000000,0.0000000,0.0000000,37.8560000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2483.0000000,-2417.3999000,12.6000000,0.0000000,0.0000000,37.8530000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2494.5000000,-2409.8000500,12.6000000,0.0000000,0.0000000,87.8530000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2510.8999000,-2387.5000000,12.6000000,0.0000000,0.0000000,87.8520000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2533.0000000,-2372.3999000,12.6000000,0.0000000,0.0000000,137.8520000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2559.3000500,-2389.6999500,12.6000000,0.0000000,0.0000000,137.8510000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2567.6999500,-2394.5000000,12.6000000,0.0000000,0.0000000,227.8510000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2566.8999000,-2408.0000000,12.8000000,0.0000000,0.0000000,317.8510000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2556.5000000,-2405.3999000,12.8000000,0.0000000,0.0000000,27.8510000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2589.1999500,-2421.8999000,12.6000000,0.0000000,0.0000000,27.8500000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2592.6999500,-2417.6001000,12.6000000,0.0000000,0.0000000,117.8500000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2600.6999500,-2400.3000500,12.6000000,0.0000000,0.0000000,117.8500000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2610.1001000,-2406.1999500,12.7000000,0.0000000,0.0000000,207.8500000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2614.6001000,-2393.0000000,12.8000000,0.0000000,0.0000000,207.8450000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(2676,2594.5000000,-2407.6999500,12.8000000,0.0000000,0.0000000,267.8450000); //object(proc_rubbish_8)(8)
	CreateDynamicObject(3594,1889.0000000,-2167.8999000,13.0000000,0.0000000,0.0000000,323.9690000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1858.9000200,-2164.3999000,13.0000000,0.0000000,0.0000000,263.9650000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1826.0000000,-2166.0000000,13.0000000,0.0000000,0.0000000,293.9630000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1824.1999500,-2132.1999500,13.0000000,0.0000000,0.0000000,213.9610000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1812.8000500,-2113.1001000,13.0000000,0.0000000,0.0000000,171.9590000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1788.6999500,-2114.6999500,13.0000000,0.0000000,0.0000000,251.9580000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1766.4000200,-2111.1001000,13.0000000,0.0000000,0.0000000,303.9550000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1733.9000200,-2114.3000500,13.0000000,0.0000000,0.0000000,243.9530000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1702.0000000,-2111.0000000,13.0000000,0.0000000,0.0000000,283.9510000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1698.4000200,-2097.6999500,13.1000000,0.0000000,0.0000000,13.9470000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1824.9000200,-2099.8999000,13.0000000,0.0000000,0.0000000,171.9580000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1816.5000000,-2077.1001000,13.0000000,0.0000000,0.0000000,243.9580000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1827.8000500,-2058.8999000,13.0000000,0.0000000,0.0000000,143.9570000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1854.0000000,-2049.1999500,13.0000000,0.0000000,0.0000000,93.9540000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1878.3000500,-2046.3000500,13.0000000,0.0000000,0.0000000,143.9500000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1885.6999500,-2024.0999800,13.0000000,0.0000000,0.0000000,193.9480000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1896.4000200,-2052.1001000,13.0000000,0.0000000,0.0000000,323.9470000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1926.0999800,-2049.6001000,13.0000000,0.0000000,0.0000000,83.9430000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1940.5999800,-2055.0000000,13.0000000,0.0000000,0.0000000,123.9410000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1532.1999500,-1892.1999500,12.9000000,0.0000000,0.0000000,13.9610000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1526.0999800,-1874.6999500,12.8000000,0.0000000,0.0000000,123.9580000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1556.9000200,-1871.1999500,12.9000000,0.0000000,0.0000000,63.9530000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1585.6999500,-1873.0999800,13.4000000,0.0000000,0.0000000,113.9510000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1608.8000500,-1873.0000000,12.9000000,0.0000000,0.0000000,33.9500000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1619.9000200,-1883.0000000,13.2000000,0.0000000,0.0000000,99.9480000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1620.8000500,-1862.8000500,13.1000000,0.0000000,0.0000000,149.9430000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1645.0000000,-1865.3000500,13.1000000,0.0000000,0.0000000,89.9410000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1646.0999800,-1873.5000000,12.8000000,0.0000000,0.0000000,159.9400000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1686.8000500,-1854.4000200,12.8000000,0.0000000,0.0000000,139.9390000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1688.8000500,-1848.5000000,12.8000000,0.0000000,0.0000000,29.9380000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1686.5999800,-1822.6999500,12.8000000,0.0000000,0.0000000,171.9380000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1706.5000000,-1812.1999500,12.8000000,0.0000000,0.0000000,121.9360000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1737.4000200,-1820.1999500,12.8000000,0.0000000,0.0000000,81.9320000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1780.6999500,-1829.3000500,12.8000000,0.0000000,0.0000000,201.9310000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1813.4000200,-1833.8000500,12.8000000,0.0000000,0.0000000,121.9290000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1823.9000200,-1829.5999800,12.8000000,0.0000000,0.0000000,31.9260000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1815.5999800,-1851.3000500,12.8000000,0.0000000,0.0000000,121.9260000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1757.4000200,-1854.8000500,12.8000000,0.0000000,0.0000000,231.9260000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1754.4000200,-1857.6999500,12.8000000,0.0000000,0.0000000,91.9210000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1816.6999500,-1893.5999800,12.8000000,0.0000000,0.0000000,41.9170000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1818.4000200,-1928.1999500,12.8000000,0.0000000,0.0000000,1.9130000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1842.6999500,-1934.9000200,12.8000000,0.0000000,0.0000000,91.9120000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1876.5999800,-1932.5999800,13.0000000,0.0000000,0.0000000,171.9060000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1908.8000500,-1930.0999800,12.8000000,0.0000000,0.0000000,91.9030000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1927.9000200,-1933.3000500,12.8000000,0.0000000,0.0000000,141.9010000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1819.9000200,-1808.4000200,13.0000000,0.0000000,0.0000000,171.9030000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1822.8000500,-1770.5999800,13.0000000,0.0000000,0.0000000,221.9030000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1820.8000500,-1749.0000000,13.0000000,0.0000000,0.0000000,151.9020000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1856.5000000,-1755.1999500,13.0000000,0.0000000,0.0000000,91.8970000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1893.4000200,-1751.0000000,13.0000000,0.0000000,0.0000000,241.8950000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1911.5999800,-1762.8000500,13.0000000,0.0000000,0.0000000,341.8910000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1933.3000500,-1748.5000000,13.0000000,0.0000000,0.0000000,101.8890000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1944.6999500,-1727.8000500,13.0000000,0.0000000,0.0000000,191.8870000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1940.1999500,-1684.0999800,13.0000000,0.0000000,0.0000000,141.8820000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1943.6999500,-1649.4000200,13.0000000,0.0000000,0.0000000,181.8770000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1940.9000200,-1624.6999500,13.0000000,0.0000000,0.0000000,221.8730000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1923.3000500,-1609.5999800,13.0000000,0.0000000,0.0000000,261.8690000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1894.6999500,-1614.5999800,13.0000000,0.0000000,0.0000000,101.8650000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1856.3000500,-1612.4000200,13.0000000,0.0000000,0.0000000,61.8600000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1835.3000500,-1611.4000200,13.0000000,0.0000000,0.0000000,151.8590000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1826.0999800,-1616.9000200,13.0000000,0.0000000,0.0000000,291.8530000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1811.1999500,-1599.4000200,13.0000000,0.0000000,0.0000000,321.8520000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1830.3000500,-1592.6999500,13.0000000,0.0000000,0.0000000,311.8500000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1822.4000200,-1601.8000500,12.9000000,0.0000000,0.0000000,291.8470000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1820.1999500,-1594.9000200,12.9000000,0.0000000,0.0000000,41.8460000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1835.5999800,-1558.5999800,12.9000000,0.0000000,0.0000000,1.8410000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1835.3000500,-1565.9000200,12.9000000,0.0000000,0.0000000,71.8400000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1832.8000500,-1571.3000500,12.9000000,0.0000000,0.0000000,1.8400000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1846.4000200,-1472.0000000,12.9000000,0.0000000,0.0000000,91.8310000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1853.6999500,-1475.1999500,12.9000000,0.0000000,0.0000000,61.8290000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1859.0999800,-1481.4000200,13.0000000,0.0000000,0.0000000,1.8290000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1839.5000000,-1477.4000200,13.0000000,0.0000000,0.0000000,185.8290000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1824.3000500,-1660.5000000,13.0000000,0.0000000,0.0000000,351.8520000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1820.6999500,-1691.0999800,13.0000000,0.0000000,0.0000000,31.8480000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1822.4000200,-1722.4000200,13.0000000,0.0000000,0.0000000,331.8440000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1786.0000000,-1729.1999500,13.0000000,0.0000000,0.0000000,271.8420000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1756.0000000,-1733.4000200,13.0000000,0.0000000,0.0000000,311.8400000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1748.6999500,-1702.9000200,13.0000000,0.0000000,0.0000000,221.8360000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1748.5000000,-1668.5999800,13.0000000,0.0000000,0.0000000,161.8300000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1751.4000200,-1633.1999500,13.0000000,0.0000000,0.0000000,203.8290000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1747.0000000,-1604.1999500,13.0000000,0.0000000,0.0000000,173.8240000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1770.5999800,-1604.6999500,13.0000000,0.0000000,0.0000000,273.8200000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1795.8000500,-1611.3000500,13.0000000,0.0000000,0.0000000,63.8180000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1714.6999500,-1591.3000500,13.0000000,0.0000000,0.0000000,253.8200000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1694.0999800,-1596.3000500,13.0000000,0.0000000,0.0000000,293.8170000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1664.3994100,-1588.0000000,13.0000000,0.0000000,0.0000000,233.8110000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1634.0999800,-1595.3000500,13.0000000,0.0000000,0.0000000,263.8110000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1615.5000000,-1596.6999500,13.0000000,0.0000000,0.0000000,303.8090000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1585.6999500,-1590.9000200,13.0000000,0.0000000,0.0000000,253.8050000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1558.1999500,-1593.1999500,13.0000000,0.0000000,0.0000000,303.8010000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1525.5000000,-1591.2998000,13.0000000,0.0000000,0.0000000,243.7980000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1485.0999800,-1590.5999800,13.0000000,0.0000000,0.0000000,303.7980000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1451.5000000,-1593.5000000,13.0000000,0.0000000,0.0000000,43.7940000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1465.9000200,-1590.0999800,13.0000000,0.0000000,0.0000000,93.7920000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1424.4000200,-1598.3000500,13.0000000,0.0000000,0.0000000,43.7900000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1432.3000500,-1642.1999500,13.0000000,0.0000000,0.0000000,3.7860000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1415.6999500,-1646.4000200,13.0000000,0.0000000,0.0000000,273.7850000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1426.5999800,-1683.6999500,13.0000000,0.0000000,0.0000000,353.7790000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1433.3000500,-1724.1999500,13.0000000,0.0000000,0.0000000,25.7760000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1404.5000000,-1734.0000000,13.0000000,0.0000000,0.0000000,125.7740000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1456.5999800,-1732.0000000,13.0000000,0.0000000,0.0000000,65.7710000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1492.5999800,-1735.0000000,13.0000000,0.0000000,0.0000000,95.7700000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1525.3000500,-1726.5000000,13.0000000,0.0000000,0.0000000,145.7680000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1545.8000500,-1731.5999800,13.0000000,0.0000000,0.0000000,55.7670000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1574.6999500,-1736.4000200,13.0000000,0.0000000,0.0000000,105.7670000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1570.3000500,-1762.6999500,13.0000000,0.0000000,0.0000000,45.7650000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1572.0000000,-1798.8000500,13.0000000,0.0000000,0.0000000,357.7640000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1568.8000500,-1827.5000000,13.0000000,0.0000000,0.0000000,37.7590000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1571.4000200,-1863.0000000,12.9000000,0.0000000,0.0000000,357.7530000); //object(la_fuckcar1)(143)
	CreateDynamicObject(761,1944.0000000,-1731.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1947.0000000,-1731.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1938.0000000,-1748.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1940.5999800,-1686.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1943.9000200,-1682.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1942.1999500,-1651.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1946.4000200,-1647.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1941.0000000,-1627.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1947.1999500,-1626.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1941.0000000,-1621.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1921.5999800,-1611.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1927.9000200,-1609.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1893.0999800,-1612.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1898.9000200,-1615.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1898.6999500,-1611.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1862.8000500,-1604.5999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1859.9000200,-1616.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1856.5000000,-1610.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1861.8000500,-1613.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1835.9000200,-1613.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1828.9000200,-1614.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1827.0000000,-1602.5999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1823.5999800,-1598.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1814.5999800,-1599.0999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1816.5999800,-1591.5999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1812.8000500,-1595.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1830.4000200,-1590.4000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1832.5000000,-1563.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1831.8000500,-1567.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1834.0999800,-1575.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1830.4000200,-1575.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1835.9000200,-1553.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1846.8000500,-1528.9000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1844.1999500,-1524.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1834.0999800,-1528.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1878.5999800,-1258.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1856.4000200,-1479.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1860.0999800,-1486.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1849.6999500,-1474.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1842.1999500,-1475.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1837.6999500,-1481.9000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1842.4000200,-1479.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1810.5999800,-1583.1999500,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1809.0000000,-1587.5000000,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1810.4000200,-1593.6999500,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1799.0999800,-1610.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1792.9000200,-1608.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1768.5999800,-1606.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1774.3000500,-1603.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1749.8000500,-1602.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1749.1999500,-1607.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1744.5999800,-1604.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1715.5999800,-1593.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1713.1999500,-1588.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1714.5999800,-1582.0999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1697.9000200,-1592.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1693.4000200,-1598.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1690.4000200,-1593.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1667.4000200,-1587.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1661.6999500,-1588.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1666.8000500,-1592.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1636.0999800,-1593.5999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1631.0000000,-1593.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1635.8000500,-1597.5999800,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1630.0999800,-1596.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1616.9000200,-1598.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1617.0000000,-1586.9000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1589.3000500,-1593.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1586.5000000,-1588.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1560.6999500,-1593.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1556.5000000,-1591.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1560.5999800,-1589.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1528.1999500,-1590.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1523.6999500,-1588.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1526.0000000,-1593.6992200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1487.6999500,-1591.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1483.0999800,-1589.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1487.0000000,-1586.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1467.8000500,-1587.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1463.4000200,-1588.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1466.4000200,-1591.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1452.3000500,-1592.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1451.1999500,-1596.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1448.8000500,-1593.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1424.6999500,-1595.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1426.0999800,-1601.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1421.0999800,-1597.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1430.5999800,-1640.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1430.0999800,-1644.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1434.0999800,-1640.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1420.4000200,-1645.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1413.6999500,-1648.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1425.0000000,-1681.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1428.5999800,-1685.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1428.8000500,-1679.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1430.0999800,-1721.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1432.1999500,-1726.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1434.9000200,-1722.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1404.1999500,-1736.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1401.8000500,-1733.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1405.3000500,-1731.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1457.6999500,-1734.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1453.9000200,-1732.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1456.5000000,-1729.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1490.0999800,-1732.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1494.0000000,-1736.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1496.0000000,-1732.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1521.4000200,-1726.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1527.6999500,-1726.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1529.0999800,-1723.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1543.0999800,-1731.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1545.5000000,-1734.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1543.3000500,-1741.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1546.5999800,-1729.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1573.1999500,-1734.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1572.8000500,-1739.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1577.6999500,-1737.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1570.0999800,-1759.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1569.4000200,-1765.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1570.4000200,-1795.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1559.6999500,-1810.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1569.5999800,-1823.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1572.4000200,-1828.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1566.9000200,-1828.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1569.6999500,-1860.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1569.3000500,-1865.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1573.4000200,-1862.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1556.6999500,-1868.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1556.8000500,-1873.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1561.0999800,-1871.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1529.0000000,-1875.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1523.4000200,-1874.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1527.6999500,-1871.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1533.6999500,-1890.3000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1530.8000500,-1894.1999500,12.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1529.8000500,-1889.0999800,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1521.0999800,-1894.8000500,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1583.5000000,-1872.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1607.0999800,-1872.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1621.4000200,-1880.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1643.5999800,-1874.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1649.0999800,-1873.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1649.0000000,-1865.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1641.3000500,-1867.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1687.4000200,-1850.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1686.5999800,-1857.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1690.0999800,-1853.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1688.0000000,-1825.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1683.9000200,-1827.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1705.1999500,-1815.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1706.8000500,-1809.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1735.6999500,-1818.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1730.8000500,-1823.0999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1740.3000500,-1822.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1776.1999500,-1827.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1779.6999500,-1832.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1782.5999800,-1829.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1810.5000000,-1832.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1816.1999500,-1830.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1820.1999500,-1828.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1826.5000000,-1826.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1818.1999500,-1851.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1812.6999500,-1854.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1755.8000500,-1855.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1760.8000500,-1854.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1758.6999500,-1858.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1817.1999500,-1891.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1815.3000500,-1895.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1821.0000000,-1925.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1815.9000200,-1927.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1840.9000200,-1932.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1872.0000000,-1933.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1906.5999800,-1931.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1924.1999500,-1933.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1928.0999800,-1937.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1821.0999800,-1810.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1821.9000200,-1806.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1817.9000200,-1807.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1822.3000500,-1774.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1822.6999500,-1767.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1821.4000200,-1751.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1852.1999500,-1753.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1861.0999800,-1756.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1893.1999500,-1753.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1893.0000000,-1748.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1910.4000200,-1760.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1913.1999500,-1763.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1931.3000500,-1751.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1752.3000500,-1629.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1750.0000000,-1635.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1746.1999500,-1668.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1750.9000200,-1668.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1748.6999500,-1699.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1748.0000000,-1705.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1755.5000000,-1730.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1752.1999500,-1735.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(853,1545.5999800,-1680.8000500,13.0000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_5)(9)
	CreateDynamicObject(853,1545.4000200,-1673.5999800,13.0000000,0.0000000,0.0000000,110.0000000); //object(cj_urb_rub_5)(10)
	CreateDynamicObject(851,1541.5999800,-1667.3000500,12.9000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_2)(1)
	CreateDynamicObject(850,1542.0000000,-1684.9000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_1)(19)
	CreateDynamicObject(850,1548.5999800,-1669.0999800,12.7000000,0.0000000,0.0000000,50.0000000); //object(cj_urb_rub_1)(20)
	CreateDynamicObject(3092,1553.8000500,-1676.8000500,15.3000000,0.0000000,270.0000000,80.0000000); //object(dead_tied_cop)(1)
	CreateDynamicObject(3092,1554.5999800,-1674.1999500,15.3000000,67.9950000,91.1430000,325.3800000); //object(dead_tied_cop)(2)
	CreateDynamicObject(3035,1548.5999800,-1683.0000000,13.3000000,0.0000000,0.0000000,0.0000000); //object(tmp_bin)(16)
	CreateDynamicObject(3035,1544.6999500,-1668.9000200,13.3000000,0.0000000,0.0000000,120.0000000); //object(tmp_bin)(17)
	CreateDynamicObject(2971,1541.5999800,-1688.3000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(k_smashboxes)(22)
	CreateDynamicObject(2971,1552.4000200,-1699.0999800,12.5000000,0.0000000,0.0000000,60.0000000); //object(k_smashboxes)(23)
	CreateDynamicObject(2971,1551.9000200,-1651.6999500,12.5000000,0.0000000,0.0000000,59.9960000); //object(k_smashboxes)(24)
	CreateDynamicObject(2971,1540.9000200,-1652.9000200,12.5000000,0.0000000,0.0000000,181.9960000); //object(k_smashboxes)(25)
	CreateDynamicObject(2968,1545.0999800,-1671.8000500,12.9000000,0.0000000,0.0000000,0.0000000); //object(cm_box)(1)
	CreateDynamicObject(2968,1547.5999800,-1679.5999800,12.9000000,0.0000000,0.0000000,0.0000000); //object(cm_box)(2)
	CreateDynamicObject(2968,1543.5000000,-1683.3000500,12.9000000,0.0000000,0.0000000,70.0000000); //object(cm_box)(3)
	CreateDynamicObject(2968,1540.1999500,-1687.8000500,12.9000000,0.0000000,0.0000000,69.9990000); //object(cm_box)(4)
	CreateDynamicObject(2968,1540.4000200,-1689.6999500,12.9000000,0.0000000,0.0000000,149.9990000); //object(cm_box)(5)
	CreateDynamicObject(2907,1545.5000000,-1678.1999500,12.7000000,0.0000000,0.0000000,300.0000000); //object(kmb_deadtorso)(4)
	CreateDynamicObject(2907,1544.9000200,-1679.0000000,12.7000000,0.0000000,0.0000000,39.9980000); //object(kmb_deadtorso)(5)
	CreateDynamicObject(1449,1544.8000500,-1670.1999500,13.1000000,0.0000000,0.0000000,0.0000000); //object(dyn_crate_2)(2)
	CreateDynamicObject(1448,1555.9000200,-1674.9000200,15.8000000,0.0350000,272.0000000,0.9990000); //object(dyn_crate_1)(6)
	CreateDynamicObject(1448,1555.9000200,-1674.9000200,17.0000000,0.0330000,272.0000000,0.9940000); //object(dyn_crate_1)(7)
	CreateDynamicObject(1442,1541.5000000,-1663.6999500,13.2000000,0.0000000,0.0000000,0.0000000); //object(dyn_firebin0)(2)
	CreateDynamicObject(1440,1541.6999500,-1669.4000200,13.1000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile_3)(30)
	CreateDynamicObject(1440,1541.3000500,-1681.5999800,13.1000000,0.0000000,0.0000000,210.0000000); //object(dyn_box_pile_3)(31)
	CreateDynamicObject(1431,1543.1999500,-1652.0999800,13.1000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile)(12)
	CreateDynamicObject(12957,1535.5999800,-1667.1999500,13.0000000,0.0000000,0.0000000,0.0000000); //object(sw_pickupwreck01)(13)
	CreateDynamicObject(1219,1490.3000500,-1772.8000500,19.2000000,272.2360000,116.5550000,116.5720000); //object(palette)(13)
	CreateDynamicObject(1219,1486.9000200,-1772.8000500,19.2000000,272.2360000,116.5540000,116.5700000); //object(palette)(14)
	CreateDynamicObject(1219,1482.5999800,-1772.8000500,19.2000000,272.2360000,116.5540000,116.5700000); //object(palette)(15)
	CreateDynamicObject(1219,1475.0999800,-1772.6999500,19.2000000,272.2360000,116.5540000,116.5700000); //object(palette)(16)
	CreateDynamicObject(1219,1472.3000500,-1772.8000500,19.2000000,272.2360000,116.5540000,116.5700000); //object(palette)(17)
	CreateDynamicObject(1299,1468.4000200,-1764.5999800,18.3000000,0.0000000,0.0000000,0.0000000); //object(smashboxpile)(22)
	CreateDynamicObject(1299,1485.5000000,-1771.4000200,18.3000000,0.0000000,0.0000000,0.0000000); //object(smashboxpile)(23)
	CreateDynamicObject(1299,1488.6999500,-1769.5999800,18.3000000,0.0000000,0.0000000,60.0000000); //object(smashboxpile)(24)
	CreateDynamicObject(1344,1493.3000500,-1764.1999500,18.6000000,0.0000000,0.0000000,260.0000000); //object(cj_dumpster2)(5)
	CreateDynamicObject(1344,1492.1999500,-1766.3000500,18.6000000,0.0000000,0.0000000,229.9970000); //object(cj_dumpster2)(6)
	CreateDynamicObject(1349,1478.6999500,-1767.8000500,18.4000000,0.0000000,0.0000000,0.0000000); //object(cj_shtrolly)(17)
	CreateDynamicObject(1349,1480.1999500,-1768.0000000,18.4000000,0.0000000,0.0000000,50.0000000); //object(cj_shtrolly)(18)
	CreateDynamicObject(1349,1479.1999500,-1766.0999800,18.4000000,0.0000000,0.0000000,319.9990000); //object(cj_shtrolly)(19)
	CreateDynamicObject(1349,1476.0999800,-1767.0999800,18.4000000,0.0000000,0.0000000,29.9930000); //object(cj_shtrolly)(20)
	CreateDynamicObject(1369,1470.5000000,-1769.0999800,18.4000000,0.0000000,0.0000000,120.0000000); //object(cj_wheelchair1)(12)
	CreateDynamicObject(1438,1469.6999500,-1766.5999800,17.8000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile_2)(14)
	CreateDynamicObject(1438,1490.6999500,-1764.1999500,17.8000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile_2)(15)
	CreateDynamicObject(1441,1493.1999500,-1766.9000200,18.4000000,0.0000000,0.0000000,50.0000000); //object(dyn_box_pile_4)(14)
	CreateDynamicObject(18249,1492.5996100,-1749.6992200,9.2000000,0.0000000,0.0000000,90.0000000); //object(cuntwjunk05)(13)
	CreateDynamicObject(18249,1469.1999500,-1749.1999500,9.2000000,0.0000000,0.0000000,90.0000000); //object(cuntwjunk05)(14)
	CreateDynamicObject(13591,1472.0000000,-1731.3000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(kickcar28)(15)
	CreateDynamicObject(13591,1482.4000200,-1732.9000200,12.6000000,0.0000000,0.0000000,30.0000000); //object(kickcar28)(16)
	CreateDynamicObject(2676,1483.0000000,-1728.5999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(101)
	CreateDynamicObject(2676,1474.3000500,-1734.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(102)
	CreateDynamicObject(2676,1460.4000200,-1731.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(103)
	CreateDynamicObject(2676,1483.0000000,-1766.4000200,17.9000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(104)
	CreateDynamicObject(2676,1472.0000000,-1764.5000000,17.9000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(105)
	CreateDynamicObject(2676,1492.4000200,-1770.8000500,17.9000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(106)
	CreateDynamicObject(2676,1476.0000000,-1758.3000500,16.7000000,0.0000000,0.0000000,90.0000000); //object(proc_rubbish_8)(107)
	CreateDynamicObject(2676,1470.3000500,-1757.9000200,16.7000000,0.0000000,0.0000000,180.0000000); //object(proc_rubbish_8)(108)
	CreateDynamicObject(2676,1492.0000000,-1758.5000000,16.7000000,0.0000000,0.0000000,179.9950000); //object(proc_rubbish_8)(109)
	CreateDynamicObject(2676,1536.8000500,-1683.6999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(110)
	CreateDynamicObject(2676,1541.0999800,-1697.9000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(111)
	CreateDynamicObject(2676,1547.0000000,-1697.4000200,12.7000000,0.0000000,0.0000000,50.0000000); //object(proc_rubbish_8)(112)
	CreateDynamicObject(2676,1542.5999800,-1676.5999800,12.7000000,0.0000000,0.0000000,49.9990000); //object(proc_rubbish_8)(113)
	CreateDynamicObject(2676,1539.9000200,-1662.3000500,12.7000000,0.0000000,0.0000000,49.9990000); //object(proc_rubbish_8)(114)
	CreateDynamicObject(2676,1539.4000200,-1656.3000500,12.7000000,0.0000000,0.0000000,119.9990000); //object(proc_rubbish_8)(115)
	CreateDynamicObject(2677,1430.0999800,-1724.1999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(101)
	CreateDynamicObject(2677,1427.5999800,-1689.0000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(102)
	CreateDynamicObject(2677,1433.3000500,-1684.5000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(103)
	CreateDynamicObject(2677,1431.8000500,-1650.0000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(104)
	CreateDynamicObject(2677,1419.1999500,-1649.8000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(105)
	CreateDynamicObject(2677,1427.0999800,-1597.5000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(106)
	CreateDynamicObject(2677,1438.0999800,-1596.5000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(107)
	CreateDynamicObject(2677,1440.1999500,-1589.0000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(108)
	CreateDynamicObject(2677,1434.8000500,-1591.3000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(109)
	CreateDynamicObject(2677,1438.3000500,-1592.4000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(110)
	CreateDynamicObject(2677,1447.3000500,-1592.3000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(111)
	CreateDynamicObject(2677,1455.5999800,-1595.1999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(112)
	CreateDynamicObject(2677,1460.9000200,-1589.1999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(113)
	CreateDynamicObject(2677,1469.0000000,-1592.8000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(114)
	CreateDynamicObject(2677,1479.4000200,-1591.3000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(115)
	CreateDynamicObject(2677,1484.5999800,-1594.3000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(116)
	CreateDynamicObject(2677,1510.0999800,-1593.0999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(117)
	CreateDynamicObject(2677,1502.5999800,-1590.5999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(118)
	CreateDynamicObject(2677,1505.0000000,-1593.6999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(119)
	CreateDynamicObject(2677,1521.5999800,-1592.5000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(120)
	CreateDynamicObject(2677,1533.8000500,-1619.0999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(121)
	CreateDynamicObject(2677,1541.3000500,-1630.0000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(122)
	CreateDynamicObject(2677,1527.9000200,-1628.0000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(123)
	CreateDynamicObject(2677,1528.1999500,-1614.6999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(124)
	CreateDynamicObject(2677,1530.5999800,-1627.1999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(125)
	CreateDynamicObject(2677,1530.3000500,-1669.1999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(126)
	CreateDynamicObject(2677,1527.5999800,-1663.9000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(127)
	CreateDynamicObject(2677,1533.0999800,-1680.1999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(128)
	CreateDynamicObject(2677,1528.5999800,-1684.0999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(129)
	CreateDynamicObject(2677,1530.5000000,-1698.4000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(130)
	CreateDynamicObject(2677,1526.5999800,-1700.0999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(131)
	CreateDynamicObject(2677,1530.9000200,-1716.3000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(132)
	CreateDynamicObject(849,1488.3000500,-1711.1999500,13.3000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_3)(11)
	CreateDynamicObject(3005,1470.1999500,-1713.4000200,13.1000000,0.0000000,0.0000000,0.0000000); //object(smash_box_stay)(2)
	CreateDynamicObject(3005,1470.0000000,-1709.9000200,13.1000000,0.0000000,0.0000000,70.0000000); //object(smash_box_stay)(3)
	CreateDynamicObject(2971,1468.9000200,-1685.8000500,13.0000000,0.0000000,0.0000000,0.0000000); //object(k_smashboxes)(26)
	CreateDynamicObject(2971,1488.0999800,-1691.3000500,13.0000000,0.0000000,0.0000000,0.0000000); //object(k_smashboxes)(27)
	CreateDynamicObject(2971,1491.9000200,-1679.0999800,13.0000000,0.0000000,0.0000000,0.0000000); //object(k_smashboxes)(28)
	CreateDynamicObject(2971,1494.5000000,-1677.6999500,13.0000000,0.0000000,0.0000000,70.0000000); //object(k_smashboxes)(29)
	CreateDynamicObject(3035,1469.5999800,-1702.1999500,13.8000000,0.0000000,0.0000000,60.0000000); //object(tmp_bin)(18)
	CreateDynamicObject(3035,1487.6999500,-1703.0999800,13.8000000,0.0000000,0.0000000,229.9960000); //object(tmp_bin)(19)
	CreateDynamicObject(3035,1482.8000500,-1673.9000200,13.8000000,0.0000000,0.0000000,329.9930000); //object(tmp_bin)(20)
	CreateDynamicObject(853,1474.4000200,-1714.5999800,13.5000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_5)(12)
	CreateDynamicObject(853,1481.0000000,-1700.1999500,13.5000000,0.0000000,0.0000000,60.0000000); //object(cj_urb_rub_5)(13)
	CreateDynamicObject(853,1479.8000500,-1683.9000200,13.5000000,0.0000000,0.0000000,139.9960000); //object(cj_urb_rub_5)(14)
	CreateDynamicObject(1391,1447.5000000,-1712.8000500,45.6000000,0.0000000,0.0000000,0.0000000); //object(twrcrane_s_03)(1)
	CreateDynamicObject(8873,1485.9000200,-1716.3000500,19.1000000,0.0000000,0.0000000,180.0000000); //object(vgsecnstrct12)(1)
	CreateDynamicObject(8873,1488.5999800,-1675.4000200,19.1000000,0.0000000,0.0000000,269.9950000); //object(vgsecnstrct12)(2)
	CreateDynamicObject(929,1478.5999800,-1716.5999800,14.0000000,0.0000000,0.0000000,0.0000000); //object(generator)(3)
	CreateDynamicObject(929,1479.4000200,-1673.0999800,14.0000000,0.0000000,0.0000000,270.0000000); //object(generator)(4)
	CreateDynamicObject(929,1469.5000000,-1673.1999500,14.0000000,0.0000000,0.0000000,270.0000000); //object(generator)(5)
	CreateDynamicObject(1420,1466.3000500,-1679.5000000,13.0000000,0.0000000,0.0000000,0.0000000); //object(dyn_aircon)(1)
	CreateDynamicObject(3287,1450.0999800,-1685.8000500,17.8000000,0.0000000,0.0000000,0.0000000); //object(cxrf_oiltank)(3)
	CreateDynamicObject(12986,1478.5999800,-1614.3000500,14.6000000,0.0000000,0.0000000,90.0000000); //object(sw_well1)(2)
	CreateDynamicObject(939,1470.5999800,-1658.0999800,15.5000000,0.0000000,0.0000000,0.0000000); //object(cj_df_unit)(7)
	CreateDynamicObject(939,1489.1999500,-1658.5999800,15.5000000,0.0000000,0.0000000,0.0000000); //object(cj_df_unit)(8)
	CreateDynamicObject(942,1479.5000000,-1658.0999800,15.5000000,0.0000000,0.0000000,0.0000000); //object(cj_df_unit_2)(8)
	CreateDynamicObject(3565,1457.0999800,-1631.0999800,14.4000000,0.0000000,0.0000000,0.0000000); //object(lasdkrt1_la01)(1)
	CreateDynamicObject(3565,1457.0000000,-1634.9000200,14.4000000,0.0000000,0.0000000,0.0000000); //object(lasdkrt1_la01)(2)
	CreateDynamicObject(3565,1457.9000200,-1641.6999500,14.4000000,0.0000000,0.0000000,90.0000000); //object(lasdkrt1_la01)(3)
	CreateDynamicObject(3565,1458.3000500,-1651.1999500,14.4000000,0.0000000,0.0000000,90.0000000); //object(lasdkrt1_la01)(4)
	CreateDynamicObject(3572,1496.8000500,-1670.3000500,14.4000000,0.0000000,0.0000000,0.0000000); //object(lasdkrt4)(1)
	CreateDynamicObject(3572,1509.1999500,-1692.5000000,14.4000000,0.0000000,0.0000000,60.0000000); //object(lasdkrt4)(2)
	CreateDynamicObject(3572,1509.4000200,-1706.4000200,14.4000000,0.0000000,0.0000000,109.9960000); //object(lasdkrt4)(3)
	CreateDynamicObject(3577,1479.5000000,-1695.8000500,13.8000000,0.0000000,0.0000000,0.0000000); //object(dockcrates1_la)(3)
	CreateDynamicObject(3630,1465.0000000,-1665.8000500,14.5000000,0.0000000,0.0000000,90.0000000); //object(crdboxes2_las)(1)
	CreateDynamicObject(7040,1501.3000500,-1635.3000500,16.5000000,0.0000000,0.0000000,0.0000000); //object(vgnplcehldbox01)(1)
	CreateDynamicObject(8078,1600.4000200,-1613.8000500,16.5000000,0.0000000,0.0000000,0.0000000); //object(vgsfrates07)(1)
	CreateDynamicObject(8075,1564.5999800,-1612.6999500,16.4000000,0.0000000,0.0000000,0.0000000); //object(vgsfrates04)(1)
	CreateDynamicObject(12913,1513.1999500,-1613.3000500,15.7000000,0.0000000,0.0000000,0.0000000); //object(sw_fueldrum03)(1)
	CreateDynamicObject(16599,1604.0000000,-1635.0999800,17.5000000,0.0000000,0.0000000,0.0000000); //object(by_fuel06)(1)
	CreateDynamicObject(1388,1447.3000500,-1713.0000000,58.2000000,0.0000000,0.0000000,240.0000000); //object(twrcrane_s_04)(1)
	CreateDynamicObject(2676,1477.4000200,-1699.6999500,13.2000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(116)
	CreateDynamicObject(2676,1486.6999500,-1705.5999800,13.2000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(117)
	CreateDynamicObject(2676,1480.8000500,-1675.9000200,13.2000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(118)
	CreateDynamicObject(2676,1491.6999500,-1674.6999500,13.2000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(119)
	CreateDynamicObject(2676,1501.9000200,-1678.1999500,13.2000000,0.0000000,0.0000000,130.0000000); //object(proc_rubbish_8)(120)
	CreateDynamicObject(2676,1493.8000500,-1666.3000500,13.2000000,0.0000000,0.0000000,129.9960000); //object(proc_rubbish_8)(121)
	CreateDynamicObject(2676,1492.0999800,-1655.9000200,13.2000000,0.0000000,0.0000000,179.9960000); //object(proc_rubbish_8)(122)
	CreateDynamicObject(2676,1475.0999800,-1656.9000200,13.2000000,0.0000000,0.0000000,229.9950000); //object(proc_rubbish_8)(123)
	CreateDynamicObject(2676,1466.5999800,-1657.3000500,13.2000000,0.0000000,0.0000000,289.9930000); //object(proc_rubbish_8)(124)
	CreateDynamicObject(2676,1463.5999800,-1633.1999500,13.2000000,0.0000000,0.0000000,359.9900000); //object(proc_rubbish_8)(125)
	CreateDynamicObject(2676,1461.5999800,-1638.3000500,13.2000000,0.0000000,0.0000000,79.9890000); //object(proc_rubbish_8)(126)
	CreateDynamicObject(2676,1450.3000500,-1632.0000000,13.2000000,0.0000000,0.0000000,79.9860000); //object(proc_rubbish_8)(127)
	CreateDynamicObject(2676,1472.3000500,-1617.1999500,13.2000000,0.0000000,0.0000000,79.9860000); //object(proc_rubbish_8)(128)
	CreateDynamicObject(2676,1484.9000200,-1611.4000200,13.2000000,0.0000000,0.0000000,119.9860000); //object(proc_rubbish_8)(129)
	CreateDynamicObject(2676,1492.1999500,-1625.3000500,13.2000000,0.0000000,0.0000000,189.9820000); //object(proc_rubbish_8)(130)
	CreateDynamicObject(4517,1415.0000000,-1732.8000500,14.2000000,0.0000000,0.0000000,90.0000000); //object(cn2_roadblock04ld)(2)
	CreateDynamicObject(3877,1558.0000000,-1738.0999800,14.2000000,0.0000000,0.0000000,50.0000000); //object(sf_rooflite)(10)
	CreateDynamicObject(3877,1557.4000200,-1731.8000500,14.0000000,0.0000000,0.0000000,330.0000000); //object(sf_rooflite)(11)
	CreateDynamicObject(3877,1557.3000500,-1724.8000500,14.2000000,0.0000000,0.0000000,30.0000000); //object(sf_rooflite)(13)
	CreateDynamicObject(3877,1558.0000000,-1717.6999500,14.2000000,0.0000000,0.0000000,0.0000000); //object(sf_rooflite)(15)
	CreateDynamicObject(3461,1545.1999500,-1712.3000500,14.6000000,90.0000000,180.0000000,180.0000000); //object(tikitorch01_lvs)(84)
	CreateDynamicObject(3461,1554.5000000,-1712.1999500,14.6000000,90.0000000,179.9950000,179.9950000); //object(tikitorch01_lvs)(85)
	CreateDynamicObject(3461,1556.0999800,-1695.8000500,14.6000000,90.0000000,179.9950000,89.9950000); //object(tikitorch01_lvs)(86)
	CreateDynamicObject(3461,1556.0999800,-1683.4000200,14.6000000,90.0000000,179.9950000,89.9950000); //object(tikitorch01_lvs)(87)
	CreateDynamicObject(3461,1555.8000500,-1684.8000500,20.6000000,90.0000000,179.9950000,89.9950000); //object(tikitorch01_lvs)(88)
	CreateDynamicObject(3461,1555.8000500,-1667.9000200,20.6000000,90.0000000,179.9950000,89.9950000); //object(tikitorch01_lvs)(89)
	CreateDynamicObject(3461,1555.9000200,-1666.9000200,14.1000000,90.0000000,179.9950000,89.9950000); //object(tikitorch01_lvs)(90)
	CreateDynamicObject(647,1499.5999800,-1617.5000000,14.4000000,0.0000000,0.0000000,0.0000000); //object(new_bushsm)(7)
	CreateDynamicObject(647,1502.3000500,-1620.9000200,14.4000000,0.0000000,0.0000000,0.0000000); //object(new_bushsm)(8)
	CreateDynamicObject(647,1459.8000500,-1617.5000000,14.4000000,0.0000000,0.0000000,0.0000000); //object(new_bushsm)(9)
	CreateDynamicObject(647,1455.5000000,-1617.0000000,14.4000000,0.0000000,0.0000000,0.0000000); //object(new_bushsm)(10)
	CreateDynamicObject(647,1456.6999500,-1622.5000000,14.4000000,0.0000000,0.0000000,0.0000000); //object(new_bushsm)(11)
	CreateDynamicObject(759,1474.3000500,-1614.1999500,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_bush_large_1)(2)
	CreateDynamicObject(759,1483.5000000,-1610.8000500,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_bush_large_1)(3)
	CreateDynamicObject(759,1482.4000200,-1626.0000000,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_bush_large_1)(4)
	CreateDynamicObject(759,1493.1999500,-1633.6999500,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_bush_large_1)(5)
	CreateDynamicObject(761,1464.4000200,-1613.0999800,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(521)
	CreateDynamicObject(761,1470.9000200,-1628.3000500,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(522)
	CreateDynamicObject(761,1477.4000200,-1625.8000500,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(523)
	CreateDynamicObject(761,1464.6999500,-1622.4000200,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(524)
	CreateDynamicObject(761,1475.5000000,-1618.9000200,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(525)
	CreateDynamicObject(761,1481.0999800,-1619.4000200,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(526)
	CreateDynamicObject(761,1495.0000000,-1607.8000500,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(527)
	CreateDynamicObject(761,1486.0000000,-1659.0999800,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(528)
	CreateDynamicObject(761,1482.5000000,-1657.1999500,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(529)
	CreateDynamicObject(761,1476.0000000,-1656.0000000,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(530)
	CreateDynamicObject(761,1466.0999800,-1658.8000500,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(531)
	CreateDynamicObject(761,1459.6999500,-1655.5999800,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(532)
	CreateDynamicObject(761,1457.4000200,-1658.3000500,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(533)
	CreateDynamicObject(761,1465.9000200,-1671.5999800,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(534)
	CreateDynamicObject(761,1464.9000200,-1679.5000000,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(535)
	CreateDynamicObject(761,1468.0999800,-1680.4000200,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(536)
	CreateDynamicObject(761,1468.3000500,-1691.5999800,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(537)
	CreateDynamicObject(761,1468.3000500,-1701.1999500,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(538)
	CreateDynamicObject(761,1469.3000500,-1710.9000200,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(539)
	CreateDynamicObject(761,1467.0000000,-1716.8000500,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(540)
	CreateDynamicObject(761,1477.1999500,-1717.1999500,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(541)
	CreateDynamicObject(761,1484.4000200,-1716.9000200,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(542)
	CreateDynamicObject(761,1488.4000200,-1699.4000200,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(543)
	CreateDynamicObject(761,1509.6999500,-1712.5999800,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(544)
	CreateDynamicObject(761,1509.0000000,-1697.5999800,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(545)
	CreateDynamicObject(761,1540.9000200,-1683.6999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(546)
	CreateDynamicObject(761,1545.5999800,-1692.4000200,12.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(547)
	CreateDynamicObject(761,1542.4000200,-1671.6999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(548)
	CreateDynamicObject(761,1537.6999500,-1652.9000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(549)
	CreateDynamicObject(761,1540.1999500,-1619.0999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(550)
	CreateDynamicObject(761,1552.4000200,-1623.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(551)
	CreateDynamicObject(761,1557.5999800,-1632.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(552)
	CreateDynamicObject(761,1575.6999500,-1632.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(553)
	CreateDynamicObject(761,1591.6992200,-1623.7998000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(554)
	CreateDynamicObject(761,1606.4000200,-1625.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(555)
	CreateDynamicObject(761,1591.5999800,-1635.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(556)
	CreateDynamicObject(761,1583.3000500,-1632.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(557)
	CreateDynamicObject(761,1508.3000500,-1629.5999800,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(558)
	CreateDynamicObject(761,1498.4000200,-1640.8000500,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(559)
	CreateDynamicObject(761,1454.0999800,-1646.4000200,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(560)
	CreateDynamicObject(761,1445.5000000,-1707.4000200,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(561)
	CreateDynamicObject(761,1446.1999500,-1704.0999800,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(562)
	CreateDynamicObject(761,1451.6999500,-1706.8000500,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(563)
	CreateDynamicObject(761,1453.8000500,-1717.5000000,13.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(564)
	CreateDynamicObject(801,1570.4000200,-1736.9000200,12.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush01)(17)
	CreateDynamicObject(801,1557.5000000,-1739.9000200,12.3000000,0.0000000,0.0000000,330.0000000); //object(genveg_bush01)(18)
	CreateDynamicObject(801,1545.5999800,-1715.5000000,12.3000000,0.0000000,0.0000000,249.9960000); //object(genveg_bush01)(19)
	CreateDynamicObject(801,1527.1999500,-1729.1999500,12.3000000,0.0000000,0.0000000,269.9940000); //object(genveg_bush01)(20)
	CreateDynamicObject(801,1505.0000000,-1713.5000000,12.3000000,0.0000000,0.0000000,269.9890000); //object(genveg_bush01)(21)
	CreateDynamicObject(801,1492.9000200,-1712.1999500,12.8000000,0.0000000,0.0000000,209.9890000); //object(genveg_bush01)(22)
	CreateDynamicObject(801,1470.3000500,-1705.1999500,12.5000000,0.0000000,0.0000000,209.9870000); //object(genveg_bush01)(23)
	CreateDynamicObject(801,1475.9000200,-1667.5999800,12.5000000,0.0000000,0.0000000,269.9870000); //object(genveg_bush01)(24)
	CreateDynamicObject(801,1475.9000200,-1667.5999800,13.3000000,0.0000000,0.0000000,209.9840000); //object(genveg_bush01)(25)
	CreateDynamicObject(801,1469.4000200,-1667.0000000,13.3000000,0.0000000,0.0000000,209.9820000); //object(genveg_bush01)(26)
	CreateDynamicObject(801,1486.5999800,-1664.6999500,13.3000000,0.0000000,0.0000000,269.9820000); //object(genveg_bush01)(27)
	CreateDynamicObject(801,1501.0000000,-1672.6999500,12.8000000,0.0000000,0.0000000,269.9780000); //object(genveg_bush01)(28)
	CreateDynamicObject(801,1465.6999500,-1636.4000200,12.8000000,0.0000000,0.0000000,269.9780000); //object(genveg_bush01)(29)
	CreateDynamicObject(801,1468.4000200,-1648.6999500,12.8000000,0.0000000,0.0000000,269.9780000); //object(genveg_bush01)(30)
	CreateDynamicObject(801,1483.4000200,-1616.3000500,12.8000000,0.0000000,0.0000000,339.9780000); //object(genveg_bush01)(31)
	CreateDynamicObject(801,1474.3000500,-1611.0999800,12.8000000,0.0000000,0.0000000,19.9770000); //object(genveg_bush01)(32)
	CreateDynamicObject(806,1472.5999800,-1597.6999500,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(102)
	CreateDynamicObject(806,1465.1999500,-1585.8000500,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(105)
	CreateDynamicObject(806,1427.9000200,-1598.6999500,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(106)
	CreateDynamicObject(806,1432.8000500,-1637.6999500,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(107)
	CreateDynamicObject(806,1426.5000000,-1678.6999500,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(108)
	CreateDynamicObject(806,1433.4000200,-1719.5999800,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(109)
	CreateDynamicObject(806,1413.9000200,-1724.8000500,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(110)
	CreateDynamicObject(806,1425.9000200,-1739.0000000,16.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(111)
	CreateDynamicObject(806,1458.9000200,-1730.5999800,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(112)
	CreateDynamicObject(806,1475.1999500,-1733.1999500,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(113)
	CreateDynamicObject(806,1489.3000500,-1736.8000500,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(114)
	CreateDynamicObject(806,1521.5000000,-1729.1999500,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(115)
	CreateDynamicObject(806,1550.1999500,-1733.6999500,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(116)
	CreateDynamicObject(806,1558.9000200,-1725.6999500,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(117)
	CreateDynamicObject(806,1556.8000500,-1732.5999800,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(118)
	CreateDynamicObject(806,1570.0000000,-1720.9000200,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(119)
	CreateDynamicObject(806,1513.8000500,-1691.5000000,16.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(120)
	CreateDynamicObject(806,1539.9000200,-1700.0999800,16.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(121)
	CreateDynamicObject(806,1540.5000000,-1709.0000000,16.9000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(122)
	CreateDynamicObject(806,1541.0999800,-1705.9000200,16.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(123)
	CreateDynamicObject(806,1543.5999800,-1658.1999500,16.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(124)
	CreateDynamicObject(806,1515.5000000,-1645.1999500,16.6000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(125)
	CreateDynamicObject(806,1508.6999500,-1663.0999800,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(126)
	CreateDynamicObject(806,1514.8000500,-1672.0000000,16.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(127)
	CreateDynamicObject(806,1494.4000200,-1695.5999800,17.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(128)
	CreateDynamicObject(806,1458.8000500,-1684.4000200,17.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(129)
	CreateDynamicObject(806,1482.0000000,-1667.1999500,17.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(130)
	CreateDynamicObject(3594,1536.5999800,-1624.0000000,12.9000000,0.0000000,0.0000000,243.7980000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1531.8000500,-1649.0999800,12.9000000,0.0000000,0.0000000,343.7980000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1528.0999800,-1671.0999800,12.9000000,0.0000000,0.0000000,13.7950000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1531.6999500,-1702.1999500,12.9000000,0.0000000,0.0000000,333.7930000); //object(la_fuckcar1)(143)
	CreateDynamicObject(18249,1585.9000200,-1638.6999500,8.4000000,0.0000000,0.0000000,90.0000000); //object(cuntwjunk05)(13)
	CreateDynamicObject(3594,1579.4000200,-1620.1999500,13.2000000,0.0000000,0.0000000,343.7950000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1588.4000200,-1619.5000000,13.0000000,0.0000000,0.0000000,23.7950000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1584.6999500,-1610.0999800,13.0000000,0.0000000,0.0000000,103.7910000); //object(la_fuckcar1)(143)
	CreateDynamicObject(761,1587.5000000,-1622.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(554)
	CreateDynamicObject(761,1580.3000500,-1622.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(554)
	CreateDynamicObject(761,1581.8000500,-1616.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(554)
	CreateDynamicObject(761,1583.0000000,-1612.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(554)
	CreateDynamicObject(761,1588.1999500,-1607.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(554)
	CreateDynamicObject(761,1582.4000200,-1608.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(554)
	CreateDynamicObject(761,1588.5999800,-1615.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(554)
	CreateDynamicObject(761,1577.4000200,-1603.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(554)
	CreateDynamicObject(2672,1933.5000000,-1751.0999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1942.8000500,-1730.0000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1945.3000500,-1722.5999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1942.6999500,-1687.1999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1939.1999500,-1681.3000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1945.5999800,-1653.5000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1942.5000000,-1630.6999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1943.6999500,-1622.0000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1927.9000200,-1612.4000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1902.5000000,-1612.8000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1886.6999500,-1610.4000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1854.9000200,-1615.6999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1849.6999500,-1608.0000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1848.0000000,-1611.3000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1842.5000000,-1609.0999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1832.8000500,-1615.6999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1833.5000000,-1608.3000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1815.0000000,-1602.5000000,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1819.5999800,-1605.5999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1825.1999500,-1603.9000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1813.5000000,-1626.3000500,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1822.3000500,-1631.9000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1819.4000200,-1640.0999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1824.5999800,-1642.8000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1822.5999800,-1657.5999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1821.5000000,-1689.4000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1819.3000500,-1693.3000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1818.6999500,-1745.6999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1824.0000000,-1744.8000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1819.6999500,-1767.6999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1818.5999800,-1802.9000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1823.4000200,-1824.6999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1803.0999800,-1833.5000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1801.4000200,-1831.3000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1805.5999800,-1830.4000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1784.1999500,-1830.3000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1776.9000200,-1825.1999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1738.8000500,-1818.0000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1710.5000000,-1812.9000200,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1691.1999500,-1806.4000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1690.6999500,-1812.5999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1687.4000200,-1808.3000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1685.8000500,-1817.6999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1686.5000000,-1828.0000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1690.5000000,-1844.6999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1685.9000200,-1848.9000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1683.5999800,-1853.5999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1649.1999500,-1875.5000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1650.4000200,-1870.5999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1652.1999500,-1865.4000200,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1624.9000200,-1879.0000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1617.4000200,-1880.4000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1610.6999500,-1871.1999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1620.9000200,-1869.0000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1623.6999500,-1863.0000000,12.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1585.6999500,-1870.1999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1574.0000000,-1865.6999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1560.4000200,-1874.8000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1527.5999800,-1876.5999800,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1568.9000200,-1831.5000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1570.8000500,-1825.8000500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1569.4000200,-1799.5000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1571.5000000,-1768.5000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1572.9000200,-1745.1999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1577.6999500,-1731.9000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(2672,1577.5999800,-1731.9000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(61)
	CreateDynamicObject(1299,1576.0999800,-1734.0999800,12.8000000,0.0000000,0.0000000,0.0000000); //object(smashboxpile)(25)
	CreateDynamicObject(1299,1571.4000200,-1858.9000200,12.8000000,0.0000000,0.0000000,0.0000000); //object(smashboxpile)(26)
	CreateDynamicObject(1299,1521.0000000,-1875.9000200,12.8000000,0.0000000,0.0000000,0.0000000); //object(smashboxpile)(27)
	CreateDynamicObject(1299,1645.0000000,-1879.3000500,13.0000000,0.0000000,0.0000000,0.0000000); //object(smashboxpile)(28)
	CreateDynamicObject(1299,1652.9000200,-1863.1999500,13.0000000,0.0000000,0.0000000,0.0000000); //object(smashboxpile)(29)
	CreateDynamicObject(1299,1688.9000200,-1856.3000500,12.8000000,0.0000000,0.0000000,330.0000000); //object(smashboxpile)(30)
	CreateDynamicObject(1299,1741.5999800,-1821.0000000,12.8000000,0.0000000,0.0000000,353.9960000); //object(smashboxpile)(31)
	CreateDynamicObject(1299,1777.9000200,-1830.5999800,12.8000000,0.0000000,0.0000000,23.9960000); //object(smashboxpile)(32)
	CreateDynamicObject(1299,1819.3000500,-1893.0999800,12.8000000,0.0000000,0.0000000,23.9940000); //object(smashboxpile)(33)
	CreateDynamicObject(1299,1843.9000200,-1932.9000200,12.8000000,0.0000000,0.0000000,83.9940000); //object(smashboxpile)(34)
	CreateDynamicObject(1299,1880.0000000,-1931.4000200,12.8000000,0.0000000,0.0000000,83.9900000); //object(smashboxpile)(35)
	CreateDynamicObject(1299,1965.1999500,-1911.1999500,12.8000000,0.0000000,0.0000000,83.9900000); //object(smashboxpile)(36)
	CreateDynamicObject(3461,1538.1999500,-1757.4000200,20.6000000,270.0000000,179.3040000,179.3040000); //object(tikitorch01_lvs)(91)
	CreateDynamicObject(3461,1539.6999500,-1757.6999500,20.6000000,270.0000000,179.3020000,179.3020000); //object(tikitorch01_lvs)(92)
	CreateDynamicObject(3461,1528.3000500,-1757.6999500,20.7000000,270.0000000,179.3020000,179.3020000); //object(tikitorch01_lvs)(93)
	CreateDynamicObject(3461,1529.6999500,-1757.5999800,20.7000000,270.0000000,179.3020000,179.3020000); //object(tikitorch01_lvs)(94)
	CreateDynamicObject(3461,1519.0000000,-1758.0000000,20.7000000,270.0000000,179.3020000,179.3020000); //object(tikitorch01_lvs)(95)
	CreateDynamicObject(621,1499.6999500,-1693.0000000,13.5000000,0.0000000,0.0000000,0.0000000); //object(veg_palm02)(3)
	CreateDynamicObject(3578,1414.1999500,-1588.0999800,13.1000000,0.0000000,0.0000000,110.0000000); //object(dockbarr1_la)(1)
	CreateDynamicObject(3578,1410.4000200,-1597.6999500,13.1000000,0.0000000,0.0000000,49.9950000); //object(dockbarr1_la)(2)
	CreateDynamicObject(3578,1689.5999800,-1774.0999800,13.2000000,0.0000000,0.0000000,0.0000000); //object(dockbarr1_la)(3)
	CreateDynamicObject(925,1690.5999800,-1771.6999500,13.4000000,0.0000000,0.0000000,220.0000000); //object(rack2)(10)
	CreateDynamicObject(925,1686.9000200,-1771.5999800,13.4000000,0.0000000,0.0000000,169.9960000); //object(rack2)(11)
	CreateDynamicObject(1362,1692.8000500,-1772.3000500,13.0000000,0.0000000,0.0000000,0.0000000); //object(cj_firebin)(2)
	CreateDynamicObject(3594,1659.9000200,-1569.3000500,13.0000000,0.0000000,0.0000000,193.8110000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1655.0999800,-1552.5999800,13.0000000,0.0000000,0.0000000,173.8100000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1675.4000200,-1549.0000000,13.0000000,0.0000000,0.0000000,103.8090000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1668.9000200,-1548.1999500,13.0000000,0.0000000,0.0000000,163.8040000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1660.5000000,-1523.4000200,13.0000000,0.0000000,0.0000000,213.8010000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1654.3000500,-1501.0000000,13.0000000,0.0000000,0.0000000,183.7990000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1659.0999800,-1489.0999800,13.0000000,0.0000000,0.0000000,123.7960000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1673.5999800,-1479.3000500,13.0000000,0.0000000,0.0000000,243.7940000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1660.3000500,-1468.1999500,13.0000000,0.0000000,0.0000000,193.7920000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1653.9000200,-1447.3000500,13.0000000,0.0000000,0.0000000,233.7880000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1670.5000000,-1441.4000200,13.0000000,0.0000000,0.0000000,143.7840000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1690.9000200,-1442.0999800,13.0000000,0.0000000,0.0000000,203.7840000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1706.3000500,-1436.8000500,13.0000000,0.0000000,0.0000000,103.7800000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1717.5999800,-1428.3000500,13.0000000,0.0000000,0.0000000,183.7770000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1747.1999500,-1444.1999500,13.0000000,0.0000000,0.0000000,101.7740000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1780.5000000,-1450.0000000,13.0000000,0.0000000,0.0000000,41.7720000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1804.2998000,-1459.2998000,13.0000000,0.0000000,0.0000000,81.7660000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1845.5000000,-1461.8000500,13.0000000,0.0000000,0.0000000,143.7660000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1859.6999500,-1465.5999800,13.0000000,0.0000000,0.0000000,73.7620000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1897.6999500,-1461.5999800,13.0000000,0.0000000,0.0000000,123.7570000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1920.0999800,-1459.9000200,13.0000000,0.0000000,0.0000000,83.7550000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1950.8000500,-1467.3000500,13.0000000,0.0000000,0.0000000,133.7540000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1980.9000200,-1460.1999500,13.0000000,0.0000000,0.0000000,233.7530000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2011.8000500,-1465.6999500,13.0000000,0.0000000,0.0000000,153.7510000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1988.0000000,-1449.8000500,13.0000000,0.0000000,0.0000000,153.7480000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1849.5000000,-1427.5000000,13.0000000,0.0000000,0.0000000,143.7620000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1853.5999800,-1397.0000000,13.0000000,0.0000000,0.0000000,203.7620000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1852.9000200,-1372.4000200,13.0000000,0.0000000,0.0000000,173.7580000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1845.9000200,-1351.9000200,13.0000000,0.0000000,0.0000000,243.7540000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1853.1999500,-1350.1999500,13.0000000,0.0000000,0.0000000,303.7540000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1845.4000200,-1327.5000000,13.0000000,0.0000000,0.0000000,33.7500000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1878.5999800,-1342.1999500,13.0000000,0.0000000,0.0000000,103.7500000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1889.8000500,-1341.5999800,13.0000000,0.0000000,0.0000000,223.7490000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1850.0999800,-1308.0000000,13.0000000,0.0000000,0.0000000,223.7480000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1845.5000000,-1280.5999800,13.0000000,0.0000000,0.0000000,193.7480000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1862.2998000,-1263.8994100,13.0000000,0.0000000,0.0000000,273.7410000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1831.8000500,-1260.0999800,13.0000000,0.0000000,0.0000000,313.7410000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1810.3000500,-1264.5000000,13.0000000,0.0000000,0.0000000,273.7370000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1776.6999500,-1281.8000500,13.0000000,0.0000000,0.0000000,303.7350000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1745.8000500,-1298.9000200,13.0000000,0.0000000,0.0000000,355.7340000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1719.0000000,-1300.4000200,13.0000000,0.0000000,0.0000000,315.7320000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1712.5999800,-1332.6999500,13.0000000,0.0000000,0.0000000,355.7310000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1716.4000200,-1368.4000200,13.0000000,0.0000000,0.0000000,45.7260000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1712.0000000,-1392.0999800,13.0000000,0.0000000,0.0000000,185.7250000); //object(la_fuckcar1)(143)
	CreateDynamicObject(761,1849.4000200,-1460.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1842.1999500,-1461.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1861.0999800,-1468.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1856.4000200,-1462.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1895.0999800,-1461.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1898.0999800,-1458.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1898.3000500,-1463.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1918.1999500,-1461.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1923.8000500,-1463.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1921.5999800,-1457.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1950.1999500,-1464.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1945.6999500,-1469.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1947.3000500,-1466.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1949.5999800,-1474.5999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1977.5999800,-1460.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1980.5999800,-1462.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1978.9000200,-1457.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1985.3000500,-1450.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1990.3000500,-1450.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1987.4000200,-1454.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2009.1999500,-1466.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2011.3000500,-1462.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2012.5000000,-1468.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2015.8000500,-1464.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1852.4000200,-1427.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1847.6999500,-1426.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1848.5999800,-1431.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1852.5000000,-1399.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1854.0999800,-1394.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1857.0000000,-1399.8000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1854.4000200,-1375.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1855.4000200,-1369.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1851.1999500,-1372.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1850.1999500,-1353.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1842.5999800,-1352.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1855.6999500,-1351.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1853.5999800,-1347.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1835.0000000,-1345.1999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1835.0999800,-1357.6999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1833.0999800,-1376.0000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1849.5999800,-1310.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1854.0999800,-1309.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1849.5000000,-1304.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1844.8000500,-1284.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1847.8000500,-1282.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1847.5999800,-1277.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1842.9000200,-1276.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1859.8000500,-1267.0000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1857.8000500,-1262.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1866.1999500,-1262.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1834.3000500,-1250.1999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1834.4000200,-1260.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1828.0000000,-1260.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1833.6999500,-1256.4000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1812.0999800,-1262.5000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1809.6999500,-1266.0999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1814.4000200,-1265.4000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1811.6999500,-1252.5000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1779.4000200,-1282.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1775.0000000,-1280.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1778.9000200,-1278.4000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1748.0000000,-1297.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1747.5000000,-1301.9000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1743.6999500,-1298.0999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1744.1999500,-1287.5999800,12.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1755.0000000,-1284.0000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1765.0000000,-1276.3000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1767.3000500,-1272.6999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1718.4000200,-1304.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1722.8000500,-1298.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1717.3000500,-1299.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1714.5000000,-1331.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1710.4000200,-1335.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1716.8000500,-1365.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1716.3000500,-1371.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1713.8000500,-1389.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1710.3000500,-1393.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1713.5000000,-1396.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1709.0000000,-1387.5999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1718.5999800,-1423.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1715.5999800,-1429.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1715.0999800,-1423.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1722.3000500,-1435.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1709.0999800,-1437.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1703.1999500,-1435.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1706.0999800,-1438.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1693.5999800,-1443.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1688.9000200,-1442.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1668.3000500,-1430.5999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1670.0999800,-1438.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1667.4000200,-1441.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1672.4000200,-1442.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1656.4000200,-1447.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1653.5000000,-1444.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1649.5999800,-1446.6999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1652.3000500,-1449.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1661.8000500,-1464.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1655.9000200,-1470.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1673.8000500,-1482.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1674.0999800,-1476.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1668.6999500,-1479.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1660.0000000,-1485.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1654.5000000,-1489.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1660.0999800,-1490.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1656.0000000,-1499.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1652.1999500,-1502.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1652.0999800,-1496.4000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1660.0000000,-1519.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1659.8000500,-1526.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1661.9000200,-1522.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1656.8000500,-1520.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1651.8000500,-1520.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1653.6999500,-1550.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1652.6999500,-1554.5999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1656.5999800,-1553.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1666.9000200,-1545.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1666.9000200,-1549.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1669.5000000,-1553.3000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1673.8000500,-1551.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1661.3000500,-1568.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1658.0000000,-1571.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1651.3000500,-1572.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1744.5999800,-1442.3000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1751.4000200,-1441.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1747.6999500,-1446.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1777.3000500,-1449.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1781.4000200,-1454.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1784.0999800,-1451.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1806.1999500,-1461.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1802.4000200,-1456.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1801.3000500,-1460.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1707.3000500,-1292.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1704.5999800,-1314.6999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1703.4000200,-1293.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(1299,1855.6999500,-1467.3000500,12.9000000,0.0000000,0.0000000,340.0000000); //object(smashboxpile)(37)
	CreateDynamicObject(1299,1844.8000500,-1459.3000500,12.9000000,0.0000000,0.0000000,29.9990000); //object(smashboxpile)(38)
	CreateDynamicObject(1299,1844.1999500,-1475.6999500,12.9000000,0.0000000,0.0000000,29.9980000); //object(smashboxpile)(39)
	CreateDynamicObject(1299,1852.5999800,-1478.3000500,12.9000000,0.0000000,0.0000000,309.9980000); //object(smashboxpile)(40)
	CreateDynamicObject(761,1877.0999800,-1340.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1881.1999500,-1343.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1875.5000000,-1344.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	AddStaticVehicle(493,2911.0000000,-1846.3000500,0.0000000,300.0000000,45,58); //Jetmax
	AddStaticVehicle(493,2917.1001000,-1856.6999500,0.0000000,299.9980000,45,58); //Jetmax
	CreateDynamicObject(761,1888.5999800,-1344.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1889.5999800,-1338.1999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1892.9000200,-1341.5999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1895.1999500,-1332.9000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(969,1804.3000500,-1345.4000200,14.5000000,0.0000000,0.0000000,250.0000000); //object(electricgate)(1)
	CreateDynamicObject(969,1784.1999500,-1405.4000200,14.8000000,0.0000000,0.0000000,309.9990000); //object(electricgate)(2)
	CreateDynamicObject(971,1737.4000200,-1347.3000500,17.2000000,46.0000000,0.0000000,320.0000000); //object(subwaygate)(18)
	CreateDynamicObject(969,1793.0996100,-1342.0996100,14.5000000,0.0000000,0.0000000,309.9960000); //object(electricgate)(3)
	CreateDynamicObject(818,1803.8000500,-1352.4000200,18.0000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass02)(12)
	CreateDynamicObject(818,1796.0000000,-1342.5000000,18.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass02)(13)
	CreateDynamicObject(818,1735.4000200,-1353.9000200,18.6000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass02)(14)
	CreateDynamicObject(818,1744.9000200,-1355.6999500,18.6000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass02)(15)
	CreateDynamicObject(818,1753.8000500,-1349.8000500,18.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass02)(16)
	CreateDynamicObject(818,1759.5000000,-1350.4000200,18.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass02)(17)
	CreateDynamicObject(818,1768.0000000,-1359.9000200,18.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass02)(18)
	CreateDynamicObject(818,1783.3000500,-1366.0000000,18.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass02)(19)
	CreateDynamicObject(820,1772.1999500,-1342.8000500,14.4000000,0.0000000,0.0000000,60.0000000); //object(genveg_tallgrass04)(1)
	CreateDynamicObject(820,1784.6999500,-1344.6999500,14.4000000,0.0000000,0.0000000,59.9960000); //object(genveg_tallgrass04)(2)
	CreateDynamicObject(820,1796.5000000,-1351.8000500,14.4000000,0.0000000,0.0000000,99.9960000); //object(genveg_tallgrass04)(3)
	CreateDynamicObject(820,1787.4000200,-1360.0000000,14.4000000,0.0000000,0.0000000,99.9920000); //object(genveg_tallgrass04)(4)
	CreateDynamicObject(820,1772.0999800,-1380.1999500,14.4000000,0.0000000,0.0000000,49.9920000); //object(genveg_tallgrass04)(5)
	CreateDynamicObject(820,1749.1999500,-1357.3000500,14.4000000,0.0000000,0.0000000,49.9880000); //object(genveg_tallgrass04)(6)
	CreateDynamicObject(820,1759.0999800,-1345.4000200,14.4000000,0.0000000,0.0000000,109.9880000); //object(genveg_tallgrass04)(7)
	CreateDynamicObject(820,1764.9000200,-1349.0000000,14.4000000,0.0000000,0.0000000,109.9840000); //object(genveg_tallgrass04)(8)
	CreateDynamicObject(822,1767.0999800,-1344.0000000,15.8000000,0.0000000,0.0000000,50.0000000); //object(genveg_tallgrass06)(3)
	CreateDynamicObject(822,1786.8000500,-1366.1999500,15.8000000,0.0000000,0.0000000,49.9990000); //object(genveg_tallgrass06)(4)
	CreateDynamicObject(822,1767.6999500,-1364.1999500,15.8000000,0.0000000,0.0000000,49.9990000); //object(genveg_tallgrass06)(5)
	CreateDynamicObject(822,1770.0000000,-1370.6999500,15.8000000,0.0000000,0.0000000,119.9990000); //object(genveg_tallgrass06)(6)
	CreateDynamicObject(821,1855.8000500,-1482.3000500,12.9000000,0.0000000,0.0000000,60.0000000); //object(genveg_tallgrass05)(1)
	CreateDynamicObject(821,1838.5999800,-1484.9000200,12.9000000,0.0000000,0.0000000,109.9960000); //object(genveg_tallgrass05)(2)
	CreateDynamicObject(3594,2641.6999500,-1725.4000200,10.4000000,0.0000000,0.0000000,349.9970000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2641.6992200,-1725.3994100,10.4000000,0.0000000,0.0000000,349.9970000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2643.6999500,-1709.8000500,10.4000000,0.0000000,0.0000000,49.9970000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2643.6999500,-1694.0999800,10.4000000,0.0000000,0.0000000,119.9930000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2643.1999500,-1673.6999500,10.4000000,0.0000000,0.0000000,99.9930000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2642.5000000,-1655.3000000,10.4000000,0.0000000,0.0000000,19.9900000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2659.6001000,-1657.5999800,10.4000000,0.0000000,0.0000000,79.9900000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2676.8994100,-1657.7998000,10.4000000,0.0000000,0.0000000,109.9840000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2640.1001000,-1786.3000500,10.4000000,0.0000000,0.0000000,11.9970000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2643.6001000,-1815.5000000,10.4000000,0.0000000,0.0000000,131.9920000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2655.8999000,-1854.0999800,10.4000000,0.0000000,0.0000000,51.9900000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2680.1999500,-1872.5000000,10.4000000,0.0000000,0.0000000,231.9870000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2719.0000000,-1892.4000200,10.4000000,0.0000000,0.0000000,101.9820000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2751.3000500,-1890.9000200,10.4000000,0.0000000,0.0000000,151.9810000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2759.6999500,-1888.6999500,10.4000000,0.0000000,0.0000000,71.9790000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2777.1999500,-1895.6999500,10.4000000,0.0000000,0.0000000,121.9770000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2803.6001000,-1887.0000000,10.4000000,0.0000000,0.0000000,91.9760000); //object(la_fuckcar1)(21)
	CreateDynamicObject(13823,3807.2998000,-2099.0996100,8.7000000,353.9960000,0.0000000,289.9950000); //object(cunteground23)(1)
	CreateDynamicObject(18228,3834.3000500,-2209.5000000,0.0000000,0.0000000,0.0000000,350.0000000); //object(cunt_rockgp2_21)(1)
	CreateDynamicObject(18228,3865.3000500,-2203.1001000,0.2000000,0.0000000,0.0000000,349.9970000); //object(cunt_rockgp2_21)(2)
	CreateDynamicObject(18228,3904.1001000,-2188.3999000,0.2000000,0.0000000,0.0000000,349.9970000); //object(cunt_rockgp2_21)(3)
	CreateDynamicObject(18228,3945.8000500,-2172.6001000,0.2000000,0.0000000,0.0000000,349.9970000); //object(cunt_rockgp2_21)(4)
	CreateDynamicObject(18228,3978.8999000,-2157.8000500,0.2000000,0.0000000,0.0000000,9.9970000); //object(cunt_rockgp2_21)(5)
	CreateDynamicObject(18228,3970.6999500,-2126.8000500,0.2000000,0.0000000,0.0000000,79.9920000); //object(cunt_rockgp2_21)(6)
	CreateDynamicObject(18228,3946.6999500,-2099.8000500,0.2000000,0.0000000,0.0000000,79.9910000); //object(cunt_rockgp2_21)(7)
	CreateDynamicObject(18228,3951.6001000,-2058.8000500,0.2000000,0.0000000,0.0000000,59.9910000); //object(cunt_rockgp2_21)(8)
	CreateDynamicObject(18228,3932.3999000,-2047.9000200,0.2000000,0.0000000,0.0000000,79.9910000); //object(cunt_rockgp2_21)(9)
	CreateDynamicObject(18228,3921.3999000,-2013.9000200,0.2000000,0.0000000,0.0000000,49.9860000); //object(cunt_rockgp2_21)(10)
	CreateDynamicObject(18228,3912.8999000,-1979.3000500,1.5000000,0.0000000,0.0000000,59.9820000); //object(cunt_rockgp2_21)(11)
	CreateDynamicObject(18228,3897.3000500,-1938.6999500,0.2000000,0.0000000,0.0000000,69.9800000); //object(cunt_rockgp2_21)(12)
	CreateDynamicObject(17031,3907.1999500,-2179.8999000,0.2000000,0.0000000,0.0000000,310.0000000); //object(cunt_rockgp2_13)(1)
	CreateDynamicObject(17031,3945.8000500,-2165.6001000,0.2000000,0.0000000,0.0000000,309.9960000); //object(cunt_rockgp2_13)(2)
	CreateDynamicObject(17031,3957.6001000,-2161.0000000,5.2000000,0.0000000,0.0000000,309.9960000); //object(cunt_rockgp2_13)(3)
	CreateDynamicObject(17031,3979.8000500,-2149.1001000,5.2000000,0.0000000,0.0000000,327.9960000); //object(cunt_rockgp2_13)(4)
	CreateDynamicObject(17031,3961.5000000,-2133.1999500,18.2000000,0.0000000,0.0000000,27.9910000); //object(cunt_rockgp2_13)(5)
	CreateDynamicObject(17031,3945.0000000,-2111.6999500,10.7000000,0.0000000,0.0000000,27.9880000); //object(cunt_rockgp2_13)(6)
	CreateDynamicObject(17031,3941.8000500,-2087.3000500,16.0000000,0.0000000,0.0000000,7.9880000); //object(cunt_rockgp2_13)(7)
	CreateDynamicObject(17031,3930.5000000,-2056.1001000,13.0000000,0.0000000,0.0000000,37.9870000); //object(cunt_rockgp2_13)(8)
	CreateDynamicObject(17031,3919.5000000,-2037.5999800,15.8000000,0.0000000,0.0000000,37.9850000); //object(cunt_rockgp2_13)(9)
	CreateDynamicObject(17031,3911.3000500,-2003.3000500,8.3000000,0.0000000,0.0000000,17.9850000); //object(cunt_rockgp2_13)(10)
	CreateDynamicObject(18228,3928.5000000,-2180.6999500,7.5000000,0.0000000,0.0000000,349.9970000); //object(cunt_rockgp2_21)(13)
	CreateDynamicObject(18228,3955.3000500,-2176.1999500,6.4000000,0.0000000,0.0000000,349.9970000); //object(cunt_rockgp2_21)(14)
	CreateDynamicObject(18228,3980.0000000,-2160.3000500,6.9000000,0.0000000,0.0000000,3.9970000); //object(cunt_rockgp2_21)(15)
	CreateDynamicObject(18228,3945.8000500,-2080.0000000,13.7000000,0.0000000,0.0000000,33.9940000); //object(cunt_rockgp2_21)(16)
	CreateDynamicObject(17031,3921.6999500,-2015.5999800,17.5000000,0.0000000,0.0000000,17.9850000); //object(cunt_rockgp2_13)(11)
	CreateDynamicObject(17031,3939.1999500,-2014.5000000,-2.7000000,0.0000000,0.0000000,17.9850000); //object(cunt_rockgp2_13)(12)
	CreateDynamicObject(18228,3912.8999000,-1979.3000500,6.0000000,0.0000000,0.0000000,59.9800000); //object(cunt_rockgp2_21)(17)
	CreateDynamicObject(672,3854.5000000,-2198.8000500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree5)(1)
	CreateDynamicObject(672,3884.8000500,-2191.6999500,18.8000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree5)(2)
	CreateDynamicObject(691,3822.3999000,-2205.5000000,3.4000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4_big)(1)
	CreateDynamicObject(691,3861.8999000,-2152.6999500,13.2000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4_big)(2)
	CreateDynamicObject(691,3839.0000000,-2135.6999500,6.5000000,0.0000000,0.0000000,30.0000000); //object(sm_veg_tree4_big)(3)
	CreateDynamicObject(691,3849.5000000,-2105.0000000,18.3000000,0.0000000,0.0000000,29.9980000); //object(sm_veg_tree4_big)(4)
	CreateDynamicObject(691,3827.3999000,-2080.5000000,9.9000000,0.0000000,0.0000000,29.9980000); //object(sm_veg_tree4_big)(5)
	CreateDynamicObject(691,3817.0000000,-2040.6999500,4.1000000,0.0000000,0.0000000,29.9980000); //object(sm_veg_tree4_big)(6)
	CreateDynamicObject(691,3815.1001000,-2001.8000500,0.6000000,0.0000000,0.0000000,29.9980000); //object(sm_veg_tree4_big)(7)
	CreateDynamicObject(703,3842.0000000,-2180.6999500,5.9000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree7_big)(1)
	CreateDynamicObject(703,3824.5000000,-2186.5000000,3.2000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree7_big)(2)
	CreateDynamicObject(703,3828.3000500,-2161.0000000,3.2000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree7_big)(3)
	CreateDynamicObject(703,3870.1001000,-2174.8999000,16.1000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree7_big)(4)
	CreateDynamicObject(703,3876.3999000,-2196.1001000,17.6000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree7_big)(5)
	CreateDynamicObject(703,3916.8000500,-2182.6001000,22.6000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree7_big)(6)
	CreateDynamicObject(703,3939.3000500,-2170.1001000,24.4000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree7_big)(7)
	CreateDynamicObject(703,3952.1999500,-2163.8000500,26.9000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree7_big)(8)
	CreateDynamicObject(703,3971.6999500,-2163.6999500,26.9000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree7_big)(9)
	CreateDynamicObject(703,3957.8999000,-2128.3999000,34.9000000,0.0000000,0.0000000,30.0000000); //object(sm_veg_tree7_big)(10)
	CreateDynamicObject(703,3951.1999500,-2093.1001000,34.9000000,0.0000000,0.0000000,29.9980000); //object(sm_veg_tree7_big)(11)
	CreateDynamicObject(703,3940.5000000,-2111.3000500,34.9000000,0.0000000,0.0000000,29.9980000); //object(sm_veg_tree7_big)(12)
	CreateDynamicObject(703,3939.8000500,-2075.1001000,33.9000000,0.0000000,0.0000000,29.9980000); //object(sm_veg_tree7_big)(13)
	CreateDynamicObject(703,3938.8000500,-2058.3999000,36.5000000,0.0000000,0.0000000,29.9980000); //object(sm_veg_tree7_big)(14)
	CreateDynamicObject(727,3837.3000500,-2118.3999000,10.4000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly04)(1)
	CreateDynamicObject(727,3812.3000500,-2092.6001000,2.4000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly04)(2)
	CreateDynamicObject(727,3822.8000500,-2064.1001000,7.4000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly04)(3)
	CreateDynamicObject(727,3806.0000000,-2043.4000200,3.4000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly04)(4)
	CreateDynamicObject(727,3809.6992200,-2007.2998000,1.9000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly04)(5)
	CreateDynamicObject(727,3796.5000000,-2020.5000000,0.9000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly04)(6)
	CreateDynamicObject(727,3795.0000000,-1980.5999800,0.9000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly04)(7)
	CreateDynamicObject(727,3834.8000500,-1971.5000000,-0.1000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly04)(8)
	CreateDynamicObject(727,3863.0000000,-1949.0999800,2.9000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly04)(9)
	CreateDynamicObject(18228,3862.6999500,-1942.0999800,-7.8000000,0.0000000,0.0000000,153.9770000); //object(cunt_rockgp2_21)(18)
	CreateDynamicObject(730,3843.1999500,-2156.6999500,6.4000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly08)(1)
	CreateDynamicObject(730,3851.1999500,-2179.3000500,8.4000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly08)(2)
	CreateDynamicObject(730,3823.1001000,-2174.8999000,1.4000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly08)(3)
	CreateDynamicObject(730,3812.3000500,-2200.5000000,0.2000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly08)(4)
	CreateDynamicObject(730,3878.6999500,-2188.3999000,16.2000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly08)(5)
	CreateDynamicObject(730,3921.8999000,-2149.1999500,29.9000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly08)(6)
	CreateDynamicObject(730,3939.8994100,-2159.0996100,26.9000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly08)(7)
	CreateDynamicObject(730,3943.5000000,-2122.1001000,31.7000000,0.0000000,0.0000000,40.0000000); //object(tree_hipoly08)(8)
	CreateDynamicObject(730,3937.0000000,-2101.0996100,30.7000000,0.0000000,0.0000000,79.9910000); //object(tree_hipoly08)(9)
	CreateDynamicObject(730,3933.1999500,-2079.0000000,30.0000000,0.0000000,0.0000000,79.9910000); //object(tree_hipoly08)(10)
	CreateDynamicObject(733,3905.8999000,-2070.8000500,32.8000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly11)(1)
	CreateDynamicObject(733,3899.1001000,-2109.3999000,32.1000000,0.0000000,0.0000000,60.0000000); //object(tree_hipoly11)(2)
	CreateDynamicObject(733,3871.8999000,-2119.3999000,25.5000000,0.0000000,0.0000000,99.9960000); //object(tree_hipoly11)(3)
	CreateDynamicObject(765,3903.6999500,-2112.5000000,33.9000000,0.0000000,0.0000000,0.0000000); //object(cedar2_hi)(1)
	CreateDynamicObject(763,3900.6999500,-2163.6001000,23.2000000,0.0000000,0.0000000,0.0000000); //object(ash1_hi)(1)
	CreateDynamicObject(763,3894.0000000,-2186.8999000,16.0000000,0.0000000,0.0000000,0.0000000); //object(ash1_hi)(2)
	CreateDynamicObject(763,3958.8999000,-2155.0000000,24.0000000,0.0000000,0.0000000,0.0000000); //object(ash1_hi)(3)
	CreateDynamicObject(763,3952.8000500,-2112.3999000,33.3000000,0.0000000,0.0000000,0.0000000); //object(ash1_hi)(4)
	CreateDynamicObject(763,3939.8000500,-2065.1999500,33.3000000,0.0000000,0.0000000,40.0000000); //object(ash1_hi)(5)
	CreateDynamicObject(763,3904.8000500,-2039.9000200,33.3000000,0.0000000,0.0000000,39.9960000); //object(ash1_hi)(6)
	CreateDynamicObject(763,3913.1001000,-2010.9000200,28.1000000,0.0000000,0.0000000,39.9960000); //object(ash1_hi)(7)
	CreateDynamicObject(763,3911.3000500,-1993.0999800,19.6000000,0.0000000,0.0000000,39.9960000); //object(ash1_hi)(8)
	CreateDynamicObject(769,3833.5000000,-2148.0000000,3.4000000,0.0000000,0.0000000,0.0000000); //object(locust_hi)(1)
	CreateDynamicObject(769,3828.3999000,-2197.8000500,3.4000000,0.0000000,0.0000000,70.0000000); //object(locust_hi)(2)
	CreateDynamicObject(769,3854.3000500,-2188.8999000,9.1000000,0.0000000,0.0000000,69.9990000); //object(locust_hi)(3)
	CreateDynamicObject(769,3864.3000500,-2184.8000500,11.9000000,0.0000000,0.0000000,69.9990000); //object(locust_hi)(4)
	CreateDynamicObject(769,3896.6999500,-2156.8999000,24.2000000,0.0000000,0.0000000,119.9990000); //object(locust_hi)(5)
	CreateDynamicObject(772,3906.6001000,-2130.6999500,31.3000000,0.0000000,0.0000000,0.0000000); //object(elmred_hi)(1)
	CreateDynamicObject(774,3868.6001000,-2033.9000200,28.3000000,0.0000000,0.0000000,0.0000000); //object(elmsparse_hi)(1)
	CreateDynamicObject(774,3852.0000000,-2053.6001000,24.0000000,0.0000000,0.0000000,0.0000000); //object(elmsparse_hi)(2)
	CreateDynamicObject(780,3888.1001000,-2068.1001000,34.1000000,0.0000000,0.0000000,0.0000000); //object(elmsparse_hism)(1)
	CreateDynamicObject(782,3889.5000000,-2094.1999500,33.2000000,0.0000000,0.0000000,0.0000000); //object(elmtreegrn_hism)(1)
	CreateDynamicObject(715,3903.6999500,-2030.8000500,41.1000000,0.0000000,0.0000000,0.0000000); //object(veg_bevtree3)(2)
	CreateDynamicObject(715,3925.6999500,-2051.8000500,43.6000000,0.0000000,0.0000000,50.0000000); //object(veg_bevtree3)(3)
	CreateDynamicObject(726,3874.8999000,-2081.8000500,30.6000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly19)(1)
	CreateDynamicObject(726,3867.5000000,-2100.1999500,28.9000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly19)(2)
	CreateDynamicObject(726,3899.8000500,-2144.0000000,28.9000000,0.0000000,0.0000000,40.0000000); //object(tree_hipoly19)(3)
	CreateDynamicObject(726,3945.1999500,-2135.6001000,30.4000000,0.0000000,0.0000000,79.9960000); //object(tree_hipoly19)(4)
	CreateDynamicObject(647,3874.8999000,-1947.3000500,6.1000000,0.0000000,0.0000000,0.0000000); //object(new_bushsm)(12)
	CreateDynamicObject(647,3859.1999500,-1950.0999800,5.0000000,0.0000000,0.0000000,0.0000000); //object(new_bushsm)(13)
	CreateDynamicObject(647,3889.6999500,-1946.0999800,7.3000000,0.0000000,0.0000000,0.0000000); //object(new_bushsm)(14)
	CreateDynamicObject(647,3891.6001000,-1952.4000200,9.1000000,0.0000000,0.0000000,0.0000000); //object(new_bushsm)(15)
	CreateDynamicObject(647,3832.3999000,-1971.9000200,3.6000000,0.0000000,0.0000000,0.0000000); //object(new_bushsm)(16)
	CreateDynamicObject(647,3812.6001000,-2001.1999500,2.8000000,0.0000000,0.0000000,0.0000000); //object(new_bushsm)(17)
	CreateDynamicObject(647,3807.8000500,-2006.3000500,2.6000000,0.0000000,0.0000000,0.0000000); //object(new_bushsm)(18)
	CreateDynamicObject(647,3811.1001000,-2006.9000200,3.3000000,0.0000000,0.0000000,0.0000000); //object(new_bushsm)(19)
	CreateDynamicObject(728,3796.3999000,-2018.5999800,0.6000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly06)(1)
	CreateDynamicObject(728,3814.6001000,-2039.5999800,4.9000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly06)(2)
	CreateDynamicObject(728,3804.5000000,-2043.0000000,2.5000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly06)(3)
	CreateDynamicObject(728,3850.8000500,-2054.5000000,24.7000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly06)(4)
	CreateDynamicObject(728,3867.1001000,-2034.5000000,29.4000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly06)(5)
	CreateDynamicObject(728,3879.3999000,-2043.0000000,31.8000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly06)(6)
	CreateDynamicObject(728,3900.1999500,-2032.4000200,34.3000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly06)(7)
	CreateDynamicObject(728,3900.1999500,-2038.5999800,34.5000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly06)(8)
	CreateDynamicObject(728,3904.5000000,-2042.5000000,34.9000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly06)(9)
	CreateDynamicObject(728,3920.5000000,-2052.0000000,35.3000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly06)(10)
	CreateDynamicObject(728,3938.8000500,-2072.3999000,33.2000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly06)(11)
	CreateDynamicObject(728,3934.3999000,-2084.6001000,32.9000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly06)(12)
	CreateDynamicObject(728,3940.8000500,-2098.8000500,33.8000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly06)(13)
	CreateDynamicObject(728,3938.5000000,-2108.8000500,34.6000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly06)(14)
	CreateDynamicObject(728,3946.8999000,-2113.5000000,34.7000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly06)(15)
	CreateDynamicObject(728,3939.8000500,-2121.8999000,34.6000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly06)(16)
	CreateDynamicObject(728,3960.3999000,-2143.8999000,32.4000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly06)(17)
	CreateDynamicObject(728,3967.1999500,-2162.5000000,27.0000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly06)(18)
	CreateDynamicObject(728,3949.8999000,-2162.3000500,27.0000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly06)(19)
	CreateDynamicObject(728,3936.5000000,-2169.6001000,25.2000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly06)(20)
	CreateDynamicObject(762,3883.3000500,-2053.6999500,36.2000000,0.0000000,0.0000000,0.0000000); //object(new_bushtest)(1)
	CreateDynamicObject(762,3875.3999000,-2056.8000500,36.2000000,0.0000000,0.0000000,50.0000000); //object(new_bushtest)(2)
	CreateDynamicObject(762,3889.6999500,-2044.5999800,36.2000000,0.0000000,0.0000000,49.9990000); //object(new_bushtest)(3)
	CreateDynamicObject(801,3907.0000000,-2073.3999000,33.9000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush01)(33)
	CreateDynamicObject(801,3908.6001000,-2127.6999500,33.1000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush01)(34)
	CreateDynamicObject(801,3875.6001000,-2118.0000000,28.7000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush01)(35)
	CreateDynamicObject(801,3853.3999000,-2105.6001000,23.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush01)(36)
	CreateDynamicObject(801,3837.3000500,-2115.8999000,12.1000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush01)(37)
	CreateDynamicObject(801,3832.3000500,-2146.8000500,4.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush01)(38)
	CreateDynamicObject(801,3826.5000000,-2159.6001000,1.9000000,0.0000000,0.0000000,40.0000000); //object(genveg_bush01)(39)
	CreateDynamicObject(801,3822.8000500,-2177.3000500,-0.1000000,0.0000000,0.0000000,89.9960000); //object(genveg_bush01)(40)
	CreateDynamicObject(801,3822.8000500,-2187.1999500,1.9000000,0.0000000,0.0000000,89.9950000); //object(genveg_bush01)(41)
	CreateDynamicObject(802,3868.8999000,-2173.8000500,16.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush08)(1)
	CreateDynamicObject(802,3872.3000500,-2177.3999000,17.0000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush08)(2)
	CreateDynamicObject(802,3866.8999000,-2174.6999500,15.9000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush08)(3)
	CreateDynamicObject(802,3866.8000500,-2174.6001000,15.9000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush08)(4)
	CreateDynamicObject(806,3816.3000500,-2203.8000500,6.7000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(131)
	CreateDynamicObject(806,3814.3000500,-2199.1001000,4.9000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(132)
	CreateDynamicObject(806,3816.1001000,-2191.8000500,4.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(133)
	CreateDynamicObject(806,3822.6999500,-2188.3999000,6.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(134)
	CreateDynamicObject(809,3866.6999500,-2100.3000500,29.0000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush13)(4)
	CreateDynamicObject(809,3938.0000000,-2065.8999000,34.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush13)(5)
	CreateDynamicObject(809,3935.1999500,-2100.3000500,33.9000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush13)(6)
	CreateDynamicObject(809,3941.6001000,-2119.1001000,34.7000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush13)(7)
	CreateDynamicObject(809,3945.8000500,-2137.6999500,32.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush13)(8)
	CreateDynamicObject(809,3954.6001000,-2152.1001000,30.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush13)(9)
	CreateDynamicObject(809,3940.8999000,-2165.6999500,25.9000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush13)(10)
	CreateDynamicObject(809,3923.8999000,-2148.1001000,30.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush13)(11)
	CreateDynamicObject(809,3909.1001000,-2132.3000500,32.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush13)(12)
	CreateDynamicObject(809,3891.3999000,-2093.6999500,33.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush13)(13)
	CreateDynamicObject(809,3878.1999500,-2083.3000500,32.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush13)(14)
	CreateDynamicObject(809,3836.6001000,-1971.1999500,2.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush13)(15)
	CreateDynamicObject(808,3809.8000500,-2054.1999500,4.9000000,0.0000000,0.0000000,40.0000000); //object(genveg_bush12)(1)
	CreateDynamicObject(808,3807.6999500,-2056.3999000,4.4000000,0.0000000,0.0000000,175.9960000); //object(genveg_bush12)(2)
	CreateDynamicObject(820,3800.1999500,-2059.3000500,-0.4000000,0.0000000,0.0000000,10.0000000); //object(genveg_tallgrass04)(9)
	CreateDynamicObject(820,3798.1999500,-2044.9000200,-0.4000000,0.0000000,0.0000000,339.9980000); //object(genveg_tallgrass04)(10)
	CreateDynamicObject(820,3919.3999000,-2032.1999500,34.6000000,0.0000000,0.0000000,339.9940000); //object(genveg_tallgrass04)(11)
	CreateDynamicObject(820,3934.3000500,-2058.8999000,35.4000000,0.0000000,0.0000000,339.9940000); //object(genveg_tallgrass04)(12)
	CreateDynamicObject(820,3953.8000500,-2126.0000000,34.8000000,0.0000000,0.0000000,339.9940000); //object(genveg_tallgrass04)(13)
	CreateDynamicObject(820,3903.1001000,-2141.5000000,30.6000000,0.0000000,0.0000000,339.9940000); //object(genveg_tallgrass04)(14)
	CreateDynamicObject(820,3902.0000000,-2162.8000500,25.1000000,0.0000000,0.0000000,339.9940000); //object(genveg_tallgrass04)(15)
	CreateDynamicObject(820,3871.3000500,-2196.3999000,15.9000000,0.0000000,0.0000000,339.9940000); //object(genveg_tallgrass04)(16)
	CreateDynamicObject(822,3847.1001000,-2104.8999000,22.0000000,1.8790000,339.9890000,0.6840000); //object(genveg_tallgrass06)(7)
	CreateDynamicObject(822,3856.3000500,-2146.1001000,16.1000000,11.2660000,339.5890000,4.1550000); //object(genveg_tallgrass06)(8)
	CreateDynamicObject(822,3853.0000000,-2138.8000500,16.1000000,11.2610000,339.5870000,4.1530000); //object(genveg_tallgrass06)(9)
	CreateDynamicObject(822,3859.5000000,-2139.6999500,18.6000000,11.2610000,339.5870000,4.1530000); //object(genveg_tallgrass06)(10)
	CreateDynamicObject(1483,3920.3000500,-2120.8999000,35.7000000,0.0000000,0.0000000,69.9960000); //object(dyn_garrage2)(3)
	CreateDynamicObject(3252,3934.6001000,-2117.8000500,34.3000000,0.0000000,0.0000000,100.0000000); //object(des_oldwattwr_)(1)
	CreateDynamicObject(3403,3904.1999500,-2100.0000000,36.7000000,0.0000000,0.0000000,0.0000000); //object(sw_logcover)(3)
	CreateDynamicObject(13367,3926.1001000,-2064.1001000,45.5000000,0.0000000,0.0000000,0.0000000); //object(sw_watertower01)(1)
	CreateDynamicObject(1413,3925.6001000,-2123.3999000,35.2000000,0.0000000,0.0000000,0.0000000); //object(dyn_mesh_3)(56)
	CreateDynamicObject(1413,3930.3000500,-2121.6999500,35.2000000,0.0000000,0.0000000,40.0000000); //object(dyn_mesh_3)(57)
	CreateDynamicObject(1413,3934.8000500,-2119.3999000,35.2000000,0.0000000,0.0000000,13.2460000); //object(dyn_mesh_3)(58)
	CreateDynamicObject(1413,3914.1999500,-2121.5000000,35.2000000,0.0000000,0.0000000,13.2440000); //object(dyn_mesh_3)(59)
	CreateDynamicObject(1413,3909.6999500,-2123.8000500,34.7000000,358.2550000,355.4980000,43.1070000); //object(dyn_mesh_3)(60)
	CreateDynamicObject(3276,3908.8000500,-2117.1001000,34.8000000,0.0000000,1.7500000,294.0000000); //object(cxreffencesld)(3)
	CreateDynamicObject(3276,3902.3000500,-2107.8000500,34.7000000,358.7500000,358.9970000,313.9780000); //object(cxreffencesld)(4)
	CreateDynamicObject(850,3905.5000000,-2125.6999500,33.2000000,7.9890000,356.9710000,0.4210000); //object(cj_urb_rub_1)(21)
	CreateDynamicObject(2971,3900.8000500,-2101.6001000,33.8000000,0.0000000,355.5000000,0.0000000); //object(k_smashboxes)(30)
	CreateDynamicObject(1438,3907.3999000,-2097.1001000,34.5000000,0.2500000,357.0000000,0.0130000); //object(dyn_box_pile_2)(16)
	CreateDynamicObject(1369,3900.0000000,-2096.5000000,34.4000000,357.0000000,0.0000000,70.0000000); //object(cj_wheelchair1)(13)
	CreateDynamicObject(1358,3913.3000500,-2119.6999500,35.2000000,0.0000000,0.0000000,10.0000000); //object(cj_skip_rubbish)(9)
	CreateDynamicObject(12957,3933.0000000,-2110.3999000,35.3000000,0.0000000,0.0000000,0.0000000); //object(sw_pickupwreck01)(14)
	CreateDynamicObject(2672,3920.8000500,-2099.8000500,34.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(160)
	CreateDynamicObject(2672,3920.5000000,-2103.1001000,35.0000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(161)
	CreateDynamicObject(3170,3932.1001000,-2098.0000000,33.7000000,3.2480000,357.9970000,170.1140000); //object(trailer_large3_01)(1)
	CreateDynamicObject(826,3897.0000000,-2104.8000500,34.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass10)(1)
	CreateDynamicObject(820,3900.3000500,-2112.1999500,32.6000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass04)(17)
	CreateDynamicObject(820,3906.6999500,-2121.8999000,32.6000000,0.0000000,0.0000000,70.0000000); //object(genveg_tallgrass04)(18)
	CreateDynamicObject(808,3915.3000500,-2122.8000500,35.3000000,0.0000000,0.0000000,100.0000000); //object(genveg_bush12)(3)
	CreateDynamicObject(808,3933.1999500,-2120.3999000,35.3000000,0.0000000,0.0000000,199.9980000); //object(genveg_bush12)(4)
	CreateDynamicObject(801,3937.6001000,-2119.6001000,34.6000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush01)(42)
	CreateDynamicObject(801,3932.6999500,-2105.6999500,34.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush01)(43)
	CreateDynamicObject(801,3929.3000500,-2093.3999000,33.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush01)(44)
	CreateDynamicObject(671,3813.8999000,-2066.3999000,5.9000000,0.0000000,326.0000000,0.0000000); //object(sm_bushytree)(1)
	CreateDynamicObject(672,3804.1999500,-2069.1001000,1.4000000,0.0000000,0.0000000,58.0000000); //object(sm_veg_tree5)(3)
	CreateDynamicObject(691,3844.8999000,-2043.6999500,18.6000000,352.0000000,0.0000000,0.0000000); //object(sm_veg_tree4_big)(8)
	CreateDynamicObject(691,3836.0000000,-2019.1999500,10.4000000,351.9960000,0.0000000,0.0000000); //object(sm_veg_tree4_big)(9)
	CreateDynamicObject(700,3813.8000500,-2027.0000000,4.9000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree6)(1)
	CreateDynamicObject(700,3841.3000500,-2059.1001000,19.4000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree6)(2)
	CreateDynamicObject(700,3829.0000000,-1976.4000200,1.4000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree6)(3)
	CreateDynamicObject(703,3829.3000500,-2032.0000000,11.6000000,0.0000000,0.0000000,30.0000000); //object(sm_veg_tree7_big)(15)
	CreateDynamicObject(729,3821.3999000,-2053.6001000,8.5000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly07)(1)
	CreateDynamicObject(729,3806.3999000,-2032.5999800,1.0000000,0.0000000,0.0000000,80.0000000); //object(tree_hipoly07)(2)
	CreateDynamicObject(729,3792.6999500,-1989.5000000,-1.0000000,0.0000000,0.0000000,79.9970000); //object(tree_hipoly07)(3)
	CreateDynamicObject(729,3826.3000500,-1970.5999800,0.3000000,0.0000000,0.0000000,79.9970000); //object(tree_hipoly07)(4)
	CreateDynamicObject(729,3844.5000000,-1952.9000200,0.3000000,0.0000000,0.0000000,79.9970000); //object(tree_hipoly07)(5)
	CreateDynamicObject(768,3828.3999000,-1984.6999500,1.4000000,0.0000000,0.0000000,40.0000000); //object(elmtreegrn2_hi)(1)
	CreateDynamicObject(5167,3552.0000000,-1733.1999500,7.5000000,0.0000000,0.0000000,0.0000000); //object(dkcargohull2cd)(1)
	CreateDynamicObject(5166,3659.5000000,-1741.3000500,5.5000000,0.0000000,0.0000000,0.0000000); //object(dkcargohull2bd)(1)
	CreateDynamicObject(5160,3659.5000000,-1741.3000500,5.5000000,0.0000000,0.0000000,0.0000000); //object(dkcargohull2d)(1)
	CreateDynamicObject(5156,3603.8999000,-1733.3000500,11.1000000,0.0000000,0.0000000,0.0000000); //object(dk_cargoshp24d)(1)
	CreateDynamicObject(5155,3538.0000000,-1733.1999500,21.0000000,0.0000000,0.0000000,0.0000000); //object(dk_cargoshp05d)(1)
	CreateDynamicObject(5158,3513.8000500,-1733.5000000,11.7000000,0.0000000,0.0000000,90.0000000); //object(dk_cargoshp76d)(1)
	CreateDynamicObject(5157,3712.5000000,-1733.0999800,17.3000000,0.0000000,0.0000000,0.0000000); //object(dk_cargoshpd25d)(1)
	CreateDynamicObject(7515,3630.6001000,-1733.0000000,17.2000000,0.0000000,0.0000000,0.0000000); //object(vegasnfrates1)(1)
	CreateDynamicObject(3577,3600.8999000,-1725.0000000,12.0000000,0.0000000,0.0000000,0.0000000); //object(dockcrates1_la)(4)
	CreateDynamicObject(3577,3600.6999500,-1731.4000200,12.0000000,0.0000000,0.0000000,50.0000000); //object(dockcrates1_la)(5)
	CreateDynamicObject(3576,3593.3000500,-1730.1999500,12.7000000,0.0000000,0.0000000,0.0000000); //object(dockcrates2_la)(1)
	CreateDynamicObject(3575,3564.8000500,-1727.0999800,13.9000000,0.0000000,0.0000000,0.0000000); //object(lasdkrt05)(1)
	CreateDynamicObject(3574,3578.8999000,-1730.8000500,13.7000000,0.0000000,0.0000000,270.0000000); //object(lasdkrtgrp2)(1)
	CreateDynamicObject(939,3559.3000500,-1748.5000000,13.7000000,0.0000000,0.0000000,0.0000000); //object(cj_df_unit)(9)
	CreateDynamicObject(939,3597.0000000,-1748.1999500,13.7000000,0.0000000,0.0000000,0.0000000); //object(cj_df_unit)(10)
	CreateDynamicObject(939,3592.0000000,-1718.3000500,13.7000000,0.0000000,0.0000000,0.0000000); //object(cj_df_unit)(11)
	CreateDynamicObject(942,3698.0000000,-1724.9000200,13.6000000,0.0000000,0.0000000,270.0000000); //object(cj_df_unit_2)(9)
	CreateDynamicObject(942,3698.3999000,-1733.6999500,13.6000000,0.0000000,0.0000000,268.0000000); //object(cj_df_unit_2)(10)
	CreateDynamicObject(17055,3672.3000500,-1731.8000500,13.5000000,0.0000000,0.0000000,0.0000000); //object(cw_fueldrum03)(2)
	CreateDynamicObject(923,3696.8000500,-1728.3000500,12.0000000,0.0000000,0.0000000,0.0000000); //object(packing_carates2)(2)
	CreateDynamicObject(923,3696.5000000,-1729.9000200,12.0000000,0.0000000,0.0000000,0.0000000); //object(packing_carates2)(3)
	CreateDynamicObject(16089,3678.0000000,-1731.0000000,11.2000000,0.0000000,0.0000000,0.0000000); //object(des_pipestrut02)(1)
	CreateDynamicObject(16089,3661.0000000,-1731.1999500,11.2000000,0.0000000,0.0000000,0.0000000); //object(des_pipestrut02)(2)
	CreateDynamicObject(761,3575.1001000,-1725.4000200,11.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(291)
	CreateDynamicObject(761,3570.0000000,-1717.9000200,11.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(324)
	CreateDynamicObject(761,3556.5000000,-1722.6999500,11.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(325)
	CreateDynamicObject(761,3562.0000000,-1747.5000000,11.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(326)
	CreateDynamicObject(761,3574.1999500,-1740.5999800,11.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(327)
	CreateDynamicObject(761,3599.3999000,-1726.6999500,11.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(328)
	CreateDynamicObject(761,3601.0000000,-1733.9000200,11.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(329)
	CreateDynamicObject(761,3600.1001000,-1747.3000500,11.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(330)
	CreateDynamicObject(761,3593.3000500,-1749.0999800,11.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(331)
	CreateDynamicObject(761,3698.1001000,-1743.5000000,11.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(332)
	CreateDynamicObject(761,3696.3999000,-1736.5999800,11.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(333)
	CreateDynamicObject(761,3696.1001000,-1726.5999800,11.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(334)
	CreateDynamicObject(761,3690.1999500,-1720.0000000,11.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(335)
	CreateDynamicObject(761,3676.1001000,-1722.6999500,11.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(336)
	CreateDynamicObject(761,3664.6001000,-1722.4000200,11.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(337)
	CreateDynamicObject(761,3595.0000000,-1717.4000200,11.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(338)
	CreateDynamicObject(761,3590.3000500,-1730.0000000,11.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(339)
	CreateDynamicObject(850,3585.3999000,-1720.0000000,11.3000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_1)(22)
	CreateDynamicObject(850,3696.0000000,-1732.9000200,11.2000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_1)(23)
	CreateDynamicObject(3035,3678.5000000,-1726.1999500,11.9000000,0.0000000,0.0000000,0.0000000); //object(tmp_bin)(21)
	CreateDynamicObject(3035,3661.6001000,-1726.0000000,12.0000000,0.0000000,0.0000000,0.0000000); //object(tmp_bin)(22)
	CreateDynamicObject(2971,3660.0000000,-1740.6999500,11.2000000,0.0000000,0.0000000,0.0000000); //object(k_smashboxes)(31)
	CreateDynamicObject(2971,3677.6999500,-1740.0999800,11.2000000,0.0000000,0.0000000,60.0000000); //object(k_smashboxes)(32)
	CreateDynamicObject(2971,3680.3000500,-1738.0999800,11.2000000,0.0000000,0.0000000,179.9960000); //object(k_smashboxes)(33)
	CreateDynamicObject(1440,3696.6001000,-1738.5000000,11.7000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile_3)(32)
	CreateDynamicObject(1440,3680.6001000,-1726.3000500,11.7000000,0.0000000,0.0000000,100.0000000); //object(dyn_box_pile_3)(33)
	CreateDynamicObject(1440,3662.8999000,-1739.1999500,11.7000000,0.0000000,0.0000000,79.9980000); //object(dyn_box_pile_3)(34)
	CreateDynamicObject(1440,3604.8999000,-1744.3000500,11.7000000,0.0000000,0.0000000,359.9970000); //object(dyn_box_pile_3)(35)
	CreateDynamicObject(1440,3585.8999000,-1739.9000200,11.7000000,0.0000000,0.0000000,59.9950000); //object(dyn_box_pile_3)(36)
	CreateDynamicObject(1439,3590.3000500,-1735.5999800,11.2000000,0.0000000,0.0000000,0.0000000); //object(dyn_dumpster_1)(9)
	CreateDynamicObject(1438,3597.6001000,-1718.0000000,11.2000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile_2)(17)
	CreateDynamicObject(1365,3586.1001000,-1730.4000200,12.4000000,0.0000000,0.0000000,90.0000000); //object(cj_big_skip1)(5)
	CreateDynamicObject(1358,3679.3999000,-1735.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(cj_skip_rubbish)(10)
	CreateDynamicObject(1347,3679.0000000,-1729.4000200,11.7000000,0.0000000,0.0000000,0.0000000); //object(cj_wastebin)(3)
	CreateDynamicObject(1347,3610.1001000,-1719.9000200,11.8000000,0.0000000,0.0000000,0.0000000); //object(cj_wastebin)(4)
	CreateDynamicObject(1347,3563.1999500,-1740.8000500,11.8000000,0.0000000,0.0000000,0.0000000); //object(cj_wastebin)(5)
	CreateDynamicObject(12957,3565.1999500,-1736.8000500,12.1000000,0.0000000,0.0000000,0.0000000); //object(sw_pickupwreck01)(15)
	CreateDynamicObject(2672,3561.1001000,-1744.8000500,11.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(162)
	CreateDynamicObject(2672,3567.8000500,-1736.6999500,11.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(163)
	CreateDynamicObject(2672,3588.1001000,-1736.4000200,11.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(164)
	CreateDynamicObject(2672,3591.6001000,-1748.0999800,11.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(165)
	CreateDynamicObject(2672,3597.3999000,-1732.9000200,11.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(166)
	CreateDynamicObject(2672,3595.6999500,-1719.9000200,11.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(167)
	CreateDynamicObject(2672,3609.0000000,-1719.3000500,11.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(168)
	CreateDynamicObject(2672,3602.3000500,-1721.6999500,11.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(169)
	CreateDynamicObject(2672,3572.8999000,-1719.3000500,11.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(170)
	CreateDynamicObject(2672,3543.0000000,-1718.3000500,11.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(171)
	CreateDynamicObject(2672,3510.8999000,-1724.3000500,11.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(172)
	CreateDynamicObject(2672,3513.3000500,-1737.5000000,11.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(173)
	CreateDynamicObject(2672,3675.1001000,-1738.1999500,11.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(174)
	CreateDynamicObject(2672,3697.1999500,-1740.5000000,11.4000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(175)
	CreateDynamicObject(2672,3693.5000000,-1730.3000500,11.4000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(176)
	CreateDynamicObject(2672,3694.5000000,-1723.5000000,11.4000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(177)
	CreateDynamicObject(2672,3677.6999500,-1728.0000000,11.4000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(178)
	CreateDynamicObject(2672,3666.1999500,-1723.1999500,11.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4)(179)
	CreateDynamicObject(2676,3672.0000000,-1727.1999500,11.3000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(67)
	CreateDynamicObject(2676,3688.3999000,-1720.9000200,11.3000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(82)
	CreateDynamicObject(2676,3664.0000000,-1742.0000000,11.4000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(83)
	CreateDynamicObject(2676,3603.3999000,-1748.5000000,11.3000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(84)
	CreateDynamicObject(2676,3594.0000000,-1735.0000000,11.3000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(85)
	CreateDynamicObject(2676,3581.8000500,-1718.5999800,11.3000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(86)
	CreateDynamicObject(2676,3556.3999000,-1738.1999500,19.0000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(87)
	CreateDynamicObject(2676,3558.0000000,-1727.8000500,11.3000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(88)
	CreateDynamicObject(6976,3584.3999000,-1753.0000000,2.3000000,0.0000000,0.0000000,180.0000000); //object(shamheliprt04)(1)
	CreateDynamicObject(3461,3552.8000500,-1734.3000500,20.5000000,88.0000000,0.0000000,100.0000000); //object(tikitorch01_lvs)(96)
	CreateDynamicObject(3461,3552.3000500,-1737.3000500,23.8000000,87.9950000,0.0000000,99.9980000); //object(tikitorch01_lvs)(97)
	CreateDynamicObject(3461,3552.6999500,-1729.6999500,23.8000000,87.9950000,0.0000000,99.9980000); //object(tikitorch01_lvs)(98)
	CreateDynamicObject(3461,3552.5000000,-1722.8000500,20.0000000,87.9950000,0.0000000,99.9980000); //object(tikitorch01_lvs)(99)
	CreateDynamicObject(3461,3541.3999000,-1719.0000000,17.4000000,87.9950000,0.0000000,179.9980000); //object(tikitorch01_lvs)(100)
	CreateDynamicObject(3461,3532.0000000,-1718.3000500,17.4000000,87.9900000,0.0000000,179.9950000); //object(tikitorch01_lvs)(101)
	CreateDynamicObject(3461,3548.6001000,-1721.0000000,22.8000000,87.9900000,0.0000000,179.9950000); //object(tikitorch01_lvs)(102)
	CreateDynamicObject(3461,3563.0000000,-1740.6999500,10.8000000,2.5000000,0.0000000,179.9950000); //object(tikitorch01_lvs)(103)
	CreateDynamicObject(3461,3610.1999500,-1720.0000000,10.8000000,2.4990000,0.0000000,179.9950000); //object(tikitorch01_lvs)(104)
	CreateDynamicObject(3461,3679.0000000,-1729.4000200,10.8000000,2.4990000,0.0000000,179.9950000); //object(tikitorch01_lvs)(105)
	CreateDynamicObject(761,2639.1999500,-1727.1999500,9.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2644.0000000,-1724.0000000,9.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2649.1999500,-1705.6999500,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2641.0000000,-1709.3000500,9.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2643.0000000,-1696.5000000,9.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2645.0000000,-1691.3000500,9.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2641.3000500,-1676.1999500,9.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2644.6999500,-1657.5999800,9.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2639.6999500,-1654.5999800,9.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2635.8000500,-1668.0999800,9.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2662.1999500,-1656.3000500,9.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2658.1001000,-1655.5999800,9.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2657.8999000,-1659.0000000,9.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2665.8000500,-1663.0000000,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2663.1999500,-1667.0000000,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2678.3000500,-1655.5999800,10.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2675.6001000,-1660.1999500,9.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2683.8000500,-1663.1999500,10.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2641.3999000,-1784.4000200,9.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2638.8999000,-1788.8000500,9.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2641.1999500,-1815.3000500,9.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2644.0000000,-1812.6999500,9.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2658.5000000,-1853.6999500,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2652.6001000,-1853.9000200,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2677.5000000,-1872.5000000,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2680.1001000,-1870.0000000,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2680.0000000,-1875.4000200,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2720.1999500,-1890.3000500,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2717.8000500,-1894.8000500,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2750.1999500,-1888.0000000,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2754.5000000,-1888.8000500,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2756.8999000,-1890.0999800,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2765.1999500,-1887.5000000,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2856.1999500,-1920.4000200,-21.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2772.6999500,-1899.9000200,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2773.6001000,-1895.0999800,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2778.1001000,-1893.1999500,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2806.6001000,-1889.0000000,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2800.5000000,-1888.9000200,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2799.6999500,-1885.1999500,10.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(3594,2748.3000500,-1992.5000000,13.0000000,0.0000000,0.0000000,77.9330000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2776.8999000,-1990.0000000,13.0000000,0.0000000,0.0000000,237.9320000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2765.0000000,-1988.0000000,13.0000000,0.0000000,0.0000000,157.9310000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2784.6999500,-1996.8000500,13.0000000,0.0000000,0.0000000,287.9280000); //object(la_fuckcar1)(83)
	CreateDynamicObject(761,2720.0996100,-1987.6992200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2750.0000000,-1995.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2745.3000500,-1993.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2761.8000500,-1989.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2767.5000000,-1988.0999800,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2777.0000000,-1992.5000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2773.8000500,-1986.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2786.8999000,-1997.6999500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2780.5000000,-1997.6999500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2787.8999000,-1993.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2803.8000500,-2000.3000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2782.1001000,-1983.0999800,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(3594,2771.1001000,-1960.5999800,13.0000000,0.0000000,0.0000000,177.9310000); //object(la_fuckcar1)(83)
	CreateDynamicObject(3594,2769.1001000,-1929.3000500,13.0000000,0.0000000,0.0000000,287.9290000); //object(la_fuckcar1)(83)
	CreateDynamicObject(761,2769.6001000,-1958.4000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2770.6999500,-1964.8000500,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2779.3000500,-1941.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2771.1999500,-1931.8000500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2766.1999500,-1931.5999800,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2767.8999000,-1927.8000500,12.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2761.5000000,-1891.0999800,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2774.8999000,-1911.8000500,11.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(761,2763.1999500,-1914.0999800,11.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(172)
	CreateDynamicObject(3594,2696.8000500,-1659.1999500,11.6000000,356.2500000,0.0000000,109.9840000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2702.7000000,-1658.2000000,12.0000000,4.7430000,0.0000000,239.9800000); //object(la_fuckcar1)(21)
	CreateDynamicObject(761,2698.3999000,-1657.0000000,11.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2694.6999500,-1658.3000500,10.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2701.5000000,-1658.9000200,11.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2754.8000500,-1656.4000200,11.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(3594,2752.1999500,-1654.9000200,12.3000000,2.2500000,0.0000000,109.9840000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2769.3000500,-1659.1999500,11.3000000,355.4970000,0.0000000,269.9840000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2801.3999000,-1655.4000200,10.2000000,0.2460000,0.0000000,59.9840000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2821.6999500,-1647.3000500,10.2000000,0.2420000,0.0000000,109.9800000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2839.3999000,-1657.0999800,10.2000000,0.2420000,0.0000000,239.9790000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2824.3999000,-1625.5000000,10.2000000,0.2420000,0.0000000,169.9790000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2832.6001000,-1604.3000500,10.2000000,0.2420000,0.0000000,139.9750000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2858.6999500,-1558.4000200,10.2000000,0.2420000,0.0000000,179.9710000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2865.1999500,-1522.3000500,10.2000000,0.2420000,0.0000000,139.9670000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2873.1999500,-1500.0999800,10.2000000,0.2420000,0.0000000,179.9660000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2875.6999500,-1473.0999800,10.2000000,0.2420000,0.0000000,199.9620000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2877.6999500,-1447.5999800,10.2000000,0.2420000,0.0000000,159.9570000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2874.5000000,-1427.0999800,10.2000000,0.2420000,0.0000000,209.9550000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2877.8999000,-1402.5000000,10.2000000,0.2420000,0.0000000,169.9540000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2869.3999000,-1391.3000500,10.2000000,0.2420000,0.0000000,229.9530000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2870.1999500,-1364.5000000,10.2000000,0.2420000,0.0000000,199.9490000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2867.1001000,-1334.5000000,10.2000000,0.2420000,0.0000000,159.9460000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2858.5000000,-1313.1999500,12.7000000,345.9920000,0.0000000,199.9440000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2859.6999500,-1287.3000500,18.2000000,349.4870000,0.0000000,169.9400000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2852.8999000,-1260.5999800,20.8000000,358.7370000,2.0000000,297.2310000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2850.1001000,-1234.0999800,22.1000000,358.7370000,2.0000000,197.2300000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2840.8000500,-1207.0999800,23.4000000,358.7370000,2.0000000,197.2270000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2838.1999500,-1169.5000000,24.2000000,358.7370000,2.0000000,147.2270000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2841.5000000,-1141.4000200,24.2000000,358.7370000,2.0000000,187.2220000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2851.6999500,-1158.0999800,24.6000000,358.7370000,2.0000000,227.2180000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2836.1999500,-1099.4000200,23.5000000,2.7340000,2.0010000,187.0780000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2840.3000500,-1071.8000500,23.0000000,358.7330000,1.9980000,187.2150000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2839.6001000,-1052.5000000,23.0000000,358.7310000,1.9940000,357.2130000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2838.8999000,-1057.3000500,23.0000000,358.7260000,1.9890000,277.2110000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2851.6001000,-1056.9000200,23.0000000,358.7260000,1.9830000,337.2070000); //object(la_fuckcar1)(21)
	CreateDynamicObject(987,2908.6001000,-800.0000000,10.0000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar)(1)
	CreateDynamicObject(987,2896.6001000,-800.0000000,10.0000000,0.0000000,0.0000000,0.0000000); //object(elecfence_bar)(2)
	CreateDynamicObject(987,2884.6999500,-800.0999800,10.0000000,0.0000000,0.0000000,0.7500000); //object(elecfence_bar)(3)
	CreateDynamicObject(987,2872.8000500,-800.2000100,10.0000000,0.0000000,0.0000000,0.7470000); //object(elecfence_bar)(4)
	CreateDynamicObject(987,2860.8999000,-800.2999900,10.0000000,0.0000000,0.0000000,0.7470000); //object(elecfence_bar)(5)
	CreateDynamicObject(987,2849.0000000,-800.4000200,10.0000000,0.0000000,0.0000000,0.7470000); //object(elecfence_bar)(6)
	CreateDynamicObject(987,2837.0000000,-800.5000000,10.0000000,0.0000000,0.0000000,0.7470000); //object(elecfence_bar)(7)
	CreateDynamicObject(987,2825.1001000,-800.5999800,10.0000000,0.0000000,0.0000000,0.7470000); //object(elecfence_bar)(8)
	CreateDynamicObject(987,2815.1999500,-800.5999800,20.0000000,0.0000000,29.7500000,0.7470000); //object(elecfence_bar)(9)
	CreateDynamicObject(987,2804.8000500,-800.5999800,25.9000000,0.0000000,29.7450000,0.7420000); //object(elecfence_bar)(10)
	CreateDynamicObject(987,2794.3999000,-799.7999900,31.7000000,0.0000000,29.7450000,356.7420000); //object(elecfence_bar)(11)
	CreateDynamicObject(987,2784.1001000,-799.2000100,37.7000000,0.0000000,29.7400000,356.7370000); //object(elecfence_bar)(12)
	CreateDynamicObject(987,2772.8999000,-798.2000100,40.1000000,358.0750000,15.7490000,357.2800000); //object(elecfence_bar)(13)
	CreateDynamicObject(987,2765.1999500,-789.2000100,42.8000000,354.2230000,15.8220000,314.3660000); //object(elecfence_bar)(14)
	CreateDynamicObject(987,2741.8000500,-791.9000200,49.6000000,28.1650000,21.9470000,21.9600000); //object(elecfence_bar)(15)
	CreateDynamicObject(987,2735.1999500,-801.5999800,49.1000000,13.9900000,1.2750000,50.4150000); //object(elecfence_bar)(16)
	CreateDynamicObject(987,2723.8000500,-801.2999900,51.4000000,13.8750000,7.4550000,358.9210000); //object(elecfence_bar)(17)
	CreateDynamicObject(987,2712.0000000,-801.4000200,53.0000000,13.8700000,7.4540000,358.9180000); //object(elecfence_bar)(18)
	CreateDynamicObject(13591,2839.8999000,-803.0999800,10.2000000,0.0000000,0.0000000,0.0000000); //object(kickcar28)(17)
	CreateDynamicObject(13591,2847.5000000,-804.9000200,10.2000000,0.0000000,0.0000000,180.0000000); //object(kickcar28)(18)
	CreateDynamicObject(13591,2858.1999500,-804.0000000,10.2000000,0.0000000,0.0000000,191.9950000); //object(kickcar28)(19)
	CreateDynamicObject(13591,2869.3000500,-803.0999800,10.2000000,0.0000000,0.0000000,171.9920000); //object(kickcar28)(20)
	CreateDynamicObject(13591,2881.1001000,-804.9000200,10.2000000,0.0000000,0.0000000,331.9910000); //object(kickcar28)(21)
	CreateDynamicObject(13591,2892.8000500,-804.5000000,10.2000000,0.0000000,0.0000000,1.9900000); //object(kickcar28)(22)
	CreateDynamicObject(13591,2905.1001000,-803.7999900,10.3000000,0.0000000,0.0000000,351.9890000); //object(kickcar28)(23)
	CreateDynamicObject(13591,2913.8000500,-806.5000000,10.3000000,0.0000000,0.0000000,101.9850000); //object(kickcar28)(24)
	CreateDynamicObject(18248,2912.8999000,-809.4000200,17.9000000,0.0000000,0.0000000,180.0000000); //object(cuntwjunk01)(2)
	CreateDynamicObject(18248,2885.1001000,-810.0000000,17.8000000,0.0000000,0.0000000,199.9950000); //object(cuntwjunk01)(3)
	CreateDynamicObject(18248,2852.0000000,-814.0000000,17.8000000,0.0000000,0.0000000,149.9900000); //object(cuntwjunk01)(4)
	CreateDynamicObject(18249,2891.8000500,-800.7000100,5.6000000,0.0000000,0.0000000,90.0000000); //object(cuntwjunk05)(15)
	CreateDynamicObject(18249,2872.8999000,-800.5999800,5.6000000,0.0000000,0.0000000,90.0000000); //object(cuntwjunk05)(16)
	CreateDynamicObject(18249,2853.8999000,-800.7000100,5.6000000,0.0000000,0.0000000,90.0000000); //object(cuntwjunk05)(17)
	CreateDynamicObject(18249,2834.3999000,-801.0000000,5.6000000,0.0000000,0.0000000,90.0000000); //object(cuntwjunk05)(18)
	CreateDynamicObject(2676,2867.6999500,-809.5999800,10.2000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(89)
	CreateDynamicObject(2676,2874.6001000,-810.9000200,10.0000000,0.0000000,0.0000000,50.0000000); //object(proc_rubbish_8)(90)
	CreateDynamicObject(2676,2883.8999000,-809.7000100,10.0000000,0.0000000,0.0000000,49.9990000); //object(proc_rubbish_8)(91)
	CreateDynamicObject(2676,2901.1001000,-811.4000200,10.0000000,0.0000000,0.0000000,9.9990000); //object(proc_rubbish_8)(92)
	CreateDynamicObject(2676,2896.5000000,-810.0999800,10.0000000,0.0000000,0.0000000,9.9980000); //object(proc_rubbish_8)(93)
	CreateDynamicObject(2676,2890.6999500,-810.4000200,10.0000000,0.0000000,0.0000000,69.9980000); //object(proc_rubbish_8)(94)
	CreateDynamicObject(2676,2908.1001000,-809.7999900,10.2000000,0.0000000,0.0000000,69.9940000); //object(proc_rubbish_8)(95)
	CreateDynamicObject(2676,2905.8999000,-821.9000200,10.2000000,0.0000000,0.0000000,139.9940000); //object(proc_rubbish_8)(96)
	CreateDynamicObject(2676,2914.6001000,-822.0000000,10.2000000,0.0000000,0.0000000,139.9930000); //object(proc_rubbish_8)(97)
	CreateDynamicObject(2676,2866.1001000,-817.5000000,10.2000000,0.0000000,0.0000000,139.9930000); //object(proc_rubbish_8)(98)
	CreateDynamicObject(2676,2852.3999000,-823.5000000,10.2000000,0.0000000,0.0000000,189.9930000); //object(proc_rubbish_8)(99)
	CreateDynamicObject(2676,2842.6999500,-823.2999900,10.2000000,0.0000000,0.0000000,189.9920000); //object(proc_rubbish_8)(100)
	CreateDynamicObject(2676,2841.6001000,-808.7999900,10.2000000,0.0000000,0.0000000,149.9920000); //object(proc_rubbish_8)(131)
	CreateDynamicObject(1299,2846.6001000,-823.9000200,10.4000000,0.0000000,0.0000000,340.0000000); //object(smashboxpile)(41)
	CreateDynamicObject(618,2822.1001000,-813.4000200,16.9000000,0.0000000,0.0000000,0.0000000); //object(veg_treea3)(1)
	CreateDynamicObject(618,2808.1999500,-816.5999800,21.7000000,0.0000000,0.0000000,70.0000000); //object(veg_treea3)(2)
	CreateDynamicObject(618,2815.1999500,-832.4000200,18.0000000,0.0000000,0.0000000,69.9990000); //object(veg_treea3)(3)
	CreateDynamicObject(669,2827.0000000,-828.5999800,14.4000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4)(1)
	CreateDynamicObject(669,2823.3000500,-853.4000200,13.2000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4)(2)
	CreateDynamicObject(669,2811.1001000,-872.5999800,15.5000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4)(3)
	CreateDynamicObject(761,2706.5000000,-1659.1992200,11.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2749.1999500,-1657.5000000,12.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2765.6001000,-1656.8000500,11.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2770.1001000,-1661.3000500,10.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2797.6001000,-1655.6999500,9.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2805.1001000,-1657.1999500,9.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2819.3999000,-1646.0000000,9.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2825.1001000,-1648.3000500,9.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2841.5000000,-1655.9000200,9.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2836.6001000,-1657.8000500,9.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2822.3000500,-1623.4000200,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2825.8000500,-1627.5000000,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2833.1001000,-1606.8000500,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2836.1001000,-1602.3000500,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2856.5000000,-1555.8000500,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2860.6999500,-1559.5000000,10.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2866.3000500,-1523.9000200,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2861.0000000,-1523.3000500,10.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2867.3000500,-1513.5999800,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2871.1999500,-1501.3000500,9.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2875.1001000,-1497.5000000,9.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2872.8999000,-1471.3000500,9.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2873.8999000,-1475.1999500,9.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2879.0000000,-1474.9000200,9.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2878.6999500,-1450.5000000,9.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2880.8999000,-1445.0999800,10.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2875.8000500,-1447.0999800,9.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2873.8999000,-1430.3000500,9.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2871.6999500,-1424.6999500,9.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2877.1999500,-1427.3000500,9.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2876.3999000,-1399.5999800,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2879.1001000,-1405.3000500,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2867.1999500,-1393.0000000,10.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2870.1001000,-1394.3000500,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2870.3000500,-1388.9000200,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2869.1001000,-1366.6999500,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2871.8000500,-1362.9000200,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2868.5000000,-1336.6999500,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2870.1999500,-1332.6999500,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2864.6001000,-1335.0999800,9.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2857.8999000,-1291.5999800,16.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2862.3999000,-1285.5999800,18.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2859.8000500,-1310.9000200,12.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2851.5000000,-1263.0000000,20.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2856.1999500,-1261.3000500,20.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2854.1999500,-1258.0000000,20.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2848.8999000,-1236.1999500,21.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2851.8999000,-1231.9000200,21.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2852.3999000,-1237.4000200,21.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2838.6001000,-1204.8000500,22.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2839.6999500,-1210.6999500,22.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2848.0000000,-1202.8000500,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2838.6001000,-1172.4000200,23.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2842.0000000,-1167.0999800,23.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2836.8000500,-1168.1999500,23.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2848.8999000,-1157.5999800,23.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2851.5000000,-1161.5999800,23.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2853.5000000,-1155.8000500,23.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2844.0000000,-1143.4000200,23.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2839.5000000,-1139.3000500,23.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2843.0000000,-1138.1999500,23.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2838.3000500,-1101.5000000,23.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2834.3999000,-1097.5999800,22.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2834.6999500,-1102.5000000,23.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2838.1001000,-1069.6999500,22.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2838.0000000,-1075.6999500,22.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2842.3999000,-1073.8000500,22.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2849.5000000,-1057.5000000,22.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2853.8999000,-1056.0999800,22.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2851.8000500,-1061.0999800,22.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2840.6001000,-1054.9000200,22.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2837.1001000,-1059.0999800,22.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2836.6001000,-1053.5999800,22.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(761,2839.0000000,-1048.5999800,22.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(199)
	CreateDynamicObject(3594,2343.5000000,-1565.3000500,23.4000000,0.0000000,0.0000000,319.9990000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2337.3999000,-1564.0999800,23.4000000,0.0000000,0.0000000,69.9990000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2339.3999000,-1548.5000000,23.4000000,0.0000000,0.0000000,179.9940000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2346.6001000,-1532.0000000,23.4000000,0.0000000,0.0000000,149.9890000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2346.8999000,-1521.0999800,23.4000000,0.0000000,0.0000000,109.9850000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2403.1999500,-1518.0999800,23.5000000,0.0000000,0.0000000,49.9840000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2399.1999500,-1514.3000500,23.4000000,0.0000000,0.0000000,109.9820000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2395.0000000,-1484.3000500,23.4000000,0.0000000,0.0000000,169.9790000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2400.3000500,-1487.5000000,23.4000000,0.0000000,0.0000000,99.9750000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2424.3999000,-1486.5999800,23.4000000,0.0000000,0.0000000,99.9700000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2428.3000500,-1491.5000000,23.4000000,0.0000000,0.0000000,349.9700000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2427.8000500,-1512.5999800,23.2000000,0.0000000,0.0000000,359.9690000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2426.5000000,-1526.0999800,23.2000000,0.0000000,0.0000000,39.9670000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2427.8999000,-1532.4000200,23.2000000,0.0000000,0.0000000,219.9630000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2434.1001000,-1557.4000200,23.2000000,0.0000000,0.0000000,169.9570000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2430.6999500,-1552.5999800,23.2000000,0.0000000,0.0000000,249.9530000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2444.3000500,-1506.8000500,23.4000000,0.0000000,0.0000000,87.9690000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2489.8000500,-1504.6999500,23.4000000,0.0000000,0.0000000,127.9680000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2508.5000000,-1501.5000000,23.4000000,0.0000000,0.0000000,87.9630000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2546.6001000,-1505.3000500,23.4000000,0.0000000,0.0000000,127.9620000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2547.3999000,-1490.0000000,23.4000000,0.0000000,0.0000000,187.9580000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2548.6001000,-1469.5999800,23.4000000,0.0000000,0.0000000,147.9540000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2554.3000500,-1498.9000200,23.4000000,0.0000000,0.0000000,207.9530000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2531.6001000,-1471.9000200,23.4000000,0.0000000,0.0000000,207.9490000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2536.6999500,-1470.5999800,23.4000000,0.0000000,0.0000000,257.9490000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2560.8999000,-1443.0000000,23.4000000,0.0000000,0.0000000,297.9480000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2555.1001000,-1445.1999500,23.4000000,0.0000000,0.0000000,157.9440000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2568.6001000,-1437.9000200,23.4000000,0.0000000,0.0000000,99.9390000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2571.8999000,-1441.0999800,23.4000000,0.0000000,0.0000000,337.9390000); //object(la_fuckcar1)(7)
	CreateDynamicObject(4516,2571.6001000,-1422.4000200,24.7000000,0.0000000,0.0000000,180.0000000); //object(cn2_roadblock03ld)(1)
	CreateDynamicObject(3594,2345.8000500,-1498.0999800,23.4000000,0.0000000,0.0000000,189.9840000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2335.5000000,-1488.0999800,23.4000000,0.0000000,0.0000000,239.9810000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2345.3000500,-1469.3000500,23.4000000,0.0000000,0.0000000,199.9800000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2344.1999500,-1461.5999800,23.4000000,0.0000000,0.0000000,149.9790000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2344.1992200,-1461.5996100,23.4000000,0.0000000,0.0000000,149.9740000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2344.1001000,-1420.3000500,23.4000000,0.0000000,0.0000000,199.9740000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2349.0000000,-1377.3000500,23.4000000,0.0000000,0.0000000,159.9730000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2331.1999500,-1387.5000000,23.4000000,0.0000000,0.0000000,279.9720000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2338.3000500,-1390.5999800,23.4000000,0.0000000,0.0000000,49.9700000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2361.8999000,-1380.9000200,23.4000000,0.0000000,0.0000000,109.9660000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2388.1992200,-1384.0000000,23.4000000,0.0000000,0.0000000,49.9600000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2387.8999000,-1405.9000200,23.4000000,0.0000000,0.0000000,349.9600000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2389.6999500,-1439.1999500,23.4000000,0.0000000,0.0000000,69.9580000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2393.3999000,-1436.5999800,23.4000000,0.0000000,0.0000000,199.9550000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2420.3000500,-1447.9000200,23.4000000,0.0000000,0.0000000,99.9510000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2447.5000000,-1442.1999500,23.4000000,0.0000000,0.0000000,49.9480000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2442.5000000,-1444.1999500,23.4000000,0.0000000,0.0000000,119.9440000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2454.1001000,-1427.0999800,23.4000000,0.0000000,0.0000000,179.9430000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2451.1001000,-1409.4000200,23.4000000,0.0000000,0.0000000,229.9400000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2448.3000500,-1421.6999500,23.4000000,0.0000000,0.0000000,169.9380000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2451.5000000,-1368.4000200,23.4000000,0.0000000,0.0000000,229.9370000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2447.5000000,-1371.4000200,23.4000000,0.0000000,0.0000000,169.9330000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2458.6001000,-1341.6999500,23.4000000,0.0000000,0.0000000,359.9310000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2449.3000500,-1329.5999800,23.4000000,0.0000000,0.0000000,139.9290000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2452.8999000,-1331.6999500,23.4000000,0.0000000,0.0000000,189.9270000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2456.8999000,-1307.4000200,23.4000000,0.0000000,0.0000000,269.9260000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2454.0000000,-1301.3000500,23.4000000,0.0000000,0.0000000,9.9230000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2517.5000000,-1438.5000000,27.9000000,0.0000000,0.0000000,231.9160000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2453.5000000,-1275.1999500,23.3000000,0.0000000,0.0000000,211.9150000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2452.7000000,-1249.3000000,23.4000000,0.0000000,0.0000000,271.9120000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2445.3999000,-1252.0999800,23.4000000,0.0000000,0.0000000,311.9120000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2413.3999000,-1260.0999800,23.4000000,0.0000000,0.0000000,261.9070000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2411.6001000,-1253.3000500,23.4000000,0.0000000,0.0000000,291.9030000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2388.3000500,-1256.9000200,23.3000000,0.0000000,0.0000000,341.9010000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2370.3000500,-1255.9000200,23.3000000,0.0000000,0.0000000,341.9000000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2370.6001000,-1260.5999800,23.3000000,0.0000000,0.0000000,101.9000000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2373.3999000,-1288.6999500,23.3000000,0.0000000,0.0000000,185.8980000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2373.2998000,-1298.0996100,23.3000000,0.0000000,0.0000000,345.8940000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2352.6001000,-1304.1999500,23.3000000,0.0000000,0.0000000,265.8940000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2357.6999500,-1302.5000000,23.3000000,0.0000000,0.0000000,45.8910000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2322.3000500,-1301.5999800,23.6000000,0.0000000,0.0000000,305.8900000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2316.3999000,-1299.0000000,23.5000000,0.0000000,0.0000000,245.8870000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2301.3000500,-1290.1999500,23.3000000,0.0000000,0.0000000,245.8850000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2304.3000500,-1271.5999800,23.3000000,0.0000000,0.0000000,345.8850000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2301.3000500,-1313.1999500,23.4000000,0.0000000,0.0000000,25.8830000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2302.3000500,-1320.8000500,23.3000000,0.0000000,0.0000000,65.8780000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2305.5000000,-1337.0000000,23.3000000,0.0000000,0.0000000,345.8740000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2301.1001000,-1370.5999800,23.3000000,0.0000000,0.0000000,15.8720000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2299.6001000,-1378.3000500,23.3000000,0.0000000,0.0000000,115.8700000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2306.8000500,-1386.9000200,23.4000000,0.0000000,0.0000000,125.8670000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2266.3994100,-1294.0996100,23.3000000,0.0000000,0.0000000,135.8730000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2273.0000000,-1273.5000000,23.3000000,0.0000000,0.0000000,185.8730000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2272.0000000,-1253.4000200,23.3000000,0.0000000,0.0000000,235.8720000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2270.5000000,-1258.6999500,23.3000000,0.0000000,0.0000000,155.8710000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2269.8999000,-1234.3000500,23.3000000,0.0000000,0.0000000,235.8690000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2261.8999000,-1215.4000200,23.3000000,0.0000000,0.0000000,205.8650000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2239.0000000,-1228.3000500,23.3000000,0.0000000,0.0000000,285.8620000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2220.3999000,-1212.6999500,23.3000000,0.0000000,0.0000000,245.8590000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2196.8999000,-1221.6999500,23.3000000,0.0000000,0.0000000,295.8580000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2189.3000500,-1220.1999500,23.3000000,0.0000000,0.0000000,45.8560000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2170.5996100,-1214.6992200,23.3000000,0.0000000,0.0000000,145.8490000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2178.1001000,-1233.3000500,23.3000000,0.0000000,0.0000000,195.8490000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2174.5000000,-1239.9000200,23.3000000,0.0000000,0.0000000,325.8480000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2165.1001000,-1277.4000200,23.3000000,0.0000000,0.0000000,5.8440000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2165.0996100,-1277.3994100,23.3000000,0.0000000,0.0000000,5.8390000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2168.0000000,-1281.9000200,23.3000000,0.0000000,0.0000000,315.8390000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2152.1999500,-1304.1999500,23.3000000,0.0000000,0.0000000,95.8350000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2171.1001000,-1294.1999500,23.3000000,0.0000000,0.0000000,215.8340000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2118.5000000,-1297.6999500,23.3000000,0.0000000,0.0000000,275.8320000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2114.3999000,-1301.6999500,23.3000000,0.0000000,0.0000000,125.8280000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2079.6999500,-1296.9000200,23.3000000,0.0000000,0.0000000,255.8260000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2074.1992200,-1294.2998000,23.3000000,0.0000000,0.0000000,355.8200000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2254.3999000,-1302.9000200,23.3000000,0.0000000,0.0000000,235.8730000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2251.0000000,-1298.8000500,23.3000000,0.0000000,0.0000000,265.8710000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2213.3999000,-1300.5999800,23.3000000,0.0000000,0.0000000,305.8690000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2216.8999000,-1303.9000200,23.3000000,0.0000000,0.0000000,235.8650000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2183.8000500,-1303.1999500,23.3000000,0.0000000,0.0000000,265.8600000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2186.8000500,-1300.8000500,23.3000000,0.0000000,0.0000000,55.8580000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2167.8999000,-1317.6999500,23.3000000,0.0000000,0.0000000,175.8540000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2161.1999500,-1320.1999500,23.3000000,0.0000000,0.0000000,325.8530000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2165.3999000,-1353.3000500,23.3000000,0.0000000,0.0000000,25.8490000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2168.1001000,-1370.1999500,23.3000000,0.0000000,0.0000000,335.8450000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2155.0000000,-1383.0999800,23.3000000,0.0000000,0.0000000,255.8410000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2178.5000000,-1387.5999800,23.3000000,0.0000000,0.0000000,275.8390000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2194.8000500,-1382.9000200,23.3000000,0.0000000,0.0000000,35.8340000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2185.6999500,-1382.0000000,23.3000000,0.0000000,0.0000000,95.8320000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2213.6999500,-1410.0000000,23.3000000,0.0000000,0.0000000,57.8280000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2215.1999500,-1432.0000000,23.3000000,0.0000000,0.0000000,347.8270000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2210.8999000,-1464.8000500,23.3000000,0.0000000,0.0000000,27.8220000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2210.6001000,-1473.1999500,23.3000000,0.0000000,0.0000000,337.8170000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2217.8999000,-1478.5999800,23.3000000,0.0000000,0.0000000,37.8130000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2237.8999000,-1487.5000000,23.1000000,0.0000000,0.0000000,97.8090000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2252.1001000,-1481.5999800,22.6000000,0.0000000,0.0000000,137.8060000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2291.6999500,-1484.0000000,22.3000000,357.2500000,0.0000000,137.8020000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2315.1001000,-1486.5000000,22.8000000,357.2480000,0.0000000,107.7960000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2374.1001000,-1321.3000500,23.3000000,0.0000000,0.0000000,7.8940000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2373.3000500,-1328.0999800,23.3000000,0.0000000,0.0000000,47.8880000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2370.8000500,-1357.8000500,23.3000000,0.0000000,0.0000000,317.8840000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2374.6999500,-1372.4000200,23.3000000,0.0000000,0.0000000,7.8780000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2403.3000500,-1379.0000000,23.6000000,0.0000000,0.0000000,49.9600000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2404.3999000,-1383.4000200,23.6000000,0.0000000,0.0000000,109.9600000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2404.8999000,-1388.4000200,23.6000000,0.0000000,0.0000000,209.9570000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2169.8999000,-1202.5999800,23.3000000,0.0000000,0.0000000,195.8490000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2176.6999500,-1170.3000500,23.9000000,0.0000000,0.0000000,145.8480000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2173.6999500,-1165.0000000,23.9000000,0.0000000,0.0000000,195.8440000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2169.8000500,-1138.0000000,23.3000000,0.0000000,0.0000000,235.8420000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2176.6999500,-1139.5999800,24.6000000,0.0000000,0.0000000,195.8420000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2166.0000000,-1116.6999500,24.8000000,0.0000000,0.0000000,273.8420000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2152.6999500,-1117.3000500,24.8000000,0.0000000,0.0000000,333.8400000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2148.3000500,-1115.5999800,24.8000000,0.0000000,0.0000000,283.8360000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2126.5000000,-1114.5000000,24.8000000,0.0000000,0.0000000,243.8320000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2095.1001000,-1097.4000200,24.6000000,0.0000000,0.0000000,263.8310000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2088.3999000,-1099.4000200,24.6000000,0.0000000,0.0000000,63.8260000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2073.1999500,-1104.0000000,24.3000000,357.2500000,0.0000000,153.8250000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2066.8999000,-1110.5000000,23.9000000,357.2480000,0.0000000,203.8200000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2056.8000500,-1080.3000500,24.3000000,0.0000000,0.0000000,243.8250000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2042.1999500,-1078.5000000,24.1000000,0.0000000,0.0000000,333.8250000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2036.6999500,-1075.5000000,24.1000000,0.0000000,0.0000000,43.8200000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2012.6999500,-1066.0999800,23.9000000,0.0000000,0.0000000,263.8190000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2009.4000200,-1061.8000500,23.9000000,0.0000000,0.0000000,323.8150000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,1974.9000200,-1047.5999800,23.9000000,0.0000000,0.0000000,275.8110000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,1978.3000500,-1063.0000000,23.9000000,0.0000000,0.0000000,352.5560000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,1972.8000500,-1084.8000500,24.6000000,0.0000000,0.0000000,352.5510000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,1976.5999800,-1088.0999800,24.6000000,0.0000000,0.0000000,302.5510000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,1973.6999500,-1119.1999500,25.2000000,359.2500000,0.0000000,352.5470000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2145.5000000,-1222.8000500,23.3000000,0.0000000,0.0000000,235.8490000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2150.6001000,-1222.5000000,23.3000000,0.0000000,0.0000000,265.8490000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2089.1999500,-1219.3000500,23.3000000,0.0000000,0.0000000,317.8470000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2064.1999500,-1223.5999800,23.3000000,0.0000000,0.0000000,227.8450000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2073.8999000,-1191.5000000,23.3000000,0.0000000,0.0000000,157.8400000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2069.1001000,-1164.6999500,23.3000000,0.0000000,0.0000000,197.8350000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2069.8999000,-1142.4000200,23.3000000,0.0000000,0.0000000,237.8310000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2047.4000200,-1138.3000500,23.3000000,0.0000000,0.0000000,277.8270000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2042.3000500,-1136.5000000,23.3000000,0.0000000,0.0000000,137.8220000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2012.5999800,-1133.6999500,24.5000000,0.0000000,0.0000000,237.8180000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2001.4000200,-1137.4000200,24.7000000,357.0000000,0.0000000,287.8160000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,1981.9000200,-1134.4000200,25.1000000,0.2450000,0.0000000,287.8140000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,1972.8000500,-1143.5999800,25.2000000,0.2420000,0.0000000,327.8140000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,1952.1999500,-1138.9000200,25.0000000,0.2420000,0.0000000,267.8100000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,1961.0999800,-1132.4000200,25.2000000,0.2420000,0.0000000,297.8080000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,1966.9000200,-1163.1999500,25.3000000,0.2420000,0.0000000,7.8100000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,1971.3000500,-1167.4000200,25.3000000,0.2420000,0.0000000,152.0560000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,1972.6999500,-1209.9000200,24.8000000,2.4920000,0.0000000,342.0510000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,1973.0000000,-1248.5000000,23.5000000,1.9880000,0.0000000,34.0480000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2066.6001000,-1250.1999500,23.3000000,0.0000000,0.0000000,337.8400000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2066.0000000,-1272.4000200,23.3000000,0.0000000,0.0000000,37.8350000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2044.0999800,-1260.4000200,23.3000000,0.0000000,0.0000000,287.8310000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2034.4000200,-1261.5000000,23.3000000,0.0000000,0.0000000,27.8310000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2028.0000000,-1263.1999500,23.3000000,0.0000000,0.0000000,257.8280000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2004.1999500,-1259.3000500,23.3000000,0.0000000,0.0000000,307.8270000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,1990.0999800,-1257.8000500,23.3000000,0.0000000,0.0000000,267.8260000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2065.1999500,-1320.0999800,23.3000000,0.0000000,0.0000000,355.8200000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2072.5000000,-1324.3000500,23.3000000,0.0000000,0.0000000,95.8200000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2070.3999000,-1331.0000000,23.3000000,0.0000000,0.0000000,165.8170000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2045.9000200,-1343.5000000,23.3000000,0.0000000,0.0000000,275.8170000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2049.5000000,-1340.6999500,23.3000000,0.0000000,0.0000000,65.8120000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2063.8999000,-1350.4000200,23.3000000,0.0000000,0.0000000,15.8080000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2075.1999500,-1372.8000500,23.3000000,0.0000000,0.0000000,7.8040000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2069.8000500,-1386.3000500,23.3000000,0.0000000,0.0000000,77.8000000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2096.6001000,-1383.4000200,23.3000000,0.0000000,0.0000000,117.8000000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2103.6999500,-1387.9000200,23.3000000,0.0000000,0.0000000,87.7950000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2125.3000500,-1380.5999800,23.3000000,0.0000000,0.0000000,197.7920000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2120.8000500,-1393.5000000,23.3000000,0.0000000,0.0000000,337.7870000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2110.6001000,-1409.3000500,23.3000000,0.0000000,0.0000000,17.7860000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2119.3000500,-1420.8000500,23.3000000,0.0000000,0.0000000,57.7810000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2129.5000000,-1435.1999500,23.3000000,0.0000000,0.0000000,7.7770000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2130.8999000,-1428.3000500,23.3000000,0.0000000,0.0000000,117.7730000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2109.6999500,-1453.3000500,23.3000000,0.0000000,0.0000000,7.7680000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2104.1001000,-1457.8000500,23.3000000,0.0000000,0.0000000,297.7670000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2121.1001000,-1458.0999800,23.3000000,0.0000000,0.0000000,87.7620000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2129.3999000,-1450.0000000,23.3000000,0.0000000,0.0000000,177.7590000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2110.3000500,-1481.3000500,23.3000000,0.0000000,0.0000000,337.7590000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2116.3999000,-1501.0999800,23.3000000,0.0000000,0.0000000,7.7580000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,1881.5999800,-1260.1999500,13.0000000,0.0000000,0.0000000,23.7410000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,1904.0000000,-1260.4000200,13.0000000,0.0000000,0.0000000,73.7360000); //object(la_fuckcar1)(143)
	CreateDynamicObject(3594,2014.5999800,-1339.0999800,23.3000000,0.0000000,0.0000000,255.8120000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,1994.4000200,-1343.6999500,23.3000000,0.0000000,0.0000000,285.8110000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,1986.6999500,-1351.8000500,23.3000000,0.0000000,0.0000000,325.8090000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,1974.0000000,-1337.6999500,23.3000000,0.0000000,0.0000000,281.8050000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,1984.5000000,-1371.8000500,23.3000000,0.0000000,0.0000000,3.8050000); //object(la_fuckcar1)(7)
	CreateDynamicObject(1299,2023.8000500,-1414.1999500,16.4000000,0.0000000,0.0000000,0.0000000); //object(smashboxpile)(42)
	CreateDynamicObject(1299,2030.0999800,-1426.0000000,16.4000000,0.0000000,0.0000000,60.0000000); //object(smashboxpile)(43)
	CreateDynamicObject(1299,2034.0000000,-1417.0999800,16.4000000,0.0000000,0.0000000,129.9960000); //object(smashboxpile)(44)
	CreateDynamicObject(1299,2016.5999800,-1416.5999800,16.4000000,0.0000000,0.0000000,169.9960000); //object(smashboxpile)(45)
	CreateDynamicObject(1264,2017.1999500,-1418.9000200,16.5000000,0.0000000,0.0000000,330.0000000); //object(blackbag1)(4)
	CreateDynamicObject(1264,2018.1999500,-1418.1999500,16.5000000,0.0000000,0.0000000,60.0000000); //object(blackbag1)(5)
	CreateDynamicObject(1264,2016.9000200,-1415.0999800,16.5000000,0.0000000,0.0000000,50.0000000); //object(blackbag1)(6)
	CreateDynamicObject(1264,2022.0999800,-1413.4000200,16.5000000,0.0000000,0.0000000,0.0000000); //object(blackbag1)(7)
	CreateDynamicObject(1264,2025.5000000,-1415.8000500,16.5000000,0.0000000,0.0000000,30.0000000); //object(blackbag1)(8)
	CreateDynamicObject(1264,2031.8000500,-1418.4000200,16.5000000,0.0000000,0.0000000,340.0000000); //object(blackbag1)(9)
	CreateDynamicObject(1264,2028.0999800,-1423.1999500,16.5000000,0.0000000,0.0000000,0.0000000); //object(blackbag1)(10)
	CreateDynamicObject(1264,2029.3000500,-1426.9000200,16.5000000,0.0000000,0.0000000,0.0000000); //object(blackbag1)(11)
	CreateDynamicObject(1264,2030.5999800,-1428.3000500,16.5000000,0.0000000,0.0000000,30.0000000); //object(blackbag1)(12)
	CreateDynamicObject(1219,2023.0999800,-1401.1999500,17.8000000,89.4410000,206.5910000,153.4100000); //object(palette)(18)
	CreateDynamicObject(1219,2025.9000200,-1401.1999500,17.8000000,89.4400000,206.5870000,153.4080000); //object(palette)(19)
	CreateDynamicObject(1219,2028.6999500,-1401.1999500,17.8000000,89.4400000,206.5870000,153.4080000); //object(palette)(20)
	CreateDynamicObject(1219,2032.9000200,-1401.3000500,17.8000000,89.4400000,206.5870000,153.4080000); //object(palette)(21)
	CreateDynamicObject(1219,2036.6999500,-1401.1999500,17.8000000,89.4400000,206.5870000,155.4080000); //object(palette)(22)
	CreateDynamicObject(1219,2038.5999800,-1403.4000200,17.8000000,89.4340000,206.5810000,65.4070000); //object(palette)(23)
	CreateDynamicObject(1219,2038.5999800,-1406.5000000,17.8000000,89.4290000,206.5810000,65.4020000); //object(palette)(24)
	CreateDynamicObject(1219,2040.3000500,-1407.9000200,17.8000000,89.4290000,206.5810000,153.4020000); //object(palette)(25)
	CreateDynamicObject(1219,2043.0999800,-1407.9000200,17.8000000,89.4230000,206.5810000,153.3970000); //object(palette)(26)
	CreateDynamicObject(2673,2020.1999500,-1419.0999800,16.1000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_5)(3)
	CreateDynamicObject(2673,2017.4000200,-1413.6999500,16.1000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_5)(4)
	CreateDynamicObject(2673,2014.4000200,-1414.5000000,16.1000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_5)(5)
	CreateDynamicObject(2673,2014.1999500,-1413.9000200,16.1000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_5)(6)
	CreateDynamicObject(2673,2019.1999500,-1412.5999800,16.1000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_5)(8)
	CreateDynamicObject(2673,2019.4000200,-1412.8000500,16.1000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_5)(9)
	CreateDynamicObject(2673,2021.5000000,-1415.6999500,16.1000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_5)(10)
	CreateDynamicObject(2673,2024.3000500,-1418.6999500,16.1000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_5)(11)
	CreateDynamicObject(2673,2026.3000500,-1420.9000200,16.1000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_5)(12)
	CreateDynamicObject(2673,2028.4000200,-1424.4000200,16.1000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_5)(13)
	CreateDynamicObject(2673,2027.3000500,-1419.0000000,16.1000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_5)(14)
	CreateDynamicObject(2677,2023.8000500,-1410.8000500,16.3000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(133)
	CreateDynamicObject(2677,2024.4000200,-1406.9000200,16.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(134)
	CreateDynamicObject(2677,2035.5999800,-1404.4000200,16.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7)(135)
	CreateDynamicObject(2677,2035.8000500,-1407.6999500,16.6000000,0.0000000,0.0000000,50.0000000); //object(proc_rubbish_7)(136)
	CreateDynamicObject(2677,2033.1999500,-1406.1999500,16.6000000,0.0000000,0.0000000,89.9990000); //object(proc_rubbish_7)(137)
	CreateDynamicObject(2676,2042.0000000,-1412.5000000,16.3000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(132)
	CreateDynamicObject(2676,2040.5000000,-1417.0000000,16.3000000,0.0000000,0.0000000,60.0000000); //object(proc_rubbish_8)(133)
	CreateDynamicObject(2676,2038.5999800,-1410.6999500,16.3000000,0.0000000,0.0000000,119.9960000); //object(proc_rubbish_8)(134)
	CreateDynamicObject(2676,2032.0999800,-1422.8000500,16.1000000,0.0000000,0.0000000,59.9960000); //object(proc_rubbish_8)(135)
	CreateDynamicObject(2676,2031.6999500,-1416.1999500,16.1000000,0.0000000,0.0000000,119.9960000); //object(proc_rubbish_8)(136)
	CreateDynamicObject(2676,2022.9000200,-1417.0000000,16.1000000,0.0000000,0.0000000,179.9930000); //object(proc_rubbish_8)(137)
	CreateDynamicObject(2676,2011.0000000,-1413.0999800,16.1000000,0.0000000,0.0000000,239.9890000); //object(proc_rubbish_8)(138)
	CreateDynamicObject(2676,2000.1999500,-1416.6999500,16.1000000,0.0000000,0.0000000,269.9850000); //object(proc_rubbish_8)(139)
	CreateDynamicObject(2676,2000.1992200,-1416.6992200,16.1000000,0.0000000,0.0000000,269.9840000); //object(proc_rubbish_8)(140)
	CreateDynamicObject(18249,2044.1999500,-1415.4000200,11.0000000,0.0000000,0.0000000,0.0000000); //object(cuntwjunk05)(19)
	CreateDynamicObject(1436,2034.6999500,-1431.5999800,17.6000000,0.0000000,0.0000000,0.0000000); //object(dyn_scaffold_2)(1)
	CreateDynamicObject(1436,2031.9000200,-1433.0999800,17.6000000,0.0000000,0.0000000,50.0000000); //object(dyn_scaffold_2)(2)
	CreateDynamicObject(1436,2041.5999800,-1422.5999800,17.6000000,0.0000000,0.0000000,109.9990000); //object(dyn_scaffold_2)(3)
	CreateDynamicObject(1358,2008.8000500,-1418.6999500,17.2000000,0.0000000,0.0000000,0.0000000); //object(cj_skip_rubbish)(11)
	CreateDynamicObject(1349,2007.8000500,-1412.1999500,16.6000000,0.0000000,0.0000000,70.0000000); //object(cj_shtrolly)(21)
	CreateDynamicObject(1349,2005.3000500,-1412.1999500,16.6000000,0.0000000,0.0000000,39.9990000); //object(cj_shtrolly)(22)
	CreateDynamicObject(1349,2006.0999800,-1410.6999500,16.6000000,0.0000000,0.0000000,179.9960000); //object(cj_shtrolly)(23)
	CreateDynamicObject(1344,2040.1999500,-1431.1999500,17.0000000,0.0000000,0.0000000,182.0000000); //object(cj_dumpster2)(7)
	CreateDynamicObject(1344,2043.5000000,-1426.9000200,17.0000000,0.0000000,0.0000000,268.0000000); //object(cj_dumpster2)(8)
	CreateDynamicObject(1300,2012.3000500,-1420.0000000,16.4000000,0.0000000,0.0000000,0.0000000); //object(bin1)(1)
	CreateDynamicObject(1299,2032.5999800,-1442.9000200,16.7000000,0.0000000,0.0000000,109.9960000); //object(smashboxpile)(46)
	CreateDynamicObject(1299,2038.3000500,-1449.0999800,16.7000000,0.0000000,0.0000000,69.9950000); //object(smashboxpile)(47)
	CreateDynamicObject(1299,2010.5000000,-1409.8000500,16.4000000,0.0000000,0.0000000,219.9910000); //object(smashboxpile)(48)
	CreateDynamicObject(1299,2001.9000200,-1417.0999800,16.4000000,0.0000000,0.0000000,279.9900000); //object(smashboxpile)(49)
	CreateDynamicObject(1264,2012.4000200,-1410.6999500,16.5000000,0.0000000,0.0000000,329.9960000); //object(blackbag1)(13)
	CreateDynamicObject(1264,2009.1999500,-1411.8000500,16.5000000,0.0000000,0.0000000,329.9960000); //object(blackbag1)(14)
	CreateDynamicObject(1264,2006.5000000,-1419.9000200,16.5000000,0.0000000,0.0000000,329.9960000); //object(blackbag1)(15)
	CreateDynamicObject(1264,2002.6999500,-1419.3000500,16.5000000,0.0000000,0.0000000,329.9960000); //object(blackbag1)(16)
	CreateDynamicObject(1264,2000.6999500,-1416.8000500,16.5000000,0.0000000,0.0000000,329.9960000); //object(blackbag1)(17)
	CreateDynamicObject(2676,1998.6999500,-1441.6999500,12.7000000,0.0000000,0.0000000,239.9850000); //object(proc_rubbish_8)(141)
	CreateDynamicObject(2676,2002.0999800,-1443.5000000,12.7000000,0.0000000,0.0000000,299.9850000); //object(proc_rubbish_8)(142)
	CreateDynamicObject(2676,2006.8000500,-1442.9000200,12.7000000,0.0000000,0.0000000,359.9820000); //object(proc_rubbish_8)(143)
	CreateDynamicObject(2676,2003.5000000,-1453.1999500,12.7000000,0.0000000,0.0000000,69.9780000); //object(proc_rubbish_8)(144)
	CreateDynamicObject(2676,1997.8000500,-1451.6999500,12.7000000,0.0000000,0.0000000,109.9770000); //object(proc_rubbish_8)(145)
	CreateDynamicObject(819,2016.5999800,-1437.4000200,13.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass03)(3)
	CreateDynamicObject(819,2022.1999500,-1438.9000200,13.8000000,0.0000000,0.0000000,70.0000000); //object(genveg_tallgrass03)(4)
	CreateDynamicObject(819,2026.4000200,-1431.0999800,13.8000000,0.0000000,0.0000000,129.9990000); //object(genveg_tallgrass03)(5)
	CreateDynamicObject(819,2015.6999500,-1423.5000000,13.8000000,0.0000000,0.0000000,129.9960000); //object(genveg_tallgrass03)(6)
	CreateDynamicObject(819,2010.6999500,-1429.4000200,13.8000000,0.0000000,0.0000000,129.9960000); //object(genveg_tallgrass03)(7)
	CreateDynamicObject(806,2013.5000000,-1439.1999500,16.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(135)
	CreateDynamicObject(806,2008.1999500,-1430.6999500,17.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(136)
	CreateDynamicObject(806,2004.0999800,-1418.0999800,19.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(137)
	CreateDynamicObject(806,2010.3000500,-1412.1999500,19.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(138)
	CreateDynamicObject(806,2042.5999800,-1409.4000200,20.0000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(139)
	CreateDynamicObject(806,2037.3000500,-1431.6999500,19.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass)(140)
	CreateDynamicObject(810,2005.3000500,-1427.3000500,14.9000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush14)(2)
	CreateDynamicObject(822,2018.9000200,-1408.1999500,16.5000000,0.0000000,0.0000000,40.0000000); //object(genveg_tallgrass06)(11)
	CreateDynamicObject(822,2042.5000000,-1417.4000200,16.5000000,0.0000000,0.0000000,69.9960000); //object(genveg_tallgrass06)(12)
	CreateDynamicObject(1413,2023.3000500,-1306.1999500,21.2000000,0.0000000,0.0000000,270.0000000); //object(dyn_mesh_3)(61)
	CreateDynamicObject(1413,2023.3000500,-1306.1999500,23.5000000,0.0000000,0.0000000,270.0000000); //object(dyn_mesh_3)(62)
	CreateDynamicObject(1413,2023.3000500,-1306.1999500,25.8000000,0.0000000,0.0000000,270.0000000); //object(dyn_mesh_3)(63)
	CreateDynamicObject(1413,2023.4000200,-1300.8000500,25.3000000,0.0000000,0.0000000,270.0000000); //object(dyn_mesh_3)(64)
	CreateDynamicObject(1413,2023.4000200,-1295.4000200,25.3000000,0.0000000,0.0000000,270.2500000); //object(dyn_mesh_3)(65)
	CreateDynamicObject(1413,2023.4000200,-1290.0999800,25.3000000,0.0000000,0.0000000,270.2470000); //object(dyn_mesh_3)(66)
	CreateDynamicObject(1413,2023.4000200,-1284.8000500,25.3000000,0.0000000,0.0000000,270.2470000); //object(dyn_mesh_3)(67)
	CreateDynamicObject(1413,2023.1999500,-1279.4000200,25.3000000,0.0000000,0.0000000,270.2470000); //object(dyn_mesh_3)(68)
	CreateDynamicObject(1413,2023.0999800,-1274.0999800,25.3000000,0.0000000,0.0000000,270.2470000); //object(dyn_mesh_3)(69)
	CreateDynamicObject(1413,2025.9000200,-1271.0999800,25.3000000,0.0000000,0.0000000,180.2470000); //object(dyn_mesh_3)(70)
	CreateDynamicObject(1413,2031.2000000,-1271.1000000,25.3000000,0.0000000,0.0000000,183.9880000); //object(dyn_mesh_3)(71)
	CreateDynamicObject(1413,2036.4000200,-1270.9000200,25.3000000,0.0000000,0.0000000,178.9880000); //object(dyn_mesh_3)(72)
	CreateDynamicObject(1413,2041.6999500,-1271.0999800,25.3000000,0.0000000,0.0000000,178.9840000); //object(dyn_mesh_3)(73)
	CreateDynamicObject(1413,2047.0000000,-1271.0999800,25.3000000,0.0000000,0.0000000,181.7340000); //object(dyn_mesh_3)(74)
	CreateDynamicObject(1413,2052.4000000,-1271.0000000,25.3000000,0.0000000,0.0000000,181.7250000); //object(dyn_mesh_3)(75)
	CreateDynamicObject(1413,2026.0999800,-1331.1999500,24.3000000,0.0000000,0.0000000,0.0000000); //object(dyn_mesh_3)(76)
	CreateDynamicObject(1413,2037.1999500,-1331.0000000,24.3000000,0.0000000,0.0000000,0.0000000); //object(dyn_mesh_3)(77)
	CreateDynamicObject(1413,2040.3000500,-1328.4000200,24.3000000,0.0000000,0.0000000,80.0000000); //object(dyn_mesh_3)(78)
	CreateDynamicObject(1413,2024.0000000,-1328.5000000,24.3000000,0.0000000,0.0000000,260.0000000); //object(dyn_mesh_3)(79)
	CreateDynamicObject(1457,2026.4000200,-1307.0000000,21.5000000,0.0000000,0.0000000,90.0000000); //object(dyn_outhouse_2)(1)
	CreateDynamicObject(1457,2026.4000200,-1300.3000500,21.5000000,0.0000000,0.0000000,90.0000000); //object(dyn_outhouse_2)(2)
	CreateDynamicObject(1457,2026.3000500,-1291.8000500,21.5000000,0.0000000,0.0000000,90.0000000); //object(dyn_outhouse_2)(3)
	CreateDynamicObject(1457,2026.0999800,-1285.6999500,21.5000000,0.0000000,0.0000000,90.0000000); //object(dyn_outhouse_2)(4)
	CreateDynamicObject(1457,2026.0000000,-1279.0000000,21.5000000,0.0000000,0.0000000,90.0000000); //object(dyn_outhouse_2)(5)
	CreateDynamicObject(1458,2028.8000500,-1281.5000000,20.2000000,0.0000000,0.0000000,110.0000000); //object(dyn_cart)(2)
	CreateDynamicObject(1458,2029.0000000,-1289.0000000,20.2000000,0.0000000,0.0000000,29.9950000); //object(dyn_cart)(3)
	CreateDynamicObject(1458,2035.0000000,-1306.5000000,20.2000000,0.0000000,0.0000000,189.9930000); //object(dyn_cart)(4)
	CreateDynamicObject(1483,2027.0999800,-1272.8000500,21.7000000,0.0000000,0.0000000,270.0000000); //object(dyn_garrage2)(2)
	CreateDynamicObject(3286,2034.5000000,-1280.0999800,24.7000000,0.0000000,0.0000000,0.0000000); //object(cxrf_watertwr)(1)
	CreateDynamicObject(3403,2031.8000500,-1298.0999800,23.0000000,0.0000000,0.0000000,90.0000000); //object(sw_logcover)(4)
	CreateDynamicObject(920,2027.0000000,-1277.0000000,20.5000000,0.0000000,0.0000000,180.0000000); //object(y_generator)(4)
	CreateDynamicObject(920,2028.1999500,-1284.0999800,20.5000000,0.0000000,0.0000000,89.9950000); //object(y_generator)(5)
	CreateDynamicObject(920,2028.6999500,-1292.8000500,20.5000000,0.0000000,0.0000000,109.9950000); //object(y_generator)(6)
	CreateDynamicObject(920,2028.6999500,-1302.0999800,20.5000000,0.0000000,0.0000000,39.9900000); //object(y_generator)(7)
	CreateDynamicObject(920,2024.9000200,-1304.8000500,20.5000000,0.0000000,0.0000000,169.9850000); //object(y_generator)(8)
	CreateDynamicObject(3529,2054.1999500,-1271.5999800,26.2000000,0.0000000,0.0000000,0.0000000); //object(vgsn_constrbeam)(1)
	CreateDynamicObject(3529,2028.5999800,-1309.0000000,23.1000000,0.0000000,0.0000000,0.0000000); //object(vgsn_constrbeam)(2)
	CreateDynamicObject(3529,2034.5000000,-1308.6992200,23.1000000,0.0000000,0.0000000,0.0000000); //object(vgsn_constrbeam)(3)
	CreateDynamicObject(3529,2054.1001000,-1277.0000000,26.2000000,0.0000000,0.0000000,0.0000000); //object(vgsn_constrbeam)(4)
	CreateDynamicObject(2676,2031.4000200,-1306.4000200,20.1000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8)(146)
	CreateDynamicObject(2676,2028.6999500,-1296.1999500,20.1000000,0.0000000,0.0000000,110.0000000); //object(proc_rubbish_8)(147)
	CreateDynamicObject(2676,2034.8000500,-1293.5999800,20.1000000,0.0000000,0.0000000,49.9950000); //object(proc_rubbish_8)(148)
	CreateDynamicObject(2676,2034.4000200,-1279.5999800,20.1000000,0.0000000,0.0000000,99.9930000); //object(proc_rubbish_8)(149)
	CreateDynamicObject(2676,2036.1999500,-1273.5000000,20.1000000,0.0000000,0.0000000,139.9920000); //object(proc_rubbish_8)(150)
	CreateDynamicObject(923,2035.4000200,-1294.1999500,20.8000000,0.0000000,0.0000000,0.0000000); //object(packing_carates2)(4)
	CreateDynamicObject(939,2035.4000200,-1297.6999500,22.4000000,0.0000000,0.0000000,90.0000000); //object(cj_df_unit)(12)
	CreateDynamicObject(1345,2035.3000500,-1301.0999800,20.7000000,0.0000000,0.0000000,0.0000000); //object(cj_dumpster)(1)
	CreateDynamicObject(1345,2035.0999800,-1283.4000200,20.7000000,0.0000000,0.0000000,320.0000000); //object(cj_dumpster)(2)
	CreateDynamicObject(1345,2034.1999500,-1277.4000200,20.7000000,0.0000000,0.0000000,189.9990000); //object(cj_dumpster)(3)
	CreateDynamicObject(1220,2025.3000500,-1307.9000200,20.3000000,0.0000000,0.0000000,0.0000000); //object(cardboardbox2)(1)
	CreateDynamicObject(1220,2025.4000200,-1299.4000200,20.3000000,0.0000000,0.0000000,0.0000000); //object(cardboardbox2)(2)
	CreateDynamicObject(1220,2027.4000200,-1290.8000500,20.3000000,0.0000000,0.0000000,0.0000000); //object(cardboardbox2)(3)
	CreateDynamicObject(1220,2027.0000000,-1279.8000500,20.3000000,0.0000000,0.0000000,0.0000000); //object(cardboardbox2)(4)
	CreateDynamicObject(1220,2025.1992200,-1286.5000000,20.3000000,0.0000000,0.0000000,0.0000000); //object(cardboardbox2)(5)
	CreateDynamicObject(1349,2026.8000500,-1303.9000200,20.5000000,0.0000000,0.0000000,0.0000000); //object(cj_shtrolly)(24)
	CreateDynamicObject(1349,2026.8000500,-1294.5000000,20.5000000,0.0000000,0.0000000,0.0000000); //object(cj_shtrolly)(25)
	CreateDynamicObject(1349,2025.5000000,-1296.4000200,20.5000000,0.0000000,0.0000000,300.0000000); //object(cj_shtrolly)(26)
	CreateDynamicObject(1349,2030.6999500,-1288.9000200,20.5000000,0.0000000,0.0000000,299.9980000); //object(cj_shtrolly)(27)
	CreateDynamicObject(1369,2028.6999500,-1305.0000000,20.5000000,0.0000000,0.0000000,110.0000000); //object(cj_wheelchair1)(14)
	CreateDynamicObject(1438,2032.0000000,-1272.4000200,20.0000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile_2)(18)
	CreateDynamicObject(850,2032.8000500,-1301.3000500,20.0000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_1)(24)
	CreateDynamicObject(1763,2031.5000000,-1295.4000200,19.9000000,0.0000000,0.0000000,0.0000000); //object(low_couch_1)(7)
	CreateDynamicObject(1763,2033.5999800,-1296.6999500,19.9000000,0.0000000,0.0000000,270.0000000); //object(low_couch_1)(8)
	CreateDynamicObject(1763,2028.6999500,-1272.4000200,19.9000000,0.0000000,0.0000000,0.0000000); //object(low_couch_1)(9)
	CreateDynamicObject(1763,2026.0999800,-1272.5000000,19.9000000,0.0000000,0.0000000,0.0000000); //object(low_couch_1)(10)
	CreateDynamicObject(1763,2024.5000000,-1275.5000000,19.9000000,0.0000000,0.0000000,90.0000000); //object(low_couch_1)(11)
	CreateDynamicObject(1646,2025.5999800,-1278.0000000,20.3000000,0.0000000,0.0000000,90.0000000); //object(lounge_towel_up)(1)
	CreateDynamicObject(1646,2025.5999800,-1284.6999500,20.3000000,0.0000000,0.0000000,90.0000000); //object(lounge_towel_up)(2)
	CreateDynamicObject(1646,2026.0000000,-1301.1999500,20.3000000,0.0000000,0.0000000,90.0000000); //object(lounge_towel_up)(3)
	CreateDynamicObject(1647,2026.0999800,-1306.0000000,20.1000000,0.0000000,0.0000000,90.0000000); //object(lounge_wood_dn)(1)
	CreateDynamicObject(1647,2025.8000500,-1292.8000500,20.1000000,0.0000000,0.0000000,90.0000000); //object(lounge_wood_dn)(2)
	CreateDynamicObject(855,2034.6999500,-1286.3000500,20.0000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01)(46)
	CreateDynamicObject(827,2035.5999800,-1304.0000000,23.7000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass11)(1)
	CreateDynamicObject(1383,1903.9000200,-1317.8000500,28.2000000,0.0000000,0.0000000,0.0000000); //object(twrcrane_m_04)(2)
	CreateDynamicObject(1384,1903.9000200,-1317.8000500,60.1000000,286.0000000,0.0000000,210.0000000); //object(twrcrane_m_01)(2)
	CreateDynamicObject(761,1839.0996100,-1515.3994100,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1879.5000000,-1261.9000200,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1898.9000200,-1261.0000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1986.1999500,-1258.9000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1975.6999500,-1252.5000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1971.5000000,-1251.5999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2004.4000200,-1256.6999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2004.5999800,-1261.4000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2032.3000500,-1261.8000500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2040.9000200,-1263.1999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2044.6999500,-1258.0000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2026.5999800,-1260.6999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2063.6999500,-1250.9000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2068.8000500,-1250.4000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2069.1999500,-1272.9000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2066.8000500,-1269.3000500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2064.1001000,-1273.5999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2076.5000000,-1293.5000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2072.1001000,-1295.9000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2081.3999000,-1299.5000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2066.8000500,-1321.9000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2063.5000000,-1318.0999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2075.0000000,-1321.6999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2069.8000500,-1326.5000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2066.8999000,-1331.5999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2066.3999000,-1352.0000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2061.6001000,-1348.8000500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2063.1999500,-1354.3000500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2068.8999000,-1384.0999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2071.3000500,-1389.0999800,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2066.8000500,-1387.9000200,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2073.1001000,-1375.1999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2077.0000000,-1376.5000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2077.3000500,-1371.6999500,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2099.6001000,-1388.4000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2096.6999500,-1381.0000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2092.5000000,-1384.4000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2117.5000000,-1394.0999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2119.3000500,-1391.0000000,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2123.6001000,-1391.4000200,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2112.1999500,-1407.5000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2108.8999000,-1414.0000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2122.3999000,-1421.0999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2118.6999500,-1417.6999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2115.1999500,-1420.0000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2120.0000000,-1423.4000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2128.1001000,-1426.9000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2133.1999500,-1429.5000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2128.0000000,-1437.1999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2131.3999000,-1435.9000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2131.3999000,-1452.1999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2127.5000000,-1447.9000200,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2127.3999000,-1454.4000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2124.0000000,-1460.0999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2119.3999000,-1456.1999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2118.5000000,-1459.6999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2108.6001000,-1457.5000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2111.5000000,-1451.3000500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2102.8000500,-1455.5999800,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2107.6999500,-1481.0000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2112.8999000,-1479.5999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2110.1001000,-1477.4000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2114.8000500,-1502.9000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2113.6999500,-1498.0999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2118.5000000,-1497.5000000,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2127.6999500,-1381.1999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2122.8999000,-1380.8000500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2125.1999500,-1385.0000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2155.8999000,-1385.3000500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2151.8000500,-1380.6999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2151.6001000,-1384.5000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2183.1001000,-1384.0999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2179.5000000,-1385.8000500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2177.1001000,-1389.6999500,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2191.5000000,-1382.0999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2193.5000000,-1386.4000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2196.5000000,-1382.4000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2216.6999500,-1409.1999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2212.6999500,-1407.1999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2212.6999500,-1411.9000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2212.3999000,-1433.4000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2213.5000000,-1429.0999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2210.6999500,-1468.1999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2213.8999000,-1469.3000500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2208.5000000,-1474.0000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2215.8000500,-1479.5999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2214.6999500,-1477.3000500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2220.3999000,-1478.8000500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2235.3000500,-1485.5999800,22.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2234.1001000,-1490.3000500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2241.6001000,-1488.6999500,22.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2250.6001000,-1485.1999500,22.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2250.6999500,-1479.4000200,22.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2248.3000500,-1482.4000200,22.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2289.3000500,-1483.9000200,21.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2294.3999000,-1484.4000200,22.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2312.6999500,-1484.9000200,22.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2317.3999000,-1488.5000000,22.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2335.1001000,-1485.1999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2336.1999500,-1491.0999800,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2343.8000500,-1495.1999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2344.1001000,-1500.4000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2348.1001000,-1500.0999800,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2344.1001000,-1471.5999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2345.1001000,-1464.5999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2346.5000000,-1460.3000500,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2343.8999000,-1457.3000500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2340.1999500,-1442.6999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2344.1999500,-1437.1999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2341.3999000,-1418.5999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2344.3999000,-1416.0000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2338.6001000,-1393.9000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2335.3000500,-1387.3000500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2350.3000500,-1380.0000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2352.0000000,-1376.4000200,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2357.6999500,-1384.1999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2366.1001000,-1380.9000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2372.6999500,-1374.9000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2384.8000500,-1383.8000500,22.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2388.6001000,-1387.4000200,22.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2401.1999500,-1386.5999800,23.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2386.6001000,-1403.6999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2384.6999500,-1409.1999500,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2390.0000000,-1407.3000500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2391.8999000,-1437.9000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2385.3000500,-1437.4000200,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2393.3999000,-1432.0999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2421.3999000,-1445.0999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2418.8000500,-1450.4000200,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2428.8000500,-1487.0999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2421.5000000,-1488.5999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2398.1001000,-1485.9000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2397.3000500,-1480.5999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2403.8999000,-1516.1999500,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2402.8000500,-1520.8000500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2397.1999500,-1516.6999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2350.1001000,-1529.5000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2345.1001000,-1519.5999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2341.0000000,-1551.0999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2336.6999500,-1561.8000500,22.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2343.1001000,-1562.3000500,22.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2345.5000000,-1567.4000200,22.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2426.8000500,-1535.5999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2429.5000000,-1530.5000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2429.6001000,-1514.9000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2425.6999500,-1512.3000500,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2430.1001000,-1509.3000500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2429.8999000,-1495.1999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2447.8999000,-1505.5999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2441.8000500,-1508.5999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2490.1001000,-1501.5999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2485.8999000,-1507.1999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2486.6999500,-1503.6999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2507.6001000,-1503.1999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2512.3999000,-1502.9000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2552.8000500,-1502.0000000,22.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2545.6999500,-1502.9000200,22.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2545.3000500,-1508.5000000,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2549.3000500,-1489.9000200,22.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2545.6999500,-1492.5000000,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2548.1001000,-1484.0000000,22.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2551.1001000,-1469.0999800,22.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2546.1999500,-1470.0000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2537.6001000,-1472.9000200,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2534.8000500,-1467.9000200,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2534.3000500,-1475.4000200,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2557.1999500,-1445.4000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2553.8999000,-1441.9000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2552.1999500,-1446.9000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2570.1999500,-1439.5999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2572.0000000,-1445.0999800,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2565.1999500,-1439.8000500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2566.5000000,-1436.0999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2576.8000500,-1449.9000200,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2569.0000000,-1456.0000000,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2567.8999000,-1452.5000000,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2442.5000000,-1441.8000500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2578.8000500,-1453.6999500,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2447.1001000,-1445.5000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2508.5000000,-1439.2000000,27.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2464.0000000,-1440.5000000,23.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2454.8999000,-1435.8000500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2452.6001000,-1422.6999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2450.1999500,-1411.1999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2447.1001000,-1408.1999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2446.3999000,-1419.0999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2448.6001000,-1373.6999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2452.0000000,-1370.6999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2447.1001000,-1367.0000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2456.3000500,-1343.4000200,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2460.3999000,-1345.0999800,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2450.3999000,-1330.6999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2454.1001000,-1328.3000500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2455.1001000,-1333.8000500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2454.3999000,-1310.0000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2460.1001000,-1310.3000500,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2451.6999500,-1300.0000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2455.5000000,-1296.3000500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2452.6999500,-1279.1999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2453.3999000,-1271.4000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2448.3000500,-1265.9000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2449.6999500,-1259.0000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2447.6999500,-1252.4000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2454.1001000,-1251.5000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2451.1999500,-1247.5000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2442.1001000,-1252.0999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2415.1999500,-1258.5999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2414.0000000,-1254.1999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2408.8999000,-1252.5000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2389.0000000,-1259.6999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2387.1001000,-1254.0999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2384.6999500,-1260.0000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2372.6999500,-1257.6999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2373.1001000,-1252.1999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2366.6999500,-1233.6999500,24.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2377.1001000,-1246.0000000,23.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2372.6001000,-1293.4000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2374.3000500,-1283.8000500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2369.8999000,-1299.5999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2353.6001000,-1302.3000500,22.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2348.1001000,-1303.5000000,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2321.3999000,-1304.8000500,23.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2320.8999000,-1299.5999800,23.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2314.3000500,-1295.8000500,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2304.3000500,-1289.9000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2298.6999500,-1286.5000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2301.1001000,-1292.4000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2307.0000000,-1269.9000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2301.6999500,-1272.8000500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2301.1001000,-1318.3000500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2302.6001000,-1311.0999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2297.3000500,-1313.6999500,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2302.8000500,-1337.3000500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2309.6999500,-1334.5000000,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2306.8000500,-1340.0000000,22.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2302.6001000,-1366.8000500,22.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2305.1999500,-1385.4000200,22.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2297.3000500,-1376.9000200,23.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2304.1999500,-1378.0999800,22.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2267.1001000,-1297.6999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2267.5000000,-1290.3000500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2270.6999500,-1270.0000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2275.1999500,-1274.1999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2273.3000500,-1257.9000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2267.3999000,-1261.3000500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2269.8000500,-1254.0999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2270.5000000,-1237.0000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2268.3999000,-1230.6999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2263.1999500,-1212.9000200,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2260.6999500,-1218.6999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2234.3000500,-1227.6999500,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2243.6999500,-1227.6999500,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2223.0000000,-1216.5000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2224.0000000,-1211.9000200,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2193.5000000,-1220.6999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2196.8999000,-1224.5000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2201.5000000,-1220.8000500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2185.8999000,-1217.5999800,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2172.0000000,-1217.0000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2171.8999000,-1210.0000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2173.3000500,-1204.5000000,22.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2172.0000000,-1200.1999500,23.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2166.5000000,-1198.5999800,23.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2149.8000500,-1224.6999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2150.1999500,-1220.1999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2141.6999500,-1219.6999500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2086.3999000,-1221.9000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2093.0000000,-1217.0000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2090.8000500,-1220.4000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2064.6001000,-1220.4000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2067.6001000,-1223.9000200,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2064.0000000,-1225.5000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2076.8999000,-1190.8000500,22.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2070.8000500,-1192.3000500,22.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2067.1001000,-1167.4000200,22.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2070.1999500,-1161.0000000,22.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2071.8000500,-1167.5000000,22.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2070.6999500,-1145.0999800,22.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2070.1999500,-1139.5999800,22.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2063.8999000,-1109.3000500,23.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2073.6999500,-1107.4000200,23.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2076.1001000,-1102.1999500,23.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2085.6999500,-1099.9000200,23.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2091.0000000,-1102.0999800,23.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2096.5000000,-1099.3000500,24.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2093.1001000,-1099.0999800,24.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2126.1999500,-1117.0000000,24.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2126.1001000,-1111.5000000,24.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2151.3000500,-1113.1999500,24.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2150.0000000,-1117.5999800,24.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2154.1001000,-1118.9000200,24.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2164.3000500,-1119.5999800,24.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2171.1999500,-1118.0999800,24.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2040.4000200,-1076.6999500,23.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2036.0000000,-1071.5999800,23.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2043.4000200,-1081.0000000,23.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2056.3000500,-1082.1999500,23.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1973.8000500,-1050.1999500,23.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1978.3000500,-1045.5000000,23.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1974.5999800,-1087.1999500,24.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1977.0000000,-1067.9000200,23.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1976.0999800,-1061.5999800,23.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1987.4000200,-1068.5000000,23.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1971.0999800,-1081.9000200,24.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1972.4000200,-1117.3000500,24.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1957.8000500,-1132.0000000,24.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1963.5000000,-1133.5999800,24.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1951.9000200,-1136.9000200,24.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1956.1999500,-1140.5999800,24.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1948.3000500,-1140.6999500,24.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1970.0000000,-1143.6999500,24.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1973.0000000,-1146.5999800,24.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1975.6999500,-1142.4000200,24.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1984.4000200,-1135.9000200,24.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1977.6999500,-1134.5000000,24.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,1999.4000200,-1140.4000200,24.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2004.1999500,-1138.9000200,24.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2000.3000500,-1135.5999800,24.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2016.5999800,-1134.0999800,23.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2012.0000000,-1130.5999800,24.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2040.8000500,-1133.5000000,23.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2038.8000500,-1137.1999500,23.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2040.9000200,-1140.1999500,23.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2047.5000000,-1141.1999500,23.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(3920,2047.1000000,-1271.3000000,25.4000000,0.0000000,0.0000000,0.0000000); //object(lib_veg3) (1)
	CreateDynamicObject(3920,2034.5000000,-1271.1000000,25.4000000,0.0000000,0.0000000,0.0000000); //object(lib_veg3) (2)
	CreateDynamicObject(3920,2023.2000000,-1277.6000000,25.5000000,0.0000000,0.0000000,90.0000000); //object(lib_veg3) (3)
	CreateDynamicObject(3594,2644.4000000,-1619.0000000,10.4000000,0.0000000,0.0000000,159.9900000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2642.9000000,-1599.8000000,11.7000000,350.0000000,0.0000000,159.9880000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2642.4000000,-1581.3000000,14.9000000,349.9970000,0.0000000,209.9880000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2645.5000000,-1540.7000000,22.3000000,349.9920000,0.0000000,169.9870000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2640.3000000,-1514.1000000,27.0000000,349.9920000,0.0000000,219.9860000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2650.8000000,-1503.1000000,29.0000000,351.5550000,352.9230000,148.9400000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2641.2000000,-1485.6000000,29.8000000,0.0000000,0.0000000,129.9900000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2649.7000000,-1463.6000000,29.9000000,0.0000000,0.0000000,189.9850000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2639.0000000,-1450.2000000,29.8000000,0.0000000,0.0000000,189.9810000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2646.9000000,-1410.8000000,29.8000000,0.0000000,0.0000000,139.9810000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2669.0000000,-1404.2000000,29.8000000,0.0000000,0.0000000,59.9770000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2674.9000000,-1435.9000000,30.0000000,0.0000000,0.0000000,359.9740000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2679.6000000,-1450.8000000,30.0000000,0.0000000,0.0000000,359.9730000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2678.4000000,-1488.1000000,30.0000000,0.0000000,0.0000000,49.9730000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2698.2000000,-1506.9000000,30.0000000,0.0000000,0.0000000,149.9710000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2721.1000000,-1515.3000000,29.7000000,0.0000000,0.0000000,79.9690000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2728.2000000,-1514.0000000,29.7000000,0.0000000,0.0000000,149.9640000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2734.5000000,-1515.3000000,29.7000000,0.0000000,0.0000000,109.9630000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2738.4000000,-1511.2000000,29.7000000,0.0000000,0.0000000,69.9620000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2730.3000000,-1482.4000000,29.7000000,0.0000000,0.0000000,179.9610000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2730.1000000,-1469.1000000,29.9000000,0.0000000,0.0000000,199.9560000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2730.3000000,-1461.0000000,29.9000000,0.0000000,0.0000000,159.9510000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2740.0000000,-1455.6000000,29.9000000,0.0000000,0.0000000,9.9500000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2738.2000000,-1460.3000000,29.9000000,0.0000000,0.0000000,49.9480000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2725.5000000,-1447.5000000,29.9000000,0.0000000,0.0000000,189.9440000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2719.7000000,-1461.9000000,29.9000000,0.0000000,0.0000000,359.9430000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2724.7000000,-1425.6000000,30.6000000,12.7010000,354.8740000,21.0720000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2722.1000000,-1405.4000000,34.4000000,10.4420000,6.0970000,328.8320000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2722.0000000,-1336.8000000,46.7000000,10.4950000,359.9910000,1.9410000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2718.8000000,-1330.8000000,47.8000000,9.2190000,355.9370000,32.5890000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2722.3000000,-1297.5000000,53.8000000,9.2180000,355.9350000,32.5850000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2723.8000000,-1272.4000000,58.2000000,9.2180000,355.9350000,12.5850000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2737.4000000,-1265.9000000,59.2000000,0.0000000,0.0000000,269.9560000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2744.6000000,-1262.3000000,59.1000000,0.0000000,0.0000000,319.9560000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2744.0000000,-1255.6000000,59.2000000,0.0000000,0.0000000,9.9550000); //object(la_fuckcar1)(21)
	CreateDynamicObject(3594,2507.6000000,-1265.2000000,34.3000000,0.0000000,0.0000000,201.9160000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2516.4000000,-1277.3000000,34.3000000,0.0000000,0.0000000,21.9120000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2512.3000000,-1303.7000000,34.3000000,0.0000000,0.0000000,341.9070000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2510.7000000,-1326.9000000,32.3000000,7.4910000,2.7740000,341.5440000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2511.5000000,-1345.3000000,29.4000000,8.9330000,353.1620000,32.9710000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2448.2000000,-1262.6000000,23.4000000,0.0000000,0.0000000,141.9160000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2510.2000000,-1409.4000000,27.9000000,0.0000000,0.0000000,161.9100000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2505.4000000,-1439.2000000,27.9000000,0.0000000,0.0000000,301.9060000); //object(la_fuckcar1)(7)
	CreateDynamicObject(4509,2858.0000000,-1137.2000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(cuntw_roadblock05ld) (1)
	CreateDynamicObject(4509,2380.7000000,-1154.7000000,29.3000000,0.0000000,0.0000000,180.0000000); //object(cuntw_roadblock05ld) (2)
	CreateDynamicObject(3594,2467.1000000,-1255.6000000,24.9000000,16.5000000,0.0000000,271.9120000); //object(la_fuckcar1)(7)
	CreateDynamicObject(3594,2492.3000000,-1255.4000000,32.0000000,348.4530000,343.9160000,38.6030000); //object(la_fuckcar1)(7)
	CreateDynamicObject(761,2500.8000000,-1440.5000000,27.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2514.0000000,-1438.6000000,27.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2519.4000000,-1442.3000000,27.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2512.8000000,-1408.4000000,27.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2507.6000000,-1410.8000000,27.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2508.7000000,-1345.5000000,29.0000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2512.9000000,-1349.4000000,28.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2512.6000000,-1343.3000000,29.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2513.4000000,-1325.6000000,32.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2507.5000000,-1328.1000000,31.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2510.6000000,-1322.4000000,32.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2515.2000000,-1302.7000000,33.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2509.8000000,-1304.1000000,33.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2513.0000000,-1307.7000000,33.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2514.0000000,-1277.2000000,33.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2516.3000000,-1282.2000000,33.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2518.8000000,-1277.2000000,33.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2508.4000000,-1261.8000000,33.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2493.3000000,-1259.8000000,31.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2493.6000000,-1253.6000000,31.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2471.1000000,-1257.5000000,25.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2465.8000000,-1253.9000000,24.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2740.9000000,-1264.7000000,58.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2733.1000000,-1266.5000000,58.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2742.0000000,-1254.4000000,58.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2725.6000000,-1270.4000000,58.2000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2722.0000000,-1274.0000000,57.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2723.0000000,-1294.2000000,53.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2721.5000000,-1300.1000000,52.8000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2720.0000000,-1334.8000000,46.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2718.8000000,-1326.5000000,48.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2721.8000000,-1401.9000000,34.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2718.8000000,-1406.5000000,33.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2726.5000000,-1424.0000000,30.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2723.4000000,-1446.1000000,29.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2741.2000000,-1459.8000000,29.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2736.2000000,-1455.8000000,29.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2731.0000000,-1465.0000000,29.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2717.6000000,-1458.0000000,29.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2721.5000000,-1464.5000000,29.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2725.4000000,-1515.8000000,29.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2716.9000000,-1515.0000000,29.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2729.3000000,-1510.0000000,29.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2732.6000000,-1514.0000000,29.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2741.2000000,-1510.1000000,29.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2738.4000000,-1513.8000000,29.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2732.7000000,-1485.4000000,29.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2728.5000000,-1480.9000000,29.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2699.2000000,-1509.3000000,29.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2698.3000000,-1503.1000000,29.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2681.5000000,-1488.6000000,29.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2677.5000000,-1452.8000000,29.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2676.9000000,-1438.5000000,29.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2681.7000000,-1447.8000000,29.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2667.0000000,-1405.6000000,29.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2673.2000000,-1405.5000000,29.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2648.1000000,-1412.7000000,29.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2650.5000000,-1404.5000000,29.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2650.0000000,-1395.1000000,29.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2640.8000000,-1447.6000000,29.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2636.6000000,-1451.4000000,29.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2647.5000000,-1465.1000000,29.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2639.6000000,-1484.6000000,29.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2644.6000000,-1482.9000000,29.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2648.2000000,-1501.9000000,28.9000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2642.9000000,-1514.9000000,26.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2638.2000000,-1510.0000000,27.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2644.0000000,-1538.5000000,22.1000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2646.9000000,-1542.6000000,21.4000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2644.8000000,-1581.6000000,14.3000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2639.2000000,-1579.5000000,14.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2641.5000000,-1597.3000000,11.6000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2643.6000000,-1602.8000000,10.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2645.1000000,-1615.2000000,9.7000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(761,2579.6000000,-1643.8000000,1.5000000,0.0000000,0.0000000,0.0000000); //object(sm_drybrush_sm1)(67)
	CreateDynamicObject(1413,2667.8000000,-1445.8000000,30.7000000,0.0000000,0.0000000,84.5000000); //object(dyn_mesh_3) (1)
	CreateDynamicObject(1413,2668.2000000,-1440.6000000,30.7000000,0.0000000,0.0000000,86.4960000); //object(dyn_mesh_3) (2)
	CreateDynamicObject(1413,2668.3000000,-1435.3000000,30.7000000,0.0000000,0.0000000,90.4950000); //object(dyn_mesh_3) (3)
	CreateDynamicObject(1413,2668.1000000,-1430.0000000,30.6000000,0.0000000,0.0000000,94.7440000); //object(dyn_mesh_3) (4)
	CreateDynamicObject(1413,2667.6000000,-1424.8000000,30.6000000,0.0000000,0.0000000,94.4930000); //object(dyn_mesh_3) (5)
	CreateDynamicObject(1413,2666.7000000,-1419.6000000,30.6000000,0.0000000,0.0000000,104.4930000); //object(dyn_mesh_3) (6)
	CreateDynamicObject(1413,2663.9000000,-1415.6000000,30.6000000,0.0000000,0.0000000,146.4910000); //object(dyn_mesh_3) (7)
	CreateDynamicObject(1413,2655.2000000,-1413.9000000,30.6000000,0.0000000,0.0000000,190.4860000); //object(dyn_mesh_3) (8)
	CreateDynamicObject(1413,2652.7000000,-1417.0000000,30.6000000,0.0000000,0.0000000,270.4810000); //object(dyn_mesh_3) (9)
	CreateDynamicObject(1413,2652.7000000,-1422.1000000,30.6000000,0.0000000,0.0000000,270.4780000); //object(dyn_mesh_3) (10)
	CreateDynamicObject(1413,2652.7000000,-1427.2000000,30.6000000,0.0000000,0.0000000,270.4780000); //object(dyn_mesh_3) (11)
	CreateDynamicObject(1413,2652.7000000,-1432.3000000,30.6000000,0.0000000,0.0000000,270.4780000); //object(dyn_mesh_3) (12)
	CreateDynamicObject(1413,2652.7000000,-1437.4000000,30.6000000,0.0000000,0.0000000,270.4780000); //object(dyn_mesh_3) (13)
	CreateDynamicObject(1413,2652.7000000,-1442.4000000,30.6000000,0.0000000,0.0000000,270.4780000); //object(dyn_mesh_3) (14)
	CreateDynamicObject(1413,2652.7000000,-1447.4000000,30.6000000,0.0000000,0.0000000,270.4780000); //object(dyn_mesh_3) (15)
	CreateDynamicObject(1424,2656.7000000,-1411.4000000,30.0000000,0.0000000,0.0000000,40.0000000); //object(dyn_roadbarrier_2) (1)
	CreateDynamicObject(1424,2659.0000000,-1410.3000000,30.0000000,0.0000000,0.0000000,339.9960000); //object(dyn_roadbarrier_2) (2)
	CreateDynamicObject(1424,2662.3000000,-1411.5000000,30.0000000,0.0000000,0.0000000,109.9940000); //object(dyn_roadbarrier_2) (3)
	CreateDynamicObject(1424,2664.6000000,-1414.0000000,30.0000000,0.0000000,0.0000000,169.9900000); //object(dyn_roadbarrier_2) (4)
	CreateDynamicObject(1451,2664.3000000,-1418.3000000,30.3000000,0.0000000,0.0000000,300.0000000); //object(dyn_coup) (1)
	CreateDynamicObject(1452,2661.8000000,-1415.6000000,30.5000000,0.0000000,0.0000000,260.0000000); //object(dyn_outhouse) (1)
	CreateDynamicObject(1457,2655.2000000,-1420.9000000,30.9000000,0.0000000,0.0000000,90.0000000); //object(dyn_outhouse_2) (1)
	CreateDynamicObject(1457,2655.0000000,-1426.9000000,30.9000000,0.0000000,0.0000000,90.0000000); //object(dyn_outhouse_2) (2)
	CreateDynamicObject(1457,2655.3000000,-1432.7000000,30.9000000,0.0000000,0.0000000,90.0000000); //object(dyn_outhouse_2) (3)
	CreateDynamicObject(1457,2655.5000000,-1438.7000000,31.0000000,0.0000000,0.0000000,90.0000000); //object(dyn_outhouse_2) (4)
	CreateDynamicObject(1457,2665.3000000,-1440.3000000,30.9000000,0.0000000,0.0000000,220.0000000); //object(dyn_outhouse_2) (5)
	CreateDynamicObject(1457,2666.0000000,-1433.2000000,30.9000000,0.0000000,0.0000000,267.9960000); //object(dyn_outhouse_2) (6)
	CreateDynamicObject(1457,2665.3000000,-1426.3000000,30.9000000,0.0000000,0.0000000,275.9950000); //object(dyn_outhouse_2) (7)
	CreateDynamicObject(1458,2655.0000000,-1416.0000000,29.7000000,0.0000000,0.0000000,70.0000000); //object(dyn_cart) (1)
	CreateDynamicObject(1458,2665.7000000,-1422.6000000,29.7000000,0.0000000,0.0000000,169.9990000); //object(dyn_cart) (2)
	CreateDynamicObject(3252,2654.7000000,-1443.5000000,29.3000000,0.0000000,0.0000000,0.0000000); //object(des_oldwattwr_) (1)
	CreateDynamicObject(920,2663.6000000,-1423.4000000,29.9000000,0.0000000,0.0000000,230.0000000); //object(y_generator) (1)
	CreateDynamicObject(920,2656.8000000,-1430.5000000,29.9000000,0.0000000,0.0000000,149.9990000); //object(y_generator) (2)
	CreateDynamicObject(920,2658.5000000,-1441.0000000,29.9000000,0.0000000,0.0000000,171.9960000); //object(y_generator) (3)
	CreateDynamicObject(920,2667.1000000,-1435.7000000,29.9000000,0.0000000,0.0000000,303.9910000); //object(y_generator) (4)
	CreateDynamicObject(3529,2662.0000000,-1414.2000000,30.8000000,0.0000000,0.0000000,358.0000000); //object(vgsn_constrbeam) (1)
	CreateDynamicObject(3529,2657.9000000,-1414.1000000,30.8000000,0.0000000,0.0000000,0.0000000); //object(vgsn_constrbeam) (2)
	CreateDynamicObject(1646,2654.7000000,-1421.8000000,29.7000000,0.0000000,0.0000000,90.0000000); //object(lounge_towel_up) (1)
	CreateDynamicObject(1646,2654.6000000,-1433.6000000,29.7000000,0.0000000,0.0000000,90.0000000); //object(lounge_towel_up) (2)
	CreateDynamicObject(1646,2666.5000000,-1432.4000000,29.7000000,0.0000000,0.0000000,270.0000000); //object(lounge_towel_up) (3)
	CreateDynamicObject(1646,2665.8000000,-1427.3000000,29.7000000,0.0000000,0.0000000,270.0000000); //object(lounge_towel_up) (4)
	CreateDynamicObject(1645,2654.8000000,-1427.8000000,29.8000000,0.0000000,0.0000000,92.0000000); //object(lounge_wood_up) (1)
	CreateDynamicObject(1645,2655.1000000,-1437.7000000,29.8000000,0.0000000,0.0000000,92.0000000); //object(lounge_wood_up) (2)
	CreateDynamicObject(1645,2666.3000000,-1440.0000000,29.8000000,0.0000000,0.0000000,222.0000000); //object(lounge_wood_up) (3)
	CreateDynamicObject(2968,2653.9000000,-1419.7000000,29.8000000,0.0000000,0.0000000,0.0000000); //object(cm_box) (1)
	CreateDynamicObject(2968,2654.0000000,-1425.9000000,29.8000000,0.0000000,0.0000000,0.0000000); //object(cm_box) (2)
	CreateDynamicObject(2968,2653.8000000,-1427.0000000,29.8000000,0.0000000,0.0000000,50.0000000); //object(cm_box) (3)
	CreateDynamicObject(2968,2654.4000000,-1432.0000000,29.8000000,0.0000000,0.0000000,49.9990000); //object(cm_box) (4)
	CreateDynamicObject(2968,2656.4000000,-1433.6000000,29.8000000,0.0000000,0.0000000,169.9990000); //object(cm_box) (5)
	CreateDynamicObject(2968,2656.4000000,-1439.6000000,29.8000000,0.0000000,0.0000000,169.9970000); //object(cm_box) (6)
	CreateDynamicObject(2968,2654.1000000,-1438.5000000,29.8000000,0.0000000,0.0000000,89.9970000); //object(cm_box) (7)
	CreateDynamicObject(2968,2665.4000000,-1441.9000000,29.8000000,0.0000000,0.0000000,89.9950000); //object(cm_box) (8)
	CreateDynamicObject(2968,2666.3000000,-1441.5000000,29.8000000,0.0000000,0.0000000,49.9950000); //object(cm_box) (9)
	CreateDynamicObject(2968,2667.4000000,-1434.4000000,29.8000000,0.0000000,0.0000000,49.9930000); //object(cm_box) (10)
	CreateDynamicObject(2968,2666.3000000,-1425.2000000,29.8000000,0.0000000,0.0000000,149.9930000); //object(cm_box) (11)
	CreateDynamicObject(2968,2664.0000000,-1419.2000000,29.8000000,0.0000000,0.0000000,149.9910000); //object(cm_box) (12)
	CreateDynamicObject(2971,2664.8000000,-1421.0000000,29.5000000,0.0000000,0.0000000,0.0000000); //object(k_smashboxes) (1)
	CreateDynamicObject(2971,2655.4000000,-1417.9000000,29.5000000,0.0000000,0.0000000,50.0000000); //object(k_smashboxes) (2)
	CreateDynamicObject(1441,2655.3000000,-1422.9000000,30.1000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile_4) (1)
	CreateDynamicObject(1441,2655.0000000,-1434.8000000,30.1000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile_4) (2)
	CreateDynamicObject(1439,2665.2000000,-1428.6000000,29.5000000,0.0000000,0.0000000,0.0000000); //object(dyn_dumpster_1) (1)
	CreateDynamicObject(1438,2664.8000000,-1436.1000000,29.5000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile_2) (1)
	CreateDynamicObject(1369,2663.0000000,-1417.6000000,30.1000000,0.0000000,0.0000000,330.0000000); //object(cj_wheelchair1) (1)
	CreateDynamicObject(1369,2655.3000000,-1440.9000000,30.1000000,0.0000000,0.0000000,99.9960000); //object(cj_wheelchair1) (2)
	CreateDynamicObject(1349,2659.7000000,-1420.8000000,30.0000000,0.0000000,0.0000000,0.0000000); //object(cj_shtrolly) (1)
	CreateDynamicObject(1349,2661.2000000,-1420.4000000,30.0000000,0.0000000,0.0000000,100.0000000); //object(cj_shtrolly) (2)
	CreateDynamicObject(1349,2662.9000000,-1419.5000000,30.0000000,0.0000000,0.0000000,179.9980000); //object(cj_shtrolly) (3)
	CreateDynamicObject(2675,2659.6000000,-1418.4000000,29.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_6) (1)
	CreateDynamicObject(2675,2663.3000000,-1429.9000000,29.6000000,0.0000000,0.0000000,64.0000000); //object(proc_rubbish_6) (2)
	CreateDynamicObject(2675,2657.9000000,-1434.3000000,29.6000000,0.0000000,0.0000000,343.9950000); //object(proc_rubbish_6) (3)
	CreateDynamicObject(2675,2663.0000000,-1437.9000000,29.7000000,0.0000000,0.0000000,33.9930000); //object(proc_rubbish_6) (4)
	CreateDynamicObject(18249,2687.9000000,-1431.8000000,26.0000000,0.0000000,0.0000000,0.0000000); //object(cuntwjunk05) (1)
	CreateDynamicObject(18249,2687.1000000,-1452.8000000,26.0000000,0.0000000,0.0000000,354.0000000); //object(cuntwjunk05) (2)
	CreateDynamicObject(926,2656.4000000,-1418.8000000,29.6000000,0.0000000,0.0000000,0.0000000); //object(rubbish_box2) (1)
	CreateDynamicObject(926,2655.7000000,-1416.2000000,29.6000000,0.0000000,0.0000000,0.0000000); //object(rubbish_box2) (2)
	CreateDynamicObject(926,2655.9000000,-1430.3000000,29.7000000,0.0000000,0.0000000,0.0000000); //object(rubbish_box2) (3)
	CreateDynamicObject(926,2656.2000000,-1435.8000000,29.7000000,0.0000000,0.0000000,0.0000000); //object(rubbish_box2) (4)
	CreateDynamicObject(926,2659.7000000,-1440.8000000,29.7000000,0.0000000,0.0000000,0.0000000); //object(rubbish_box2) (5)
	CreateDynamicObject(926,2663.4000000,-1436.1000000,29.8000000,0.0000000,0.0000000,0.0000000); //object(rubbish_box2) (6)
	CreateDynamicObject(853,2662.3000000,-1421.1000000,29.9000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_5) (1)
	CreateDynamicObject(802,2657.8000000,-1412.5000000,29.9000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush08) (1)
	CreateDynamicObject(806,2667.4000000,-1430.7000000,33.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass) (1)
	CreateDynamicObject(806,2662.8000000,-1440.9000000,33.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass) (2)
	CreateDynamicObject(806,2653.6000000,-1436.0000000,32.9000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass) (3)
	CreateDynamicObject(819,2653.6000000,-1410.2000000,29.6000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass03) (1)
	CreateDynamicObject(855,2650.3000000,-1444.7000000,29.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (1)
	CreateDynamicObject(855,2650.8000000,-1382.6000000,29.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (2)
	CreateDynamicObject(855,2637.1000000,-1378.6000000,29.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (3)
	CreateDynamicObject(855,2643.3000000,-1412.7000000,29.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (4)
	CreateDynamicObject(855,2677.3000000,-1485.3000000,29.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (5)
	CreateDynamicObject(855,2723.4000000,-1511.9000000,29.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (6)
	CreateDynamicObject(855,2743.6000000,-1506.0000000,29.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (7)
	CreateDynamicObject(855,2734.4000000,-1466.2000000,29.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (8)
	CreateDynamicObject(855,2722.0000000,-1443.9000000,29.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (9)
	CreateDynamicObject(855,2726.5000000,-1266.0000000,58.6000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (10)
	CreateDynamicObject(855,2742.5000000,-1260.2000000,58.6000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (11)
	CreateDynamicObject(855,2651.9000000,-1263.9000000,49.0000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (12)
	CreateDynamicObject(855,2564.1000000,-1281.0000000,45.1000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (13)
	CreateDynamicObject(855,2527.0000000,-1470.3000000,23.0000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (14)
	CreateDynamicObject(855,2509.1000000,-1433.2000000,27.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,2514.7000000,-1501.9000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (16)
	CreateDynamicObject(855,2485.3000000,-1506.5000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (17)
	CreateDynamicObject(855,2409.5000000,-1516.3000000,23.0000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (18)
	CreateDynamicObject(855,2342.5000000,-1524.9000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (19)
	CreateDynamicObject(855,2289.3000000,-1480.5000000,21.9000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (20)
	CreateDynamicObject(855,2210.9000000,-1413.3000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (21)
	CreateDynamicObject(855,2159.7000000,-1381.6000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (22)
	CreateDynamicObject(855,2165.8000000,-1311.9000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (23)
	CreateDynamicObject(855,2175.1000000,-1234.8000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (24)
	CreateDynamicObject(16092,2154.2000000,-2873.3000000,0.3000000,0.0000000,0.0000000,0.0000000); //object(des_pipestrut05) (1)
	CreateDynamicObject(16092,2130.5000000,-2881.2000000,0.3000000,0.0000000,0.0000000,92.0000000); //object(des_pipestrut05) (2)
	CreateDynamicObject(16092,2129.3000000,-2867.7000000,0.3000000,0.0000000,0.0000000,92.0000000); //object(des_pipestrut05) (3)
	CreateDynamicObject(3115,2128.3000000,-2875.1000000,8.4000000,0.0000000,0.0000000,0.0000000); //object(carrier_lift1_sfse) (1)
	CreateDynamicObject(3115,2149.0000000,-2875.2000000,8.4000000,0.0000000,0.0000000,0.0000000); //object(carrier_lift1_sfse) (2)
	CreateDynamicObject(16342,2154.7000000,-2870.7000000,12.0000000,0.0000000,0.0000000,0.0000000); //object(dam_genturbine04) (1)
	CreateDynamicObject(3643,2152.4000000,-2882.5000000,14.6000000,0.0000000,0.0000000,90.0000000); //object(la_chem_piping) (1)
	CreateDynamicObject(3427,2144.4000000,-2874.0000000,8.7000000,0.0000000,0.0000000,90.0000000); //object(derrick01) (2)
	CreateDynamicObject(3259,2121.4000000,-2869.2000000,8.7000000,0.0000000,0.0000000,0.0000000); //object(refcondens1) (1)
	CreateDynamicObject(3258,2156.7000000,-2877.9000000,8.7000000,0.0000000,0.0000000,0.0000000); //object(refthinchim1) (1)
	CreateDynamicObject(1689,2122.3000000,-2882.5000000,9.5000000,0.0000000,0.0000000,0.0000000); //object(gen_roofbit3) (1)
	CreateDynamicObject(934,2119.0000000,-2876.2000000,10.0000000,0.0000000,0.0000000,0.0000000); //object(generator_big) (1)
	CreateDynamicObject(934,2147.7000000,-2867.4000000,10.0000000,0.0000000,0.0000000,90.0000000); //object(generator_big) (2)
	CreateDynamicObject(16092,2129.1000000,-2851.8000000,0.3000000,0.0000000,0.0000000,90.0000000); //object(des_pipestrut05) (5)
	CreateDynamicObject(16092,2147.2000000,-2851.2000000,0.3000000,0.0000000,0.0000000,89.9950000); //object(des_pipestrut05) (6)
	CreateDynamicObject(3115,2149.0000000,-2856.4000000,8.4000000,0.0000000,0.0000000,0.0000000); //object(carrier_lift1_sfse) (4)
	CreateDynamicObject(3115,2128.3000000,-2856.3000000,8.4000000,0.0000000,0.0000000,0.0000000); //object(carrier_lift1_sfse) (5)
	CreateDynamicObject(3673,2130.0000000,-2853.1000000,32.7000000,0.0000000,0.0000000,0.0000000); //object(laxrf_refinerybase) (2)
	CreateDynamicObject(929,2142.4000000,-2856.7000000,9.7000000,0.0000000,0.0000000,0.0000000); //object(generator) (1)
	CreateDynamicObject(942,2156.0000000,-2864.1000000,11.2000000,0.0000000,0.0000000,0.0000000); //object(cj_df_unit_2) (1)
	CreateDynamicObject(17055,2149.2000000,-2862.2000000,10.9000000,0.0000000,0.0000000,0.0000000); //object(cw_fueldrum03) (1)
	CreateDynamicObject(925,2119.6000000,-2864.2000000,9.8000000,0.0000000,0.0000000,90.0000000); //object(rack2) (1)
	CreateDynamicObject(925,2119.6000000,-2861.6000000,9.8000000,0.0000000,0.0000000,90.0000000); //object(rack2) (2)
	CreateDynamicObject(925,2122.5000000,-2859.5000000,9.8000000,0.0000000,0.0000000,0.0000000); //object(rack2) (3)
	CreateDynamicObject(930,2124.7000000,-2859.2000000,9.2000000,0.0000000,0.0000000,0.0000000); //object(o2_bottles) (1)
	CreateDynamicObject(930,2124.0000000,-2865.7000000,9.2000000,0.0000000,0.0000000,0.0000000); //object(o2_bottles) (2)
	CreateDynamicObject(2669,2156.2000000,-2849.2000000,10.1000000,0.0000000,0.0000000,270.0000000); //object(cj_chris_crate) (1)
	CreateDynamicObject(2669,2156.2000000,-2853.0000000,10.1000000,0.0000000,0.0000000,270.0000000); //object(cj_chris_crate) (2)
	CreateDynamicObject(3577,2157.4000000,-2856.4000000,9.5000000,0.0000000,0.0000000,0.0000000); //object(dockcrates1_la) (1)
	CreateDynamicObject(16601,2128.4000000,-2881.9000000,13.5000000,0.0000000,0.0000000,0.0000000); //object(by_fuel07) (1)
	CreateDynamicObject(5816,2146.9000000,-2845.6000000,5.1000000,0.0000000,0.0000000,0.0000000); //object(odrampbit) (1)
	CreateDynamicObject(1411,2140.3000000,-2847.3000000,10.3000000,0.0000000,0.0000000,180.0000000); //object(dyn_mesh_1) (1)
	CreateDynamicObject(1411,2148.6000000,-2847.4000000,10.3000000,0.0000000,0.0000000,179.9950000); //object(dyn_mesh_1) (2)
	CreateDynamicObject(1411,2154.0000000,-2847.4000000,10.3000000,0.0000000,0.0000000,179.9950000); //object(dyn_mesh_1) (3)
	CreateDynamicObject(1411,2159.1000000,-2849.8000000,10.2000000,0.0000000,0.0000000,89.9950000); //object(dyn_mesh_1) (4)
	CreateDynamicObject(1411,2159.1000000,-2855.2000000,10.2000000,0.0000000,0.0000000,89.9950000); //object(dyn_mesh_1) (5)
	CreateDynamicObject(1411,2159.0000000,-2860.5000000,10.2000000,0.0000000,0.0000000,89.9950000); //object(dyn_mesh_1) (6)
	CreateDynamicObject(1411,2159.0000000,-2865.9000000,10.2000000,0.0000000,0.0000000,89.9950000); //object(dyn_mesh_1) (7)
	CreateDynamicObject(1411,2159.0000000,-2871.3000000,10.2000000,0.0000000,0.0000000,89.9950000); //object(dyn_mesh_1) (8)
	CreateDynamicObject(1411,2159.0000000,-2876.7000000,10.2000000,0.0000000,0.0000000,89.9950000); //object(dyn_mesh_1) (9)
	CreateDynamicObject(1411,2158.9000000,-2881.9000000,10.2000000,0.0000000,0.0000000,89.9950000); //object(dyn_mesh_1) (10)
	CreateDynamicObject(1411,2156.1000000,-2884.2000000,10.1000000,0.0000000,0.0000000,359.9950000); //object(dyn_mesh_1) (11)
	CreateDynamicObject(1411,2150.8000000,-2884.3000000,10.1000000,0.0000000,0.0000000,359.9890000); //object(dyn_mesh_1) (12)
	CreateDynamicObject(1411,2145.5000000,-2884.3000000,10.1000000,0.0000000,0.0000000,359.9890000); //object(dyn_mesh_1) (13)
	CreateDynamicObject(1411,2140.1000000,-2884.2000000,10.1000000,0.0000000,0.0000000,359.9890000); //object(dyn_mesh_1) (14)
	CreateDynamicObject(1411,2134.7000000,-2884.1000000,10.1000000,0.0000000,0.0000000,359.9890000); //object(dyn_mesh_1) (15)
	CreateDynamicObject(1411,2129.4000000,-2884.1000000,10.1000000,0.0000000,0.0000000,359.9890000); //object(dyn_mesh_1) (16)
	CreateDynamicObject(1411,2124.1000000,-2884.1000000,10.1000000,0.0000000,0.0000000,359.9890000); //object(dyn_mesh_1) (17)
	CreateDynamicObject(1411,2118.1000000,-2881.6000000,10.1000000,0.0000000,0.0000000,269.9890000); //object(dyn_mesh_1) (18)
	CreateDynamicObject(1411,2118.1000000,-2873.6000000,10.1000000,0.0000000,0.0000000,269.9890000); //object(dyn_mesh_1) (19)
	CreateDynamicObject(1411,2118.1000000,-2867.8000000,10.1000000,0.0000000,0.0000000,269.9890000); //object(dyn_mesh_1) (20)
	CreateDynamicObject(1424,2122.1000000,-2882.8000000,9.3000000,0.0000000,0.0000000,0.0000000); //object(dyn_roadbarrier_2) (5)
	CreateDynamicObject(1424,2119.9000000,-2879.3000000,9.3000000,0.0000000,0.0000000,50.0000000); //object(dyn_roadbarrier_2) (6)
	CreateDynamicObject(1424,2121.3000000,-2874.0000000,9.3000000,0.0000000,0.0000000,109.9990000); //object(dyn_roadbarrier_2) (7)
	CreateDynamicObject(1436,2136.9000000,-2880.9000000,10.3000000,0.0000000,0.0000000,0.0000000); //object(dyn_scaffold_2) (1)
	CreateDynamicObject(1436,2140.7000000,-2881.5000000,10.3000000,0.0000000,0.0000000,40.0000000); //object(dyn_scaffold_2) (2)
	CreateDynamicObject(1464,2154.1000000,-2855.7000000,9.9000000,0.0000000,0.0000000,0.0000000); //object(dyn_scaffold_3) (1)
	CreateDynamicObject(11292,2134.5000000,-2861.1000000,10.2000000,0.0000000,0.0000000,0.0000000); //object(gasstatiohut) (1)
	CreateDynamicObject(1225,2136.1000000,-2875.8000000,9.1000000,0.0000000,0.0000000,0.0000000); //object(barrel4) (4)
	CreateDynamicObject(1225,2132.7000000,-2878.8000000,9.1000000,0.0000000,0.0000000,0.0000000); //object(barrel4) (10)
	CreateDynamicObject(1225,2134.6000000,-2877.5000000,9.1000000,0.0000000,0.0000000,0.0000000); //object(barrel4) (11)
	CreateDynamicObject(1225,2134.6000000,-2875.1000000,9.1000000,0.0000000,0.0000000,0.0000000); //object(barrel4) (12)
	CreateDynamicObject(1225,2133.2000000,-2875.8000000,9.1000000,0.0000000,0.0000000,0.0000000); //object(barrel4) (13)
	CreateDynamicObject(1676,2143.2000000,-2866.8000000,10.3000000,0.0000000,0.0000000,0.0000000); //object(washgaspump) (1)
	CreateDynamicObject(1676,2140.9000000,-2866.9000000,10.3000000,0.0000000,0.0000000,0.0000000); //object(washgaspump) (2)
	CreateDynamicObject(3461,2156.5000000,-2877.8000000,38.8000000,0.0000000,0.0000000,0.0000000); //object(tikitorch01_lvs) (1)
	CreateDynamicObject(855,2512.3000000,-1470.3000000,23.0000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,2513.5000000,-1375.6000000,27.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,2509.7000000,-1375.4000000,27.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,2504.6000000,-1375.7000000,27.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,2519.5000000,-1375.4000000,27.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,2512.1000000,-1370.6000000,27.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,2515.3000000,-1365.7000000,27.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,2517.9000000,-1381.9000000,27.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,2513.7000000,-1297.9000000,33.7000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,2504.3000000,-1260.4000000,33.9000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,2393.8000000,-1254.3000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,2360.3000000,-1300.5000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,2317.3000000,-1303.7000000,23.1000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,2308.3000000,-1265.3000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,2267.9000000,-1255.0000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,2194.1000000,-1218.7000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,2177.7000000,-1164.1000000,23.6000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,2144.5000000,-1104.9000000,24.1000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,2089.6000000,-1095.5000000,23.9000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,2044.4000000,-1143.8000000,23.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,1977.3000000,-1131.5000000,24.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,1977.3000000,-1050.1000000,23.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,1840.9000000,-1173.3000000,22.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,1773.8000000,-1285.1000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,1743.0000000,-1300.6000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,1714.9000000,-1302.8000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,1698.8000000,-1358.1000000,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,1699.4000000,-1323.0000000,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,1713.2000000,-1384.6000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,1717.8000000,-1364.4000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,1708.9000000,-1434.4000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,1687.4000000,-1439.4000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,1642.5000000,-1451.9000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,1659.7000000,-1527.9000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,1660.5000000,-1575.3000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,1581.2000000,-1591.6000000,12.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,1513.7000000,-1608.3000000,13.0000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,1511.1000000,-1628.7000000,13.0000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,1500.2000000,-1660.9000000,13.0000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,1475.7000000,-1654.9000000,13.0000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,1464.1000000,-1629.5000000,13.0000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,1458.7000000,-1624.6000000,13.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(855,1461.6000000,-1610.5000000,13.0000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (15)
	CreateDynamicObject(1447,2397.7385300,-1898.7182600,13.3203000,45.0000000,0.0000000,0.0000000); //convertffs(0)
	CreateDynamicObject(1447,2396.9731400,-1897.7209500,13.0182900,60.0000000,0.0000000,0.0000000); //convertffs(1)
	CreateDynamicObject(2415,2397.7316900,-1899.2678200,11.4325500,0.0000000,0.0000000,0.0000000); //convertffs(2)
	CreateDynamicObject(1810,2402.0456500,-1913.3481400,12.5444000,0.0000000,90.0000000,-28.7400000); //convertffs(3)
	CreateDynamicObject(2635,2401.2507300,-1912.2911400,12.8484900,10.0000000,0.0000000,-92.3400000); //convertffs(4)
	CreateDynamicObject(1810,2401.0874000,-1913.9102800,12.5444000,0.0000000,0.0000000,-104.9400000); //convertffs(5)
	CreateDynamicObject(1810,2401.7009300,-1911.8919700,12.9464000,270.0000000,0.0000000,-104.9400000); //convertffs(6)
	CreateDynamicObject(1810,2403.2883300,-1911.7928500,12.5444000,0.0000000,90.0000000,-103.9800000); //convertffs(7)
	CreateDynamicObject(2635,2403.3142100,-1910.0786100,12.8484900,10.0000000,0.0000000,-202.5000000); //convertffs(8)
	CreateDynamicObject(1810,2402.8335000,-1909.3552200,12.5444000,0.0000000,0.0000000,-162.6000000); //convertffs(9)
	CreateDynamicObject(1810,2401.8884300,-1909.7481700,12.9464000,270.0000000,0.0000000,-164.6400000); //convertffs(10)
	CreateDynamicObject(2635,2400.9936500,-1908.0616500,13.0495000,90.0000000,0.0000000,-275.4000000); //convertffs(11)
	CreateDynamicObject(1810,2401.3562000,-1907.3912400,14.0944000,0.0000000,180.0000000,-104.9400000); //convertffs(12)
	CreateDynamicObject(2415,2399.5793500,-1901.7330300,13.1690100,0.0000000,45.0000000,0.0000000); //convertffs(13)
	CreateDynamicObject(1810,2402.3520500,-1907.7922400,12.9464000,270.0000000,0.0000000,-104.9400000); //convertffs(14)
	CreateDynamicObject(2635,2401.7949200,-1905.7474400,12.1404700,0.0000000,0.0000000,-275.4000000); //convertffs(15)
	CreateDynamicObject(1810,2401.0795900,-1905.6090100,12.5444000,0.0000000,0.0000000,-162.6000000); //convertffs(16)
	CreateDynamicObject(1810,2402.2233900,-1904.8253200,12.5444000,0.0000000,90.0000000,-102.5400000); //convertffs(17)
	CreateDynamicObject(1264,2403.1460000,-1906.5015900,12.9486000,0.0000000,0.0000000,0.0000000); //convertffs(18)
	CreateDynamicObject(1264,2401.2717300,-1912.1286600,13.6617000,0.0000000,-10.0000000,0.0000000); //convertffs(19)
	CreateDynamicObject(1450,2401.2504900,-1901.1074200,13.1506100,0.0000000,0.0000000,88.0800000); //convertffs(20)
	CreateDynamicObject(1349,2401.8164100,-1902.5896000,12.8460600,90.0000000,0.0000000,-28.2600000); //convertffs(21)
	CreateDynamicObject(2635,2403.4638700,-1897.7598900,13.0495000,90.0000000,0.0000000,-374.7000000); //convertffs(22)
	CreateDynamicObject(1810,2402.3068800,-1897.9455600,12.5444000,0.0000000,90.0000000,-102.5400000); //convertffs(23)
	CreateDynamicObject(1810,2402.8505900,-1899.0244100,12.9464000,270.0000000,0.0000000,-104.9400000); //convertffs(24)
	CreateDynamicObject(1230,2401.2507300,-1909.2458500,12.9480600,0.0000000,0.0000000,-35.4000000); //convertffs(25)
	CreateDynamicObject(3461,2390.4250500,-1899.0012200,11.0310400,0.0000000,0.0000000,0.0000000); //convertffs(26)
	CreateDynamicObject(1226,2402.9758300,-1910.0484600,15.2438500,40.1420000,0.0000000,-81.9650000); //convertffs(27)
	CreateDynamicObject(1223,2402.6784700,-1901.3944100,12.5469000,45.0000000,0.0000000,-34.8000000); //convertffs(28)
	CreateDynamicObject(1223,2403.6674800,-1913.1589400,12.2438900,0.0000000,30.0000000,-171.8400000); //convertffs(29)
	CreateDynamicObject(1315,2401.9677700,-1892.0968000,12.7663000,0.1420000,-41.0000000,73.0910000); //convertffs(30)
	CreateDynamicObject(2415,2393.2399900,-1900.6046100,13.1690000,0.0000000,45.0000000,90.0000000); //convertffs(31)
	CreateDynamicObject(2415,2390.1672400,-1900.6097400,13.1690000,0.0000000,45.0000000,90.0000000); //convertffs(32)
	CreateDynamicObject(2415,2387.2226600,-1900.5817900,13.1690000,0.0000000,45.0000000,90.0000000); //convertffs(33)
	CreateDynamicObject(2415,2384.1145000,-1900.6097400,13.1690000,0.0000000,45.0000000,90.0000000); //convertffs(34)
	CreateDynamicObject(2415,2383.5368700,-1900.9808300,13.1690000,0.0000000,45.0000000,180.0000000); //convertffs(35)
	CreateDynamicObject(2415,2383.5637200,-1904.0045200,13.1690000,0.0000000,45.0000000,180.0000000); //convertffs(36)
	CreateDynamicObject(1358,2400.7490200,-1885.3977100,13.7242700,0.0000000,0.0000000,-33.1800000); //convertffs(39)
	CreateDynamicObject(1441,2390.7120000,-1898.2820000,13.1998100,0.0000000,0.0000000,330.6560000); //convertffs(40)
	CreateDynamicObject(3461,2401.2197300,-1909.2666000,11.0310400,0.0000000,0.0000000,0.0000000); //convertffs(41)
	CreateDynamicObject(1217,2391.5460000,-1892.8460000,12.7821200,0.0000000,0.0000000,0.0000000); //convertffs(44)
	CreateDynamicObject(1217,2395.2526900,-1891.4604500,12.7821200,0.0000000,0.0000000,0.0000000); //convertffs(45)
	CreateDynamicObject(1217,2388.8325200,-1891.6009500,12.7821200,0.0000000,0.0000000,0.0000000); //convertffs(46)
	CreateDynamicObject(1217,2385.3015100,-1896.0238000,12.7821200,0.0000000,0.0000000,0.0000000); //convertffs(47)
	CreateDynamicObject(1447,2391.5483400,-1891.3713400,12.7172900,60.0000000,0.0000000,-25.0200000); //convertffs(48)
	CreateDynamicObject(1440,2396.7402300,-1891.3864700,12.7782800,0.0000000,0.0000000,-26.6400000); //convertffs(49)
	CreateDynamicObject(910,2400.8527800,-1893.6320800,12.8865900,270.0000000,0.0000000,-48.3600000); //convertffs(50)
	CreateDynamicObject(1441,2403.0969200,-1893.0987500,12.9988100,0.0000000,0.0000000,-29.3400000); //convertffs(51)
	CreateDynamicObject(3461,2400.8022500,-1894.0579800,11.0310400,0.0000000,0.0000000,0.0000000); //convertffs(52)
	CreateDynamicObject(3594,2370.5040000,-1927.2050000,12.6795200,0.0000000,0.0000000,0.0000000); //convertffs(53)
	CreateDynamicObject(3593,2383.5690900,-1927.8115200,12.7824900,0.0000000,0.0000000,18.9000000); //convertffs(55)
	CreateDynamicObject(3594,2392.7040000,-1926.6420000,12.6795200,0.0000000,0.0000000,339.0550000); //convertffs(56)
	CreateDynamicObject(3594,2384.4218800,-1888.9127200,12.6795200,0.0000000,0.0000000,-86.0400000); //convertffs(57)
	CreateDynamicObject(3593,2380.8000000,-1894.4000000,12.8000000,0.0000000,0.0000000,300.6570000); //convertffs(58)
	CreateDynamicObject(2675,2401.8344700,-1890.0758100,12.5760100,0.0000000,0.0000000,0.0000000); //convertffs(59)
	CreateDynamicObject(2675,2393.9406700,-1889.5880100,12.5760100,0.0000000,0.0000000,0.0000000); //convertffs(60)
	CreateDynamicObject(2674,2398.2253400,-1890.3468000,12.4767800,0.0000000,0.0000000,0.0000000); //convertffs(61)
	CreateDynamicObject(2674,2392.5180700,-1896.1840800,12.4767800,0.0000000,0.0000000,0.0000000); //convertffs(62)
	CreateDynamicObject(2676,2386.4191900,-1891.6297600,12.5778700,0.0000000,0.0000000,0.0000000); //convertffs(63)
	CreateDynamicObject(2676,2378.8481400,-1889.2188700,12.5778700,0.0000000,0.0000000,0.0000000); //convertffs(64)
	CreateDynamicObject(2674,2379.4436000,-1893.9751000,12.4767800,0.0000000,0.0000000,0.0000000); //convertffs(65)
	CreateDynamicObject(2676,2387.1140100,-1885.3989300,12.6788700,0.0000000,0.0000000,0.0000000); //convertffs(67)
	CreateDynamicObject(2676,2396.0461400,-1885.0848400,12.6788700,0.0000000,0.0000000,0.0000000); //convertffs(68)
	CreateDynamicObject(1447,2407.5742200,-1894.6900600,13.5193000,356.8580000,0.0000000,94.9800000); //convertffs(70)
	CreateDynamicObject(1447,2408.0090000,-1899.9510000,13.5183000,356.8580000,0.0000000,94.9770000); //convertffs(71)
	CreateDynamicObject(1447,2406.6335400,-1904.7412100,13.6203000,356.8580000,0.0000000,53.5800000); //convertffs(72)
	CreateDynamicObject(1447,2405.8815900,-1889.8317900,13.4142600,356.8580000,0.0000000,125.2800000); //convertffs(73)
	CreateDynamicObject(13591,2375.1772500,-1902.7595200,12.5714400,0.0000000,0.0000000,-52.0800000); //convertffs(76)
	CreateDynamicObject(2676,2371.3635300,-1895.7135000,12.5778700,0.0000000,0.0000000,0.0000000); //convertffs(77)
	CreateDynamicObject(2675,2373.9606900,-1892.5048800,12.5760100,0.0000000,0.0000000,0.0000000); //convertffs(78)
	CreateDynamicObject(2675,2374.8608400,-1906.7482900,12.5760100,0.0000000,0.0000000,0.0000000); //convertffs(79)
	CreateDynamicObject(2676,2373.7832000,-1925.0876500,12.5778700,0.0000000,0.0000000,0.0000000); //convertffs(80)
	CreateDynamicObject(1447,2406.0776400,-1931.0324700,13.4132600,356.8580000,0.0000000,66.4800000); //convertffs(85)
	CreateDynamicObject(1447,2385.0266100,-1931.7254600,13.8203000,356.8580000,0.0000000,0.0200000); //convertffs(90)
	CreateDynamicObject(1447,2380.0530000,-1932.7610000,13.8203000,356.8580000,0.0000000,24.9770000); //convertffs(91)
	CreateDynamicObject(1447,2375.1958000,-1932.7429200,13.8203000,356.8580000,0.0000000,-26.1400000); //convertffs(92)
	CreateDynamicObject(1447,2370.2746600,-1931.2453600,13.8203000,356.8580000,0.0000000,-6.4600000); //convertffs(93)
	CreateDynamicObject(1217,2381.6342800,-1901.7032500,12.7821200,0.0000000,0.0000000,0.0000000); //convertffs(97)
	CreateDynamicObject(1439,2381.5788600,-1903.8974600,12.9447000,270.0000000,0.0000000,44.0400000); //convertffs(98)
	CreateDynamicObject(1440,2380.3313000,-1902.1286600,13.0792800,0.0000000,0.0000000,79.0800000); //convertffs(99)
	CreateDynamicObject(2676,2380.9245600,-1906.3245800,12.6788700,0.0000000,0.0000000,-52.8000000); //convertffs(100)
	CreateDynamicObject(1369,2376.9440000,-1893.4350000,12.7754900,0.0000000,90.0000000,298.4380000); //convertffs(101)
	CreateDynamicObject(2674,2375.6013200,-1893.5765400,12.4767800,0.0000000,0.0000000,0.0000000); //convertffs(102)
	CreateDynamicObject(1447,2370.0214800,-1886.7650100,13.8203000,356.8580000,0.0000000,24.9800000); //convertffs(103)
	CreateDynamicObject(1447,2373.4167500,-1887.1646700,13.8203000,356.8580000,0.0000000,-9.7600000); //convertffs(104)
	CreateDynamicObject(1447,2378.4919400,-1886.3172600,13.8203000,356.8580000,0.0000000,29.2400000); //convertffs(105)
	CreateDynamicObject(1447,2383.0959500,-1884.4386000,13.8203000,356.8580000,0.0000000,19.1000000); //convertffs(106)
	CreateDynamicObject(1447,2383.0959500,-1884.4386000,16.1551000,356.8580000,0.0000000,19.1000000); //convertffs(107)
	CreateDynamicObject(1447,2373.4167500,-1887.1646700,16.1551000,356.8580000,0.0000000,-9.7600000); //convertffs(108)
	CreateDynamicObject(13591,2403.5520000,-1923.3820000,12.5714400,0.0000000,0.0000000,280.7390000); //convertffs(109)
	CreateDynamicObject(2676,2399.1743200,-1927.6988500,12.5778700,0.0000000,0.0000000,0.0000000); //convertffs(110)
	CreateDynamicObject(2675,2398.8105500,-1923.6717500,12.4760100,0.0000000,0.0000000,0.0000000); //convertffs(111)
	CreateDynamicObject(2676,2384.4243200,-1918.7961400,12.5778700,0.0000000,0.0000000,0.0000000); //convertffs(112)
	CreateDynamicObject(1217,2375.1311000,-1910.0808100,12.7821200,0.0000000,0.0000000,0.0000000); //convertffs(114)
	CreateDynamicObject(1362,2375.6389200,-1909.3308100,12.7519000,0.0000000,90.0000000,0.0000000); //convertffs(115)
	CreateDynamicObject(1327,2374.0920000,-1909.9540000,12.8874800,0.0000000,44.9950000,0.0000000); //convertffs(116)
	CreateDynamicObject(2676,2375.3808600,-1916.0406500,12.4809000,0.0000000,0.0000000,0.0000000); //convertffs(117)
	CreateDynamicObject(852,2378.8493700,-1917.4763200,12.2717800,0.0000000,0.0000000,0.0000000); //convertffs(118)
	CreateDynamicObject(852,2380.7770000,-1928.2110000,12.2717800,0.0000000,0.0000000,0.0000000); //convertffs(119)
	CreateDynamicObject(852,2387.1337900,-1898.0905800,12.4768200,0.0000000,0.0000000,-57.9600000); //convertffs(120)
	CreateDynamicObject(1462,2389.8322800,-1930.1221900,12.3723300,0.0000000,0.0000000,-197.4600000); //convertffs(121)
	CreateDynamicObject(1358,2391.7902800,-1919.8737800,13.6232700,0.0000000,0.0000000,-33.1800000); //convertffs(122)
	CreateDynamicObject(2676,2394.5659200,-1921.8579100,12.5778700,0.0000000,0.0000000,0.0000000); //convertffs(123)
	CreateDynamicObject(1226,2389.0737300,-1916.6865200,15.2438500,40.1420000,0.0000000,-207.0050000); //convertffs(124)
	CreateDynamicObject(2674,2370.9841300,-1914.0291700,12.4767800,0.0000000,0.0000000,0.0000000); //convertffs(125)
	CreateDynamicObject(2674,2389.2460900,-1926.0824000,12.4767800,0.0000000,0.0000000,0.0000000); //convertffs(126)
	CreateDynamicObject(1447,2376.8957500,-1923.3092000,12.4991400,90.8580000,0.0000000,0.0200000); //convertffs(127)
	CreateDynamicObject(1308,2387.3625500,-1923.8375200,12.4349700,3.1420000,90.0000000,156.7200000); //convertffs(128)
	CreateDynamicObject(1440,2371.7531700,-1921.1978800,12.7762700,0.0000000,0.0000000,79.0800000); //convertffs(129)
	CreateDynamicObject(2674,2371.4162600,-1919.2279100,12.4767800,0.0000000,0.0000000,0.0000000); //convertffs(130)
	CreateDynamicObject(2415,2395.7492700,-1913.2286400,13.1690000,0.0000000,45.0000000,270.0000000); //convertffs(131)
	CreateDynamicObject(3525,2393.6460000,-1924.5542000,12.0227200,0.0000000,0.0000000,0.0000000); //convertffs(132)
	CreateDynamicObject(3525,2391.5429700,-1892.8059100,12.4803600,0.0000000,0.0000000,0.0000000); //convertffs(133)
	CreateDynamicObject(3525,2375.1247600,-1903.6106000,12.2793600,0.0000000,0.0000000,0.0000000); //convertffs(135)
	CreateDynamicObject(3525,2375.2419400,-1910.0662800,12.2793600,0.0000000,0.0000000,0.0000000); //convertffs(136)
	CreateDynamicObject(3525,2371.5117200,-1901.0134300,11.8763500,0.0000000,0.0000000,0.0000000); //convertffs(137)
	CreateDynamicObject(3525,2383.1164600,-1925.6019300,11.8763500,0.0000000,0.0000000,0.0000000); //convertffs(139)
	CreateDynamicObject(3525,2391.4594700,-1920.2119100,13.2347600,0.0000000,0.0000000,0.0000000); //convertffs(140)
	CreateDynamicObject(3525,2404.1535600,-1924.1839600,12.6287400,0.0000000,0.0000000,0.0000000); //convertffs(141)
	CreateDynamicObject(822,364.1000000,-1893.0000000,5.4000000,0.0000000,0.0000000,311.7500000); //object(genveg_tallgrass06) (1)
	CreateDynamicObject(822,363.1000100,-1879.1999500,4.9000000,0.0000000,0.0000000,134.0000000); //object(genveg_tallgrass06) (2)
	CreateDynamicObject(855,360.9000000,-1895.9000000,0.8000000,0.0000000,0.0000000,350.0000000); //object(genveg_tallgrass01) (1)
	CreateDynamicObject(855,360.8000000,-1901.0000000,0.1000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (2)
	CreateDynamicObject(1631,330.1000000,-1906.3000000,0.5000000,0.0000000,0.0000000,128.0000000); //object(waterjump2) (1)
	CreateDynamicObject(1264,360.2000000,-1894.4000000,1.1000000,0.0000000,0.0000000,0.0000000); //object(blackbag1) (1)
	CreateDynamicObject(1265,360.3000000,-1896.5000000,1.0000000,0.0000000,0.0000000,0.0000000); //object(blackbag2) (1)
	CreateDynamicObject(928,361.7000000,-1892.4000000,1.0000000,0.0000000,0.0000000,337.2500000); //object(rubbish_box1) (1)
	CreateDynamicObject(926,366.7000000,-1888.5000000,1.3000000,0.0000000,0.0000000,0.0000000); //object(rubbish_box2) (1)
	CreateDynamicObject(933,362.7002000,-1880.5000000,1.7000000,0.0000000,0.0000000,0.0000000); //object(cj_cableroll) (1)
	CreateDynamicObject(1337,361.2000000,-1879.6000000,2.4000000,0.0000000,0.0000000,315.7470000); //object(binnt07_la) (2)
	CreateDynamicObject(855,367.3000000,-1892.0000000,0.7000000,0.0000000,0.0000000,50.0000000); //object(genveg_tallgrass01) (3)
	CreateDynamicObject(1264,367.8000000,-1892.3000000,1.2000000,0.0000000,0.0000000,0.0000000); //object(blackbag1) (2)
	CreateDynamicObject(1265,364.0000000,-1879.6000000,2.2000000,0.0000000,0.0000000,0.0000000); //object(blackbag2) (2)
	CreateDynamicObject(1264,364.8000000,-1879.2000000,2.2000000,0.0000000,0.0000000,0.0000000); //object(blackbag1) (3)
	CreateDynamicObject(928,379.5000000,-1881.6000000,1.7000000,0.0000000,0.0000000,0.0000000); //object(rubbish_box1) (2)
	CreateDynamicObject(855,368.5996000,-1879.8000000,1.6000000,0.0000000,0.0000000,261.7490000); //object(genveg_tallgrass01) (4)
	CreateDynamicObject(806,362.5000000,-1891.9000000,2.8000000,0.0000000,0.0000000,357.9950000); //object(genveg_tallgrass) (7)
	CreateDynamicObject(1264,359.2000000,-1895.3000000,1.1000000,0.0000000,0.0000000,0.0000000); //object(blackbag1) (4)
	CreateDynamicObject(1264,358.9000000,-1898.5000000,0.8000000,0.0000000,0.0000000,0.0000000); //object(blackbag1) (5)
	CreateDynamicObject(1230,359.0000000,-1896.3000000,0.9000000,0.0000000,0.0000000,32.0000000); //object(cardboardbox) (1)
	CreateDynamicObject(1230,360.3000000,-1899.1000000,0.7000000,0.0000000,0.0000000,0.0000000); //object(cardboardbox) (2)
	CreateDynamicObject(1224,356.0000000,-1902.6000000,0.3000000,0.0000000,0.0000000,325.5000000); //object(woodenbox) (1)
	CreateDynamicObject(3414,335.5000000,-1875.1999500,3.8000000,0.0000000,0.0000000,0.0000000); //object(ce_oldhut1) (1)
	CreateDynamicObject(1440,360.0996000,-1877.7000000,2.4000000,0.0000000,0.0000000,280.7450000); //object(dyn_box_pile_3) (1)
	CreateDynamicObject(1441,340.9000000,-1881.2000000,1.9000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile_4) (1)
	CreateDynamicObject(1442,374.7000000,-1883.0000000,1.9000000,0.0000000,0.0000000,0.0000000); //object(dyn_firebin0) (1)
	CreateDynamicObject(1449,373.9000000,-1879.4000000,2.2000000,0.0000000,0.0000000,0.0000000); //object(dyn_crate_2) (1)
	CreateDynamicObject(1450,382.5000000,-1879.9000000,2.3000000,0.0000000,0.0000000,0.0000000); //object(dyn_crate_3) (1)
	CreateDynamicObject(1773,375.4000000,-1879.7000000,2.4000000,0.0000000,0.0000000,0.0000000); //object(cj_cooker2) (1)
	CreateDynamicObject(1370,376.5000000,-1879.5000000,2.2000000,0.0000000,0.0000000,0.0000000); //object(cj_flame_drum) (1)
	CreateDynamicObject(1358,358.7000000,-1874.9000000,3.3000000,0.0000000,0.0000000,306.0000000); //object(cj_skip_rubbish) (1)
	CreateDynamicObject(1349,370.6000000,-1882.5000000,2.0000000,0.0000000,0.0000000,40.0000000); //object(cj_shtrolly) (1)
	CreateDynamicObject(1349,372.6000000,-1891.6000000,1.3000000,0.0000000,0.0000000,310.0000000); //object(cj_shtrolly) (2)
	CreateDynamicObject(1327,360.9000000,-1872.9000000,3.2000000,0.0000000,0.0000000,0.0000000); //object(junk_tyre) (1)
	CreateDynamicObject(13591,350.0000000,-1861.4000000,2.6000000,0.0000000,0.0000000,46.0000000); //object(kickcar28) (1)
	CreateDynamicObject(3929,325.9000000,-1902.4000000,0.6000000,0.0000000,0.0000000,0.0000000); //object(d_rock) (1)
	CreateDynamicObject(3929,333.3000000,-1906.7000000,0.0000000,0.0000000,0.0000000,0.0000000); //object(d_rock) (2)
	CreateDynamicObject(3929,332.0000000,-1910.7000000,0.0000000,0.0000000,0.0000000,0.0000000); //object(d_rock) (3)
	CreateDynamicObject(747,358.0000000,-1907.3000000,0.0000000,0.0000000,0.0000000,0.0000000); //object(sm_scrub_rock3) (1)
	CreateDynamicObject(1303,312.5338000,-1903.7760000,-0.0799300,0.0000000,0.0000000,0.0000000); //object(dyn_quarryrock03) (1)
	CreateDynamicObject(851,307.7000000,-1870.7000000,2.0000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_2) (1)
	CreateDynamicObject(851,353.1000000,-1903.8000000,0.1000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_2) (2)
	CreateDynamicObject(853,355.1000000,-1852.3000000,2.9000000,0.0000000,0.0000000,24.0000000); //object(cj_urb_rub_5) (1)
	CreateDynamicObject(850,303.3000000,-1894.1000000,0.6000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_1) (1)
	CreateDynamicObject(3035,359.3000000,-1870.4000000,3.2000000,0.0000000,0.0000000,252.0000000); //object(tmp_bin) (1)
	CreateDynamicObject(3035,392.4000000,-1891.9000000,1.2000000,0.0000000,0.0000000,0.0000000); //object(tmp_bin) (2)
	CreateDynamicObject(3006,377.2998000,-1890.8000000,0.7000000,0.0000000,0.0000000,0.0000000); //object(smash_box_brk) (1)
	CreateDynamicObject(3005,374.8000000,-1890.9000000,0.7000000,0.0000000,0.0000000,0.0000000); //object(smash_box_stay) (1)
	CreateDynamicObject(2971,385.0996000,-1880.2000000,1.6000000,0.0000000,0.0000000,0.0000000); //object(k_smashboxes) (1)
	CreateDynamicObject(3006,394.2000100,-1891.0000000,0.3000000,0.0000000,0.0000000,0.0000000); //object(smash_box_brk) (2)
	CreateDynamicObject(3005,410.3000000,-1878.0000000,2.0000000,0.0000000,0.0000000,0.0000000); //object(smash_box_stay) (2)
	CreateDynamicObject(2953,396.2000000,-1891.8000000,0.5000000,0.0000000,0.0000000,0.0000000); //object(kmb_paper_code) (1)
	CreateDynamicObject(1462,388.7002000,-1879.7000000,1.7000000,0.0000000,0.0000000,0.0000000); //object(dyn_woodpile) (1)
	CreateDynamicObject(1449,392.5000000,-1879.4000000,2.3000000,0.0000000,0.0000000,0.0000000); //object(dyn_crate_2) (2)
	CreateDynamicObject(1441,410.0000000,-1875.7000000,2.8000000,0.0000000,0.0000000,84.5000000); //object(dyn_box_pile_4) (2)
	CreateDynamicObject(12955,275.2002000,-1899.6000000,1.8000000,0.0000000,0.0000000,83.9960000); //object(dock_props01) (1)
	CreateDynamicObject(2670,390.1000000,-1886.9000000,1.1000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_1) (1)
	CreateDynamicObject(2670,402.7000000,-1886.1000000,1.3000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_1) (2)
	CreateDynamicObject(2670,354.5000000,-1879.6000000,1.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_1) (3)
	CreateDynamicObject(2671,317.9000000,-1891.2000000,0.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_3) (1)
	CreateDynamicObject(2672,357.8000000,-1877.9000000,2.1000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4) (1)
	CreateDynamicObject(2673,351.2000000,-1888.9000000,1.0000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_5) (1)
	CreateDynamicObject(2673,363.4004000,-1883.9000000,1.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_5) (2)
	CreateDynamicObject(2673,353.3000000,-1884.1000000,1.4000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_5) (3)
	CreateDynamicObject(2675,330.6000000,-1891.0000000,0.9000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_6) (1)
	CreateDynamicObject(2675,400.8000000,-1882.6000000,1.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_6) (2)
	CreateDynamicObject(2676,355.5000000,-1892.1000000,0.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8) (1)
	CreateDynamicObject(3593,385.8999900,-1888.5999800,1.2000000,356.2500000,0.0000000,229.9990000); //object(la_fuckcar2) (1)
	CreateDynamicObject(3594,321.5000000,-1903.5000000,0.3000000,0.0000000,0.0000000,146.0000000); //object(la_fuckcar1) (1)
	CreateDynamicObject(2675,328.4000000,-1852.6000000,2.3000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_6) (3)
	CreateDynamicObject(2674,398.5000000,-1889.0000000,0.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_2) (1)
	CreateDynamicObject(2672,343.1000000,-1855.0000000,2.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4) (2)
	CreateDynamicObject(18246,275.5000000,-1864.8000500,4.3000000,0.0000000,0.0000000,0.0000000); //object(cuntwjunk04) (1)
	CreateDynamicObject(1438,395.8000000,-1880.0000000,1.7000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile_2) (1)
	CreateDynamicObject(851,387.2998000,-1879.6000000,2.0000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_2) (3)
	CreateDynamicObject(933,397.0000000,-1892.1000000,0.5000000,0.0000000,0.0000000,0.0000000); //object(cj_cableroll) (2)
	CreateDynamicObject(849,398.4000000,-1879.6000000,2.1000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_3) (1)
	CreateDynamicObject(3035,399.1000000,-1892.1000000,1.2000000,0.0000000,0.0000000,316.0000000); //object(tmp_bin) (3)
	CreateDynamicObject(1440,401.4000000,-1880.0000000,2.3000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile_3) (2)
	CreateDynamicObject(1431,404.0000000,-1879.6000000,2.5000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile) (1)
	CreateDynamicObject(18253,356.2002000,-1841.7000000,5.4000000,0.0000000,0.0000000,0.0000000); //object(cuntwjunk09) (1)
	CreateDynamicObject(3594,309.7000000,-1860.9000000,2.7000000,0.0000000,0.0000000,0.0000000); //object(la_fuckcar1) (2)
	CreateDynamicObject(3594,312.1000000,-1860.7000000,2.7000000,0.0000000,0.0000000,0.0000000); //object(la_fuckcar1) (3)
	CreateDynamicObject(3594,314.6000000,-1860.6000000,2.7000000,0.0000000,0.0000000,0.0000000); //object(la_fuckcar1) (4)
	CreateDynamicObject(3593,317.2000000,-1860.9000000,2.8000000,0.0000000,0.0000000,0.0000000); //object(la_fuckcar2) (2)
	CreateDynamicObject(3593,320.1000000,-1861.0000000,2.8000000,0.0000000,0.0000000,0.0000000); //object(la_fuckcar2) (3)
	CreateDynamicObject(3594,317.9004000,-1858.8000000,3.8000000,0.0000000,0.0000000,270.0000000); //object(la_fuckcar1) (5)
	CreateDynamicObject(3593,311.4000000,-1860.7000000,4.3000000,0.0000000,0.0000000,250.0000000); //object(la_fuckcar2) (4)
	CreateDynamicObject(13591,314.3000000,-1867.5000000,2.3000000,0.0000000,0.0000000,0.0000000); //object(kickcar28) (2)
	CreateDynamicObject(2673,348.7000000,-1870.8000000,2.3000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_5) (4)
	CreateDynamicObject(2674,353.8000000,-1867.2000000,2.4000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_2) (2)
	CreateDynamicObject(2672,343.5000000,-1866.4000000,2.4000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4) (3)
	CreateDynamicObject(2670,357.4000000,-1866.4000000,2.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_1) (4)
	CreateDynamicObject(2062,359.2000000,-1849.9000000,3.1000000,0.0000000,0.0000000,0.0000000); //object(cj_oildrum2) (1)
	CreateDynamicObject(2062,358.4000000,-1849.7000000,3.1000000,0.0000000,0.0000000,0.0000000); //object(cj_oildrum2) (2)
	CreateDynamicObject(2062,359.5000000,-1850.8000000,3.0000000,0.0000000,0.0000000,0.0000000); //object(cj_oildrum2) (3)
	CreateDynamicObject(2062,357.5996000,-1849.7000000,3.1000000,0.0000000,0.0000000,0.0000000); //object(cj_oildrum2) (4)
	CreateDynamicObject(1429,385.2998000,-1880.3994100,3.7000000,0.0000000,0.0000000,0.0000000); //object(dyn_tv) (1)
	CreateDynamicObject(855,388.7000000,-1892.1000000,2.2000000,0.0000000,0.0000000,16.0000000); //object(genveg_tallgrass01) (5)
	CreateDynamicObject(817,390.2998000,-1879.2000000,2.2000000,0.0000000,0.0000000,0.0000000); //object(veg_pflowers01) (1)
	CreateDynamicObject(818,399.8000000,-1899.2000000,3.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass02) (1)
	CreateDynamicObject(806,380.9004000,-1880.2000000,3.7000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass) (1)
	CreateDynamicObject(806,381.2002000,-1891.4000000,4.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass) (2)
	CreateDynamicObject(806,383.5000000,-1891.2000000,4.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass) (3)
	CreateDynamicObject(852,331.7002000,-1863.9000000,2.0000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_4) (1)
	CreateDynamicObject(852,339.6000000,-1863.0000000,2.1000000,0.0000000,0.0000000,270.0000000); //object(cj_urb_rub_4) (2)
	CreateDynamicObject(851,337.2002000,-1862.2000000,2.4000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_2) (4)
	CreateDynamicObject(851,330.7000000,-1861.2000000,2.4000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_2) (5)
	CreateDynamicObject(850,334.4000000,-1864.6000000,2.1000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_1) (2)
	CreateDynamicObject(853,342.6000000,-1861.7000000,2.6000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_5) (2)
	CreateDynamicObject(3035,357.3000000,-1832.5000000,3.6000000,0.0000000,0.0000000,0.0000000); //object(tmp_bin) (4)
	CreateDynamicObject(3035,358.5000000,-1830.5000000,3.7000000,0.0000000,0.0000000,60.0000000); //object(tmp_bin) (5)
	CreateDynamicObject(3035,358.5000000,-1827.4000000,3.8000000,0.0000000,0.0000000,90.0000000); //object(tmp_bin) (6)
	CreateDynamicObject(1440,358.4004000,-1818.3000000,3.8000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile_3) (3)
	CreateDynamicObject(1439,351.0000000,-1849.0000000,2.5000000,0.0000000,0.0000000,290.0000000); //object(dyn_dumpster_1) (1)
	CreateDynamicObject(1439,350.7000000,-1846.6000000,2.5000000,0.0000000,0.0000000,289.9950000); //object(dyn_dumpster_1) (2)
	CreateDynamicObject(1439,351.3000000,-1844.6000000,2.5000000,0.0000000,0.0000000,269.9950000); //object(dyn_dumpster_1) (3)
	CreateDynamicObject(1439,351.8000000,-1835.2000000,2.8000000,0.0000000,0.0000000,269.9950000); //object(dyn_dumpster_1) (4)
	CreateDynamicObject(1439,351.8000000,-1839.0000000,2.8000000,0.0000000,0.0000000,269.9950000); //object(dyn_dumpster_1) (5)
	CreateDynamicObject(1439,351.7000000,-1841.6000000,2.6000000,0.0000000,0.0000000,269.9950000); //object(dyn_dumpster_1) (6)
	CreateDynamicObject(2672,354.8000000,-1829.0000000,3.2000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4) (4)
	CreateDynamicObject(2672,343.7998000,-1836.3000000,3.0000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4) (5)
	CreateDynamicObject(2673,329.2002000,-1825.6000000,3.1000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_5) (5)
	CreateDynamicObject(2673,340.5000000,-1833.3000000,2.9000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_5) (6)
	CreateDynamicObject(2671,329.5000000,-1853.5000000,2.2000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_3) (2)
	CreateDynamicObject(2671,338.9000000,-1827.7000000,3.0000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_3) (3)
	CreateDynamicObject(2673,363.4004000,-1883.9000000,1.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_5) (2)
	CreateDynamicObject(2671,336.2000000,-1856.5000000,2.2000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_3) (1)
	CreateDynamicObject(2672,382.4004000,-1883.9000000,1.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4) (2)
	CreateDynamicObject(2675,321.8000000,-1885.6000000,1.1000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_6) (3)
	CreateDynamicObject(2671,345.9000000,-1822.5000000,3.1000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_3) (2)
	CreateDynamicObject(2671,336.0000000,-1846.1000000,2.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_3) (2)
	CreateDynamicObject(2672,352.7998000,-1821.8000000,3.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4) (4)
	CreateDynamicObject(1440,317.1000000,-1816.4000000,3.8000000,0.0000000,0.0000000,180.0000000); //object(dyn_box_pile_3) (3)
	CreateDynamicObject(1328,312.5000000,-1819.7000000,3.7000000,0.0000000,0.0000000,0.0000000); //object(binnt10_la) (1)
	CreateDynamicObject(1328,311.0996000,-1819.7000000,3.7000000,0.0000000,0.0000000,0.0000000); //object(binnt10_la) (2)
	CreateDynamicObject(928,313.9000000,-1820.0000000,5.0000000,0.0000000,0.0000000,0.0000000); //object(rubbish_box1) (3)
	CreateDynamicObject(928,314.5000000,-1825.1000000,3.3000000,0.0000000,0.0000000,0.0000000); //object(rubbish_box1) (4)
	CreateDynamicObject(928,315.4000000,-1822.0000000,3.4000000,0.0000000,0.0000000,0.0000000); //object(rubbish_box1) (5)
	CreateDynamicObject(926,314.9000000,-1820.1000000,3.4000000,0.0000000,0.0000000,0.0000000); //object(rubbish_box2) (2)
	CreateDynamicObject(926,315.2000000,-1824.6000000,3.3000000,0.0000000,0.0000000,0.0000000); //object(rubbish_box2) (3)
	CreateDynamicObject(1264,313.9000000,-1819.9000000,3.7000000,0.0000000,0.0000000,0.0000000); //object(blackbag1) (6)
	CreateDynamicObject(1264,315.1000000,-1821.4000000,3.6000000,0.0000000,0.0000000,0.0000000); //object(blackbag1) (7)
	CreateDynamicObject(1264,315.3000000,-1823.6000000,3.6000000,0.0000000,0.0000000,0.0000000); //object(blackbag1) (8)
	CreateDynamicObject(1264,315.3980000,-1822.6100000,3.6016700,0.0000000,0.0000000,0.0000000); //object(blackbag1) (9)
	CreateDynamicObject(1219,309.5000000,-1824.4000000,3.4000000,0.0000000,0.0000000,0.0000000); //object(palette) (1)
	CreateDynamicObject(820,398.2000000,-1914.3000000,3.1000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass04) (1)
	CreateDynamicObject(2671,343.2000000,-1893.7000000,0.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_3) (1)
	CreateDynamicObject(850,352.0000000,-1894.3000000,0.7000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_1) (1)
	CreateDynamicObject(851,341.0000000,-1903.9000000,0.2000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_2) (1)
	CreateDynamicObject(2675,332.7998000,-1881.0000000,1.4000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_6) (1)
	CreateDynamicObject(2675,395.2002000,-1882.8000000,1.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_6) (3)
	CreateDynamicObject(2671,359.5996000,-1886.3000000,1.3000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_3) (1)
	CreateDynamicObject(850,315.5996000,-1880.3000000,1.4000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_1) (1)
	CreateDynamicObject(2671,317.9004000,-1891.2000000,0.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_3) (1)
	CreateDynamicObject(2675,307.2000000,-1884.3000000,1.1000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_6) (3)
	CreateDynamicObject(2675,288.3000000,-1885.4000000,0.9000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_6) (3)
	CreateDynamicObject(1440,300.5000000,-1902.4000000,0.0000000,0.0000000,0.0000000,180.7450000); //object(dyn_box_pile_3) (1)
	CreateDynamicObject(1440,293.2000000,-1900.4000000,0.1000000,0.0000000,0.0000000,180.7420000); //object(dyn_box_pile_3) (1)
	CreateDynamicObject(1440,255.7000000,-1890.6000000,0.2000000,0.0000000,0.0000000,180.7420000); //object(dyn_box_pile_3) (1)
	CreateDynamicObject(3035,334.7998000,-1878.6000000,2.2000000,0.0000000,0.0000000,338.0000000); //object(tmp_bin) (1)
	CreateDynamicObject(2971,358.7000000,-1852.4000000,2.5000000,0.0000000,0.0000000,310.0000000); //object(k_smashboxes) (1)
	CreateDynamicObject(2971,359.0000000,-1860.6000000,2.5000000,0.0000000,0.0000000,349.9960000); //object(k_smashboxes) (1)
	CreateDynamicObject(853,344.2998000,-1879.1000000,1.9000000,0.0000000,0.0000000,24.0000000); //object(cj_urb_rub_5) (1)
	CreateDynamicObject(851,358.3000000,-1855.4000000,2.8000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_2) (4)
	CreateDynamicObject(852,357.8000000,-1857.7000000,2.5000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_4) (1)
	CreateDynamicObject(1449,342.7000000,-1875.2000000,2.2000000,0.0000000,0.0000000,90.0000000); //object(dyn_crate_2) (2)
	CreateDynamicObject(1449,360.7002000,-1867.8000000,3.0000000,0.0000000,0.0000000,270.0000000); //object(dyn_crate_2) (2)
	CreateDynamicObject(1462,360.2000000,-1864.2000000,2.5000000,0.0000000,0.0000000,260.0000000); //object(dyn_woodpile) (1)
	CreateDynamicObject(3594,331.5995000,-1853.6280000,2.8530000,0.0000000,0.0000000,330.0000000); //object(la_fuckcar1) (5)
	CreateDynamicObject(16023,351.4000000,-1817.4000000,5.0000000,0.0000000,0.0000000,270.0000000); //object(des_trxingsign02) (1)
	CreateDynamicObject(16023,317.0000000,-1817.4000000,5.0000000,0.0000000,0.0000000,270.0000000); //object(des_trxingsign02) (2)
	CreateDynamicObject(16023,328.9004000,-1817.4000000,5.0000000,0.0000000,0.0000000,270.0000000); //object(des_trxingsign02) (3)
	CreateDynamicObject(16023,339.2002000,-1817.4000000,5.0000000,0.0000000,0.0000000,270.0000000); //object(des_trxingsign02) (4)
	CreateDynamicObject(2062,348.9000000,-1818.2000000,3.8000000,0.0000000,0.0000000,0.0000000); //object(cj_oildrum2) (4)
	CreateDynamicObject(2062,328.8000000,-1818.1000000,3.8000000,0.0000000,0.0000000,0.0000000); //object(cj_oildrum2) (4)
	CreateDynamicObject(928,347.8000000,-1818.0000000,3.5000000,0.0000000,0.0000000,0.0000000); //object(rubbish_box1) (7)
	CreateDynamicObject(928,339.9000000,-1817.9000000,3.5000000,0.0000000,0.0000000,0.0000000); //object(rubbish_box1) (8)
	CreateDynamicObject(928,359.6000000,-1819.2000000,3.5000000,0.0000000,0.0000000,0.0000000); //object(rubbish_box1) (9)
	CreateDynamicObject(926,354.4000000,-1818.0000000,3.5000000,0.0000000,0.0000000,0.0000000); //object(rubbish_box2) (4)
	CreateDynamicObject(926,344.3000000,-1817.8000000,3.5000000,0.0000000,0.0000000,0.0000000); //object(rubbish_box2) (5)
	CreateDynamicObject(926,349.5996000,-1818.0000000,3.5000000,0.0000000,0.0000000,0.0000000); //object(rubbish_box2) (6)
	CreateDynamicObject(2672,345.2000000,-1844.0000000,2.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4) (4)
	CreateDynamicObject(2672,326.1000000,-1821.1000000,3.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_4) (4)
	CreateDynamicObject(853,359.0000000,-1824.3000000,3.5000000,0.0000000,0.0000000,50.0000000); //object(cj_urb_rub_5) (4)
	CreateDynamicObject(2671,336.0000000,-1846.1000000,2.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_3) (2)
	CreateDynamicObject(2671,355.7000000,-1825.3000000,3.1000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_3) (2)
	CreateDynamicObject(2673,320.3000000,-1822.3000000,3.2000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_5) (5)
	CreateDynamicObject(2673,357.4000000,-1828.9000000,3.1000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_5) (5)
	CreateDynamicObject(3119,341.5000000,-1819.5000000,3.5000000,0.0000000,0.0000000,0.0000000); //object(cs_ry_props) (1)
	CreateDynamicObject(3119,363.9000000,-1886.1000000,1.5000000,0.0000000,0.0000000,0.0000000); //object(cs_ry_props) (2)
	CreateDynamicObject(3119,356.6000000,-1821.7000000,3.5000000,0.0000000,0.0000000,0.0000000); //object(cs_ry_props) (3)
	CreateDynamicObject(2062,314.9000000,-1816.5000000,3.9000000,0.0000000,0.0000000,0.0000000); //object(cj_oildrum2) (4)
	CreateDynamicObject(933,345.8000000,-1818.5000000,3.3000000,0.0000000,0.0000000,0.0000000); //object(cj_cableroll) (1)
	CreateDynamicObject(3073,355.6000100,-1811.1999500,5.1000000,0.0000000,0.0000000,209.2460000); //object(kmb_container_broke) (1)
	CreateDynamicObject(3006,323.7000000,-1818.6000000,3.2000000,0.0000000,0.0000000,0.0000000); //object(smash_box_brk) (1)
	CreateDynamicObject(1264,330.7000000,-1832.2000000,3.3000000,0.0000000,0.0000000,0.0000000); //object(blackbag1) (10)
	CreateDynamicObject(1264,329.7000000,-1832.5000000,3.3000000,0.0000000,0.0000000,0.0000000); //object(blackbag1) (11)
	CreateDynamicObject(1264,350.9000000,-1831.0000000,3.4000000,0.0000000,0.0000000,0.0000000); //object(blackbag1) (12)
	CreateDynamicObject(1264,351.0000000,-1818.4000000,3.7000000,0.0000000,0.0000000,0.0000000); //object(blackbag1) (13)
	CreateDynamicObject(1264,342.5000000,-1818.5000000,3.7000000,0.0000000,0.0000000,0.0000000); //object(blackbag1) (14)
	CreateDynamicObject(1219,327.3000000,-1819.4000000,3.6000000,0.0000000,0.0000000,230.0000000); //object(palette) (2)
	CreateDynamicObject(3005,339.3000000,-1821.9000000,3.2000000,0.0000000,0.0000000,0.0000000); //object(smash_box_stay) (3)
	CreateDynamicObject(3005,328.3000000,-1846.0000000,2.4000000,0.0000000,0.0000000,0.0000000); //object(smash_box_stay) (4)
	CreateDynamicObject(2905,366.3000000,-1879.8000000,1.8000000,0.0000000,0.0000000,0.0000000); //object(kmb_deadleg) (1)
	CreateDynamicObject(2906,363.9000000,-1892.0000000,0.8000000,0.0000000,0.0000000,0.0000000); //object(kmb_deadarm) (1)
	CreateDynamicObject(2907,378.6000000,-1883.6000000,1.4000000,0.0000000,0.0000000,0.0000000); //object(kmb_deadtorso) (1)
	CreateDynamicObject(3006,309.6000000,-1815.5000000,3.3000000,0.0000000,0.0000000,0.0000000); //object(smash_box_brk) (1)
	CreateDynamicObject(1440,310.0000000,-1821.4000000,3.7000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile_3) (3)
	CreateDynamicObject(2062,338.0996000,-1818.1000000,3.8000000,0.0000000,0.0000000,0.0000000); //object(cj_oildrum2) (4)
	CreateDynamicObject(1264,308.8000000,-1816.6000000,3.8000000,0.0000000,0.0000000,0.0000000); //object(blackbag1) (15)
	CreateDynamicObject(1264,313.6000000,-1816.4000000,3.8000000,0.0000000,0.0000000,0.0000000); //object(blackbag1) (16)
	CreateDynamicObject(1264,311.3000000,-1816.4000000,3.8000000,0.0000000,0.0000000,0.0000000); //object(blackbag1) (17)
	CreateDynamicObject(1264,312.9000000,-1816.5000000,4.0000000,0.0000000,0.0000000,0.0000000); //object(blackbag1) (18)
	CreateDynamicObject(933,309.3000000,-1818.7000000,3.2000000,0.0000000,0.0000000,0.0000000); //object(cj_cableroll) (1)
	CreateDynamicObject(2907,359.0000000,-1819.5000000,3.4000000,0.0000000,0.0000000,160.0000000); //object(kmb_deadtorso) (2)
	CreateDynamicObject(1440,358.2000000,-1818.5000000,3.8000000,0.0000000,0.0000000,0.0000000); //object(dyn_box_pile_3) (3)
	CreateDynamicObject(1415,352.6000000,-1818.6000000,3.3000000,0.0000000,0.0000000,0.0000000); //object(dyn_dumpster) (1)
	CreateDynamicObject(1415,317.0000000,-1825.4000000,3.0000000,0.0000000,0.0000000,162.0000000); //object(dyn_dumpster) (2)
	CreateDynamicObject(3005,319.5000000,-1825.3000000,3.0000000,0.0000000,0.0000000,120.0000000); //object(smash_box_stay) (5)
	CreateDynamicObject(1409,356.4000000,-1818.1000000,3.3000000,0.0000000,0.0000000,40.0000000); //object(cj_dump1_low) (1)
	CreateDynamicObject(1370,321.4000000,-1825.7000000,3.6000000,0.0000000,0.0000000,0.0000000); //object(cj_flame_drum) (2)
	CreateDynamicObject(1370,350.4004000,-1818.0000000,3.8000000,0.0000000,0.0000000,0.0000000); //object(cj_flame_drum) (3)
	CreateDynamicObject(1264,312.0000000,-1816.7000000,3.8000000,0.0000000,0.0000000,0.0000000); //object(blackbag1) (19)
	CreateDynamicObject(1370,359.2000000,-1814.1000000,3.9000000,0.0000000,0.0000000,0.0000000); //object(cj_flame_drum) (4)
	CreateDynamicObject(933,357.0000000,-1808.6000000,3.6000000,0.0000000,0.0000000,0.0000000); //object(cj_cableroll) (1)
	CreateDynamicObject(955,360.6000000,-1892.3000000,0.8000000,0.0000000,0.0000000,220.0000000); //object(cj_ext_sprunk) (1)
	CreateDynamicObject(1525,352.4000000,-1837.2000000,4.7000000,0.0000000,0.0000000,0.0000000); //object(tag_kilo) (1)
	CreateDynamicObject(1526,360.9000000,-1862.4000000,4.5000000,0.0000000,0.0000000,0.0000000); //object(tag_rifa) (1)
	CreateDynamicObject(1527,360.9000000,-1905.3000000,3.0000000,0.0000000,0.0000000,0.0000000); //object(tag_rollin) (1)
	CreateDynamicObject(1232,344.9000000,-1812.7000000,6.1000000,0.0000000,0.0000000,0.0000000); //object(streetlamp1) (1)
	CreateDynamicObject(1232,316.0996000,-1812.8000000,6.0000000,0.0000000,0.0000000,0.0000000); //object(streetlamp1) (2)
	CreateDynamicObject(1232,331.0996000,-1812.8000000,6.0000000,0.0000000,0.0000000,0.0000000); //object(streetlamp1) (3)
	CreateDynamicObject(1315,342.2000000,-1785.4000000,7.4000000,0.0000000,0.0000000,178.0000000); //object(trafficlight1) (1)
	CreateDynamicObject(4509,1469.3000000,-1300.0000000,15.2000000,0.0000000,0.0000000,180.0000000); //object(cuntw_roadblock05ld) (3)
	CreateDynamicObject(969,1696.2000000,-1286.5000000,12.6000000,0.0000000,0.0000000,290.0000000); //object(electricgate) (1)
	CreateDynamicObject(969,1687.5000000,-1286.4000000,12.6000000,0.0000000,0.0000000,359.9950000); //object(electricgate) (2)
	CreateDynamicObject(969,1704.5000000,-1316.5000000,16.5000000,0.0000000,0.0000000,269.9950000); //object(electricgate) (3)
	CreateDynamicObject(969,1695.6000000,-1316.6000000,16.5000000,0.0000000,0.0000000,359.9950000); //object(electricgate) (4)
	CreateDynamicObject(1413,1685.5000000,-1283.1000000,15.1000000,0.0000000,0.0000000,0.0000000); //object(dyn_mesh_3) (16)
	CreateDynamicObject(1413,1690.7000000,-1283.2000000,15.1000000,0.0000000,0.0000000,0.0000000); //object(dyn_mesh_3) (17)
	CreateDynamicObject(1413,1696.0000000,-1283.2000000,15.1000000,0.0000000,0.0000000,0.0000000); //object(dyn_mesh_3) (18)
	CreateDynamicObject(1413,1700.0000000,-1280.9000000,15.1000000,0.0000000,0.0000000,60.0000000); //object(dyn_mesh_3) (19)
	CreateDynamicObject(1413,1701.3000000,-1276.0000000,15.1000000,0.0000000,0.0000000,89.9960000); //object(dyn_mesh_3) (20)
	CreateDynamicObject(1413,1701.4000000,-1270.7000000,15.1000000,0.0000000,0.0000000,89.9950000); //object(dyn_mesh_3) (21)
	CreateDynamicObject(1413,1701.4000000,-1265.6000000,15.1000000,0.0000000,0.0000000,89.9950000); //object(dyn_mesh_3) (22)
	CreateDynamicObject(1413,1701.4000000,-1260.5000000,15.1000000,0.0000000,0.0000000,89.9950000); //object(dyn_mesh_3) (23)
	CreateDynamicObject(1413,1701.4000000,-1255.4000000,15.1000000,0.0000000,0.0000000,89.9950000); //object(dyn_mesh_3) (24)
	CreateDynamicObject(1413,1701.4000000,-1250.3000000,15.1000000,0.0000000,0.0000000,89.9950000); //object(dyn_mesh_3) (25)
	CreateDynamicObject(1413,1701.3000000,-1245.2000000,15.1000000,0.0000000,0.0000000,89.9950000); //object(dyn_mesh_3) (26)
	CreateDynamicObject(1413,1698.8000000,-1242.1000000,15.1000000,0.0000000,0.0000000,169.9950000); //object(dyn_mesh_3) (27)
	CreateDynamicObject(1413,1694.0000000,-1240.3000000,15.1000000,0.0000000,0.0000000,149.9920000); //object(dyn_mesh_3) (28)
	CreateDynamicObject(1413,1689.2000000,-1239.8000000,15.1000000,0.0000000,0.0000000,195.9910000); //object(dyn_mesh_3) (29)
	CreateDynamicObject(1413,1609.3000000,-1209.4000000,20.2000000,0.0000000,0.0000000,350.0000000); //object(dyn_mesh_3) (30)
	CreateDynamicObject(1413,1614.3000000,-1208.9000000,20.2000000,0.0000000,0.0000000,19.9970000); //object(dyn_mesh_3) (31)
	CreateDynamicObject(1413,1619.2000000,-1207.1000000,20.2000000,0.0000000,0.0000000,21.9950000); //object(dyn_mesh_3) (32)
	CreateDynamicObject(1413,1620.7000000,-1203.7000000,20.2000000,0.0000000,0.0000000,111.9950000); //object(dyn_mesh_3) (33)
	CreateDynamicObject(1413,1620.5000000,-1198.6000000,20.2000000,0.0000000,0.0000000,71.9890000); //object(dyn_mesh_3) (34)
	CreateDynamicObject(1413,1470.6000000,-1290.3000000,13.9000000,0.0000000,0.0000000,319.9950000); //object(dyn_mesh_3) (35)
	CreateDynamicObject(1413,1467.1000000,-1310.1000000,13.9000000,0.0000000,0.0000000,199.9900000); //object(dyn_mesh_3) (36)
	CreateDynamicObject(1424,1586.0000000,-1286.8000000,17.1000000,0.0000000,0.0000000,0.0000000); //object(dyn_roadbarrier_2) (8)
	CreateDynamicObject(1424,1581.8000000,-1286.9000000,17.1000000,0.0000000,0.0000000,0.0000000); //object(dyn_roadbarrier_2) (9)
	CreateDynamicObject(1424,1577.0000000,-1286.0000000,17.1000000,0.0000000,0.0000000,70.0000000); //object(dyn_roadbarrier_2) (10)
	CreateDynamicObject(1424,1580.7000000,-1284.5000000,17.1000000,0.0000000,0.0000000,9.9990000); //object(dyn_roadbarrier_2) (11)
	CreateDynamicObject(1424,1572.4000000,-1285.1000000,17.1000000,0.0000000,0.0000000,309.9980000); //object(dyn_roadbarrier_2) (12)
	CreateDynamicObject(1447,1541.0000000,-1257.9000000,17.7000000,0.0000000,0.0000000,0.0000000); //object(dyn_mesh_4) (1)
	CreateDynamicObject(1447,1535.8000000,-1257.9000000,17.7000000,0.0000000,0.0000000,0.0000000); //object(dyn_mesh_4) (2)
	CreateDynamicObject(1447,1523.0000000,-1258.9000000,14.8000000,0.0000000,0.0000000,0.0000000); //object(dyn_mesh_4) (3)
	CreateDynamicObject(1447,1517.7000000,-1259.0000000,14.8000000,0.0000000,0.0000000,0.0000000); //object(dyn_mesh_4) (4)
	CreateDynamicObject(1447,1513.1000000,-1259.0000000,14.8000000,0.0000000,0.0000000,0.0000000); //object(dyn_mesh_4) (5)
	CreateDynamicObject(1447,1511.0000000,-1341.5000000,14.2000000,0.0000000,0.0000000,180.0000000); //object(dyn_mesh_4) (6)
	CreateDynamicObject(1447,1506.0000000,-1341.0000000,14.2000000,0.0000000,0.0000000,159.9950000); //object(dyn_mesh_4) (7)
	CreateDynamicObject(1447,1501.2000000,-1341.3000000,14.2000000,0.0000000,0.0000000,209.9940000); //object(dyn_mesh_4) (8)
	CreateDynamicObject(4509,1613.7000000,-1387.9000000,30.5000000,0.0000000,0.0000000,270.0000000); //object(cuntw_roadblock05ld) (5)
	CreateDynamicObject(3276,1659.3000000,-1317.4000000,17.4000000,0.0000000,0.0000000,0.0000000); //object(cxreffencesld) (1)
	CreateDynamicObject(3276,1626.4000000,-1317.5000000,17.3000000,0.0000000,0.0000000,0.0000000); //object(cxreffencesld) (2)
	CreateDynamicObject(615,1649.8000000,-1318.5000000,16.4000000,0.0000000,0.0000000,0.0000000); //object(veg_tree3) (1)
	CreateDynamicObject(618,1626.0000000,-1284.5000000,15.6000000,0.0000000,0.0000000,0.0000000); //object(veg_treea3) (1)
	CreateDynamicObject(669,1626.2000000,-1267.0000000,15.6000000,0.0000000,0.0000000,340.0000000); //object(sm_veg_tree4) (1)
	CreateDynamicObject(669,1621.2000000,-1254.0000000,17.2000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (2)
	CreateDynamicObject(669,1621.4000000,-1287.1000000,17.1000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (3)
	CreateDynamicObject(669,1627.9000000,-1332.9000000,16.3000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (4)
	CreateDynamicObject(669,1635.2000000,-1347.6000000,16.3000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (5)
	CreateDynamicObject(669,1628.5000000,-1359.9000000,16.3000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (6)
	CreateDynamicObject(669,1591.9000000,-1341.7000000,15.5000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (7)
	CreateDynamicObject(669,1581.7000000,-1324.7000000,15.5000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (8)
	CreateDynamicObject(669,1565.8000000,-1325.3000000,15.5000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (9)
	CreateDynamicObject(669,1566.0000000,-1288.2000000,16.4000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (10)
	CreateDynamicObject(669,1609.6000000,-1234.7000000,16.8000000,20.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (11)
	CreateDynamicObject(669,1605.2000000,-1208.8000000,16.5000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (12)
	CreateDynamicObject(669,1644.1000000,-1212.2000000,13.8000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (13)
	CreateDynamicObject(669,1658.0000000,-1286.4000000,13.8000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (14)
	CreateDynamicObject(669,1700.9000000,-1282.1000000,14.6000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (15)
	CreateDynamicObject(669,1700.5000000,-1322.0000000,16.3000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (16)
	CreateDynamicObject(669,1697.7000000,-1355.6000000,16.3000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (17)
	CreateDynamicObject(669,1665.0000000,-1314.8000000,13.5000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (18)
	CreateDynamicObject(669,1582.9000000,-1375.1000000,13.1000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (19)
	CreateDynamicObject(669,1611.5000000,-1422.4000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (20)
	CreateDynamicObject(669,1589.9000000,-1423.7000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (21)
	CreateDynamicObject(669,1580.5000000,-1409.3000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (22)
	CreateDynamicObject(669,1550.9000000,-1209.7000000,19.0000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (23)
	CreateDynamicObject(669,1528.1000000,-1208.9000000,18.2000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (24)
	CreateDynamicObject(703,1639.8000000,-1361.6000000,16.7000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree7_big) (1)
	CreateDynamicObject(703,1617.2000000,-1370.4000000,14.3000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree7_big) (2)
	CreateDynamicObject(703,1629.5000000,-1312.5000000,35.0000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree7_big) (3)
	CreateDynamicObject(703,1613.1000000,-1315.2000000,34.1000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree7_big) (4)
	CreateDynamicObject(703,1598.2000000,-1304.3000000,36.2000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree7_big) (5)
	CreateDynamicObject(703,1606.2000000,-1347.1000000,28.9000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree7_big) (6)
	CreateDynamicObject(703,1616.7000000,-1370.6000000,27.6000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree7_big) (7)
	CreateDynamicObject(703,1586.7000000,-1372.8000000,27.8000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree7_big) (8)
	CreateDynamicObject(711,1636.3000000,-1286.9000000,19.8000000,0.0000000,0.0000000,0.0000000); //object(vgs_palm02) (1)
	CreateDynamicObject(711,1588.0000000,-1280.7000000,22.5000000,0.0000000,0.0000000,0.0000000); //object(vgs_palm02) (2)
	CreateDynamicObject(711,1593.3000000,-1314.5000000,22.4000000,0.0000000,0.0000000,0.0000000); //object(vgs_palm02) (3)
	CreateDynamicObject(711,1615.4000000,-1337.9000000,22.3000000,0.0000000,0.0000000,0.0000000); //object(vgs_palm02) (4)
	CreateDynamicObject(711,1594.0000000,-1327.9000000,37.3000000,0.0000000,0.0000000,0.0000000); //object(vgs_palm02) (5)
	CreateDynamicObject(711,1631.7000000,-1301.1000000,43.6000000,0.0000000,0.0000000,0.0000000); //object(vgs_palm02) (6)
	CreateDynamicObject(711,1701.6000000,-1263.7000000,19.4000000,0.0000000,0.0000000,0.0000000); //object(vgs_palm02) (7)
	CreateDynamicObject(711,1698.6000000,-1234.9000000,20.0000000,0.0000000,0.0000000,0.0000000); //object(vgs_palm02) (8)
	CreateDynamicObject(727,1638.1000000,-1284.8000000,39.2000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly04) (1)
	CreateDynamicObject(727,1535.0000000,-1319.0000000,15.3000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly04) (2)
	CreateDynamicObject(727,1515.7000000,-1319.4000000,14.1000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly04) (3)
	CreateDynamicObject(727,1539.2000000,-1287.7000000,14.6000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly04) (4)
	CreateDynamicObject(727,1514.8000000,-1280.7000000,13.6000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly04) (5)
	CreateDynamicObject(727,1488.0000000,-1287.5000000,14.3000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly04) (6)
	CreateDynamicObject(727,1582.9000000,-1432.4000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly04) (7)
	CreateDynamicObject(727,1502.6000000,-1309.4000000,13.3000000,0.0000000,0.0000000,0.0000000); //object(tree_hipoly04) (8)
	CreateDynamicObject(769,1603.8000000,-1371.8000000,27.6000000,0.0000000,0.0000000,0.0000000); //object(locust_hi) (1)
	CreateDynamicObject(769,1618.6000000,-1281.3000000,41.8000000,0.0000000,0.0000000,0.0000000); //object(locust_hi) (2)
	CreateDynamicObject(769,1700.6000000,-1330.7000000,16.3000000,0.0000000,0.0000000,0.0000000); //object(locust_hi) (3)
	CreateDynamicObject(769,1699.6000000,-1363.9000000,16.3000000,0.0000000,0.0000000,0.0000000); //object(locust_hi) (4)
	CreateDynamicObject(769,1679.2000000,-1319.1000000,16.5000000,0.0000000,0.0000000,0.0000000); //object(locust_hi) (5)
	CreateDynamicObject(769,1626.9000000,-1253.5000000,15.6000000,0.0000000,0.0000000,0.0000000); //object(locust_hi) (6)
	CreateDynamicObject(769,1626.7000000,-1227.5000000,15.6000000,0.0000000,0.0000000,0.0000000); //object(locust_hi) (7)
	CreateDynamicObject(769,1571.2000000,-1313.1000000,16.0000000,0.0000000,0.0000000,0.0000000); //object(locust_hi) (8)
	CreateDynamicObject(773,1631.5000000,-1315.6000000,15.6000000,0.0000000,0.0000000,0.0000000); //object(elmdead_hi) (1)
	CreateDynamicObject(773,1647.4000000,-1267.6000000,13.8000000,0.0000000,0.0000000,0.0000000); //object(elmdead_hi) (2)
	CreateDynamicObject(774,1621.6000000,-1261.3000000,45.4000000,0.0000000,0.0000000,0.0000000); //object(elmsparse_hi) (1)
	CreateDynamicObject(774,1602.4000000,-1280.2000000,41.8000000,0.0000000,0.0000000,0.0000000); //object(elmsparse_hi) (2)
	CreateDynamicObject(781,1736.3000000,-1286.1000000,13.5000000,0.0000000,0.0000000,0.0000000); //object(elmwee_hism) (1)
	CreateDynamicObject(3920,1698.3000000,-1316.6000000,15.9000000,0.0000000,0.0000000,0.0000000); //object(lib_veg3) (4)
	CreateDynamicObject(3920,1704.5000000,-1322.7000000,15.9000000,0.0000000,0.0000000,270.0000000); //object(lib_veg3) (5)
	CreateDynamicObject(3920,1685.9000000,-1316.6000000,15.9000000,0.0000000,0.0000000,0.0000000); //object(lib_veg3) (6)
	CreateDynamicObject(3920,1659.0000000,-1316.5000000,15.9000000,0.0000000,0.0000000,0.0000000); //object(lib_veg3) (7)
	CreateDynamicObject(3920,1628.0000000,-1260.3000000,14.7000000,0.0000000,0.0000000,270.0000000); //object(lib_veg3) (8)
	CreateDynamicObject(3920,1640.8000000,-1316.5000000,15.9000000,0.0000000,0.0000000,0.0000000); //object(lib_veg3) (9)
	CreateDynamicObject(3920,1628.0000000,-1234.8000000,14.7000000,0.0000000,0.0000000,270.0000000); //object(lib_veg3) (10)
	CreateDynamicObject(3920,1628.0000000,-1286.9000000,14.7000000,0.0000000,0.0000000,270.0000000); //object(lib_veg3) (11)
	CreateDynamicObject(3920,1551.6000000,-1288.1000000,16.2000000,0.2500000,359.0000000,180.7540000); //object(lib_veg3) (12)
	CreateDynamicObject(3920,1592.5000000,-1376.6000000,14.5000000,0.0000000,0.0000000,270.0000000); //object(lib_veg3) (13)
	CreateDynamicObject(3920,1591.7000000,-1320.0000000,32.5000000,0.2420000,348.2450000,77.5480000); //object(lib_veg3) (14)
	CreateDynamicObject(3920,1595.0000000,-1307.9000000,35.2000000,0.2420000,348.2450000,73.5480000); //object(lib_veg3) (15)
	CreateDynamicObject(801,1545.7000000,-1287.2000000,17.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush01) (1)
	CreateDynamicObject(801,1538.0000000,-1286.3000000,14.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush01) (2)
	CreateDynamicObject(801,1525.3000000,-1275.5000000,13.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush01) (3)
	CreateDynamicObject(801,1513.4000000,-1282.0000000,13.6000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush01) (4)
	CreateDynamicObject(801,1490.4000000,-1287.8000000,13.6000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush01) (5)
	CreateDynamicObject(801,1515.9000000,-1316.4000000,14.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush01) (6)
	CreateDynamicObject(801,1536.2000000,-1316.2000000,15.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush01) (7)
	CreateDynamicObject(801,1571.6000000,-1312.3000000,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush01) (8)
	CreateDynamicObject(801,1593.3000000,-1312.9000000,16.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_bush01) (9)
	CreateDynamicObject(801,1620.7000000,-1285.7000000,17.1000000,0.0000000,0.0000000,80.0000000); //object(genveg_bush01) (10)
	CreateDynamicObject(801,1579.7000000,-1323.5000000,15.5000000,0.0000000,0.0000000,79.9970000); //object(genveg_bush01) (11)
	CreateDynamicObject(801,1626.4000000,-1332.0000000,16.3000000,0.0000000,0.0000000,79.9970000); //object(genveg_bush01) (12)
	CreateDynamicObject(801,1614.5000000,-1337.1000000,16.3000000,0.0000000,0.0000000,79.9970000); //object(genveg_bush01) (13)
	CreateDynamicObject(801,1591.5000000,-1340.8000000,15.5000000,0.0000000,0.0000000,79.9970000); //object(genveg_bush01) (14)
	CreateDynamicObject(801,1591.5000000,-1425.0000000,12.6000000,0.0000000,0.0000000,189.9970000); //object(genveg_bush01) (15)
	CreateDynamicObject(801,1610.8000000,-1425.3000000,12.5000000,0.0000000,0.0000000,189.9920000); //object(genveg_bush01) (16)
	CreateDynamicObject(801,1583.3000000,-1434.0000000,12.5000000,0.0000000,0.0000000,189.9920000); //object(genveg_bush01) (17)
	CreateDynamicObject(801,1589.0000000,-1383.2000000,15.3000000,0.0000000,0.0000000,189.9920000); //object(genveg_bush01) (18)
	CreateDynamicObject(801,1581.8000000,-1375.7000000,13.1000000,0.0000000,0.0000000,189.9920000); //object(genveg_bush01) (19)
	CreateDynamicObject(801,1621.1000000,-1266.6000000,17.2000000,0.0000000,0.0000000,189.9920000); //object(genveg_bush01) (20)
	CreateDynamicObject(801,1627.5000000,-1266.9000000,15.6000000,0.0000000,0.0000000,189.9920000); //object(genveg_bush01) (21)
	CreateDynamicObject(801,1622.9000000,-1228.4000000,17.2000000,0.0000000,0.0000000,189.9920000); //object(genveg_bush01) (22)
	CreateDynamicObject(801,1603.5000000,-1209.7000000,16.5000000,0.0000000,0.0000000,189.9920000); //object(genveg_bush01) (23)
	CreateDynamicObject(801,1611.6000000,-1235.4000000,16.5000000,0.0000000,0.0000000,189.9920000); //object(genveg_bush01) (24)
	CreateDynamicObject(801,1603.1000000,-1282.1000000,16.5000000,0.0000000,0.0000000,189.9920000); //object(genveg_bush01) (25)
	CreateDynamicObject(801,1630.4000000,-1356.6000000,16.3000000,0.0000000,0.0000000,189.9920000); //object(genveg_bush01) (26)
	CreateDynamicObject(801,1631.8000000,-1346.7000000,16.3000000,0.0000000,0.0000000,189.9920000); //object(genveg_bush01) (27)
	CreateDynamicObject(801,1662.7000000,-1319.2000000,16.5000000,0.0000000,0.0000000,189.9920000); //object(genveg_bush01) (28)
	CreateDynamicObject(801,1699.4000000,-1329.4000000,16.3000000,0.0000000,0.0000000,189.9920000); //object(genveg_bush01) (29)
	CreateDynamicObject(801,1701.0000000,-1355.6000000,16.3000000,0.0000000,0.0000000,189.9920000); //object(genveg_bush01) (30)
	CreateDynamicObject(806,1662.5000000,-1287.1000000,17.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass) (4)
	CreateDynamicObject(806,1649.2000000,-1309.2000000,18.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass) (5)
	CreateDynamicObject(806,1599.3000000,-1291.5000000,20.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass) (6)
	CreateDynamicObject(806,1587.6000000,-1281.3000000,20.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass) (8)
	CreateDynamicObject(806,1564.1000000,-1286.0000000,21.0000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass) (9)
	CreateDynamicObject(806,1547.0000000,-1287.3000000,21.0000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass) (10)
	CreateDynamicObject(806,1530.2000000,-1310.5000000,18.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass) (11)
	CreateDynamicObject(806,1501.2000000,-1308.9000000,17.0000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass) (12)
	CreateDynamicObject(806,1488.9000000,-1289.3000000,16.6000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass) (13)
	CreateDynamicObject(806,1616.0000000,-1310.2000000,20.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass) (14)
	CreateDynamicObject(806,1614.0000000,-1380.3000000,17.6000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass) (15)
	CreateDynamicObject(806,1594.6000000,-1369.7000000,18.1000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass) (16)
	CreateDynamicObject(806,1584.8000000,-1366.0000000,19.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass) (17)
	CreateDynamicObject(806,1565.7000000,-1318.0000000,19.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass) (18)
	CreateDynamicObject(806,1554.4000000,-1287.3000000,21.0000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass) (19)
	CreateDynamicObject(806,1620.9000000,-1242.3000000,20.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass) (20)
	CreateDynamicObject(806,1646.1000000,-1258.3000000,17.6000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass) (21)
	CreateDynamicObject(806,1628.1000000,-1223.9000000,17.6000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass) (22)
	CreateDynamicObject(806,1680.6000000,-1318.4000000,20.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass) (23)
	CreateDynamicObject(820,1698.2000000,-1279.6000000,13.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass04) (2)
	CreateDynamicObject(820,1699.4000000,-1261.0000000,13.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass04) (3)
	CreateDynamicObject(820,1699.2000000,-1244.0000000,14.0000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass04) (4)
	CreateDynamicObject(820,1686.7000000,-1242.2000000,14.0000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass04) (5)
	CreateDynamicObject(820,1681.2000000,-1285.2000000,13.0000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass04) (6)
	CreateDynamicObject(820,1678.4000000,-1290.4000000,13.1000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass04) (7)
	CreateDynamicObject(820,1677.5000000,-1286.7000000,13.0000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass04) (8)
	CreateDynamicObject(820,1638.8000000,-1283.8000000,13.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass04) (9)
	CreateDynamicObject(820,1599.5000000,-1262.8000000,16.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass04) (10)
	CreateDynamicObject(820,1599.1000000,-1226.3000000,16.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass04) (11)
	CreateDynamicObject(820,1621.8000000,-1238.7000000,17.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass04) (12)
	CreateDynamicObject(820,1647.5000000,-1319.5000000,16.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass04) (13)
	CreateDynamicObject(820,1627.4000000,-1345.3000000,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass04) (14)
	CreateDynamicObject(820,1590.7000000,-1367.6000000,15.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass04) (15)
	CreateDynamicObject(820,1571.7000000,-1315.9000000,15.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass04) (16)
	CreateDynamicObject(820,1592.6000000,-1330.0000000,15.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass04) (17)
	CreateDynamicObject(820,1698.5000000,-1329.0000000,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass04) (18)
	CreateDynamicObject(820,1699.4000000,-1367.9000000,16.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass04) (19)
	CreateDynamicObject(855,1665.6000000,-1313.6000000,13.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (25)
	CreateDynamicObject(855,1657.8000000,-1310.8000000,13.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (26)
	CreateDynamicObject(855,1659.7000000,-1303.8000000,13.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (27)
	CreateDynamicObject(855,1499.8000000,-1306.0000000,13.0000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (28)
	CreateDynamicObject(855,1502.0000000,-1290.5000000,13.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (29)
	CreateDynamicObject(855,1500.1000000,-1279.0000000,13.6000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (30)
	CreateDynamicObject(855,1501.2000000,-1284.3000000,13.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (31)
	CreateDynamicObject(855,1545.1000000,-1292.1000000,15.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (32)
	CreateDynamicObject(855,1573.7000000,-1312.0000000,16.4000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (33)
	CreateDynamicObject(855,1619.4000000,-1288.7000000,16.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (34)
	CreateDynamicObject(855,1635.3000000,-1331.3000000,16.3000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (35)
	CreateDynamicObject(855,1622.5000000,-1365.6000000,16.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (36)
	CreateDynamicObject(855,1581.3000000,-1359.5000000,15.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (37)
	CreateDynamicObject(855,1596.0000000,-1338.2000000,16.2000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (38)
	CreateDynamicObject(855,1619.9000000,-1271.3000000,16.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (39)
	CreateDynamicObject(855,1623.8000000,-1210.1000000,16.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (40)
	CreateDynamicObject(855,1642.5000000,-1213.6000000,13.8000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (41)
	CreateDynamicObject(855,1613.1000000,-1417.6000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (42)
	CreateDynamicObject(855,1595.1000000,-1417.2000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (43)
	CreateDynamicObject(855,1582.3000000,-1426.0000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass01) (44)
	CreateDynamicObject(872,1609.5000000,-1421.7000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(gen_tallgrsnew) (1)
	CreateDynamicObject(872,1584.4000000,-1429.1000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(gen_tallgrsnew) (2)
	CreateDynamicObject(4509,1696.2000000,-1304.6000000,15.2000000,0.0000000,0.0000000,0.0000000); //object(cuntw_roadblock05ld) (6)
	CreateDynamicObject(4509,1591.7000000,-1390.1000000,30.5000000,0.0000000,0.0000000,278.0000000); //object(cuntw_roadblock05ld) (7)
	CreateDynamicObject(874,1610.2000000,-1279.8000000,18.2000000,0.0000000,0.0000000,0.0000000); //object(veg_procgrasspatch) (1)
	CreateDynamicObject(873,1652.5000000,-1343.3000000,18.2000000,0.0000000,0.0000000,0.0000000); //object(veg_procfpatch) (1)
	CreateDynamicObject(873,1652.9000000,-1358.7000000,18.2000000,0.0000000,0.0000000,0.0000000); //object(veg_procfpatch) (2)
	CreateDynamicObject(873,1657.8000000,-1331.4000000,18.2000000,0.0000000,0.0000000,0.0000000); //object(veg_procfpatch) (3)
	CreateDynamicObject(875,1588.7000000,-1428.9000000,14.3000000,0.0000000,0.0000000,0.0000000); //object(veg_procfpatch01) (1)
	CreateDynamicObject(875,1595.4000000,-1238.3000000,18.2000000,0.0000000,0.0000000,0.0000000); //object(veg_procfpatch01) (2)
	CreateDynamicObject(3594,1616.2000000,-1260.3000000,17.1000000,0.0000000,0.0000000,0.0000000); //object(la_fuckcar1) (6)
	CreateDynamicObject(3594,1604.7000000,-1299.7000000,16.9000000,0.0000000,0.0000000,50.0000000); //object(la_fuckcar1) (7)
	CreateDynamicObject(3594,1602.1000000,-1308.6000000,16.9000000,0.0000000,0.0000000,129.9990000); //object(la_fuckcar1) (8)
	CreateDynamicObject(3594,1618.3000000,-1315.7000000,16.8000000,0.0000000,0.0000000,209.9960000); //object(la_fuckcar1) (9)
	CreateDynamicObject(3594,1616.0000000,-1342.4000000,16.5000000,355.5000000,0.0000000,159.9930000); //object(la_fuckcar1) (10)
	CreateDynamicObject(3594,1596.4000000,-1353.9000000,15.7000000,355.4960000,0.0000000,189.9880000); //object(la_fuckcar1) (11)
	CreateDynamicObject(3594,1604.2000000,-1373.8000000,14.2000000,358.7460000,0.0000000,251.9870000); //object(la_fuckcar1) (12)
	CreateDynamicObject(3594,1599.6000000,-1428.7000000,13.0000000,358.4940000,357.2490000,301.9100000); //object(la_fuckcar1) (13)
	CreateDynamicObject(3594,1614.0000000,-1425.7000000,13.0000000,358.4890000,357.2480000,301.9100000); //object(la_fuckcar1) (14)
	CreateDynamicObject(3594,1607.1000000,-1428.1000000,13.0000000,358.4890000,357.2480000,261.9100000); //object(la_fuckcar1) (15)
	CreateDynamicObject(3594,1567.7000000,-1296.2000000,16.5000000,2.2350000,357.2410000,272.0890000); //object(la_fuckcar1) (16)
	CreateDynamicObject(3594,1563.8000000,-1301.2000000,16.5000000,2.2300000,357.2370000,322.0870000); //object(la_fuckcar1) (18)
	CreateDynamicObject(3594,1543.1000000,-1291.9000000,15.5000000,357.9800000,357.2320000,81.8810000); //object(la_fuckcar1) (19)
	CreateDynamicObject(3594,1511.2000000,-1278.6000000,14.2000000,357.9790000,357.2310000,141.8760000); //object(la_fuckcar1) (20)
	CreateDynamicObject(3594,1517.7000000,-1308.0000000,14.2000000,357.9730000,357.2260000,141.8720000); //object(la_fuckcar1) (21)
	CreateDynamicObject(3594,1680.9000000,-1276.4000000,14.4000000,357.9730000,357.2260000,141.8720000); //object(la_fuckcar1) (22)
	CreateDynamicObject(3594,1630.9000000,-1269.9000000,14.5000000,357.9730000,357.2260000,141.8720000); //object(la_fuckcar1) (23)
	CreateDynamicObject(13591,1583.2000000,-1329.3000000,15.9000000,0.0000000,0.0000000,50.0000000); //object(kickcar28) (3)
	CreateDynamicObject(13591,1586.7000000,-1337.4000000,15.9000000,0.0000000,0.0000000,249.9990000); //object(kickcar28) (4)
	CreateDynamicObject(2676,1603.4000000,-1305.0000000,16.4000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8) (2)
	CreateDynamicObject(2676,1602.9000000,-1295.2000000,16.4000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8) (3)
	CreateDynamicObject(2676,1621.1000000,-1320.9000000,16.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8) (4)
	CreateDynamicObject(2676,1617.8000000,-1320.2000000,16.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8) (5)
	CreateDynamicObject(2676,1611.2000000,-1343.2000000,15.9000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8) (6)
	CreateDynamicObject(2676,1607.0000000,-1377.6000000,13.9000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8) (7)
	CreateDynamicObject(2676,1599.9000000,-1422.1000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8) (8)
	CreateDynamicObject(2676,1606.9000000,-1425.3000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8) (9)
	CreateDynamicObject(2676,1598.4000000,-1432.9000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8) (10)
	CreateDynamicObject(2676,1592.4000000,-1433.5000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8) (11)
	CreateDynamicObject(2676,1584.7000000,-1386.6000000,13.2000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8) (12)
	CreateDynamicObject(2676,1587.9000000,-1330.2000000,15.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8) (13)
	CreateDynamicObject(2676,1578.8000000,-1325.2000000,15.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8) (14)
	CreateDynamicObject(2676,1557.9000000,-1315.9000000,15.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8) (15)
	CreateDynamicObject(2676,1564.2000000,-1326.8000000,15.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8) (16)
	CreateDynamicObject(2676,1546.8000000,-1328.2000000,15.6000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8) (17)
	CreateDynamicObject(2676,1615.4000000,-1265.6000000,16.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_8) (18)
	CreateDynamicObject(2676,1599.3000000,-1248.8000000,16.7000000,0.0000000,0.0000000,90.0000000); //object(proc_rubbish_8) (19)
	CreateDynamicObject(2676,1615.7000000,-1243.7000000,16.7000000,0.0000000,0.0000000,130.0000000); //object(proc_rubbish_8) (20)
	CreateDynamicObject(2676,1605.7000000,-1234.5000000,16.7000000,0.0000000,0.0000000,189.9960000); //object(proc_rubbish_8) (21)
	CreateDynamicObject(2676,1600.5000000,-1266.1000000,16.7000000,0.0000000,0.0000000,239.9920000); //object(proc_rubbish_8) (22)
	CreateDynamicObject(2676,1592.2000000,-1274.8000000,16.7000000,0.0000000,0.0000000,319.9910000); //object(proc_rubbish_8) (23)
	CreateDynamicObject(2676,1584.4000000,-1280.4000000,16.7000000,0.0000000,0.0000000,9.9880000); //object(proc_rubbish_8) (24)
	CreateDynamicObject(2676,1569.8000000,-1280.0000000,16.6000000,0.0000000,0.0000000,59.9850000); //object(proc_rubbish_8) (26)
	CreateDynamicObject(2676,1635.3000000,-1274.6000000,14.0000000,0.0000000,0.0000000,59.9850000); //object(proc_rubbish_8) (27)
	CreateDynamicObject(2676,1638.5000000,-1271.3000000,14.0000000,0.0000000,0.0000000,119.9850000); //object(proc_rubbish_8) (28)
	CreateDynamicObject(2676,1635.3000000,-1271.3000000,14.0000000,0.0000000,0.0000000,169.9820000); //object(proc_rubbish_8) (29)
	CreateDynamicObject(2676,1647.1000000,-1265.1000000,14.0000000,0.0000000,0.0000000,239.9810000); //object(proc_rubbish_8) (30)
	CreateDynamicObject(2676,1646.1000000,-1261.2000000,14.0000000,0.0000000,0.0000000,281.9800000); //object(proc_rubbish_8) (31)
	CreateDynamicObject(2676,1650.5000000,-1248.6000000,14.0000000,0.0000000,0.0000000,331.9750000); //object(proc_rubbish_8) (32)
	CreateDynamicObject(2676,1643.7000000,-1227.0000000,14.0000000,0.0000000,0.0000000,11.9740000); //object(proc_rubbish_8) (33)
	CreateDynamicObject(2676,1642.7000000,-1231.4000000,14.0000000,0.0000000,0.0000000,61.9700000); //object(proc_rubbish_8) (34)
	CreateDynamicObject(2676,1629.4000000,-1240.9000000,14.0000000,0.0000000,0.0000000,121.9680000); //object(proc_rubbish_8) (35)
	CreateDynamicObject(2676,1631.4000000,-1237.0000000,14.0000000,0.0000000,0.0000000,171.9650000); //object(proc_rubbish_8) (36)
	CreateDynamicObject(2676,1633.8000000,-1240.7000000,14.0000000,0.0000000,0.0000000,231.9640000); //object(proc_rubbish_8) (37)
	CreateDynamicObject(2677,1612.3000000,-1235.4000000,16.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7) (1)
	CreateDynamicObject(2677,1607.8000000,-1215.2000000,16.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7) (2)
	CreateDynamicObject(2677,1612.2000000,-1218.0000000,16.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7) (3)
	CreateDynamicObject(2677,1608.9000000,-1219.9000000,16.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7) (4)
	CreateDynamicObject(2677,1610.0000000,-1217.4000000,16.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7) (5)
	CreateDynamicObject(2677,1616.5000000,-1215.9000000,16.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7) (6)
	CreateDynamicObject(2677,1605.0000000,-1213.9000000,16.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7) (7)
	CreateDynamicObject(2677,1638.9000000,-1213.2000000,14.1000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7) (8)
	CreateDynamicObject(2677,1644.0000000,-1221.5000000,14.1000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7) (9)
	CreateDynamicObject(2677,1636.3000000,-1324.3000000,16.7000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7) (10)
	CreateDynamicObject(2677,1636.7000000,-1326.6000000,16.8000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_7) (11)
	CreateDynamicObject(2677,1634.9000000,-1322.7000000,16.8000000,0.0000000,0.0000000,70.0000000); //object(proc_rubbish_7) (12)
	CreateDynamicObject(2677,1629.2000000,-1340.2000000,16.8000000,0.0000000,0.0000000,69.9990000); //object(proc_rubbish_7) (13)
	CreateDynamicObject(2677,1633.5000000,-1341.5000000,16.8000000,0.0000000,0.0000000,89.9990000); //object(proc_rubbish_7) (14)
	CreateDynamicObject(2677,1633.1000000,-1338.4000000,16.8000000,0.0000000,0.0000000,89.9950000); //object(proc_rubbish_7) (15)
	CreateDynamicObject(2677,1641.5000000,-1349.5000000,16.8000000,0.0000000,0.0000000,89.9950000); //object(proc_rubbish_7) (16)
	CreateDynamicObject(2677,1643.9000000,-1346.6000000,16.8000000,0.0000000,0.0000000,89.9950000); //object(proc_rubbish_7) (17)
	CreateDynamicObject(12961,1607.3000000,-1260.6000000,17.1000000,0.0000000,0.0000000,0.0000000); //object(sw_hedstones) (1)
	CreateDynamicObject(12957,1601.0000000,-1283.8000000,17.3000000,0.0000000,0.0000000,50.0000000); //object(sw_pickupwreck01) (1)
	CreateDynamicObject(12957,1601.3000000,-1278.3000000,17.3000000,0.0000000,0.0000000,159.9990000); //object(sw_pickupwreck01) (2)
	CreateDynamicObject(1299,1605.6000000,-1297.3000000,16.7000000,0.0000000,0.0000000,0.0000000); //object(smashboxpile) (1)
	CreateDynamicObject(1299,1621.7000000,-1319.8000000,16.9000000,0.0000000,0.0000000,0.0000000); //object(smashboxpile) (2)
	CreateDynamicObject(1299,1622.0000000,-1351.7000000,17.0000000,0.0000000,0.0000000,0.0000000); //object(smashboxpile) (3)
	CreateDynamicObject(1299,1603.1000000,-1423.2000000,12.9000000,0.0000000,0.0000000,0.0000000); //object(smashboxpile) (4)
	CreateDynamicObject(1299,1605.9000000,-1420.0000000,13.0000000,0.0000000,0.0000000,50.0000000); //object(smashboxpile) (5)
	CreateDynamicObject(1299,1598.7000000,-1426.0000000,13.0000000,0.0000000,0.0000000,99.9990000); //object(smashboxpile) (6)
	CreateDynamicObject(1299,1601.2000000,-1212.6000000,16.9000000,0.0000000,0.0000000,99.9980000); //object(smashboxpile) (7)
	CreateDynamicObject(1299,1683.1000000,-1320.2000000,16.9000000,0.0000000,0.0000000,99.9980000); //object(smashboxpile) (8)
	CreateDynamicObject(1349,1608.9000000,-1303.7000000,16.9000000,0.0000000,0.0000000,0.0000000); //object(cj_shtrolly) (4)
	CreateDynamicObject(1349,1608.8000000,-1305.9000000,16.9000000,0.0000000,0.0000000,60.0000000); //object(cj_shtrolly) (5)
	CreateDynamicObject(1349,1607.6000000,-1304.3000000,16.9000000,0.0000000,0.0000000,139.9960000); //object(cj_shtrolly) (6)
	CreateDynamicObject(1349,1609.5000000,-1301.1000000,16.9000000,0.0000000,0.0000000,209.9930000); //object(cj_shtrolly) (7)




	//* ------------------------------------- End ------------------------
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
   	if(dialogid == DIALOG_AGE)
	{
	    if(!response)
       	{
         	Kick(playerid);
       	}
       	else
       	{
		    if(strlen(inputtext))
		    {
		        new age = strval(inputtext);
		        if(age > 100 || age < 16)
				{
                    ShowPlayerDialog(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, "- Age -","How old are you??\n{FF0000}(( 16 - 100 ))","Answer","Quit");
				}
				else
				{
					PlayerInfo[playerid][pAge] = age;
					new
						string[ 64 ]
					;
					format(string, sizeof(string), "INFO: You're {3BB9FF}%d years old.",age);
					SendClientMessage(playerid, -1, string);
     				GivePlayerCash(playerid, 600);
					SaveAccountStats(playerid);
					SpawnPlayer(playerid);
				}
			}
			else
			{
			    return 0;
			}
		}
	}
	if(dialogid == DIALOG_SEX)
	{
        if(response)
		{
  			PlayerInfo[playerid][pSex] = 1;
			SendClientMessage(playerid, -1, "INFO: You are {3BB9FF}male.");
			SetPlayerSkin(playerid, 60);
			PlayerInfo[playerid][pSkin] = 60;
			ShowPlayerDialog(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, "- Age -","How old are you??\n{FF0000}(( 16 - 100 ))","Answer","Quit");
		}
		else
		{
			PlayerInfo[playerid][pSex] = 2;
			SendClientMessage(playerid, -1, "INFO: You are {3BB9FF}female.");
			SetPlayerSkin(playerid, 233);
			PlayerInfo[playerid][pSkin] = 233;
			ShowPlayerDialog(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, "- Age -","How old are you??\n{FF0000}(( 16 - 100 ))","Answer","Quit");
		}
	}
    switch( dialogid )
    {
        case DIALOG_REGISTER:
        {
            if (!response) return Kick(playerid);
            if(response)
            {
                if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_INPUT, "Registering...","You have entered an invalid password.\nType your password below to register a new account.","Register","Quit");
                new INI:File = INI_Open(UserPath(playerid));
                INI_SetTag(File,"data");
                INI_WriteInt(File,"Password",udb_hash(inputtext));
                INI_WriteInt(File,"Cash",0);
                INI_WriteInt(File,"Admin",0);
                INI_WriteInt(File,"Sex",0);
                INI_WriteInt(File,"Age",0);
                INI_WriteFloat(File,"Pos_x",0);
    			INI_WriteFloat(File,"Pos_y",0);
    			INI_WriteFloat(File,"Pos_z",0);
   			 	INI_WriteInt(File,"Skin",0);
   			 	INI_WriteInt(File,"Team",0);
   			 	INI_WriteInt(File,"Accent",0);
                INI_Close(File);
                
                ShowPlayerDialog(playerid, DIALOG_SEX, DIALOG_STYLE_MSGBOX, "- Sex -","What gender are you?","Male","Female");
            }
        }
        case DIALOG_LOGIN:
        {
            if ( !response ) return Kick ( playerid );
            if( response )
            {
                if(udb_hash(inputtext) == PlayerInfo[playerid][pPass])
                {
                    INI_ParseFile(UserPath(playerid), "LoadUser_%s", .bExtra = true, .extra = playerid);
                    new
                        tmp2[ 256 ],
                        playername2[ MAX_PLAYER_NAME ]
					;
	    			GetPlayerName(playerid, playername2, sizeof(playername2));
   					format(tmp2, sizeof(tmp2), "~w~Welcome ~n~~g~%s", playername2);
					GameTextForPlayer(playerid, tmp2, 5000, 1);
					SetTimerEx("UnsetFirstSpawn", 5000, false, "i", playerid);
                    GivePlayerCash(playerid, PlayerInfo[playerid][pCash]);
   					SetSpawnInfo(playerid, PlayerInfo[playerid][pTeam], PlayerInfo[playerid][pSkin], PlayerInfo[playerid][pPos_x], PlayerInfo[playerid][pPos_y], PlayerInfo[playerid][pPos_z], 1.0, -1, -1, -1, -1, -1, -1);
				}
                else
                {
                    ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_INPUT,"Login","You have entered an incorrect password.\nType your password below to login.","Login","Quit");
                }
                return 1;
            }
        }
    }
    return 1;
}
public ClearChat(playerid)
{
	SendClientMessage(playerid, COLOR_FADE1, " ");
	SendClientMessage(playerid, COLOR_FADE1, " ");
	SendClientMessage(playerid, COLOR_FADE1, " ");
	SendClientMessage(playerid, COLOR_FADE1, " ");
	SendClientMessage(playerid, COLOR_FADE1, " ");
	SendClientMessage(playerid, COLOR_FADE1, " ");
	SendClientMessage(playerid, COLOR_FADE1, " ");
	SendClientMessage(playerid, COLOR_FADE1, " ");
	SendClientMessage(playerid, COLOR_FADE1, " ");
	SendClientMessage(playerid, COLOR_FADE1, " ");
	SendClientMessage(playerid, COLOR_FADE1, " ");
	return 1;
}
public OnPlayerSpawn(playerid)
{
   // SetTimer("ClearChat", 500, true);
	SetPlayerSkin(playerid, 287);
	GivePlayerWeapon(playerid, 25,20);
	GivePlayerWeapon(playerid, 30,20);
	SetPlayerInterior(playerid, 0);
	print("Test test test");
   	if(IsPlayerConnected(playerid))
	{
    	SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
    	SetPlayerToTeamColor(playerid);
    	Logged[playerid] = 1;
	}
	if(PlayerInfo[playerid][pPos_x] == 0 && PlayerInfo[playerid][pPos_y] == 0)
    {
        SetPlayerPos(playerid, 1271.3654,181.0756,19.4705);
        Logged[playerid] = 1;
		
    }
    else
	{
		SetPlayerPos(playerid, PlayerInfo[playerid][pPos_x], PlayerInfo[playerid][pPos_y], PlayerInfo[playerid][pPos_z]);
		Logged[playerid] = 1;
 	}
    return 1;
}

public OnPlayerText(playerid, text[])
{
	new
		realchat = 1,
		string[ 128 ]
	;
	if(IsPlayerConnected(playerid))
	{
		if(realchat)
		{
			if(PlayerInfo[playerid][pAccent] == 0)
			{
				format(string, sizeof(string), "%s says: %s", RPName(playerid), text);
				ProxDetector(20.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
			}
			else
			{
				new
					accent[20]
				;
				switch(PlayerInfo[playerid][pAccent])
				{
					case 1: accent = "Russian";
					case 2: accent = "Italian";
					case 3: accent = "Germany";
					case 4: accent = "Japanese";
					case 5: accent = "French";
					case 6: accent = "Spain";
					case 7: accent = "China";
					case 8: accent = "British";
				}
				format(string, sizeof(string), "%s says: [%s Accent] %s", RPName(playerid), accent, text);
				ProxDetector(20.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
			}
			return 0;
		}
	}
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	SaveAccountStats(playerid);
    return 1;
}

function SetPlayerToTeamColor(playerid)
{
	if(IsPlayerConnected(playerid))
	{
	    SetPlayerColor(playerid,TEAM_HIT_COLOR);
	}
}

function OOCOff(color,const string[])
{
	foreach (Player,i)
	{
		if(!gOoc{i})
		{
			SendClientMessage(i, color, string);
		}
	}
}

function SaveAccountStats(playerid)
{
	if(Logged[playerid] == 1)
	{
	new
		INI:File = INI_Open(UserPath(playerid))
	;
    INI_SetTag(File,"data");
    
   	PlayerInfo[playerid][pSkin] = GetPlayerSkin(playerid);
    PlayerInfo[playerid][pCash] = GetPlayerCash(playerid);
   	new
	   	Float:x,
	    Float:y,
		Float:z
	;
	GetPlayerPos(playerid,x,y,z);
	PlayerInfo[playerid][pPos_x] = x;
	PlayerInfo[playerid][pPos_y] = y;
	PlayerInfo[playerid][pPos_z] = z;
	
    INI_WriteInt(File,"Cash",PlayerInfo[playerid][pCash]);
    INI_WriteInt(File,"Admin",PlayerInfo[playerid][pAdmin]);
    INI_WriteInt(File,"Sex",PlayerInfo[playerid][pSex]);
    INI_WriteInt(File,"Age",PlayerInfo[playerid][pAge]);
    INI_WriteFloat(File,"Pos_x",PlayerInfo[playerid][pPos_x]);
    INI_WriteFloat(File,"Pos_y",PlayerInfo[playerid][pPos_y]);
    INI_WriteFloat(File,"Pos_z",PlayerInfo[playerid][pPos_z]);
    INI_WriteInt(File,"Skin",PlayerInfo[playerid][pSkin]);
    INI_WriteInt(File,"Team",PlayerInfo[playerid][pTeam]);
    INI_WriteInt(File,"Accent",PlayerInfo[playerid][pAccent]);
    INI_WriteInt(File,"InventoryStats",PlayerInfo[playerid][pInventoryStats]);
    //1
    INI_WriteInt(File,"Slot1ID",PlayerInfo[playerid][pSlot1ID]);
    INI_WriteInt(File,"Slot1Amount",PlayerInfo[playerid][pSlot1Amount]);
    //2
    INI_WriteInt(File,"Slot2ID",PlayerInfo[playerid][pSlot2ID]);
    INI_WriteInt(File,"Slot2Amount",PlayerInfo[playerid][pSlot2Amount]);
    //3
    INI_WriteInt(File,"Slot3ID",PlayerInfo[playerid][pSlot3ID]);
    INI_WriteInt(File,"Slot3Amount",PlayerInfo[playerid][pSlot3Amount]);
    //4
    INI_WriteInt(File,"Slot4ID",PlayerInfo[playerid][pSlot4ID]);
    INI_WriteInt(File,"Slot4Amount",PlayerInfo[playerid][pSlot4Amount]);
    //5
    INI_WriteInt(File,"Slot5ID",PlayerInfo[playerid][pSlot5ID]);
    INI_WriteInt(File,"Slot5Amount",PlayerInfo[playerid][pSlot5Amount]);
    //6
    INI_WriteInt(File,"Slot6ID",PlayerInfo[playerid][pSlot6ID]);
    INI_WriteInt(File,"Slot6Amount",PlayerInfo[playerid][pSlot6Amount]);
    //7
    INI_WriteInt(File,"Slot7ID",PlayerInfo[playerid][pSlot7ID]);
    INI_WriteInt(File,"Slot7Amount",PlayerInfo[playerid][pSlot7Amount]);
    //8
    INI_WriteInt(File,"Slot8ID",PlayerInfo[playerid][pSlot8ID]);
    INI_WriteInt(File,"Slot8Amount",PlayerInfo[playerid][pSlot8Amount]);
    //9
    INI_WriteInt(File,"Slot9ID",PlayerInfo[playerid][pSlot9ID]);
    INI_WriteInt(File,"Slot9Amount",PlayerInfo[playerid][pSlot9Amount]);
    //10
    INI_WriteInt(File,"Slot10ID",PlayerInfo[playerid][pSlot10ID]);
    INI_WriteInt(File,"Slot10Amount",PlayerInfo[playerid][pSlot10Amount]);
    //11
    INI_WriteInt(File,"Slot11ID",PlayerInfo[playerid][pSlot11ID]);
    INI_WriteInt(File,"Slot11Amount",PlayerInfo[playerid][pSlot11Amount]);
    //12
    INI_WriteInt(File,"Slot12ID",PlayerInfo[playerid][pSlot12ID]);
    INI_WriteInt(File,"Slot12Amount",PlayerInfo[playerid][pSlot12Amount]);
    //13
    INI_WriteInt(File,"Slot13ID",PlayerInfo[playerid][pSlot13ID]);
    INI_WriteInt(File,"Slot13Amount",PlayerInfo[playerid][pSlot13Amount]);
    //14
    INI_WriteInt(File,"Slot14ID",PlayerInfo[playerid][pSlot14ID]);
    INI_WriteInt(File,"Slot14Amount",PlayerInfo[playerid][pSlot14Amount]);
    //15
    INI_WriteInt(File,"Slot15ID",PlayerInfo[playerid][pSlot15ID]);
    INI_WriteInt(File,"Slot15Amount",PlayerInfo[playerid][pSlot15Amount]);
    //16
    INI_WriteInt(File,"Slot16ID",PlayerInfo[playerid][pSlot16ID]);
    INI_WriteInt(File,"Slot16Amount",PlayerInfo[playerid][pSlot16Amount]);
    //17
    INI_WriteInt(File,"Slot17ID",PlayerInfo[playerid][pSlot17ID]);
    INI_WriteInt(File,"Slot17Amount",PlayerInfo[playerid][pSlot17Amount]);
    //18
    INI_WriteInt(File,"Slot18ID",PlayerInfo[playerid][pSlot18ID]);
    INI_WriteInt(File,"Slot18Amount",PlayerInfo[playerid][pSlot18Amount]);
    //19
    INI_WriteInt(File,"Slot19ID",PlayerInfo[playerid][pSlot19ID]);
    INI_WriteInt(File,"Slot19Amount",PlayerInfo[playerid][pSlot19Amount]);
    //20
    INI_WriteInt(File,"Slot20ID",PlayerInfo[playerid][pSlot20ID]);
    INI_WriteInt(File,"Slot20Amount",PlayerInfo[playerid][pSlot20Amount]);
    //21
    INI_WriteInt(File,"Slot21ID",PlayerInfo[playerid][pSlot21ID]);
    INI_WriteInt(File,"Slot21Amount",PlayerInfo[playerid][pSlot21Amount]);
    //22
    INI_WriteInt(File,"Slot22ID",PlayerInfo[playerid][pSlot22ID]);
    INI_WriteInt(File,"Slot22Amount",PlayerInfo[playerid][pSlot22Amount]);
    //23
    INI_WriteInt(File,"Slot23ID",PlayerInfo[playerid][pSlot23ID]);
    INI_WriteInt(File,"Slot23Amount",PlayerInfo[playerid][pSlot23Amount]);
    //24
    INI_WriteInt(File,"Slot24ID",PlayerInfo[playerid][pSlot24ID]);
    INI_WriteInt(File,"Slot24Amount",PlayerInfo[playerid][pSlot24Amount]);
    //25
    INI_WriteInt(File,"Slot25ID",PlayerInfo[playerid][pSlot25ID]);
    INI_WriteInt(File,"Slot25Amount",PlayerInfo[playerid][pSlot25Amount]);
    //26
    INI_WriteInt(File,"Slot26ID",PlayerInfo[playerid][pSlot26ID]);
    INI_WriteInt(File,"Slot26Amount",PlayerInfo[playerid][pSlot26Amount]);
    //27
    INI_WriteInt(File,"Slot27ID",PlayerInfo[playerid][pSlot27ID]);
    INI_WriteInt(File,"Slot27Amount",PlayerInfo[playerid][pSlot27Amount]);
    //28
    INI_WriteInt(File,"Slot28ID",PlayerInfo[playerid][pSlot28ID]);
    INI_WriteInt(File,"Slot28Amount",PlayerInfo[playerid][pSlot28Amount]);
	//29
	INI_WriteInt(File,"Slot29ID",PlayerInfo[playerid][pSlot29ID]);
	INI_WriteInt(File,"Slot29Amount",PlayerInfo[playerid][pSlot29Amount]);
	//30
	INI_WriteInt(File,"Slot30ID",PlayerInfo[playerid][pSlot30ID]);
	INI_WriteInt(File,"Slot30Amount",PlayerInfo[playerid][pSlot30Amount]);
    
    INI_Close(File);
    }
    return 1;
}

function SaveAccounts()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			SaveAccountStats(i);
  		}
	}
}
function GameModeExitFunc()
{
 	GameModeExit();
	return 1;
}
//ItemInfo[MAX_OBJ][Idata][1]
/*
enum IInfo
{
	IObjectId,
	Idata[2],
	Float:Item_pos[3]
};
new ItemInfo[MAX_OBJ][IInfo];
*/
function LoadUser_data(playerid,name[],value[])
{
    INI_Int("Password",PlayerInfo[playerid][pPass]);
    INI_Int("Cash",PlayerInfo[playerid][pCash]);
    INI_Int("Admin",PlayerInfo[playerid][pAdmin]);
    INI_Int("Sex",PlayerInfo[playerid][pSex]);
    INI_Int("Age",PlayerInfo[playerid][pAge]);
    INI_Float("Pos_x",PlayerInfo[playerid][pPos_x]);
    INI_Float("Pos_y",PlayerInfo[playerid][pPos_y]);
    INI_Float("Pos_z",PlayerInfo[playerid][pPos_z]);
    INI_Int("Skin",PlayerInfo[playerid][pSkin]);
    INI_Int("Team",PlayerInfo[playerid][pTeam]);
    INI_Int("Accent",PlayerInfo[playerid][pAccent]);
    INI_Int("InventoryStats",PlayerInfo[playerid][pInventoryStats]);
    //----------------------------------------------
    // 1
    INI_Int("SlotID",PlayerInfo[playerid][pSlot1ID]);
    INI_Int("SlotAmount",PlayerInfo[playerid][pSlot1Amount]);
	// 2
    INI_Int("SlotID",PlayerInfo[playerid][pSlot2ID]);
    INI_Int("SlotAmount",PlayerInfo[playerid][pSlot2Amount]);
    // 3
    INI_Int("SlotID",PlayerInfo[playerid][pSlot3ID]);
    INI_Int("SlotAmount",PlayerInfo[playerid][pSlot3Amount]);
    // 4
    INI_Int("SlotID",PlayerInfo[playerid][pSlot4ID]);
    INI_Int("SlotAmount",PlayerInfo[playerid][pSlot4Amount]);
    // 5
    INI_Int("SlotID",PlayerInfo[playerid][pSlot5ID]);
    INI_Int("SlotAmount",PlayerInfo[playerid][pSlot5Amount]);
    // 6
    INI_Int("SlotID",PlayerInfo[playerid][pSlot6ID]);
    INI_Int("SlotAmount",PlayerInfo[playerid][pSlot6Amount]);
    // 7
    INI_Int("SlotID",PlayerInfo[playerid][pSlot7ID]);
    INI_Int("SlotAmount",PlayerInfo[playerid][pSlot7Amount]);
    // 8
    INI_Int("SlotID",PlayerInfo[playerid][pSlot8ID]);
    INI_Int("SlotAmount",PlayerInfo[playerid][pSlot8Amount]);
    // 9
    INI_Int("SlotID",PlayerInfo[playerid][pSlot9ID]);
    INI_Int("SlotAmount",PlayerInfo[playerid][pSlot9Amount]);
    // 10
    INI_Int("SlotID",PlayerInfo[playerid][pSlot10ID]);
    INI_Int("SlotAmount",PlayerInfo[playerid][pSlot10Amount]);
	// 11
    INI_Int("SlotID",PlayerInfo[playerid][pSlot11ID]);
    INI_Int("SlotAmount",PlayerInfo[playerid][pSlot11Amount]);
    // 12
    INI_Int("SlotID",PlayerInfo[playerid][pSlot12ID]);
    INI_Int("SlotAmount",PlayerInfo[playerid][pSlot12Amount]);
    // 13
    INI_Int("SlotID",PlayerInfo[playerid][pSlot13ID]);
    INI_Int("SlotAmount",PlayerInfo[playerid][pSlot13Amount]);
    // 14
    INI_Int("SlotID",PlayerInfo[playerid][pSlot14ID]);
    INI_Int("SlotAmount",PlayerInfo[playerid][pSlot14Amount]);
    // 15
    INI_Int("SlotID",PlayerInfo[playerid][pSlot15ID]);
    INI_Int("SlotAmount",PlayerInfo[playerid][pSlot15Amount]);
    // 16
    INI_Int("SlotID",PlayerInfo[playerid][pSlot16ID]);
    INI_Int("SlotAmount",PlayerInfo[playerid][pSlot16Amount]);
    // 17
    INI_Int("SlotID",PlayerInfo[playerid][pSlot17ID]);
    INI_Int("SlotAmount",PlayerInfo[playerid][pSlot17Amount]);
    // 18
    INI_Int("SlotID",PlayerInfo[playerid][pSlot18ID]);
	INI_Int("SlotAmount",PlayerInfo[playerid][pSlot18Amount]);
	// 19
	INI_Int("SlotID",PlayerInfo[playerid][pSlot19ID]);
	INI_Int("SlotAmount",PlayerInfo[playerid][pSlot19Amount]);
	// 20
	INI_Int("SlotID",PlayerInfo[playerid][pSlot20ID]);
	INI_Int("SlotAmount",PlayerInfo[playerid][pSlot20Amount]);
	// 21
	INI_Int("SlotID",PlayerInfo[playerid][pSlot21ID]);
	INI_Int("SlotAmount",PlayerInfo[playerid][pSlot21Amount]);
	// 22
	INI_Int("SlotID",PlayerInfo[playerid][pSlot22ID]);
	INI_Int("SlotAmount",PlayerInfo[playerid][pSlot22Amount]);
	// 23
	INI_Int("SlotID",PlayerInfo[playerid][pSlot23ID]);
	INI_Int("SlotAmount",PlayerInfo[playerid][pSlot23Amount]);
	// 24
	INI_Int("SlotID",PlayerInfo[playerid][pSlot24ID]);
	INI_Int("SlotAmount",PlayerInfo[playerid][pSlot24Amount]);
	// 25
	INI_Int("SlotID",PlayerInfo[playerid][pSlot25ID]);
	INI_Int("SlotAmount",PlayerInfo[playerid][pSlot25Amount]);
	// 26
	INI_Int("SlotID",PlayerInfo[playerid][pSlot26ID]);
	INI_Int("SlotAmount",PlayerInfo[playerid][pSlot26Amount]);
	// 27
	INI_Int("SlotID",PlayerInfo[playerid][pSlot27ID]);
	INI_Int("SlotAmount",PlayerInfo[playerid][pSlot27Amount]);
	// 28
	INI_Int("SlotID",PlayerInfo[playerid][pSlot28ID]);
	INI_Int("SlotAmount",PlayerInfo[playerid][pSlot28Amount]);
	// 29
	INI_Int("SlotID",PlayerInfo[playerid][pSlot29ID]);
	INI_Int("SlotAmount",PlayerInfo[playerid][pSlot29Amount]);
	// 30
	INI_Int("SlotID",PlayerInfo[playerid][pSlot30ID]);
	INI_Int("SlotAmount",PlayerInfo[playerid][pSlot30Amount]);
	//--------------------------------------------------
    return 1;
}

function MoneyUpdate(playerid)
{
	if(GetPlayerCash(playerid) < GetPlayerMoney(playerid))
	{
		foreach(Player, i)
		{
  			new const old_money = GetPlayerCash(playerid);
    		ResetPlayerCash(playerid), GivePlayerCash(playerid, old_money);
   		}
	}
 	return 1;
}

function ProxDetector(Float:radi, playerid, string[],col1,col2,col3,col4,col5)
{
	if(IsPlayerConnected(playerid))
	{
		new Float:posx, Float:posy, Float:posz;
		new BigEar[MAX_PLAYERS];
		new Float:oldposx, Float:oldposy, Float:oldposz;
		new Float:tempposx, Float:tempposy, Float:tempposz;
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		for(new i = 0; i < MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i) && (GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(i)))
			{
				if(!BigEar[i])
				{
					GetPlayerPos(i, posx, posy, posz);
					tempposx = (oldposx -posx);
					tempposy = (oldposy -posy);
					tempposz = (oldposz -posz);
					if (((tempposx < radi/16) && (tempposx > -radi/16)) && ((tempposy < radi/16) && (tempposy > -radi/16)) && ((tempposz < radi/16) && (tempposz > -radi/16)))
					{
						SendClientMessage(i, col1, string);
					}
					else if (((tempposx < radi/8) && (tempposx > -radi/8)) && ((tempposy < radi/8) && (tempposy > -radi/8)) && ((tempposz < radi/8) && (tempposz > -radi/8)))
					{
						SendClientMessage(i, col2, string);
					}
					else if (((tempposx < radi/4) && (tempposx > -radi/4)) && ((tempposy < radi/4) && (tempposy > -radi/4)) && ((tempposz < radi/4) && (tempposz > -radi/4)))
					{
						SendClientMessage(i, col3, string);
					}
					else if (((tempposx < radi/2) && (tempposx > -radi/2)) && ((tempposy < radi/2) && (tempposy > -radi/2)) && ((tempposz < radi/2) && (tempposz > -radi/2)))
					{
						SendClientMessage(i, col4, string);
					}
					else if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
					{
						SendClientMessage(i, col5, string);
					}
				}
				else
				{
					SendClientMessage(i, col1, string);
				}
			}
		}
	}
	return 1;
}

// ============ STOCKS ============
stock SendAdminMessage( color, string[] )
{
    foreach (Player,i)
    {
		if( PlayerInfo[ i] [ pAdmin ] > 1 )
		{
		    SendClientMessage( i, color, string );
		}
    }
}
/*
enum IInfo
{
	ItemID,
	IObjectId,
	Idata[2],
	Float:Item_pos[3]
}
new ItemInfo[MAX_OBJ][IInfo];
*/

stock CreateItem(itemid, Float:Xpos, Float:Ypos, Float:Zpos, ItemTypeID, ItemAmount)
{
	ItemInfo[itemid][Idata][0] = ItemTypeID;
	ItemInfo[itemid][Idata][1] = ItemAmount;
	ItemInfo[itemid][ItemID] = itemid;
    ItemInfo[itemid][Item_pos][0] = Xpos;
    ItemInfo[itemid][Item_pos][1] = Ypos;
    ItemInfo[itemid][Item_pos][2] = Zpos;
	new ItemObjectID = 0;
	//--------------------------- Vrsta itema ----------------------
	if(ItemInfo[itemid][Idata][0] == 0) { ItemObjectID = 2358; }
	if(ItemInfo[itemid][Idata][0] == 1) { ItemObjectID = 2040; }
	if(ItemInfo[itemid][Idata][0] == 2) { ItemObjectID = 2844; }
	if(ItemInfo[itemid][Idata][0] == 3) { ItemObjectID = 2060; }
	if(ItemInfo[itemid][Idata][0] == 4) { ItemObjectID = 1576; }
	if(ItemInfo[itemid][Idata][0] == 5) { ItemObjectID = 1577; }
	if(ItemInfo[itemid][Idata][0] == 6) { ItemObjectID = 1578; }
	if(ItemInfo[itemid][Idata][0] == 7) { ItemObjectID = 1580; }
	if(ItemInfo[itemid][Idata][0] == 8) { ItemObjectID = 1654; }
	if(ItemInfo[itemid][Idata][0] == 9) { ItemObjectID = 920; }
	if(ItemInfo[itemid][Idata][0] == 10) { ItemObjectID = 862; }
	if(ItemInfo[itemid][Idata][0] == 11) { ItemObjectID = 811; }
	if(ItemInfo[itemid][Idata][0] == 12) { ItemObjectID = 876; }
	if(ItemInfo[itemid][Idata][0] == 13) { ItemObjectID = 760; }
	if(ItemInfo[itemid][Idata][0] == 14) { ItemObjectID = 19473; }
	if(ItemInfo[itemid][Idata][0] == 15) { ItemObjectID = 1327; }
	if(ItemInfo[itemid][Idata][0] == 16) { ItemObjectID = 850; }
	if(ItemInfo[itemid][Idata][0] == 17) { ItemObjectID = 1219; }
	if(ItemInfo[itemid][Idata][0] == 18) { ItemObjectID = 2814; }
    if(ItemInfo[itemid][Idata][0] == 19) { ItemObjectID = 1668; }
    //--------------------------------------------------------------
    
    new string[64];
    
	if(ItemInfo[itemid][Idata][0] == 0) { format(string,sizeof(string),"Assault Ammo \nAmount: %d", ItemInfo[itemid][Idata][1]); }
	if(ItemInfo[itemid][Idata][0] == 1) { format(string,sizeof(string),"9mm Ammo \nAmount: %d", ItemInfo[itemid][Idata][1]); }
	if(ItemInfo[itemid][Idata][0] == 2) { format(string,sizeof(string),"Clothes \nAmount: %d", ItemInfo[itemid][Idata][1]); }
	if(ItemInfo[itemid][Idata][0] == 3) { format(string,sizeof(string),"Bandage \nAmount: %d", ItemInfo[itemid][Idata][1]); }
	if(ItemInfo[itemid][Idata][0] == 4) { format(string,sizeof(string),"Medic Pill A \nAmount: %d", ItemInfo[itemid][Idata][1]); }
	if(ItemInfo[itemid][Idata][0] == 5) { format(string,sizeof(string),"Medic Pill B \nAmount: %d", ItemInfo[itemid][Idata][1]); }
	if(ItemInfo[itemid][Idata][0] == 6) { format(string,sizeof(string),"Medic Pill C \nAmount: %d", ItemInfo[itemid][Idata][1]); }
	if(ItemInfo[itemid][Idata][0] == 7) { format(string,sizeof(string),"Cocain \nAmount: %d", ItemInfo[itemid][Idata][1]); }
	if(ItemInfo[itemid][Idata][0] == 8) { format(string,sizeof(string),"C4 Explosive \nAmount: %d", ItemInfo[itemid][Idata][1]); }
	if(ItemInfo[itemid][Idata][0] == 9) { format(string,sizeof(string),"Car Engine \nAmount: %d", ItemInfo[itemid][Idata][1]); }
	if(ItemInfo[itemid][Idata][0] == 10) { format(string,sizeof(string),"Poppy \nAmount: %d", ItemInfo[itemid][Idata][1]); }
	if(ItemInfo[itemid][Idata][0] == 11) { format(string,sizeof(string),"Gold Gazania \nAmount: %d", ItemInfo[itemid][Idata][1]); }
	if(ItemInfo[itemid][Idata][0] == 12) { format(string,sizeof(string),"Sage \nAmount: %d", ItemInfo[itemid][Idata][1]); }
	if(ItemInfo[itemid][Idata][0] == 13) { format(string,sizeof(string),"Yellow Plant \nAmount: %d", ItemInfo[itemid][Idata][1]); }
	if(ItemInfo[itemid][Idata][0] == 14) { format(string,sizeof(string),"Weed \nAmount: %d", ItemInfo[itemid][Idata][1]); }
	if(ItemInfo[itemid][Idata][0] == 15) { format(string,sizeof(string),"Tire \nAmount: %d", ItemInfo[itemid][Idata][1]); }
	if(ItemInfo[itemid][Idata][0] == 16) { format(string,sizeof(string),"Low Quality Metal \nAmount: %d", ItemInfo[itemid][Idata][1]); }
	if(ItemInfo[itemid][Idata][0] == 17) { format(string,sizeof(string),"Wood \nAmount: %d", ItemInfo[itemid][Idata][1]); }
	if(ItemInfo[itemid][Idata][0] == 18) { format(string,sizeof(string),"Pizza Box \nAmount: %d", ItemInfo[itemid][Idata][1]); }
    if(ItemInfo[itemid][Idata][0] == 19) { format(string,sizeof(string),"Bottle of water \nAmount: %d", ItemInfo[itemid][Idata][1]); }
    
    //---------------------------------------------------------------------------------------------------------------------------------------

	// 10,13,14,16,17,18,19 se ne pokazuje
    
    if(ItemInfo[itemid][Idata][0] == 4 || ItemInfo[itemid][Idata][0] == 5 || ItemInfo[itemid][Idata][0] == 6 || ItemInfo[itemid][Idata][0] == 7) { ItemInfo[itemid][ItemID] = CreateDynamicObject(ItemObjectID, Float:Xpos, Float:Ypos, Float:Zpos-1, -1, -1, 250.0); }
	if(ItemInfo[itemid][Idata][0] == 0 || ItemInfo[itemid][Idata][0] == 1 || ItemInfo[itemid][Idata][0] == 3) { ItemInfo[itemid][ItemID] = CreateDynamicObject(ItemObjectID, Float:Xpos, Float:Ypos, Float:Zpos-0.92, -1, -1, 250.0); }
	if(ItemInfo[itemid][Idata][0] == 3) { ItemInfo[itemid][ItemID] = CreateDynamicObject(ItemObjectID, Float:Xpos, Float:Ypos, Float:Zpos-0.8, -1, -1, 250.0); }
	if(ItemInfo[itemid][Idata][0] == 8 ) { ItemInfo[itemid][ItemID] = CreateDynamicObject(ItemObjectID, Float:Xpos, Float:Ypos, Float:Zpos-0.79, -1, -1, 250.0); }
	if(ItemInfo[itemid][Idata][0] == 9 ) { ItemInfo[itemid][ItemID] = CreateDynamicObject(ItemObjectID, Float:Xpos, Float:Ypos, Float:Zpos-0.7, -1, -1, 250.0); }
	if(ItemInfo[itemid][Idata][0] == 15) {ItemInfo[itemid][ItemID] = CreateDynamicObject(ItemObjectID, Float:Xpos, Float:Ypos, Float:Zpos-0.5, -1, -1, 250.0); }
	if(ItemInfo[itemid][Idata][0] == 2) {ItemInfo[itemid][ItemID] = CreateDynamicObject(ItemObjectID, Float:Xpos, Float:Ypos, Float:Zpos-0.98, -1, -1, 250.0); }
	if(ItemInfo[itemid][Idata][0] == 11) {ItemInfo[itemid][ItemID] = CreateDynamicObject(ItemObjectID, Float:Xpos, Float:Ypos, Float:Zpos-0.1, -1, -1, 250.0); }
	if(ItemInfo[itemid][Idata][0] == 12) {ItemInfo[itemid][ItemID] = CreateDynamicObject(ItemObjectID, Float:Xpos, Float:Ypos, Float:Zpos-0.01, -1, -1, 250.0); }
	if(ItemInfo[itemid][Idata][0] == 19) {ItemInfo[itemid][ItemID] = CreateDynamicObject(ItemObjectID, Float:Xpos, Float:Ypos, Float:Zpos-0.8, -1, -1, 250.0); }
	if(ItemInfo[itemid][Idata][0] == 10 || ItemInfo[itemid][Idata][0] == 13 || ItemInfo[itemid][Idata][0] == 14 || ItemInfo[itemid][Idata][0] == 16 || ItemInfo[itemid][Idata][0] == 17 || ItemInfo[itemid][Idata][0] == 18) {ItemInfo[itemid][ItemID] = CreateDynamicObject(ItemObjectID, Float:Xpos, Float:Ypos, Float:Zpos-1, -1, -1, 250.0); }


	ItemInfo[itemid][Item3Dtext] = Create3DTextLabel(string, 0xCDCDCDFF, Xpos, Ypos, Zpos, 15.0, 0, 0);
	SumID ++;
	
	printf("ITEM: itemid: %d   ItemObjectID: %d ItemXpos: %f ItemYpos: %f  ItemZpos: %f  ItemTypeID: %d  ItemAmount: %d", itemid, ItemObjectID, Xpos, Ypos, Zpos, ItemTypeID, ItemAmount);
	printf("Amount of items: %d", SumID);
	return 1;
}
/*
stock RestartInventory(playerid)
{
    PlayerInfo[ playerid ][ pSlot1ID ] = 0;
    PlayerInfo[ playerid ][ pSlot2ID ] = 0;
    PlayerInfo[ playerid ][ pSlot3ID ] = 0;
    PlayerInfo[ playerid ][ pSlot4ID ] = 0;
    PlayerInfo[ playerid ][ pSlot5ID ] = 0;
    PlayerInfo[ playerid ][ pSlot6ID ] = 0;
    PlayerInfo[ playerid ][ pSlot7ID ] = 0;
    PlayerInfo[ playerid ][ pSlot8ID ] = 0;
    PlayerInfo[ playerid ][ pSlot9ID ] = 0;
    PlayerInfo[ playerid ][ pSlot10ID ] = 0;
    PlayerInfo[ playerid ][ pSlot11ID ] = 0;
    PlayerInfo[ playerid ][ pSlot12ID ] = 0;
    PlayerInfo[ playerid ][ pSlot13ID ] = 0;
    PlayerInfo[ playerid ][ pSlot14ID ] = 0;
    PlayerInfo[ playerid ][ pSlot15ID ] = 0;
    PlayerInfo[ playerid ][ pSlot16ID ] = 0;
    PlayerInfo[ playerid ][ pSlot17ID ] = 0;
    PlayerInfo[ playerid ][ pSlot18ID ] = 0;
    PlayerInfo[ playerid ][ pSlot19ID ] = 0;
    PlayerInfo[ playerid ][ pSlot20ID ] = 0;
    PlayerInfo[ playerid ][ pSlot21ID ] = 0;
    PlayerInfo[ playerid ][ pSlot22ID ] = 0;
	PlayerInfo[ playerid ][ pSlot23ID ] = 0;
	PlayerInfo[ playerid ][ pSlot24ID ] = 0;
	PlayerInfo[ playerid ][ pSlot25ID ] = 0;
	PlayerInfo[ playerid ][ pSlot26ID ] = 0;
	PlayerInfo[ playerid ][ pSlot27ID ] = 0;
	PlayerInfo[ playerid ][ pSlot28ID ] = 0;
	PlayerInfo[ playerid ][ pSlot29ID ] = 0;
	PlayerInfo[ playerid ][ pSlot30ID ] = 0;

	//-------------------------------------------

    PlayerInfo[ playerid ][ pSlot1Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot2Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot3Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot4Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot5Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot6Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot7Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot8Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot9Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot10Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot11Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot12Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot13Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot14Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot15Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot16Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot17Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot18Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot19Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot20Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot21Amount ] = 0;
    PlayerInfo[ playerid ][ pSlot22Amount ] = 0;
	PlayerInfo[ playerid ][ pSlot23Amount ] = 0;
	PlayerInfo[ playerid ][ pSlot24Amount ] = 0;
	PlayerInfo[ playerid ][ pSlot25Amount ] = 0;
	PlayerInfo[ playerid ][ pSlot26Amount ] = 0;
	PlayerInfo[ playerid ][ pSlot27Amount ] = 0;
	PlayerInfo[ playerid ][ pSlot28Amount ] = 0;
	PlayerInfo[ playerid ][ pSlot29Amount ] = 0;
	PlayerInfo[ playerid ][ pSlot30Amount ] = 0;

	return 1;
}
*/
stock SaveItemInInventory(playerid, ItemType, ItemAmount)
{
    if(PlayerInfo[playerid][pInventoryStats] >= 30) 
    {
        return 1;
    }
	if(PlayerInfo[playerid][pSlot1ID] == ItemType)
	{
        PlayerInfo[playerid][pSlot1Amount] = PlayerInfo[playerid][pSlot1Amount]+ItemAmount;
	    return 1;
	}

	if(PlayerInfo[playerid][pSlot2ID] == ItemType)
	{
        PlayerInfo[playerid][pSlot2Amount] = PlayerInfo[playerid][pSlot2Amount]+ItemAmount;
	    return 1;
	}

	if(PlayerInfo[playerid][pSlot3ID] == ItemType)
	{
        PlayerInfo[playerid][pSlot3Amount] = PlayerInfo[playerid][pSlot3Amount]+ItemAmount;
	    return 1;
	}

	if(PlayerInfo[playerid][pSlot4ID] == ItemType)
	{
        PlayerInfo[playerid][pSlot4Amount] = PlayerInfo[playerid][pSlot4Amount]+ItemAmount;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot5ID] == ItemType)
	{
        PlayerInfo[playerid][pSlot5Amount] = PlayerInfo[playerid][pSlot5Amount]+ItemAmount;
	    return 1;
	}

	if(PlayerInfo[playerid][pSlot6ID] == ItemType)
	{
        PlayerInfo[playerid][pSlot6Amount] = PlayerInfo[playerid][pSlot6Amount]+ItemAmount;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot7ID] == ItemType)
	{
        PlayerInfo[playerid][pSlot7Amount] = PlayerInfo[playerid][pSlot7Amount]+ItemAmount;
	    return 1;
	}

	if(PlayerInfo[playerid][pSlot8ID] == ItemType)
	{
        PlayerInfo[playerid][pSlot8Amount] = PlayerInfo[playerid][pSlot8Amount]+ItemAmount;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot9ID] == ItemType)
	{
        PlayerInfo[playerid][pSlot9Amount] = PlayerInfo[playerid][pSlot9Amount]+ItemAmount;
	    return 1;
	}

	if(PlayerInfo[playerid][pSlot10ID] == ItemType)
	{
        PlayerInfo[playerid][pSlot10Amount] = PlayerInfo[playerid][pSlot10Amount]+ItemAmount;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot11ID] == ItemType)
	{
        PlayerInfo[playerid][pSlot11Amount] = PlayerInfo[playerid][pSlot11Amount]+ItemAmount;
	    return 1;
	}

	if(PlayerInfo[playerid][pSlot12ID] == ItemType)
	{
        PlayerInfo[playerid][pSlot12Amount] = PlayerInfo[playerid][pSlot12Amount]+ItemAmount;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot13ID] == ItemType)
	{
        PlayerInfo[playerid][pSlot13Amount] = PlayerInfo[playerid][pSlot13Amount]+ItemAmount;
	    return 1;
	}

	if(PlayerInfo[playerid][pSlot14ID] == ItemType)
	{
        PlayerInfo[playerid][pSlot14Amount] = PlayerInfo[playerid][pSlot14Amount]+ItemAmount;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot15ID] == ItemType)
	{
        PlayerInfo[playerid][pSlot15Amount] = PlayerInfo[playerid][pSlot15Amount]+ItemAmount;
	    return 1;
	}

	if(PlayerInfo[playerid][pSlot16ID] == ItemType)
	{
        PlayerInfo[playerid][pSlot16Amount] = PlayerInfo[playerid][pSlot16Amount]+ItemAmount;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot17ID] == ItemType)
	{
        PlayerInfo[playerid][pSlot17Amount] = PlayerInfo[playerid][pSlot17Amount]+ItemAmount;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot18ID] == ItemType)
	{
        PlayerInfo[playerid][pSlot18Amount] = PlayerInfo[playerid][pSlot18Amount]+ItemAmount;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot19ID] == ItemType)
	{
        PlayerInfo[playerid][pSlot19Amount] = PlayerInfo[playerid][pSlot19Amount]+ItemAmount;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot20ID] == ItemType)
	{
        PlayerInfo[playerid][pSlot20Amount] = PlayerInfo[playerid][pSlot20Amount]+ItemAmount;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot21ID] == ItemType)
	{
        PlayerInfo[playerid][pSlot21Amount] = PlayerInfo[playerid][pSlot21Amount]+ItemAmount;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot22ID] == ItemType)
	{
        PlayerInfo[playerid][pSlot22Amount] = PlayerInfo[playerid][pSlot22Amount]+ItemAmount;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot23ID] == ItemType)
	{
        PlayerInfo[playerid][pSlot23Amount] = PlayerInfo[playerid][pSlot23Amount]+ItemAmount;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot24ID] == ItemType)
	{
        PlayerInfo[playerid][pSlot24Amount] = PlayerInfo[playerid][pSlot24Amount]+ItemAmount;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot25ID] == ItemType)
	{
        PlayerInfo[playerid][pSlot25Amount] = PlayerInfo[playerid][pSlot25Amount]+ItemAmount;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot26ID] == ItemType)
	{
        PlayerInfo[playerid][pSlot26Amount] = PlayerInfo[playerid][pSlot26Amount]+ItemAmount;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot27ID] == ItemType)
	{
        PlayerInfo[playerid][pSlot27Amount] = PlayerInfo[playerid][pSlot27Amount]+ItemAmount;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot28ID] == ItemType)
	{
        PlayerInfo[playerid][pSlot28Amount] = PlayerInfo[playerid][pSlot28Amount]+ItemAmount;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot29ID] == ItemType)
	{
        PlayerInfo[playerid][pSlot29Amount] = PlayerInfo[playerid][pSlot29Amount]+ItemAmount;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot30ID] == ItemType)
	{
        PlayerInfo[playerid][pSlot30Amount] = PlayerInfo[playerid][pSlot30Amount]+ItemAmount;
	    return 1;
	}
	

	if(PlayerInfo[playerid][pSlot1ID] == 0 && PlayerInfo[playerid][pSlot1Amount] == 0)
	{
	    PlayerInfo[playerid][pSlot1ID] = ItemType;
	    PlayerInfo[playerid][pSlot1Amount] = ItemAmount;
        PlayerInfo[playerid][pInventoryStats] ++;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot2ID] == 0 && PlayerInfo[playerid][pSlot2Amount] == 0)
	{
	    PlayerInfo[playerid][pSlot2ID] = ItemType;
	    PlayerInfo[playerid][pSlot2Amount] = ItemAmount;
        PlayerInfo[playerid][pInventoryStats] ++;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot3ID] == 0 && PlayerInfo[playerid][pSlot3Amount] == 0)
	{
	    PlayerInfo[playerid][pSlot3ID] = ItemType;
	    PlayerInfo[playerid][pSlot3Amount] = ItemAmount;
        PlayerInfo[playerid][pInventoryStats] ++;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot4ID] == 0 && PlayerInfo[playerid][pSlot4Amount] == 0)
	{
	    PlayerInfo[playerid][pSlot4ID] = ItemType;
	    PlayerInfo[playerid][pSlot4Amount] = ItemAmount;
        PlayerInfo[playerid][pInventoryStats] ++;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot5ID] == 0 && PlayerInfo[playerid][pSlot5Amount] == 0)
	{
	    PlayerInfo[playerid][pSlot5ID] = ItemType;
	    PlayerInfo[playerid][pSlot5Amount] = ItemAmount;
        PlayerInfo[playerid][pInventoryStats] ++;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot6ID] == 0 && PlayerInfo[playerid][pSlot6Amount] == 0)
	{
	    PlayerInfo[playerid][pSlot6ID] = ItemType;
	    PlayerInfo[playerid][pSlot6Amount] = ItemAmount;
        PlayerInfo[playerid][pInventoryStats] ++;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot7ID] == 0 && PlayerInfo[playerid][pSlot7Amount] == 0)
	{
	    PlayerInfo[playerid][pSlot7ID] = ItemType;
	    PlayerInfo[playerid][pSlot7Amount] = ItemAmount;
        PlayerInfo[playerid][pInventoryStats] ++;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot8ID] == 0 && PlayerInfo[playerid][pSlot8Amount] == 0)
	{
	    PlayerInfo[playerid][pSlot8ID] = ItemType;
	    PlayerInfo[playerid][pSlot8Amount] = ItemAmount;
        PlayerInfo[playerid][pInventoryStats] ++;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot9ID] == 0 && PlayerInfo[playerid][pSlot9Amount] == 0)
	{
	    PlayerInfo[playerid][pSlot9ID] = ItemType;
	    PlayerInfo[playerid][pSlot9Amount] = ItemAmount;
        PlayerInfo[playerid][pInventoryStats] ++;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot10ID] == 0 && PlayerInfo[playerid][pSlot10Amount] == 0)
	{
		PlayerInfo[playerid][pSlot10ID] = ItemType;
	    PlayerInfo[playerid][pSlot10Amount] = ItemAmount;
        PlayerInfo[playerid][pInventoryStats] ++;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot11ID] == 0 && PlayerInfo[playerid][pSlot11Amount] == 0)
	{
	    PlayerInfo[playerid][pSlot11ID] = ItemType;
	    PlayerInfo[playerid][pSlot11Amount] = ItemAmount;
        PlayerInfo[playerid][pInventoryStats] ++;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot12ID] == 0 && PlayerInfo[playerid][pSlot12Amount] == 0)
	{
	    PlayerInfo[playerid][pSlot12ID] = ItemType;
	    PlayerInfo[playerid][pSlot12Amount] = ItemAmount;
        PlayerInfo[playerid][pInventoryStats] ++;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot13ID] == 0 && PlayerInfo[playerid][pSlot13Amount] == 0)
	{
	    PlayerInfo[playerid][pSlot13ID] = ItemType;
	    PlayerInfo[playerid][pSlot13Amount] = ItemAmount;
        PlayerInfo[playerid][pInventoryStats] ++;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot14ID] == 0 && PlayerInfo[playerid][pSlot14Amount] == 0)
	{
	    PlayerInfo[playerid][pSlot14ID] = ItemType;
	    PlayerInfo[playerid][pSlot14Amount] = ItemAmount;
        PlayerInfo[playerid][pInventoryStats] ++;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot15ID] == 0 && PlayerInfo[playerid][pSlot15Amount] == 0)
	{
	    PlayerInfo[playerid][pSlot15ID] = ItemType;
	    PlayerInfo[playerid][pSlot15Amount] = ItemAmount;
        PlayerInfo[playerid][pInventoryStats] ++;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot16ID] == 0 && PlayerInfo[playerid][pSlot16Amount] == 0)
	{
	    PlayerInfo[playerid][pSlot16ID] = ItemType;
	    PlayerInfo[playerid][pSlot16Amount] = ItemAmount;
        PlayerInfo[playerid][pInventoryStats] ++;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot17ID] == 0 && PlayerInfo[playerid][pSlot17Amount] == 0)
	{
	    PlayerInfo[playerid][pSlot17ID] = ItemType;
		PlayerInfo[playerid][pSlot17Amount] = ItemAmount;
        PlayerInfo[playerid][pInventoryStats] ++;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot18ID] == 0 && PlayerInfo[playerid][pSlot18Amount] == 0)
	{
	    PlayerInfo[playerid][pSlot18ID] = ItemType;
	    PlayerInfo[playerid][pSlot18Amount] = ItemAmount;
        PlayerInfo[playerid][pInventoryStats] ++;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot19ID] == 0 && PlayerInfo[playerid][pSlot19Amount] == 0)
	{
	    PlayerInfo[playerid][pSlot19ID] = ItemType;
	    PlayerInfo[playerid][pSlot19Amount] = ItemAmount;
        PlayerInfo[playerid][pInventoryStats] ++;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot20ID] == 0 && PlayerInfo[playerid][pSlot20Amount] == 0)
	{
	    PlayerInfo[playerid][pSlot20ID] = ItemType;
	    PlayerInfo[playerid][pSlot20Amount] = ItemAmount;
        PlayerInfo[playerid][pInventoryStats] ++;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot21ID] == 0 && PlayerInfo[playerid][pSlot21Amount] == 0)
	{
	    PlayerInfo[playerid][pSlot21ID] = ItemType;
	    PlayerInfo[playerid][pSlot21Amount] = ItemAmount;
	    PlayerInfo[playerid][pInventoryStats] ++;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot22ID] == 0 && PlayerInfo[playerid][pSlot22Amount] == 0)
	{
	    PlayerInfo[playerid][pSlot22ID] = ItemType;
	    PlayerInfo[playerid][pSlot22Amount] = ItemAmount;
	    PlayerInfo[playerid][pInventoryStats] ++;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot23ID] == 0 && PlayerInfo[playerid][pSlot23Amount] == 0)
	{
		PlayerInfo[playerid][pSlot23ID] = ItemType;
	    PlayerInfo[playerid][pSlot23Amount] = ItemAmount;
	    PlayerInfo[playerid][pInventoryStats] ++;

	    return 1;
	}
	if(PlayerInfo[playerid][pSlot24ID] == 0 && PlayerInfo[playerid][pSlot24Amount] == 0)
	{
	    PlayerInfo[playerid][pSlot24ID] = ItemType;
	    PlayerInfo[playerid][pSlot24Amount] = ItemAmount;
	    PlayerInfo[playerid][pInventoryStats] ++;

	    return 1;
	}
	if(PlayerInfo[playerid][pSlot25ID] == 0 && PlayerInfo[playerid][pSlot25Amount] == 0)
	{
	    PlayerInfo[playerid][pSlot25ID] = ItemType;
	    PlayerInfo[playerid][pSlot25Amount] = ItemAmount;
        PlayerInfo[playerid][pInventoryStats] ++;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot26ID] == 0 && PlayerInfo[playerid][pSlot26Amount] == 0)
	{
	    PlayerInfo[playerid][pSlot26ID] = ItemType;
	    PlayerInfo[playerid][pSlot26Amount] = ItemAmount;
        PlayerInfo[playerid][pInventoryStats] ++;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot27ID] == 0 && PlayerInfo[playerid][pSlot27Amount] == 0)
	{
	    PlayerInfo[playerid][pSlot27ID] = ItemType;
	    PlayerInfo[playerid][pSlot27Amount] = ItemAmount;
        PlayerInfo[playerid][pInventoryStats] ++;
		return 1;
	}
	if(PlayerInfo[playerid][pSlot28ID] == 0 && PlayerInfo[playerid][pSlot28Amount] == 0)
	{
	    PlayerInfo[playerid][pSlot28ID] = ItemType;
	    PlayerInfo[playerid][pSlot28Amount] = ItemAmount;
        PlayerInfo[playerid][pInventoryStats] ++;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot29ID] == 0 && PlayerInfo[playerid][pSlot29Amount] == 0)
	{
	    PlayerInfo[playerid][pSlot29ID] = ItemType;
	    PlayerInfo[playerid][pSlot29Amount] = ItemAmount;
        PlayerInfo[playerid][pInventoryStats] ++;
	    return 1;
	}
	if(PlayerInfo[playerid][pSlot30ID] == 0 && PlayerInfo[playerid][pSlot30Amount] == 0)
	{
	    PlayerInfo[playerid][pSlot30ID] = ItemType;
	    PlayerInfo[playerid][pSlot30Amount] = ItemAmount;
        PlayerInfo[playerid][pInventoryStats] ++;
		return 1;
	}
	else {
	    SendClientMessage(playerid, 0xFFFFFFFF, "Inventory is full!!");
	}
	return 0;
}
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (PRESSED(65536))
	{
		new string[128];
		for(new i = 0; i < SumID; i++)
		{
			if(IsPlayerInRangeOfPoint(playerid, 1.55, ItemInfo[i][Item_pos][0], ItemInfo[i][Item_pos][1], ItemInfo[i][Item_pos][2]+1))
			{
				if(PlayerInfo[playerid][pInventoryStats] >= 30) return SendClientMessage(playerid, 0xFFFFFFFF, "Inventory is full!!");
		    	SaveItemInInventory(playerid, ItemInfo[i][Idata][0], ItemInfo[i][Idata][1]);
				format(string, sizeof(string), "{FFFFFF}You picked up item: {008000}Type{FFFFFF}: %d  {008000}Amount{FFFFFF}: %d",ItemInfo[i][Idata][0], ItemInfo[i][Idata][1]);
				SendClientMessage(playerid, 0xFFFFFFFF, string);
				SendClientMessage(playerid, 0xFFFFFFFF, "Item is saved in inventory");
				DestroyDynamicObject(ItemInfo[i][ItemID]);
				ItemInfo[i][Idata][0] = 0;
				ItemInfo[i][Idata][1] = 0;
				Delete3DTextLabel(ItemInfo[i][Item3Dtext]);
				ItemInfo[i][ItemID] = -1;
				SumID --;
				new str5[128];
				GetPlayerName(playerid, str5, sizeof(str5));
				format(str5, sizeof(str5), "* %s leans over and takes the item off the floor.", str5);
				ProxDetector(30.0, playerid, str5, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0);

			}
		}
	}
	if (PRESSED(131072))
	{
	    //horpus

		CreateCells(playerid);
	    OpenedPage[playerid] = 1;
	    SelectTextDraw(playerid, 0xFF4F4FFF);
	    TextDrawHideForPlayer(playerid, Textdraw52);
	    TextDrawSetSelectable(Text:Textdraw51, 1);
	    TextDrawSetSelectable(Text:Textdraw52, 1);
	    TextDrawSetSelectable(Text:Textdraw57, 1);
	    

	}
	return 1;
}
stock ShowItemsWithTextDraws(playerid)
{
	new ItemObjectID;
	if(OpenedPage[playerid] == 1) {
		if(PlayerInfo[playerid][pSlot1Amount] > 0)
		{
			if(PlayerInfo[playerid][pSlot1ID] == 0) { ItemObjectID = 2358; }
			if(PlayerInfo[playerid][pSlot1ID] == 1) { ItemObjectID = 2040; }
			if(PlayerInfo[playerid][pSlot1ID] == 2) { ItemObjectID = 2844; }
			if(PlayerInfo[playerid][pSlot1ID] == 3) { ItemObjectID = 2060; }
			if(PlayerInfo[playerid][pSlot1ID] == 4) { ItemObjectID = 1576; }
			if(PlayerInfo[playerid][pSlot1ID] == 5) { ItemObjectID = 1577; }
			if(PlayerInfo[playerid][pSlot1ID] == 6) { ItemObjectID = 1578; }
			if(PlayerInfo[playerid][pSlot1ID] == 7) { ItemObjectID = 1580; }
			if(PlayerInfo[playerid][pSlot1ID] == 8) { ItemObjectID = 1654; }
			if(PlayerInfo[playerid][pSlot1ID] == 9) { ItemObjectID = 920; }
			if(PlayerInfo[playerid][pSlot1ID] == 10) { ItemObjectID = 862; }
			if(PlayerInfo[playerid][pSlot1ID] == 11) { ItemObjectID = 811; }
			if(PlayerInfo[playerid][pSlot1ID] == 12) { ItemObjectID = 876; }
			if(PlayerInfo[playerid][pSlot1ID] == 13) { ItemObjectID = 760; }
			if(PlayerInfo[playerid][pSlot1ID] == 14) { ItemObjectID = 19473; }
			if(PlayerInfo[playerid][pSlot1ID] == 15) { ItemObjectID = 1327; }
			if(PlayerInfo[playerid][pSlot1ID] == 16) { ItemObjectID = 850; }
			if(PlayerInfo[playerid][pSlot1ID] == 17) { ItemObjectID = 1219; }
			if(PlayerInfo[playerid][pSlot1ID] == 18) { ItemObjectID = 2814; }
		    if(PlayerInfo[playerid][pSlot1ID] == 19) { ItemObjectID = 1668; }

		}
		if(PlayerInfo[playerid][pSlot2Amount] > 0)
		{
			if(PlayerInfo[playerid][pSlot2ID] == 0) { ItemObjectID = 2358; }
			if(PlayerInfo[playerid][pSlot2ID] == 1) { ItemObjectID = 2040; }
			if(PlayerInfo[playerid][pSlot2ID] == 2) { ItemObjectID = 2844; }
			if(PlayerInfo[playerid][pSlot2ID] == 3) { ItemObjectID = 2060; }
			if(PlayerInfo[playerid][pSlot2ID] == 4) { ItemObjectID = 1576; }
			if(PlayerInfo[playerid][pSlot2ID] == 5) { ItemObjectID = 1577; }
			if(PlayerInfo[playerid][pSlot2ID] == 6) { ItemObjectID = 1578; }
			if(PlayerInfo[playerid][pSlot2ID] == 7) { ItemObjectID = 1580; }
			if(PlayerInfo[playerid][pSlot2ID] == 8) { ItemObjectID = 1654; }
			if(PlayerInfo[playerid][pSlot2ID] == 9) { ItemObjectID = 920; }
			if(PlayerInfo[playerid][pSlot2ID] == 10) { ItemObjectID = 862; }
			if(PlayerInfo[playerid][pSlot2ID] == 11) { ItemObjectID = 811; }
			if(PlayerInfo[playerid][pSlot2ID] == 12) { ItemObjectID = 876; }
			if(PlayerInfo[playerid][pSlot2ID] == 13) { ItemObjectID = 760; }
			if(PlayerInfo[playerid][pSlot2ID] == 14) { ItemObjectID = 19473; }
			if(PlayerInfo[playerid][pSlot2ID] == 15) { ItemObjectID = 1327; }
			if(PlayerInfo[playerid][pSlot2ID] == 16) { ItemObjectID = 850; }
			if(PlayerInfo[playerid][pSlot2ID] == 17) { ItemObjectID = 1219; }
			if(PlayerInfo[playerid][pSlot2ID] == 18) { ItemObjectID = 2814; }
		    if(PlayerInfo[playerid][pSlot2ID] == 19) { ItemObjectID = 1668; }
		}
		if(PlayerInfo[playerid][pSlot3Amount] > 0)
		{
			if(PlayerInfo[playerid][pSlot3ID] == 0) { ItemObjectID = 2358; }
			if(PlayerInfo[playerid][pSlot3ID] == 1) { ItemObjectID = 2040; }
			if(PlayerInfo[playerid][pSlot3ID] == 2) { ItemObjectID = 2844; }
			if(PlayerInfo[playerid][pSlot3ID] == 3) { ItemObjectID = 2060; }
			if(PlayerInfo[playerid][pSlot3ID] == 4) { ItemObjectID = 1576; }
			if(PlayerInfo[playerid][pSlot3ID] == 5) { ItemObjectID = 1577; }
			if(PlayerInfo[playerid][pSlot3ID] == 6) { ItemObjectID = 1578; }
			if(PlayerInfo[playerid][pSlot3ID] == 7) { ItemObjectID = 1580; }
			if(PlayerInfo[playerid][pSlot3ID] == 8) { ItemObjectID = 1654; }
			if(PlayerInfo[playerid][pSlot3ID] == 9) { ItemObjectID = 920; }
			if(PlayerInfo[playerid][pSlot3ID] == 10) { ItemObjectID = 862; }
			if(PlayerInfo[playerid][pSlot3ID] == 11) { ItemObjectID = 811; }
			if(PlayerInfo[playerid][pSlot3ID] == 12) { ItemObjectID = 876; }
			if(PlayerInfo[playerid][pSlot3ID] == 13) { ItemObjectID = 760; }
			if(PlayerInfo[playerid][pSlot3ID] == 14) { ItemObjectID = 19473; }
			if(PlayerInfo[playerid][pSlot3ID] == 15) { ItemObjectID = 1327; }
			if(PlayerInfo[playerid][pSlot3ID] == 16) { ItemObjectID = 850; }
			if(PlayerInfo[playerid][pSlot3ID] == 17) { ItemObjectID = 1219; }
			if(PlayerInfo[playerid][pSlot3ID] == 18) { ItemObjectID = 2814; }
		    if(PlayerInfo[playerid][pSlot3ID] == 19) { ItemObjectID = 1668; }
		}
		if(PlayerInfo[playerid][pSlot4Amount] > 0)
		{

			if(PlayerInfo[playerid][pSlot4ID] == 0) { ItemObjectID = 2358; }
			if(PlayerInfo[playerid][pSlot4ID] == 1) { ItemObjectID = 2040; }
			if(PlayerInfo[playerid][pSlot4ID] == 2) { ItemObjectID = 2844; }
			if(PlayerInfo[playerid][pSlot4ID] == 3) { ItemObjectID = 2060; }
			if(PlayerInfo[playerid][pSlot4ID] == 4) { ItemObjectID = 1576; }
			if(PlayerInfo[playerid][pSlot4ID] == 5) { ItemObjectID = 1577; }
			if(PlayerInfo[playerid][pSlot4ID] == 6) { ItemObjectID = 1578; }
			if(PlayerInfo[playerid][pSlot4ID] == 7) { ItemObjectID = 1580; }
			if(PlayerInfo[playerid][pSlot4ID] == 8) { ItemObjectID = 1654; }
			if(PlayerInfo[playerid][pSlot4ID] == 9) { ItemObjectID = 920; }
			if(PlayerInfo[playerid][pSlot4ID] == 10) { ItemObjectID = 862; }
			if(PlayerInfo[playerid][pSlot4ID] == 11) { ItemObjectID = 811; }
			if(PlayerInfo[playerid][pSlot4ID] == 12) { ItemObjectID = 876; }
			if(PlayerInfo[playerid][pSlot4ID] == 13) { ItemObjectID = 760; }
			if(PlayerInfo[playerid][pSlot4ID] == 14) { ItemObjectID = 19473; }
			if(PlayerInfo[playerid][pSlot4ID] == 15) { ItemObjectID = 1327; }
			if(PlayerInfo[playerid][pSlot4ID] == 16) { ItemObjectID = 850; }
			if(PlayerInfo[playerid][pSlot4ID] == 17) { ItemObjectID = 1219; }
			if(PlayerInfo[playerid][pSlot4ID] == 18) { ItemObjectID = 2814; }
		    if(PlayerInfo[playerid][pSlot4ID] == 19) { ItemObjectID = 1668; }
		}
		if(PlayerInfo[playerid][pSlot5Amount] > 0)
		{
			if(PlayerInfo[playerid][pSlot5ID] == 0) { ItemObjectID = 2358; }
			if(PlayerInfo[playerid][pSlot5ID] == 1) { ItemObjectID = 2040; }
			if(PlayerInfo[playerid][pSlot5ID] == 2) { ItemObjectID = 2844; }
			if(PlayerInfo[playerid][pSlot5ID] == 3) { ItemObjectID = 2060; }
			if(PlayerInfo[playerid][pSlot5ID] == 4) { ItemObjectID = 1576; }
			if(PlayerInfo[playerid][pSlot5ID] == 5) { ItemObjectID = 1577; }
			if(PlayerInfo[playerid][pSlot5ID] == 6) { ItemObjectID = 1578; }
			if(PlayerInfo[playerid][pSlot5ID] == 7) { ItemObjectID = 1580; }
			if(PlayerInfo[playerid][pSlot5ID] == 8) { ItemObjectID = 1654; }
			if(PlayerInfo[playerid][pSlot5ID] == 9) { ItemObjectID = 920; }
			if(PlayerInfo[playerid][pSlot5ID] == 10) { ItemObjectID = 862; }
			if(PlayerInfo[playerid][pSlot5ID] == 11) { ItemObjectID = 811; }
			if(PlayerInfo[playerid][pSlot5ID] == 12) { ItemObjectID = 876; }
			if(PlayerInfo[playerid][pSlot5ID] == 13) { ItemObjectID = 760; }
			if(PlayerInfo[playerid][pSlot5ID] == 14) { ItemObjectID = 19473; }
			if(PlayerInfo[playerid][pSlot5ID] == 15) { ItemObjectID = 1327; }
			if(PlayerInfo[playerid][pSlot5ID] == 16) { ItemObjectID = 850; }
			if(PlayerInfo[playerid][pSlot5ID] == 17) { ItemObjectID = 1219; }
			if(PlayerInfo[playerid][pSlot5ID] == 18) { ItemObjectID = 2814; }
		    if(PlayerInfo[playerid][pSlot5ID] == 19) { ItemObjectID = 1668; }
		}
		if(PlayerInfo[playerid][pSlot6Amount] > 0)
		{
			if(PlayerInfo[playerid][pSlot6ID] == 0) { ItemObjectID = 2358; }
			if(PlayerInfo[playerid][pSlot6ID] == 1) { ItemObjectID = 2040; }
			if(PlayerInfo[playerid][pSlot6ID] == 2) { ItemObjectID = 2844; }
			if(PlayerInfo[playerid][pSlot6ID] == 3) { ItemObjectID = 2060; }
			if(PlayerInfo[playerid][pSlot6ID] == 4) { ItemObjectID = 1576; }
			if(PlayerInfo[playerid][pSlot6ID] == 5) { ItemObjectID = 1577; }
			if(PlayerInfo[playerid][pSlot6ID] == 6) { ItemObjectID = 1578; }
			if(PlayerInfo[playerid][pSlot6ID] == 7) { ItemObjectID = 1580; }
			if(PlayerInfo[playerid][pSlot6ID] == 8) { ItemObjectID = 1654; }
			if(PlayerInfo[playerid][pSlot6ID] == 9) { ItemObjectID = 920; }
			if(PlayerInfo[playerid][pSlot6ID] == 10) { ItemObjectID = 862; }
			if(PlayerInfo[playerid][pSlot6ID] == 11) { ItemObjectID = 811; }
			if(PlayerInfo[playerid][pSlot6ID] == 12) { ItemObjectID = 876; }
			if(PlayerInfo[playerid][pSlot6ID] == 13) { ItemObjectID = 760; }
			if(PlayerInfo[playerid][pSlot6ID] == 14) { ItemObjectID = 19473; }
			if(PlayerInfo[playerid][pSlot6ID] == 15) { ItemObjectID = 1327; }
			if(PlayerInfo[playerid][pSlot6ID] == 16) { ItemObjectID = 850; }
			if(PlayerInfo[playerid][pSlot6ID] == 17) { ItemObjectID = 1219; }
			if(PlayerInfo[playerid][pSlot6ID] == 18) { ItemObjectID = 2814; }
		    if(PlayerInfo[playerid][pSlot6ID] == 19) { ItemObjectID = 1668; }
		}
		if(PlayerInfo[playerid][pSlot7Amount] > 0)
		{
			if(PlayerInfo[playerid][pSlot7ID] == 0) { ItemObjectID = 2358; }
			if(PlayerInfo[playerid][pSlot7ID] == 1) { ItemObjectID = 2040; }
			if(PlayerInfo[playerid][pSlot7ID] == 2) { ItemObjectID = 2844; }
			if(PlayerInfo[playerid][pSlot7ID] == 3) { ItemObjectID = 2060; }
			if(PlayerInfo[playerid][pSlot7ID] == 4) { ItemObjectID = 1576; }
			if(PlayerInfo[playerid][pSlot7ID] == 5) { ItemObjectID = 1577; }
			if(PlayerInfo[playerid][pSlot7ID] == 6) { ItemObjectID = 1578; }
			if(PlayerInfo[playerid][pSlot7ID] == 7) { ItemObjectID = 1580; }
			if(PlayerInfo[playerid][pSlot7ID] == 8) { ItemObjectID = 1654; }
			if(PlayerInfo[playerid][pSlot7ID] == 9) { ItemObjectID = 920; }
			if(PlayerInfo[playerid][pSlot7ID] == 10) { ItemObjectID = 862; }
			if(PlayerInfo[playerid][pSlot7ID] == 11) { ItemObjectID = 811; }
			if(PlayerInfo[playerid][pSlot7ID] == 12) { ItemObjectID = 876; }
			if(PlayerInfo[playerid][pSlot7ID] == 13) { ItemObjectID = 760; }
			if(PlayerInfo[playerid][pSlot7ID] == 14) { ItemObjectID = 19473; }
			if(PlayerInfo[playerid][pSlot7ID] == 15) { ItemObjectID = 1327; }
			if(PlayerInfo[playerid][pSlot7ID] == 16) { ItemObjectID = 850; }
			if(PlayerInfo[playerid][pSlot7ID] == 17) { ItemObjectID = 1219; }
			if(PlayerInfo[playerid][pSlot7ID] == 18) { ItemObjectID = 2814; }
		    if(PlayerInfo[playerid][pSlot7ID] == 19) { ItemObjectID = 1668; }
		}
		if(PlayerInfo[playerid][pSlot8Amount] > 0)
		{
			if(PlayerInfo[playerid][pSlot8ID] == 0) { ItemObjectID = 2358; }
			if(PlayerInfo[playerid][pSlot8ID] == 1) { ItemObjectID = 2040; }
			if(PlayerInfo[playerid][pSlot8ID] == 2) { ItemObjectID = 2844; }
			if(PlayerInfo[playerid][pSlot8ID] == 3) { ItemObjectID = 2060; }
			if(PlayerInfo[playerid][pSlot8ID] == 4) { ItemObjectID = 1576; }
			if(PlayerInfo[playerid][pSlot8ID] == 5) { ItemObjectID = 1577; }
			if(PlayerInfo[playerid][pSlot8ID] == 6) { ItemObjectID = 1578; }
			if(PlayerInfo[playerid][pSlot8ID] == 7) { ItemObjectID = 1580; }
			if(PlayerInfo[playerid][pSlot8ID] == 8) { ItemObjectID = 1654; }
			if(PlayerInfo[playerid][pSlot8ID] == 9) { ItemObjectID = 920; }
			if(PlayerInfo[playerid][pSlot8ID] == 10) { ItemObjectID = 862; }
			if(PlayerInfo[playerid][pSlot8ID] == 11) { ItemObjectID = 811; }
			if(PlayerInfo[playerid][pSlot8ID] == 12) { ItemObjectID = 876; }
			if(PlayerInfo[playerid][pSlot8ID] == 13) { ItemObjectID = 760; }
			if(PlayerInfo[playerid][pSlot8ID] == 14) { ItemObjectID = 19473; }
			if(PlayerInfo[playerid][pSlot8ID] == 15) { ItemObjectID = 1327; }
			if(PlayerInfo[playerid][pSlot8ID] == 16) { ItemObjectID = 850; }
			if(PlayerInfo[playerid][pSlot8ID] == 17) { ItemObjectID = 1219; }
			if(PlayerInfo[playerid][pSlot8ID] == 18) { ItemObjectID = 2814; }
		    if(PlayerInfo[playerid][pSlot8ID] == 19) { ItemObjectID = 1668; }
		}
		if(PlayerInfo[playerid][pSlot9Amount] > 0)
		{
			if(PlayerInfo[playerid][pSlot9ID] == 0) { ItemObjectID = 2358; }
			if(PlayerInfo[playerid][pSlot9ID] == 1) { ItemObjectID = 2040; }
			if(PlayerInfo[playerid][pSlot9ID] == 2) { ItemObjectID = 2844; }
			if(PlayerInfo[playerid][pSlot9ID] == 3) { ItemObjectID = 2060; }
			if(PlayerInfo[playerid][pSlot9ID] == 4) { ItemObjectID = 1576; }
			if(PlayerInfo[playerid][pSlot9ID] == 5) { ItemObjectID = 1577; }
			if(PlayerInfo[playerid][pSlot9ID] == 6) { ItemObjectID = 1578; }
			if(PlayerInfo[playerid][pSlot9ID] == 7) { ItemObjectID = 1580; }
			if(PlayerInfo[playerid][pSlot9ID] == 8) { ItemObjectID = 1654; }
			if(PlayerInfo[playerid][pSlot9ID] == 9) { ItemObjectID = 920; }
			if(PlayerInfo[playerid][pSlot9ID] == 10) { ItemObjectID = 862; }
			if(PlayerInfo[playerid][pSlot9ID] == 11) { ItemObjectID = 811; }
			if(PlayerInfo[playerid][pSlot9ID] == 12) { ItemObjectID = 876; }
			if(PlayerInfo[playerid][pSlot9ID] == 13) { ItemObjectID = 760; }
			if(PlayerInfo[playerid][pSlot9ID] == 14) { ItemObjectID = 19473; }
			if(PlayerInfo[playerid][pSlot9ID] == 15) { ItemObjectID = 1327; }
			if(PlayerInfo[playerid][pSlot9ID] == 16) { ItemObjectID = 850; }
			if(PlayerInfo[playerid][pSlot9ID] == 17) { ItemObjectID = 1219; }
			if(PlayerInfo[playerid][pSlot9ID] == 18) { ItemObjectID = 2814; }
		    if(PlayerInfo[playerid][pSlot9ID] == 19) { ItemObjectID = 1668; }
		}
		if(PlayerInfo[playerid][pSlot10Amount] > 0)
		{
			if(PlayerInfo[playerid][pSlot10ID] == 0) { ItemObjectID = 2358; }
			if(PlayerInfo[playerid][pSlot10ID] == 1) { ItemObjectID = 2040; }
			if(PlayerInfo[playerid][pSlot10ID] == 2) { ItemObjectID = 2844; }
			if(PlayerInfo[playerid][pSlot10ID] == 3) { ItemObjectID = 2060; }
			if(PlayerInfo[playerid][pSlot10ID] == 4) { ItemObjectID = 1576; }
			if(PlayerInfo[playerid][pSlot10ID] == 5) { ItemObjectID = 1577; }
			if(PlayerInfo[playerid][pSlot10ID] == 6) { ItemObjectID = 1578; }
			if(PlayerInfo[playerid][pSlot10ID] == 7) { ItemObjectID = 1580; }
			if(PlayerInfo[playerid][pSlot10ID] == 8) { ItemObjectID = 1654; }
			if(PlayerInfo[playerid][pSlot10ID] == 9) { ItemObjectID = 920; }
			if(PlayerInfo[playerid][pSlot10ID] == 10) { ItemObjectID = 862; }
			if(PlayerInfo[playerid][pSlot10ID] == 11) { ItemObjectID = 811; }
			if(PlayerInfo[playerid][pSlot10ID] == 12) { ItemObjectID = 876; }
			if(PlayerInfo[playerid][pSlot10ID] == 13) { ItemObjectID = 760; }
			if(PlayerInfo[playerid][pSlot10ID] == 14) { ItemObjectID = 19473; }
			if(PlayerInfo[playerid][pSlot10ID] == 15) { ItemObjectID = 1327; }
			if(PlayerInfo[playerid][pSlot10ID] == 16) { ItemObjectID = 850; }
			if(PlayerInfo[playerid][pSlot10ID] == 17) { ItemObjectID = 1219; }
			if(PlayerInfo[playerid][pSlot10ID] == 18) { ItemObjectID = 2814; }
		    if(PlayerInfo[playerid][pSlot10ID] == 19) { ItemObjectID = 1668; }
		}
		if(PlayerInfo[playerid][pSlot11Amount] > 0)
		{
			if(PlayerInfo[playerid][pSlot11ID] == 0) { ItemObjectID = 2358; }
			if(PlayerInfo[playerid][pSlot11ID] == 1) { ItemObjectID = 2040; }
			if(PlayerInfo[playerid][pSlot11ID] == 2) { ItemObjectID = 2844; }
			if(PlayerInfo[playerid][pSlot11ID] == 3) { ItemObjectID = 2060; }
			if(PlayerInfo[playerid][pSlot11ID] == 4) { ItemObjectID = 1576; }
			if(PlayerInfo[playerid][pSlot11ID] == 5) { ItemObjectID = 1577; }
			if(PlayerInfo[playerid][pSlot11ID] == 6) { ItemObjectID = 1578; }
			if(PlayerInfo[playerid][pSlot11ID] == 7) { ItemObjectID = 1580; }
			if(PlayerInfo[playerid][pSlot11ID] == 8) { ItemObjectID = 1654; }
			if(PlayerInfo[playerid][pSlot11ID] == 9) { ItemObjectID = 920; }
			if(PlayerInfo[playerid][pSlot11ID] == 10) { ItemObjectID = 862; }
			if(PlayerInfo[playerid][pSlot11ID] == 11) { ItemObjectID = 811; }
			if(PlayerInfo[playerid][pSlot11ID] == 12) { ItemObjectID = 876; }
			if(PlayerInfo[playerid][pSlot11ID] == 13) { ItemObjectID = 760; }
			if(PlayerInfo[playerid][pSlot11ID] == 14) { ItemObjectID = 19473; }
			if(PlayerInfo[playerid][pSlot11ID] == 15) { ItemObjectID = 1327; }
			if(PlayerInfo[playerid][pSlot11ID] == 16) { ItemObjectID = 850; }
			if(PlayerInfo[playerid][pSlot11ID] == 17) { ItemObjectID = 1219; }
			if(PlayerInfo[playerid][pSlot11ID] == 18) { ItemObjectID = 2814; }
		    if(PlayerInfo[playerid][pSlot11ID] == 19) { ItemObjectID = 1668; }
		}
		if(PlayerInfo[playerid][pSlot12Amount] > 0)
		{
			if(PlayerInfo[playerid][pSlot12ID] == 0) { ItemObjectID = 2358; }
			if(PlayerInfo[playerid][pSlot12ID] == 1) { ItemObjectID = 2040; }
			if(PlayerInfo[playerid][pSlot12ID] == 2) { ItemObjectID = 2844; }
			if(PlayerInfo[playerid][pSlot12ID] == 3) { ItemObjectID = 2060; }
			if(PlayerInfo[playerid][pSlot12ID] == 4) { ItemObjectID = 1576; }
			if(PlayerInfo[playerid][pSlot12ID] == 5) { ItemObjectID = 1577; }
			if(PlayerInfo[playerid][pSlot12ID] == 6) { ItemObjectID = 1578; }
			if(PlayerInfo[playerid][pSlot12ID] == 7) { ItemObjectID = 1580; }
			if(PlayerInfo[playerid][pSlot12ID] == 8) { ItemObjectID = 1654; }
			if(PlayerInfo[playerid][pSlot12ID] == 9) { ItemObjectID = 920; }
			if(PlayerInfo[playerid][pSlot12ID] == 10) { ItemObjectID = 862; }
			if(PlayerInfo[playerid][pSlot12ID] == 11) { ItemObjectID = 811; }
			if(PlayerInfo[playerid][pSlot12ID] == 12) { ItemObjectID = 876; }
			if(PlayerInfo[playerid][pSlot12ID] == 13) { ItemObjectID = 760; }
			if(PlayerInfo[playerid][pSlot12ID] == 14) { ItemObjectID = 19473; }
			if(PlayerInfo[playerid][pSlot12ID] == 15) { ItemObjectID = 1327; }
			if(PlayerInfo[playerid][pSlot12ID] == 16) { ItemObjectID = 850; }
			if(PlayerInfo[playerid][pSlot12ID] == 17) { ItemObjectID = 1219; }
			if(PlayerInfo[playerid][pSlot12ID] == 18) { ItemObjectID = 2814; }
		    if(PlayerInfo[playerid][pSlot12ID] == 19) { ItemObjectID = 1668; }
		}
		if(PlayerInfo[playerid][pSlot13Amount] > 0)
		{
			if(PlayerInfo[playerid][pSlot13ID] == 0) { ItemObjectID = 2358; }
			if(PlayerInfo[playerid][pSlot13ID] == 1) { ItemObjectID = 2040; }
			if(PlayerInfo[playerid][pSlot13ID] == 2) { ItemObjectID = 2844; }
			if(PlayerInfo[playerid][pSlot13ID] == 3) { ItemObjectID = 2060; }
			if(PlayerInfo[playerid][pSlot13ID] == 4) { ItemObjectID = 1576; }
			if(PlayerInfo[playerid][pSlot13ID] == 5) { ItemObjectID = 1577; }
			if(PlayerInfo[playerid][pSlot13ID] == 6) { ItemObjectID = 1578; }
			if(PlayerInfo[playerid][pSlot13ID] == 7) { ItemObjectID = 1580; }
			if(PlayerInfo[playerid][pSlot13ID] == 8) { ItemObjectID = 1654; }
			if(PlayerInfo[playerid][pSlot13ID] == 9) { ItemObjectID = 920; }
			if(PlayerInfo[playerid][pSlot13ID] == 10) { ItemObjectID = 862; }
			if(PlayerInfo[playerid][pSlot13ID] == 11) { ItemObjectID = 811; }
			if(PlayerInfo[playerid][pSlot13ID] == 12) { ItemObjectID = 876; }
			if(PlayerInfo[playerid][pSlot13ID] == 13) { ItemObjectID = 760; }
			if(PlayerInfo[playerid][pSlot13ID] == 14) { ItemObjectID = 19473; }
			if(PlayerInfo[playerid][pSlot13ID] == 15) { ItemObjectID = 1327; }
			if(PlayerInfo[playerid][pSlot13ID] == 16) { ItemObjectID = 850; }
			if(PlayerInfo[playerid][pSlot13ID] == 17) { ItemObjectID = 1219; }
			if(PlayerInfo[playerid][pSlot13ID] == 18) { ItemObjectID = 2814; }
		    if(PlayerInfo[playerid][pSlot13ID] == 19) { ItemObjectID = 1668; }
		}
		if(PlayerInfo[playerid][pSlot14Amount] > 0)
		{
			if(PlayerInfo[playerid][pSlot14ID] == 0) { ItemObjectID = 2358; }
			if(PlayerInfo[playerid][pSlot14ID] == 1) { ItemObjectID = 2040; }
			if(PlayerInfo[playerid][pSlot14ID] == 2) { ItemObjectID = 2844; }
			if(PlayerInfo[playerid][pSlot14ID] == 3) { ItemObjectID = 2060; }
			if(PlayerInfo[playerid][pSlot14ID] == 4) { ItemObjectID = 1576; }
			if(PlayerInfo[playerid][pSlot14ID] == 5) { ItemObjectID = 1577; }
			if(PlayerInfo[playerid][pSlot14ID] == 6) { ItemObjectID = 1578; }
			if(PlayerInfo[playerid][pSlot14ID] == 7) { ItemObjectID = 1580; }
			if(PlayerInfo[playerid][pSlot14ID] == 8) { ItemObjectID = 1654; }
			if(PlayerInfo[playerid][pSlot14ID] == 9) { ItemObjectID = 920; }
			if(PlayerInfo[playerid][pSlot14ID] == 10) { ItemObjectID = 862; }
			if(PlayerInfo[playerid][pSlot14ID] == 11) { ItemObjectID = 811; }
			if(PlayerInfo[playerid][pSlot14ID] == 12) { ItemObjectID = 876; }
			if(PlayerInfo[playerid][pSlot14ID] == 13) { ItemObjectID = 760; }
			if(PlayerInfo[playerid][pSlot14ID] == 14) { ItemObjectID = 19473; }
			if(PlayerInfo[playerid][pSlot14ID] == 15) { ItemObjectID = 1327; }
			if(PlayerInfo[playerid][pSlot14ID] == 16) { ItemObjectID = 850; }
			if(PlayerInfo[playerid][pSlot14ID] == 17) { ItemObjectID = 1219; }
			if(PlayerInfo[playerid][pSlot14ID] == 18) { ItemObjectID = 2814; }
		    if(PlayerInfo[playerid][pSlot14ID] == 19) { ItemObjectID = 1668; }
		}
		if(PlayerInfo[playerid][pSlot15Amount] > 0)
		{
			if(PlayerInfo[playerid][pSlot15ID] == 0) { ItemObjectID = 2358; }
			if(PlayerInfo[playerid][pSlot15ID] == 1) { ItemObjectID = 2040; }
			if(PlayerInfo[playerid][pSlot15ID] == 2) { ItemObjectID = 2844; }
			if(PlayerInfo[playerid][pSlot15ID] == 3) { ItemObjectID = 2060; }
			if(PlayerInfo[playerid][pSlot15ID] == 4) { ItemObjectID = 1576; }
			if(PlayerInfo[playerid][pSlot15ID] == 5) { ItemObjectID = 1577; }
			if(PlayerInfo[playerid][pSlot15ID] == 6) { ItemObjectID = 1578; }
			if(PlayerInfo[playerid][pSlot15ID] == 7) { ItemObjectID = 1580; }
			if(PlayerInfo[playerid][pSlot15ID] == 8) { ItemObjectID = 1654; }
			if(PlayerInfo[playerid][pSlot15ID] == 9) { ItemObjectID = 920; }
			if(PlayerInfo[playerid][pSlot15ID] == 10) { ItemObjectID = 862; }
			if(PlayerInfo[playerid][pSlot15ID] == 11) { ItemObjectID = 811; }
			if(PlayerInfo[playerid][pSlot15ID] == 12) { ItemObjectID = 876; }
			if(PlayerInfo[playerid][pSlot15ID] == 13) { ItemObjectID = 760; }
			if(PlayerInfo[playerid][pSlot15ID] == 14) { ItemObjectID = 19473; }
			if(PlayerInfo[playerid][pSlot15ID] == 15) { ItemObjectID = 1327; }
			if(PlayerInfo[playerid][pSlot15ID] == 16) { ItemObjectID = 850; }
			if(PlayerInfo[playerid][pSlot15ID] == 17) { ItemObjectID = 1219; }
			if(PlayerInfo[playerid][pSlot15ID] == 18) { ItemObjectID = 2814; }
		    if(PlayerInfo[playerid][pSlot15ID] == 19) { ItemObjectID = 1668; }
		}
	}
	if(OpenedPage[playerid] == 1) {
		if(PlayerInfo[playerid][pSlot16Amount] > 0)
		{
			if(PlayerInfo[playerid][pSlot16ID] == 0) { ItemObjectID = 2358; }
			if(PlayerInfo[playerid][pSlot16ID] == 1) { ItemObjectID = 2040; }
			if(PlayerInfo[playerid][pSlot16ID] == 2) { ItemObjectID = 2844; }
			if(PlayerInfo[playerid][pSlot16ID] == 3) { ItemObjectID = 2060; }
			if(PlayerInfo[playerid][pSlot16ID] == 4) { ItemObjectID = 1576; }
			if(PlayerInfo[playerid][pSlot16ID] == 5) { ItemObjectID = 1577; }
			if(PlayerInfo[playerid][pSlot16ID] == 6) { ItemObjectID = 1578; }
			if(PlayerInfo[playerid][pSlot16ID] == 7) { ItemObjectID = 1580; }
			if(PlayerInfo[playerid][pSlot16ID] == 8) { ItemObjectID = 1654; }
			if(PlayerInfo[playerid][pSlot16ID] == 9) { ItemObjectID = 920; }
			if(PlayerInfo[playerid][pSlot16ID] == 10) { ItemObjectID = 862; }
			if(PlayerInfo[playerid][pSlot16ID] == 11) { ItemObjectID = 811; }
			if(PlayerInfo[playerid][pSlot16ID] == 12) { ItemObjectID = 876; }
			if(PlayerInfo[playerid][pSlot16ID] == 13) { ItemObjectID = 760; }
			if(PlayerInfo[playerid][pSlot16ID] == 14) { ItemObjectID = 19473; }
			if(PlayerInfo[playerid][pSlot16ID] == 15) { ItemObjectID = 1327; }
			if(PlayerInfo[playerid][pSlot16ID] == 16) { ItemObjectID = 850; }
			if(PlayerInfo[playerid][pSlot16ID] == 17) { ItemObjectID = 1219; }
			if(PlayerInfo[playerid][pSlot16ID] == 18) { ItemObjectID = 2814; }
		    if(PlayerInfo[playerid][pSlot16ID] == 19) { ItemObjectID = 1668; }
		}
		if(PlayerInfo[playerid][pSlot17Amount] > 0)
		{
			if(PlayerInfo[playerid][pSlot17ID] == 0) { ItemObjectID = 2358; }
			if(PlayerInfo[playerid][pSlot17ID] == 1) { ItemObjectID = 2040; }
			if(PlayerInfo[playerid][pSlot17ID] == 2) { ItemObjectID = 2844; }
			if(PlayerInfo[playerid][pSlot17ID] == 3) { ItemObjectID = 2060; }
			if(PlayerInfo[playerid][pSlot17ID] == 4) { ItemObjectID = 1576; }
			if(PlayerInfo[playerid][pSlot17ID] == 5) { ItemObjectID = 1577; }
			if(PlayerInfo[playerid][pSlot17ID] == 6) { ItemObjectID = 1578; }
			if(PlayerInfo[playerid][pSlot17ID] == 7) { ItemObjectID = 1580; }
			if(PlayerInfo[playerid][pSlot17ID] == 8) { ItemObjectID = 1654; }
			if(PlayerInfo[playerid][pSlot17ID] == 9) { ItemObjectID = 920; }
			if(PlayerInfo[playerid][pSlot17ID] == 10) { ItemObjectID = 862; }
			if(PlayerInfo[playerid][pSlot17ID] == 11) { ItemObjectID = 811; }
			if(PlayerInfo[playerid][pSlot17ID] == 12) { ItemObjectID = 876; }
			if(PlayerInfo[playerid][pSlot17ID] == 13) { ItemObjectID = 760; }
			if(PlayerInfo[playerid][pSlot17ID] == 14) { ItemObjectID = 19473; }
			if(PlayerInfo[playerid][pSlot17ID] == 15) { ItemObjectID = 1327; }
			if(PlayerInfo[playerid][pSlot17ID] == 16) { ItemObjectID = 850; }
			if(PlayerInfo[playerid][pSlot17ID] == 17) { ItemObjectID = 1219; }
			if(PlayerInfo[playerid][pSlot17ID] == 18) { ItemObjectID = 2814; }
		    if(PlayerInfo[playerid][pSlot17ID] == 19) { ItemObjectID = 1668; }
		}
		if(PlayerInfo[playerid][pSlot18Amount] > 0)
		{
			if(PlayerInfo[playerid][pSlot18ID] == 0) { ItemObjectID = 2358; }
			if(PlayerInfo[playerid][pSlot18ID] == 1) { ItemObjectID = 2040; }
			if(PlayerInfo[playerid][pSlot18ID] == 2) { ItemObjectID = 2844; }
			if(PlayerInfo[playerid][pSlot18ID] == 3) { ItemObjectID = 2060; }
			if(PlayerInfo[playerid][pSlot18ID] == 4) { ItemObjectID = 1576; }
			if(PlayerInfo[playerid][pSlot18ID] == 5) { ItemObjectID = 1577; }
			if(PlayerInfo[playerid][pSlot18ID] == 6) { ItemObjectID = 1578; }
			if(PlayerInfo[playerid][pSlot18ID] == 7) { ItemObjectID = 1580; }
			if(PlayerInfo[playerid][pSlot18ID] == 8) { ItemObjectID = 1654; }
			if(PlayerInfo[playerid][pSlot18ID] == 9) { ItemObjectID = 920; }
			if(PlayerInfo[playerid][pSlot18ID] == 10) { ItemObjectID = 862; }
			if(PlayerInfo[playerid][pSlot18ID] == 11) { ItemObjectID = 811; }
			if(PlayerInfo[playerid][pSlot18ID] == 12) { ItemObjectID = 876; }
			if(PlayerInfo[playerid][pSlot18ID] == 13) { ItemObjectID = 760; }
			if(PlayerInfo[playerid][pSlot18ID] == 14) { ItemObjectID = 19473; }
			if(PlayerInfo[playerid][pSlot18ID] == 15) { ItemObjectID = 1327; }
			if(PlayerInfo[playerid][pSlot18ID] == 16) { ItemObjectID = 850; }
			if(PlayerInfo[playerid][pSlot18ID] == 17) { ItemObjectID = 1219; }
			if(PlayerInfo[playerid][pSlot18ID] == 18) { ItemObjectID = 2814; }
		    if(PlayerInfo[playerid][pSlot18ID] == 19) { ItemObjectID = 1668; }
		}
		if(PlayerInfo[playerid][pSlot19Amount] > 0)
		{
			if(PlayerInfo[playerid][pSlot19ID] == 0) { ItemObjectID = 2358; }
			if(PlayerInfo[playerid][pSlot19ID] == 1) { ItemObjectID = 2040; }
			if(PlayerInfo[playerid][pSlot19ID] == 2) { ItemObjectID = 2844; }
			if(PlayerInfo[playerid][pSlot19ID] == 3) { ItemObjectID = 2060; }
			if(PlayerInfo[playerid][pSlot19ID] == 4) { ItemObjectID = 1576; }
			if(PlayerInfo[playerid][pSlot19ID] == 5) { ItemObjectID = 1577; }
			if(PlayerInfo[playerid][pSlot19ID] == 6) { ItemObjectID = 1578; }
			if(PlayerInfo[playerid][pSlot19ID] == 7) { ItemObjectID = 1580; }
			if(PlayerInfo[playerid][pSlot19ID] == 8) { ItemObjectID = 1654; }
			if(PlayerInfo[playerid][pSlot19ID] == 9) { ItemObjectID = 920; }
			if(PlayerInfo[playerid][pSlot19ID] == 10) { ItemObjectID = 862; }
			if(PlayerInfo[playerid][pSlot19ID] == 11) { ItemObjectID = 811; }
			if(PlayerInfo[playerid][pSlot19ID] == 12) { ItemObjectID = 876; }
			if(PlayerInfo[playerid][pSlot19ID] == 13) { ItemObjectID = 760; }
			if(PlayerInfo[playerid][pSlot19ID] == 14) { ItemObjectID = 19473; }
			if(PlayerInfo[playerid][pSlot19ID] == 15) { ItemObjectID = 1327; }
			if(PlayerInfo[playerid][pSlot19ID] == 16) { ItemObjectID = 850; }
			if(PlayerInfo[playerid][pSlot19ID] == 17) { ItemObjectID = 1219; }
			if(PlayerInfo[playerid][pSlot19ID] == 18) { ItemObjectID = 2814; }
		    if(PlayerInfo[playerid][pSlot19ID] == 19) { ItemObjectID = 1668; }
		}
		if(PlayerInfo[playerid][pSlot20Amount] > 0)
		{
			if(PlayerInfo[playerid][pSlot20ID] == 0) { ItemObjectID = 2358; }
			if(PlayerInfo[playerid][pSlot20ID] == 1) { ItemObjectID = 2040; }
			if(PlayerInfo[playerid][pSlot20ID] == 2) { ItemObjectID = 2844; }
			if(PlayerInfo[playerid][pSlot20ID] == 3) { ItemObjectID = 2060; }
			if(PlayerInfo[playerid][pSlot20ID] == 4) { ItemObjectID = 1576; }
			if(PlayerInfo[playerid][pSlot20ID] == 5) { ItemObjectID = 1577; }
			if(PlayerInfo[playerid][pSlot20ID] == 6) { ItemObjectID = 1578; }
			if(PlayerInfo[playerid][pSlot20ID] == 7) { ItemObjectID = 1580; }
			if(PlayerInfo[playerid][pSlot20ID] == 8) { ItemObjectID = 1654; }
			if(PlayerInfo[playerid][pSlot20ID] == 9) { ItemObjectID = 920; }
			if(PlayerInfo[playerid][pSlot20ID] == 10) { ItemObjectID = 862; }
			if(PlayerInfo[playerid][pSlot20ID] == 11) { ItemObjectID = 811; }
			if(PlayerInfo[playerid][pSlot20ID] == 12) { ItemObjectID = 876; }
			if(PlayerInfo[playerid][pSlot20ID] == 13) { ItemObjectID = 760; }
			if(PlayerInfo[playerid][pSlot20ID] == 14) { ItemObjectID = 19473; }
			if(PlayerInfo[playerid][pSlot20ID] == 15) { ItemObjectID = 1327; }
			if(PlayerInfo[playerid][pSlot20ID] == 16) { ItemObjectID = 850; }
			if(PlayerInfo[playerid][pSlot20ID] == 17) { ItemObjectID = 1219; }
			if(PlayerInfo[playerid][pSlot20ID] == 18) { ItemObjectID = 2814; }
		    if(PlayerInfo[playerid][pSlot20ID] == 19) { ItemObjectID = 1668; }
		}
		if(PlayerInfo[playerid][pSlot21Amount] > 0)
		{
			if(PlayerInfo[playerid][pSlot21ID] == 0) { ItemObjectID = 2358; }
			if(PlayerInfo[playerid][pSlot21ID] == 1) { ItemObjectID = 2040; }
			if(PlayerInfo[playerid][pSlot21ID] == 2) { ItemObjectID = 2844; }
			if(PlayerInfo[playerid][pSlot21ID] == 3) { ItemObjectID = 2060; }
			if(PlayerInfo[playerid][pSlot21ID] == 4) { ItemObjectID = 1576; }
			if(PlayerInfo[playerid][pSlot21ID] == 5) { ItemObjectID = 1577; }
			if(PlayerInfo[playerid][pSlot21ID] == 6) { ItemObjectID = 1578; }
			if(PlayerInfo[playerid][pSlot21ID] == 7) { ItemObjectID = 1580; }
			if(PlayerInfo[playerid][pSlot21ID] == 8) { ItemObjectID = 1654; }
			if(PlayerInfo[playerid][pSlot21ID] == 9) { ItemObjectID = 920; }
			if(PlayerInfo[playerid][pSlot21ID] == 10) { ItemObjectID = 862; }
			if(PlayerInfo[playerid][pSlot21ID] == 11) { ItemObjectID = 811; }
			if(PlayerInfo[playerid][pSlot21ID] == 12) { ItemObjectID = 876; }
			if(PlayerInfo[playerid][pSlot21ID] == 13) { ItemObjectID = 760; }
			if(PlayerInfo[playerid][pSlot21ID] == 14) { ItemObjectID = 19473; }
			if(PlayerInfo[playerid][pSlot21ID] == 15) { ItemObjectID = 1327; }
			if(PlayerInfo[playerid][pSlot21ID] == 16) { ItemObjectID = 850; }
			if(PlayerInfo[playerid][pSlot21ID] == 17) { ItemObjectID = 1219; }
			if(PlayerInfo[playerid][pSlot21ID] == 18) { ItemObjectID = 2814; }
		    if(PlayerInfo[playerid][pSlot21ID] == 19) { ItemObjectID = 1668; }
		}
		if(PlayerInfo[playerid][pSlot22Amount] > 0)
		{
			if(PlayerInfo[playerid][pSlot22ID] == 0) { ItemObjectID = 2358; }
			if(PlayerInfo[playerid][pSlot22ID] == 1) { ItemObjectID = 2040; }
			if(PlayerInfo[playerid][pSlot22ID] == 2) { ItemObjectID = 2844; }
			if(PlayerInfo[playerid][pSlot22ID] == 3) { ItemObjectID = 2060; }
			if(PlayerInfo[playerid][pSlot22ID] == 4) { ItemObjectID = 1576; }
			if(PlayerInfo[playerid][pSlot22ID] == 5) { ItemObjectID = 1577; }
			if(PlayerInfo[playerid][pSlot22ID] == 6) { ItemObjectID = 1578; }
			if(PlayerInfo[playerid][pSlot22ID] == 7) { ItemObjectID = 1580; }
			if(PlayerInfo[playerid][pSlot22ID] == 8) { ItemObjectID = 1654; }
			if(PlayerInfo[playerid][pSlot22ID] == 9) { ItemObjectID = 920; }
			if(PlayerInfo[playerid][pSlot22ID] == 10) { ItemObjectID = 862; }
			if(PlayerInfo[playerid][pSlot22ID] == 11) { ItemObjectID = 811; }
			if(PlayerInfo[playerid][pSlot22ID] == 12) { ItemObjectID = 876; }
			if(PlayerInfo[playerid][pSlot22ID] == 13) { ItemObjectID = 760; }
			if(PlayerInfo[playerid][pSlot22ID] == 14) { ItemObjectID = 19473; }
			if(PlayerInfo[playerid][pSlot22ID] == 15) { ItemObjectID = 1327; }
			if(PlayerInfo[playerid][pSlot22ID] == 16) { ItemObjectID = 850; }
			if(PlayerInfo[playerid][pSlot22ID] == 17) { ItemObjectID = 1219; }
			if(PlayerInfo[playerid][pSlot22ID] == 18) { ItemObjectID = 2814; }
		    if(PlayerInfo[playerid][pSlot22ID] == 19) { ItemObjectID = 1668; }
		}
		if(PlayerInfo[playerid][pSlot23Amount] > 0)
		{
			if(PlayerInfo[playerid][pSlot23ID] == 0) { ItemObjectID = 2358; }
			if(PlayerInfo[playerid][pSlot23ID] == 1) { ItemObjectID = 2040; }
			if(PlayerInfo[playerid][pSlot23ID] == 2) { ItemObjectID = 2844; }
			if(PlayerInfo[playerid][pSlot23ID] == 3) { ItemObjectID = 2060; }
			if(PlayerInfo[playerid][pSlot23ID] == 4) { ItemObjectID = 1576; }
			if(PlayerInfo[playerid][pSlot23ID] == 5) { ItemObjectID = 1577; }
			if(PlayerInfo[playerid][pSlot23ID] == 6) { ItemObjectID = 1578; }
			if(PlayerInfo[playerid][pSlot23ID] == 7) { ItemObjectID = 1580; }
			if(PlayerInfo[playerid][pSlot23ID] == 8) { ItemObjectID = 1654; }
			if(PlayerInfo[playerid][pSlot23ID] == 9) { ItemObjectID = 920; }
			if(PlayerInfo[playerid][pSlot23ID] == 10) { ItemObjectID = 862; }
			if(PlayerInfo[playerid][pSlot23ID] == 11) { ItemObjectID = 811; }
			if(PlayerInfo[playerid][pSlot23ID] == 12) { ItemObjectID = 876; }
			if(PlayerInfo[playerid][pSlot23ID] == 13) { ItemObjectID = 760; }
			if(PlayerInfo[playerid][pSlot23ID] == 14) { ItemObjectID = 19473; }
			if(PlayerInfo[playerid][pSlot23ID] == 15) { ItemObjectID = 1327; }
			if(PlayerInfo[playerid][pSlot23ID] == 16) { ItemObjectID = 850; }
			if(PlayerInfo[playerid][pSlot23ID] == 17) { ItemObjectID = 1219; }
			if(PlayerInfo[playerid][pSlot23ID] == 18) { ItemObjectID = 2814; }
		    if(PlayerInfo[playerid][pSlot23ID] == 19) { ItemObjectID = 1668; }
		}
		if(PlayerInfo[playerid][pSlot24Amount] > 0)
		{
			if(PlayerInfo[playerid][pSlot24ID] == 0) { ItemObjectID = 2358; }
			if(PlayerInfo[playerid][pSlot24ID] == 1) { ItemObjectID = 2040; }
			if(PlayerInfo[playerid][pSlot24ID] == 2) { ItemObjectID = 2844; }
			if(PlayerInfo[playerid][pSlot24ID] == 3) { ItemObjectID = 2060; }
			if(PlayerInfo[playerid][pSlot24ID] == 4) { ItemObjectID = 1576; }
			if(PlayerInfo[playerid][pSlot24ID] == 5) { ItemObjectID = 1577; }
			if(PlayerInfo[playerid][pSlot24ID] == 6) { ItemObjectID = 1578; }
			if(PlayerInfo[playerid][pSlot24ID] == 7) { ItemObjectID = 1580; }
			if(PlayerInfo[playerid][pSlot24ID] == 8) { ItemObjectID = 1654; }
			if(PlayerInfo[playerid][pSlot24ID] == 9) { ItemObjectID = 920; }
			if(PlayerInfo[playerid][pSlot24ID] == 10) { ItemObjectID = 862; }
			if(PlayerInfo[playerid][pSlot24ID] == 11) { ItemObjectID = 811; }
			if(PlayerInfo[playerid][pSlot24ID] == 12) { ItemObjectID = 876; }
			if(PlayerInfo[playerid][pSlot24ID] == 13) { ItemObjectID = 760; }
			if(PlayerInfo[playerid][pSlot24ID] == 14) { ItemObjectID = 19473; }
			if(PlayerInfo[playerid][pSlot24ID] == 15) { ItemObjectID = 1327; }
			if(PlayerInfo[playerid][pSlot24ID] == 16) { ItemObjectID = 850; }
			if(PlayerInfo[playerid][pSlot24ID] == 17) { ItemObjectID = 1219; }
			if(PlayerInfo[playerid][pSlot24ID] == 18) { ItemObjectID = 2814; }
		    if(PlayerInfo[playerid][pSlot24ID] == 19) { ItemObjectID = 1668; }
		}
		if(PlayerInfo[playerid][pSlot25Amount] > 0)
		{
			if(PlayerInfo[playerid][pSlot25ID] == 0) { ItemObjectID = 2358; }
			if(PlayerInfo[playerid][pSlot25ID] == 1) { ItemObjectID = 2040; }
			if(PlayerInfo[playerid][pSlot25ID] == 2) { ItemObjectID = 2844; }
			if(PlayerInfo[playerid][pSlot25ID] == 3) { ItemObjectID = 2060; }
			if(PlayerInfo[playerid][pSlot25ID] == 4) { ItemObjectID = 1576; }
			if(PlayerInfo[playerid][pSlot25ID] == 5) { ItemObjectID = 1577; }
			if(PlayerInfo[playerid][pSlot25ID] == 6) { ItemObjectID = 1578; }
			if(PlayerInfo[playerid][pSlot25ID] == 7) { ItemObjectID = 1580; }
			if(PlayerInfo[playerid][pSlot25ID] == 8) { ItemObjectID = 1654; }
			if(PlayerInfo[playerid][pSlot25ID] == 9) { ItemObjectID = 920; }
			if(PlayerInfo[playerid][pSlot25ID] == 10) { ItemObjectID = 862; }
			if(PlayerInfo[playerid][pSlot25ID] == 11) { ItemObjectID = 811; }
			if(PlayerInfo[playerid][pSlot25ID] == 12) { ItemObjectID = 876; }
			if(PlayerInfo[playerid][pSlot25ID] == 13) { ItemObjectID = 760; }
			if(PlayerInfo[playerid][pSlot25ID] == 14) { ItemObjectID = 19473; }
			if(PlayerInfo[playerid][pSlot25ID] == 15) { ItemObjectID = 1327; }
			if(PlayerInfo[playerid][pSlot25ID] == 16) { ItemObjectID = 850; }
			if(PlayerInfo[playerid][pSlot25ID] == 17) { ItemObjectID = 1219; }
			if(PlayerInfo[playerid][pSlot25ID] == 18) { ItemObjectID = 2814; }
		    if(PlayerInfo[playerid][pSlot25ID] == 19) { ItemObjectID = 1668; }
		}
		if(PlayerInfo[playerid][pSlot26Amount] > 0)
		{
			if(PlayerInfo[playerid][pSlot26ID] == 0) { ItemObjectID = 2358; }
			if(PlayerInfo[playerid][pSlot26ID] == 1) { ItemObjectID = 2040; }
			if(PlayerInfo[playerid][pSlot26ID] == 2) { ItemObjectID = 2844; }
			if(PlayerInfo[playerid][pSlot26ID] == 3) { ItemObjectID = 2060; }
			if(PlayerInfo[playerid][pSlot26ID] == 4) { ItemObjectID = 1576; }
			if(PlayerInfo[playerid][pSlot26ID] == 5) { ItemObjectID = 1577; }
			if(PlayerInfo[playerid][pSlot26ID] == 6) { ItemObjectID = 1578; }
			if(PlayerInfo[playerid][pSlot26ID] == 7) { ItemObjectID = 1580; }
			if(PlayerInfo[playerid][pSlot26ID] == 8) { ItemObjectID = 1654; }
			if(PlayerInfo[playerid][pSlot26ID] == 9) { ItemObjectID = 920; }
			if(PlayerInfo[playerid][pSlot26ID] == 10) { ItemObjectID = 862; }
			if(PlayerInfo[playerid][pSlot26ID] == 11) { ItemObjectID = 811; }
			if(PlayerInfo[playerid][pSlot26ID] == 12) { ItemObjectID = 876; }
			if(PlayerInfo[playerid][pSlot26ID] == 13) { ItemObjectID = 760; }
			if(PlayerInfo[playerid][pSlot26ID] == 14) { ItemObjectID = 19473; }
			if(PlayerInfo[playerid][pSlot26ID] == 15) { ItemObjectID = 1327; }
			if(PlayerInfo[playerid][pSlot26ID] == 16) { ItemObjectID = 850; }
			if(PlayerInfo[playerid][pSlot26ID] == 17) { ItemObjectID = 1219; }
			if(PlayerInfo[playerid][pSlot26ID] == 18) { ItemObjectID = 2814; }
		    if(PlayerInfo[playerid][pSlot26ID] == 19) { ItemObjectID = 1668; }
		}
		if(PlayerInfo[playerid][pSlot27Amount] > 0)
		{
			if(PlayerInfo[playerid][pSlot27ID] == 0) { ItemObjectID = 2358; }
			if(PlayerInfo[playerid][pSlot27ID] == 1) { ItemObjectID = 2040; }
			if(PlayerInfo[playerid][pSlot27ID] == 2) { ItemObjectID = 2844; }
			if(PlayerInfo[playerid][pSlot27ID] == 3) { ItemObjectID = 2060; }
			if(PlayerInfo[playerid][pSlot27ID] == 4) { ItemObjectID = 1576; }
			if(PlayerInfo[playerid][pSlot27ID] == 5) { ItemObjectID = 1577; }
			if(PlayerInfo[playerid][pSlot27ID] == 6) { ItemObjectID = 1578; }
			if(PlayerInfo[playerid][pSlot27ID] == 7) { ItemObjectID = 1580; }
			if(PlayerInfo[playerid][pSlot27ID] == 8) { ItemObjectID = 1654; }
			if(PlayerInfo[playerid][pSlot27ID] == 9) { ItemObjectID = 920; }
			if(PlayerInfo[playerid][pSlot27ID] == 10) { ItemObjectID = 862; }
			if(PlayerInfo[playerid][pSlot27ID] == 11) { ItemObjectID = 811; }
			if(PlayerInfo[playerid][pSlot27ID] == 12) { ItemObjectID = 876; }
			if(PlayerInfo[playerid][pSlot27ID] == 13) { ItemObjectID = 760; }
			if(PlayerInfo[playerid][pSlot27ID] == 14) { ItemObjectID = 19473; }
			if(PlayerInfo[playerid][pSlot27ID] == 15) { ItemObjectID = 1327; }
			if(PlayerInfo[playerid][pSlot27ID] == 16) { ItemObjectID = 850; }
			if(PlayerInfo[playerid][pSlot27ID] == 17) { ItemObjectID = 1219; }
			if(PlayerInfo[playerid][pSlot27ID] == 18) { ItemObjectID = 2814; }
		    if(PlayerInfo[playerid][pSlot27ID] == 19) { ItemObjectID = 1668; }
		}
		if(PlayerInfo[playerid][pSlot28Amount] > 0)
		{
			if(PlayerInfo[playerid][pSlot28ID] == 0) { ItemObjectID = 2358; }
			if(PlayerInfo[playerid][pSlot28ID] == 1) { ItemObjectID = 2040; }
			if(PlayerInfo[playerid][pSlot28ID] == 2) { ItemObjectID = 2844; }
			if(PlayerInfo[playerid][pSlot28ID] == 3) { ItemObjectID = 2060; }
			if(PlayerInfo[playerid][pSlot28ID] == 4) { ItemObjectID = 1576; }
			if(PlayerInfo[playerid][pSlot28ID] == 5) { ItemObjectID = 1577; }
			if(PlayerInfo[playerid][pSlot28ID] == 6) { ItemObjectID = 1578; }
			if(PlayerInfo[playerid][pSlot28ID] == 7) { ItemObjectID = 1580; }
			if(PlayerInfo[playerid][pSlot28ID] == 8) { ItemObjectID = 1654; }
			if(PlayerInfo[playerid][pSlot28ID] == 9) { ItemObjectID = 920; }
			if(PlayerInfo[playerid][pSlot28ID] == 10) { ItemObjectID = 862; }
			if(PlayerInfo[playerid][pSlot28ID] == 11) { ItemObjectID = 811; }
			if(PlayerInfo[playerid][pSlot28ID] == 12) { ItemObjectID = 876; }
			if(PlayerInfo[playerid][pSlot28ID] == 13) { ItemObjectID = 760; }
			if(PlayerInfo[playerid][pSlot28ID] == 14) { ItemObjectID = 19473; }
			if(PlayerInfo[playerid][pSlot28ID] == 15) { ItemObjectID = 1327; }
			if(PlayerInfo[playerid][pSlot28ID] == 16) { ItemObjectID = 850; }
			if(PlayerInfo[playerid][pSlot28ID] == 17) { ItemObjectID = 1219; }
			if(PlayerInfo[playerid][pSlot28ID] == 18) { ItemObjectID = 2814; }
		    if(PlayerInfo[playerid][pSlot28ID] == 19) { ItemObjectID = 1668; }
		}
		if(PlayerInfo[playerid][pSlot29Amount] > 0)
		{
			if(PlayerInfo[playerid][pSlot29ID] == 0) { ItemObjectID = 2358; }
			if(PlayerInfo[playerid][pSlot29ID] == 1) { ItemObjectID = 2040; }
			if(PlayerInfo[playerid][pSlot29ID] == 2) { ItemObjectID = 2844; }
			if(PlayerInfo[playerid][pSlot29ID] == 3) { ItemObjectID = 2060; }
			if(PlayerInfo[playerid][pSlot29ID] == 4) { ItemObjectID = 1576; }
			if(PlayerInfo[playerid][pSlot29ID] == 5) { ItemObjectID = 1577; }
			if(PlayerInfo[playerid][pSlot29ID] == 6) { ItemObjectID = 1578; }
			if(PlayerInfo[playerid][pSlot29ID] == 7) { ItemObjectID = 1580; }
			if(PlayerInfo[playerid][pSlot29ID] == 8) { ItemObjectID = 1654; }
			if(PlayerInfo[playerid][pSlot29ID] == 9) { ItemObjectID = 920; }
			if(PlayerInfo[playerid][pSlot29ID] == 10) { ItemObjectID = 862; }
			if(PlayerInfo[playerid][pSlot29ID] == 11) { ItemObjectID = 811; }
			if(PlayerInfo[playerid][pSlot29ID] == 12) { ItemObjectID = 876; }
			if(PlayerInfo[playerid][pSlot29ID] == 13) { ItemObjectID = 760; }
			if(PlayerInfo[playerid][pSlot29ID] == 14) { ItemObjectID = 19473; }
			if(PlayerInfo[playerid][pSlot29ID] == 15) { ItemObjectID = 1327; }
			if(PlayerInfo[playerid][pSlot29ID] == 16) { ItemObjectID = 850; }
			if(PlayerInfo[playerid][pSlot29ID] == 17) { ItemObjectID = 1219; }
			if(PlayerInfo[playerid][pSlot29ID] == 18) { ItemObjectID = 2814; }
		    if(PlayerInfo[playerid][pSlot29ID] == 19) { ItemObjectID = 1668; }
		}
		if(PlayerInfo[playerid][pSlot30Amount] > 0)
		{
			if(PlayerInfo[playerid][pSlot30ID] == 0) { ItemObjectID = 2358; }
			if(PlayerInfo[playerid][pSlot30ID] == 1) { ItemObjectID = 2040; }
			if(PlayerInfo[playerid][pSlot30ID] == 2) { ItemObjectID = 2844; }
			if(PlayerInfo[playerid][pSlot30ID] == 3) { ItemObjectID = 2060; }
			if(PlayerInfo[playerid][pSlot30ID] == 4) { ItemObjectID = 1576; }
			if(PlayerInfo[playerid][pSlot30ID] == 5) { ItemObjectID = 1577; }
			if(PlayerInfo[playerid][pSlot30ID] == 6) { ItemObjectID = 1578; }
			if(PlayerInfo[playerid][pSlot30ID] == 7) { ItemObjectID = 1580; }
			if(PlayerInfo[playerid][pSlot30ID] == 8) { ItemObjectID = 1654; }
			if(PlayerInfo[playerid][pSlot30ID] == 9) { ItemObjectID = 920; }
			if(PlayerInfo[playerid][pSlot30ID] == 10) { ItemObjectID = 862; }
			if(PlayerInfo[playerid][pSlot30ID] == 11) { ItemObjectID = 811; }
			if(PlayerInfo[playerid][pSlot30ID] == 12) { ItemObjectID = 876; }
			if(PlayerInfo[playerid][pSlot30ID] == 13) { ItemObjectID = 760; }
			if(PlayerInfo[playerid][pSlot30ID] == 14) { ItemObjectID = 19473; }
			if(PlayerInfo[playerid][pSlot30ID] == 15) { ItemObjectID = 1327; }
			if(PlayerInfo[playerid][pSlot30ID] == 16) { ItemObjectID = 850; }
			if(PlayerInfo[playerid][pSlot30ID] == 17) { ItemObjectID = 1219; }
			if(PlayerInfo[playerid][pSlot30ID] == 18) { ItemObjectID = 2814; }
		    if(PlayerInfo[playerid][pSlot30ID] == 19) { ItemObjectID = 1668; }
		}
	}
	return 1;
}
public OnPlayerUpdate(playerid)
{

	return 1;
}
public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
    if(clickedid == Textdraw56)
    {
		 DestroyCells(playerid);
         CancelSelectTextDraw(playerid);
         OpenedPage[playerid] = 0;
    }
    if(clickedid == Textdraw57)
    {
		 DestroyCells(playerid);
         CancelSelectTextDraw(playerid);
         OpenedPage[playerid] = 0;
    }
    if(clickedid == Textdraw51)
    {
        OpenedPage[playerid] = 2;
		TextDrawShowForPlayer(playerid, Textdraw52);
  		TextDrawHideForPlayer(playerid, Textdraw51);
  		
    }
    if(clickedid == Textdraw52)
    {
		TextDrawShowForPlayer(playerid, Textdraw51);
  		TextDrawHideForPlayer(playerid, Textdraw52);
  		OpenedPage[playerid] = 1;
    }
    return 1;
}
//CreateItem(itemid, Float:Xpos, Float:Ypos, Float:Zpos, ItemTypeID, ItemAmount)
CMD:createitem(playerid, params[])
{
	new string[128], Float:PlayerPos[3], TypeID, ItemAmount, NewID;
	if(PlayerInfo[playerid][pAdmin] < 1337) return SendClientMessage(playerid, COLOR_GRAD1, "You are not ADMIN!"); // I need amount and TypeID
	if(sscanf(params, "ii",TypeID, ItemAmount)) return SendClientMessage(playerid, 0xFF4242FF, "USE: /createitem [TypeID] [Amount]");
	GetPlayerPos(playerid, PlayerPos[0], PlayerPos[1], PlayerPos[2]);
	NewID = SumID+1;
	CreateItem(NewID, PlayerPos[0], PlayerPos[1], PlayerPos[2], TypeID, ItemAmount);
	format(string, sizeof(string), "*{FF3535}Item created{FFFFFF}: ID: %d TypeID: %d Amount: %d", NewID, TypeID, ItemAmount);
	SendClientMessage(playerid, 0xFFFFFFFF, string);
	new tmpstring[520];
	new File:fi = fopen("items.txt", io_append);
	format(tmpstring, sizeof(tmpstring), "CreateItem(%d, %f, %f, %f, %d, %d);\r\n", NewID, PlayerPos[0], PlayerPos[1], PlayerPos[2], TypeID, ItemAmount);
	fwrite(fi, tmpstring);
	fclose(fi);
	return 1;
}
stock DestroyItem(itemid)
{
	//
	ItemInfo[itemid][ItemID] = itemid;
	ItemInfo[itemid][Idata][0] = 0;
	ItemInfo[itemid][Idata][1] = 0;
	//
	DestroyDynamicObject(ItemInfo[itemid][ItemID]);
	Delete3DTextLabel(ItemInfo[itemid][Item3Dtext]);
	//
	ItemInfo[itemid][ItemID] = -1;
	return 1;
}
stock RestartItems()
{
    for(new i = 0; i < SumID; i++)
    {
        DestroyItem(i);
    }
    SetTimer("CreateItems", 2000, false);
	SendClientMessageToAll(0xFFFFFFFF, "{008000}Warning!{FFFFFF} Items are respawned!Wait 2 second until they spawn again");
    return 1;
}
forward CreateItems();
public CreateItems()
{
	CreateItem(0, 1787.9717, -1918.5905, 13.3933, 0, 30);
	CreateItem(1, 1781.9402, -1918.0964, 13.3907, 4, 4);
	CreateItem(2, 1794.7827, -1920.6770, 13.3922, 5, 2);
	CreateItem(4, 1827.965576, -1854.629882, 13.578125, 0, 1);
	CreateItem(5, 1814.458862, -1863.600830, 13.570352, 9, 1);
	CreateItem(6, 1814.734497, -1869.556396, 13.570352, 10, 15);
	CreateItem(7, 2002.696533, 171.448150, 29.942897, 10, 1);
	CreateItem(8, 2002.955322, 175.527084, 29.630865, 10, 1);
	CreateItem(9, 2002.872192, 179.755767, 29.350128, 10, 1);
	CreateItem(10, 2002.911865, 183.138275, 29.112644, 10, 1);
	CreateItem(11, 2002.955322, 187.082244, 28.836080, 10, 1);
	CreateItem(12, 2003.062500, 190.814849, 28.566299, 10, 1);
	CreateItem(13, 2003.158203, 194.145736, 28.325559, 10, 1);
	CreateItem(14, 2003.277221, 198.329162, 27.935852, 10, 1);
	CreateItem(15, 2000.213500, 173.543838, 30.100807, 10, 1);
	CreateItem(16, 2000.235839, 177.222457, 29.845058, 10, 1);
	CreateItem(17, 2000.282348, 181.533905, 29.542852, 10, 1);
	CreateItem(18, 2000.322021, 185.123291, 29.291139, 10, 1);
	CreateItem(19, 2000.366333, 189.168716, 29.012794, 10, 1);
	CreateItem(20, 2000.404174, 192.727554, 28.771419, 10, 1);
	CreateItem(21, 2000.442871, 196.432312, 28.476879, 10, 1);
	CreateItem(22, 2000.622802, 200.461593, 27.822422, 10, 1);
	CreateItem(23, 1997.482788, 173.074752, 30.465238, 11, 1);
	CreateItem(24, 1997.685180, 176.830184, 30.182327, 11, 1);
	CreateItem(25, 1997.722045, 181.360733, 29.867866, 11, 1);
	CreateItem(26, 1997.907836, 185.313201, 29.581516, 11, 1);
	CreateItem(27, 1997.953247, 189.188507, 29.318141, 11, 1);
	CreateItem(28, 1997.984741, 193.014495, 29.056468, 11, 1);
	CreateItem(29, 1998.247680, 196.664245, 28.626033, 11, 1);
	CreateItem(30, 1998.609985, 200.854873, 27.930530, 11, 1);
	CreateItem(31, 1995.265625, 172.185516, 30.796127, 13, 1);
	CreateItem(32, 1995.243164, 175.668731, 30.561267, 13, 1);
	CreateItem(33, 1995.451049, 179.598159, 30.273639, 13, 1);
	CreateItem(34, 1995.500488, 184.783996, 29.922630, 13, 1);
	CreateItem(35, 1995.699340, 188.999816, 29.617118, 13, 1);
	CreateItem(36, 1995.883544, 192.906173, 29.335556, 13, 1);
	CreateItem(37, 1996.076293, 196.996490, 28.757266, 13, 1);
	CreateItem(38, 1996.263549, 200.953369, 28.113664, 13, 1);
	CreateItem(39, 1992.890258, 171.901184, 31.110715, 14, 1);
	CreateItem(40, 1993.045898, 175.312561, 30.864158, 14, 1);
	CreateItem(41, 1993.220703, 178.956375, 30.599735, 14, 1);
	CreateItem(42, 1993.383789, 184.673736, 30.198947, 14, 1);
	CreateItem(43, 1993.424194, 188.952178, 29.907037, 14, 1);
	CreateItem(44, 1993.629272, 192.897598, 29.614795, 14, 1);
	CreateItem(45, 1993.832031, 196.768493, 28.983543, 14, 1);
	CreateItem(46, 1994.044189, 200.821243, 28.322628, 14, 1);
	CreateItem(47, 1990.601196, 171.977935, 31.396503, 14, 1);
	CreateItem(48, 1990.578613, 175.583801, 31.159679, 14, 1);
	CreateItem(49, 1990.557250, 179.066528, 30.930892, 14, 1);
	CreateItem(50, 1990.805664, 184.291595, 30.551994, 14, 1);
	CreateItem(51, 1990.993286, 188.940582, 30.222640, 14, 1);
	CreateItem(52, 1991.153198, 192.899108, 29.824300, 14, 1);
	CreateItem(53, 1991.310791, 196.798507, 29.192350, 14, 1);
	CreateItem(54, 1991.482299, 201.048156, 28.503650, 14, 1);
	return 1;
}
CMD:findid(playerid, params[])
{
	new string[128];
	for(new i = 0; i < SumID; i++)
	{
		if(IsPlayerInRangeOfPoint(playerid, 5, ItemInfo[i][Item_pos][0], ItemInfo[i][Item_pos][1], ItemInfo[i][Item_pos][2]+1))
		{
	    	format(string, sizeof(string), "{008000}Item ID{FFFFFF}: %d  {008000}Item Type{FFFFFF}: %d  {008000}Item Amount{FFFFFF}: %d", ItemInfo[i][ItemID], ItemInfo[i][Idata][0], ItemInfo[i][Idata][1]);
	    	SendClientMessage(playerid, 0xFFFFFFFF, string);
		}
	}
	return 1;
}
CMD:ritems(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 1337) return SendClientMessage(playerid, COLOR_GRAD1, "You are not ADMIN!");
	RestartItems();
	return 1;
}
CMD:pickup(playerid, params[])
{
	new string[128];
	for(new i = 0; i < SumID; i++)
	{
		if(IsPlayerInRangeOfPoint(playerid, 1.2, ItemInfo[i][Item_pos][0], ItemInfo[i][Item_pos][1], ItemInfo[i][Item_pos][2]+1))
		{
	    	format(string, sizeof(string), "{FFFFFF}You picked up item: {008000}Type{FFFFFF}: %d  {008000}Amount{FFFFFF}: %d",ItemInfo[i][Idata][0], ItemInfo[i][Idata][1]);
	    	SendClientMessage(playerid, 0xFFFFFFFF, string);
	    	SendClientMessage(playerid, 0xFFFFFFFF, "Item is saved in inventory");
	    	DestroyDynamicObject(ItemInfo[i][ItemID]);
	    	ItemInfo[i][Idata][0] = 0;
	    	ItemInfo[i][Idata][1] = 0;
	    	Delete3DTextLabel(ItemInfo[i][Item3Dtext]);
	    	ItemInfo[i][ItemID] = -1;
	    	SumID --;
	    	new str5[128];
	        GetPlayerName(playerid, str5, sizeof(str5));
	        format(str5, sizeof(str5), "* %s leans over and takes the item off the floor.", str5);
	        ProxDetector(30.0, playerid, str5, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	        ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0);
	    	
		}
	}
	return 1;
}
stock UserPath(playerid)
{
    new string[128],playername[MAX_PLAYER_NAME];
    GetPlayerName(playerid,playername,sizeof(playername));
    format(string,sizeof(string),PATH,playername);
    return string;
}

/* Credits to Dracoblue */
stock udb_hash(buf[]) {
    new length=strlen(buf);
    new s1 = 1;
    new s2 = 0;
    new n;
    for (n=0; n<length; n++)
    {
       s1 = (s1 + buf[n]) % 65521;
       s2 = (s2 + s1)     % 65521;
    }
    return (s2 << 16) + s1;
}

stock RPName(playerid)
{
    new string[24];
    GetPlayerName(playerid,string,24);
    new str[24];
    strmid(str,string,0,strlen(string),24);
    for(new i = 0; i < MAX_PLAYER_NAME; i++)
    {
        if (str[i] == '_') str[i] = ' ';
    }
    return str;
}
// =================================

/* LOGS */

function OOCLog(string[])
{
	new
		entry[ 128 ],
		year,
		month,
		day,
		hour,
		minute,
		second
	;
	getdate(year, month, day);
	gettime(hour, minute, second);

	format(entry, sizeof(entry), "%s | (%d-%d-%d) (%d:%d:%d)\n",string, day, month, year, hour, minute, second);
	new File:hFile;
	hFile = fopen("Basic/logs/OOCLog.log", io_append);
	fwrite(hFile, entry);
	fclose(hFile);
}

/* COMMANDS */

CMD:stats(playerid, params[])
{
	if(IsPlayerConnected(playerid))
	{
		new
			string[ 128 ],
			Age = PlayerInfo[ playerid ][ pAge ],
			Money = GetPlayerCash( playerid )
		;

		new Sex[20];
		if(PlayerInfo[ playerid ][ pSex ] == 1) { Sex = "Male"; }
		else if(PlayerInfo[ playerid ][ pSex ] == 2) { Sex = "Female"; }

		SendClientMessage(playerid, COLOR_LIGHTBLUE, "------------------------------------------------------------------------");
		format(string, sizeof(string), "Name: %s | Money: %d | Age: %d | Sex: %s", RPName(playerid), Money, Age, Sex);
		SendClientMessage(playerid, COLOR_GRAD2, string);
	}
	return 1;
}

CMD:ahelp(playerid, params[])
{
 	if(PlayerInfo[playerid][pAdmin] == 0) return SendClientMessage(playerid, -1,"You are not admin!");
 	SendClientMessage(playerid, -1, "____________________________________________________________________");
	if(PlayerInfo[playerid][pAdmin] >= 1)
	{
        SendClientMessage(playerid, COLOR_FADE, "Level 1: No commands yet!");
    }
   	if(PlayerInfo[playerid][pAdmin] >= 2)
	{
        SendClientMessage(playerid, COLOR_FADE, "Level 2: No commands yet!");
    }
   	if(PlayerInfo[playerid][pAdmin] >= 3)
	{
        SendClientMessage(playerid, COLOR_FADE, "Level 3: No commands yet!");
    }
   	if(PlayerInfo[playerid][pAdmin] >= 4)
	{
        SendClientMessage(playerid, COLOR_FADE, "Level 4: No commands yet!");
    }
   	if(PlayerInfo[playerid][pAdmin] >= 5)
	{
        SendClientMessage(playerid, COLOR_FADE, "Level 5: No commands yet!");
    }
   	if(PlayerInfo[playerid][pAdmin] >= 6)
	{
        SendClientMessage(playerid, COLOR_FADE, "Level 6: No commands yet!");
    }
   	if(PlayerInfo[playerid][pAdmin] >= 1337)
	{
        SendClientMessage(playerid, COLOR_FADE, "Level 1337: /givemoney -");
    }
 	SendClientMessage(playerid, -1, "____________________________________________________________________");
 	return 1;
}

CMD:help(playerid, params[])
{
    SendClientMessage(playerid, COLOR_LIGHTBLUE,"------------------------------------------------------------");
    SendClientMessage(playerid, COLOR_GRAD2,"/do - /me - /accent - /ooc - /b");
    SendClientMessage(playerid, COLOR_LIGHTBLUE,"------------------------------------------------------------");
    return 1;
}

ALTCOMMAND:o->ooc;
CMD:ooc(playerid, params[])
{
	new
		string[ 186 ]
	;
	if((noooc) && PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_GRAD2, "OOC Chat closed by administrator!");
	if(isnull(params)) return SendClientMessage(playerid, COLOR_GRAD2, "USAGE: {FFFFFF}(/o)oc [ooc chat]");

	format(string, sizeof(string), "(( OOC: %s: %s ))", RPName(playerid), params);
	OOCOff(0xCCFFFF00, string);
	OOCLog(string);
	printf("%s", string);
	return 1;
}

CMD:b(playerid, params[])
{
	new
		string[ 128 ]
	;
	if(isnull(params)) return SendClientMessage(playerid, COLOR_GRAD2, "USAGE: {FFFFFF} /b [ooc chat]");
	format(string, sizeof(string), "(( OOC: %s[%i]: %s ))", RPName( playerid ), playerid, params);
	printf("%s", string);
	ProxDetector(30.0, playerid, string, COLOR_FADE,COLOR_FADE,COLOR_FADE,COLOR_FADE,COLOR_FADE);
	return 1;
}

CMD:do(playerid, params[])
{
	new
		result[ 128 ],
		string[ 128 ]
 	;
	if(sscanf(params, "s[128]", result)) return SendClientMessage(playerid, COLOR_GRAD2, "USAGE: {FFFFFF}/do [action]");
	format(string, sizeof(string), "* %s (( %s ))", result, RPName(playerid));
	ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	printf("%s", string);
	return 1;
}

CMD:me(playerid, params[])
{
	new
		result[ 128 ],
		string[ 128 ]
 	;
	if(sscanf(params, "s[128]", result)) return SendClientMessage(playerid, COLOR_GRAD2, "USAGE: {FFFFFF}/do [action]");
	format(string, sizeof(string), "* %s %s", RPName(playerid), result);
	ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	printf("%s", string);
	return 1;
}
/*
enum IInfo
{
	IObjectId,
	Idata[2],
	Float:Item_pos[3]
}
*/

CMD:accent(playerid, params[])
{
	if(isnull(params)) return SendClientMessage(playerid, COLOR_GRAD1, "USAGE: {FFFFFF}/accent [russian | italian | germany | japanese | french | spain | china | british | none]");
	if(!strcmp(params,"russian",true))
	{
		PlayerInfo[playerid][pAccent] = 1;
		SendClientMessage(playerid, COLOR_GRAD1, "Your accent is now Russian!");
	}
	else if(!strcmp(params,"italian",true))
	{
		PlayerInfo[playerid][pAccent] = 2;
		SendClientMessage(playerid, COLOR_GRAD1, "Your accent is now Italian!");
	}
	else if(!strcmp(params,"germany",true))
	{
		PlayerInfo[playerid][pAccent] = 3;
		SendClientMessage(playerid, COLOR_GRAD1, "Your accent is now Germany!");
	}
	else if(!strcmp(params,"japanese",true))
	{
		PlayerInfo[playerid][pAccent] = 4;
		SendClientMessage(playerid, COLOR_GRAD1, "Your accent is now Japanese!");
	}
	else if(!strcmp(params,"french",true))
	{
		PlayerInfo[playerid][pAccent] = 5;
		SendClientMessage(playerid, COLOR_GRAD1, "Your accent is now French!");
	}
	else if(!strcmp(params,"spain",true))
	{
		PlayerInfo[playerid][pAccent] = 6;
		SendClientMessage(playerid, COLOR_GRAD1, "Your accent is now Spain!");
	}
	else if(!strcmp(params,"china",true))
	{
		PlayerInfo[playerid][pAccent] = 7;
		SendClientMessage(playerid, COLOR_GRAD1, "Your accent is now China!");
	}
	else if(!strcmp(params,"british", true))
	{
		PlayerInfo[playerid][pAccent] = 8;
		SendClientMessage(playerid, COLOR_GRAD1, "Your accent is now British!");
	}
	else if(!strcmp(params,"none",true))
	{
		PlayerInfo[playerid][pAccent] = 0;
		SendClientMessage(playerid, COLOR_GRAD1, "You removed the accent!");
	}
	else return SendClientMessage(playerid, COLOR_GREY, "Invalid name accent!");
	return 1;
}

CMD:givemoney(playerid, params[])
{
	new targetid,type,string[128];
	if(sscanf(params, "ui", targetid, type)) return SendClientMessage(playerid, COLOR_GRAD2, "USAGE: {FFFFFF}/givemoney [playerid] [amount]");
	if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid, COLOR_GREY, "* This player is not in server..");
	if(type < 0 || type > 99999999) return SendClientMessage(playerid, COLOR_GREY, "* Cannot go under 0 or above 99999999.");
	if(PlayerInfo[playerid][pAdmin] < 1337) return SendClientMessage(playerid, COLOR_GRAD1, "You are not ADMIN!");

	GivePlayerCash(targetid, type);
	format(string, sizeof(string),"AdmCmd: %s give player %s %d SAK", RPName( playerid ), RPName( targetid ), type);
	SendAdminMessage(COLOR_YELLOW,string);
	return 1;
}

