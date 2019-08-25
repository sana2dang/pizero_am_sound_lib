///////////////////////////////////////////////////
//
// Lollipop Selector
// System Selector by dukpoki
// Based on miflat
//
///////////////////////////////////////////////////

class UserConfig
{ 
	</ label="해상도 Width", help="가로 해상도", option="320", order=1 />  user_width="320";
	</ label="해상도 Height", help="세로 해상도" option="240", order=2 />  user_height="240";

	</ label="BGM YN", help="Play the Music ?", options="Y,N", order=3 /> bgmYn = "Y";

	</ label="배경 화면", help="배경 화면", option="bear", order=4 /> bgImg = "background";
	</ label="글자 컬러", help="글자 컬러", options="WHITE,BLACK", order=5 /> fontColor = "WHITE";
	</ label="글자 크기", help="글자 크기", options="20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40", order=6 /> fontSize = "20";

	</ label="BGM Select", help="Music Select", options="bgMusic1.mp3,bgMusic2.mp3,bgMusic3.mp3,bgMusic4.mp3,bgMusic5.mp3", order=5 />
	    bgmName = "bgMusic1.mp3";
		
}
	fe.load_module("animate");
	local my_config = fe.get_config();


	local monitor_width = abs((my_config["user_width"]).tointeger());	// 레이아웃 해상도 width 변수
	local monitor_height = abs((my_config["user_height"]).tointeger())	// 레이아웃 해상도 height 변수
	fe.layout.width =  monitor_width;				// Set 레이아웃 해상도 width
	fe.layout.height = monitor_height;			// Set 레이아웃 해상도 height

	// Main Screen
	local flx = fe.layout.width;
	local fly = fe.layout.height;
	local flw = fe.layout.width;
	local flh = fe.layout.height;


	// Modules
	fe.load_module( "fade" );
	fe.do_nut(fe.script_dir + "modules/carrier.nut" );
	//fe.load_module("carrier");


////////////////////////////////
//
//  Background
//
////////////////////////////////

	local bgArt = fe.add_image("images/"+my_config["bgImg"]+".png", 0, 0, flw, flh );
	/*
	local bgArt2 = fe.add_clone(bgArt);
	animation.add( PropertyAnimation( bgArt, {when = Transition.StartLayout, property = "x", start = 0, end = -flw, time = 38000, loop=true}));
	animation.add( PropertyAnimation( bgArt2, {when = Transition.StartLayout, property = "x", start = flw, end = 0, time = 38000, loop=true}));			
	animation.add( PropertyAnimation( bgArt2, {when = Transition.StartLayout, property = "alpha", start = 0, end = 255, time = 500}));	
	animation.add( PropertyAnimation( bgArt, {when = Transition.StartLayout, property = "alpha", start = 0, end = 255, time = 500}));
	*/
////////////////////////////////
//
//  Layout Navigation
//
////////////////////////////////

//Set Layout Navigation
function Navigation(sig)
{
	local disable = false;
	if (sig=="up")
	{
		disable = true;
	}
	if (sig=="down")
	{
		disable = true;
	}
	if (sig=="left")
	{
		disable = true;
		fe.signal("prev_game");
	}
	if (sig=="right")
	{
		disable = true;
		fe.signal("next_game");
	}
	
	return disable;
}

// ADD HORIZONTALNAVIGATION HANDLER
fe.add_signal_handler( "Navigation" );

////////////////////////////////
//
// Carrier Background
//
////////////////////////////////
	/*
	local starbg1 = fe.add_image( "images/starbg.gif",0, fly/2-flh*0.25 , flw, flh*0.4 );
	starbg1.preserve_aspect_ratio = "true"
	starbg1.alpha = 150
	*/
	//local zzz = fe.add_text( "", 0, fly/2-flh*0.35 , flw, flh*0.7 );
	//zzz.set_bg_rgb( 0, 0, 0 );
	//zzz.bg_alpha = 150;

////////////////////////////////
//
//  List / Carrier
//
////////////////////////////////

//	local carrier = Carrier( flx/30, fly*0.37, flx*0.9, fly*0.2, 3, 2, 10, "",  "" );
	local carrier = Carrier( 0-flx/1.5, fly/3.8, flx*2.3, fly*0.5, 3, 2, 10, "",  "" );
	carrier.set_keep_aspect();
	carrier.set_selector_on_top();
		
	local selCursor1 = fe.add_text( "▲",0, fly*0.785, flw, fly*0.15);
	local selCursor2 = fe.add_text( "▼",0, fly*0.05, flw, fly*0.15);
//	selCursor1.set_rgb( 0,0,0);
//	selCursor2.set_rgb( 0,0,0);
	selCursor1.set_rgb( 255,255,255);
	selCursor2.set_rgb( 255,255,255);
	//selCursor1.alpha = 150;
	//selCursor2.alpha = 150;
	

if( my_config["bgmYn"] == "Y" )
{
	//local bgMusic = fe.add_sound("bgMusic.mp3")
	local bgMusic = fe.add_sound(my_config["bgmName"])
	bgMusic.playing=true
}
