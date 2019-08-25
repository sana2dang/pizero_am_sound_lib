////////////////////////////////////////////////////
//				//
// Attract-Mode Frontend - Vewricle Theme	//
// made by sana2dang	( 구퓌 )		//
////////////////////////////////////////////////////

/*
Copyright (c) 2010, NAVER Corporation (http://www.nhncorp.com), 

with Reserved Font Name Nanum, Naver Nanum, NanumGothic, Naver NanumGothic, NanumMyeongjo, Naver NanumMyeongjo, NanumBrush, Naver NanumBrush, NanumPen, Naver NanumPen, Naver NanumGothicEco, NanumGothicEco, Naver NanumMyeongjoEco, NanumMyeongjoEco, Naver NanumGothicLight, NanumGothicLight, NanumBarunGothic, Naver NanumBarunGothic,

This Font Software is licensed under the SIL Open Font License, Version 1.1.

This license is copied below, and is also available with a FAQ at: http://scripts.sil.org/OFL

SIL OPEN FONT LICENSE

Version 1.1 - 26 February 2007  
*/

class UserConfig { 
	</ label="해상도 Width", help="가로 해상도", option="1024", order=1 />  user_width="320";
	</ label="해상도 Height", help="세로 해상도" option="768", order=2 />  user_height="240";
	</ label="marquee 유무", help="하단 marquee 유무" options="Yes,No", order=3 />  marqueeYn="No";
	</ label="게임 실행여부 확인", help="실행여부 Y, N)", options="Y,N", order=4 /> playConfirm = "Y";
	</ label="리스트 개수", help="리스트 개수", options="1,3,5,7,9,11,13,15,17,19,21", order=5 /> listCnt = "7";
	</ label="리스트 글자 크기", help="글자 크기", options="10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40", order=6 /> fontSize = "14";
	</ label="Red (R) (0-255) Color", help="리스트 배경 Red 값", option="80", order=7 /> red=0;
	</ label="Green (G) (0-255) Color", help="리스트 배경 Green 값", option="18", order=8 /> green=35;
	</ label="Blue (B) (0-255) Color", help="리스트 배경 Blue 값", option="18", order=9 />  blue=55;
	</ label="리스트 커서 타입", help="리스트 커서 타입", options="동적,고정", order=10 />  listtype="고정";
	</ label="컬러 마퀴", help="컬러 마퀴 사용", options="Yes,No", order=12 /> useColorMarquee = "No";

}


fe.load_module("animate");
fe.load_module("objects/scrollingtext");
local my_config = fe.get_config();

if( my_config["useColorMarquee"] == "Yes" )
{	
	dofile ( fe.script_dir + "colorMarquee.nut" );
}

// 폰트 파일 설정
fe.layout.font="NANUMBARUNGOTHICBOLD";


function move_sound()
{
	// 커서 이동시 사운드 설정
	//local selectMusic = fe.add_sound("select.mp3");
	selectMusic.playing=true;
}



///////////////////////////////////////////// 레이아웃 해상도 셋팅 start /////////////////////////////////////////////
local monitor_width = abs((my_config["user_width"]).tointeger());	// 레이아웃 해상도 width 변수
local monitor_height = abs((my_config["user_height"]).tointeger())	// 레이아웃 해상도 height 변수
fe.layout.width =  monitor_width;				// Set 레이아웃 해상도 width
fe.layout.height = monitor_height;				// Set 레이아웃 해상도 height
fe.layout.preserve_aspect_ratio = false;

///////////////////////////////////////////// 레이아웃 해상도 셋팅 end /////////////////////////////////////////////
local PAD= fe.layout.width / 32;

local feBg = fe.add_text("",0,0,320,240);
feBg.set_bg_rgb(255,255,255);

fe.add_image( "bg2.png", 0, 0, fe.layout.width, fe.layout.height); 

// 리스트 박스 컬러 설정
local bgRed=abs(("0"+my_config["red"]).tointeger());		// RGB 중 RED 값
local bgGreen=abs(("0"+my_config["green"]).tointeger());		// RGB 중 GREEN 값
local bgBlue=abs(("0"+my_config["blue"]).tointeger());		// RGB 중 BLUE 값
local bgColor = fe.add_text( "", 2.5, 0, fe.layout.width/1.96, fe.layout.height );		
bgColor.set_bg_rgb( bgRed, bgGreen, bgBlue);



local snap = fe.add_artwork( "snap", 169, 30, 148, 111 );
snap.preserve_aspect_ratio = true;
snap.trigger = Transition.EndNavigation;
//snap.video_flags = Vid.NoAudio;


if( my_config["listtype"] == "동적" )
{
	//Load Shuffle Module
	fe.load_module("shuffle");
	//Shuffle Gamelist
	local list = [];
	
	local listPAD = fe.layout.height/15;
	local aaa = (fe.layout.height-listPAD-listPAD) / 9;
	list.push(fe.add_text("    [Title]", fe.layout.width / 72.5, listPAD , fe.layout.width/1.98, aaa));
	list.push(fe.add_text("    [Title]", fe.layout.width / 72.5, aaa*1+listPAD, fe.layout.width/1.98, aaa));
	list.push(fe.add_text("    [Title]", fe.layout.width / 72.5, aaa*2+listPAD, fe.layout.width/1.98, aaa));
	list.push(fe.add_text("    [Title]", fe.layout.width / 72.5, aaa*3+listPAD, fe.layout.width/1.98, aaa));
	list.push(fe.add_text("    [Title]", fe.layout.width / 72.5, aaa*4+listPAD, fe.layout.width/1.98, aaa));
	list.push(fe.add_text("    [Title]", fe.layout.width / 72.5, aaa*5+listPAD, fe.layout.width/1.98, aaa));
	list.push(fe.add_text("    [Title]", fe.layout.width / 72.5, aaa*6+listPAD, fe.layout.width/1.98, aaa));
	list.push(fe.add_text("    [Title]", fe.layout.width / 72.5, aaa*7+listPAD, fe.layout.width/1.98, aaa));
	list.push(fe.add_text("    [Title]", fe.layout.width / 72.5, aaa*8+listPAD, fe.layout.width/1.98, aaa));

	class ShuffleList extends Shuffle 
	{
		function update() {
			base.update();
		}

		// Overwrite the select function
		function select(slot) {
			slot.align = Align.Left;
			slot.charsize = abs(("0"+my_config["fontSize"]).tointeger());		
			slot.set_bg_rgb( 255, 255, 255 );
			slot.set_rgb( 255, 255, 255 );
			slot.bg_alpha = 70;
		}
	
		// Overwrite the deselect function
		function deselect(slot) {
			slot.align = Align.Left;
			slot.charsize = abs(("0"+my_config["fontSize"]).tointeger());
			slot.bg_alpha = 0;
			slot.set_rgb( 180, 180, 180 );

		}
	}


	local fav= [];
	fav.push(fe.add_text("[!gamename]", 0, listPAD , fe.layout.width/15, aaa));
	fav.push(fe.add_text("[!gamename]", 0, aaa*1+listPAD, fe.layout.width/15, aaa));
	fav.push(fe.add_text("[!gamename]", 0, aaa*2+listPAD, fe.layout.width/15, aaa));
	fav.push(fe.add_text("[!gamename]", 0, aaa*3+listPAD, fe.layout.width/15, aaa));
	fav.push(fe.add_text("[!gamename]", 0, aaa*4+listPAD, fe.layout.width/15, aaa));
	fav.push(fe.add_text("[!gamename]", 0, aaa*5+listPAD, fe.layout.width/15, aaa));
	fav.push(fe.add_text("[!gamename]", 0, aaa*6+listPAD, fe.layout.width/15, aaa));
	fav.push(fe.add_text("[!gamename]", 0, aaa*7+listPAD, fe.layout.width/15, aaa));
	fav.push(fe.add_text("[!gamename]", 0, aaa*8+listPAD, fe.layout.width/15, aaa));


	class ShuffleFav extends Shuffle 
	{
		function update() {
			base.update();
		}

		// Overwrite the select function
		function select(slot) {
			slot.align = Align.Left;
			slot.charsize = abs(("0"+my_config["fontSize"]).tointeger());		
			slot.set_rgb( 255, 255, 0 );
		}

		// Overwrite the select function
		function deselect(slot) {
			slot.align = Align.Left;
			slot.charsize = abs(("0"+my_config["fontSize"]).tointeger());		
			slot.set_rgb( 255, 255, 0 );
		}
	}

	// Create an instance of the extended class
	local list = ShuffleList(list, "text");
	local fff = ShuffleFav(fav, "text");

}
else
{


	

	local listbox = fe.add_listbox( fe.layout.width / 72.5, fe.layout.height/12, fe.layout.width/1.98, fe.layout.height/1.2 );
	listbox.charsize = abs(("0"+my_config["fontSize"]).tointeger());
	//listbox.set_sel_rgb( 255, 255, 255 );
	listbox.set_sel_rgb( 255, 255, 255 );
	listbox.set_selbg_rgb( 255, 255, 255 );
	listbox.set_rgb( 180, 180, 180 );
	listbox.selbg_alpha = 70;
//	listbox.selbg_alpha = 0;
//	listbox.sel_alpha = 0;
	listbox.align = Align.Left;
	listbox.format_string =  "    [Title]";
	listbox.rows = abs(("0"+my_config["listCnt"]).tointeger());
	//listbox.font="font";

	local listbox_fav = fe.add_listbox( 0, fe.layout.height/12, fe.layout.width/2.2, fe.layout.height/1.2 );
	listbox_fav.charsize = abs(("0"+my_config["fontSize"]).tointeger());
	listbox_fav.set_sel_rgb( 255, 255, 0 );
	listbox_fav.set_rgb( 255, 255, 0 );
	listbox_fav.selbg_alpha = 0;
	listbox_fav.align = Align.Left;
	listbox_fav.format_string =  "[!gamename]";
	listbox_fav.rows = abs(("0"+my_config["listCnt"]).tointeger());
	//listbox_fav.font="font";

}



function gamename( index_offset ) 
{
	local fav = fe.game_info(  Info.Favourite , index_offset );
	if( fav == "1" )
	{
		return  "★";
	}
	else
	{
		return "";

	}
	return "";
}


local favorite_logo = fe.add_image( "[!favoriteBg]", fe.layout.width/23, fe.layout.height/5.5, fe.layout.width/8.5, fe.layout.height/7.5 );
//favorite_logo.visible = false;
//favorite_logo.preserve_aspect_ratio = false;


function favoriteBg()
{
	local index = fe.list.filter_index;
	local re;
	re = "./empty.png";
	if ( index == 0)	{	re = "./empty.png";	} // all
	if ( index == 1)	{ 	re = "./favourite.png"; 	} // favorite
	return re;
}





// 게임 리스트 개수
local list = fe.add_text("[ListEntry] / [ListSize]", 220, 5, 100, 20  );
list.set_rgb( 0,0,0 );
//list.set_bg_rgb(12,12,12);
list.charsize = 12;
list.align = Align.Right;

local filterName = fe.add_text("[FilterName]",170,5, 100, 20);
filterName.set_rgb( 0,0,0 );
filterName.charsize = 12;
filterName.align = Align.Left;


if ( my_config["marqueeYn"] == "Yes" )
{
	local marqueeName = "./marquee/"+ "[Name]" + ".png";
	local marqueeName = fe.add_image( marqueeName , fe.layout.width/1.65, fe.layout.height/7, fe.layout.width/2.9, fe.layout.height/6.55 );
}




function deleteRom()
{
	fe.set_display(  fe.list.display_index   );
	local optionsYn = ["예", "아니오"];
	local command = fe.overlay.list_dialog( optionsYn,  "'" +fe.game_info(Info.Name) + "' 롬파일을 지우시겠습니까?");
	// 0 예  1 아니오  -1 취소

	local emulator = "\""+ fe.game_info(Info.Emulator ) + "\"";	
	local filename = "\""+ fe.game_info(Info.Name ) + "\"";	

	local del_exec = "/home/pi/dev/delRomList";
//	local arg_exec = "\"" +emulator  + "\" \""  + filename + "\"";
	local arg_exec = emulator  + " "+ filename;

	if( command == 0 )	// 예
	{
		fe.plugin_command( del_exec, arg_exec );
		fe.set_display(  fe.list.display_index   );			
	}
	else
	{
	}
}

// 에뮬레이터 로고
local emulatorLogo = "./emulator/"+ "[Emulator]" + ".png";
fe.add_image( emulatorLogo , 179, 150, 128, 40 );

local infoText = fe.add_text( "ⓐ 선택\tⓑ 취소\tⓧ 즐찾보기" ,  170, 200, 150, 20);
infoText.set_rgb(0,0,0);
infoText.align = Align.Centre;
infoText.charsize = 11;

local infoText2 = fe.add_text( "ⓐ+ⓑ 즐찾 추가/삭제" ,  170, 215, 150, 20 );
infoText2.set_rgb(0,0,0);
infoText2.align = Align.Centre;
infoText2.charsize = 11;


/*
local scTitle = fe.add_text("[Title]",16.7, 108, 165, 20);
scTitle.charsize = abs(("0"+my_config["fontSize"]).tointeger());	
scTitle.align = Align.Left;

local scTitleBg = fe.add_text("",0,105,165,30);
scTitleBg.set_bg_rgb(255,255,255);
scTitleBg.bg_alpha=70;


local scrollingTitle3 = {when = Transition.ToNewSelection, property ="x", start = scTitle.x + scTitle.width/2, end = scTitle.x, time = 1, delay=5000, loop=true}
local scrollingTitle4 = {when = When.ToNewSelection, property ="x", start = scTitle.x, end = scTitle.x - scTitle.width/2, time = 3000, delay=2000, loop=true}

animation.add(PropertyAnimation(scTitle, scrollingTitle4));
animation.add(PropertyAnimation(scTitle, scrollingTitle3));
*/



fe.add_signal_handler(  "on_signal" );
function on_signal( sig )
{
	switch ( sig )	
	{
		case "up":
			move_sound();
			fe.signal( "prev_game" );
			return true;
		case "down":
			move_sound();
			fe.signal( "next_game");			
			return true;		
		case "left":
			//fe.signal( "prev_page" );
			return true;
		case "right":
			//fe.signal( "next_page" );
			return true;	
		case "select":
			if ( my_config["playConfirm"] == "Y" )
			{
				local optionsYn = ["예", "아니오"];
				local command = fe.overlay.list_dialog( optionsYn,  "'" +fe.game_info(Info.Title) + "' 을 실행합니까?");
			
				if( command == 0 )
				{
					return false;
				}
				else
				{
					return true;				
				}
			}
			else
			{
			}
			break;
		case "custom2":
			deleteRom();
			return true;	
	}
	return false;
}


