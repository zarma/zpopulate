// Control types
#include "z_def.hpp" 

class RscText_Z {
  type = CT_STATIC;
  idc = -1; 
  style = ST_LEFT;
  colorBackground[] = {0, 0, 0, 1};
  colorText[] = {1, 1, 1, 1};
  font = FontM;
  sizeEx = 0.04;
  h = 0.04;
  text = "";
};



class RscListBox_Z {
	type = CT_LISTBOX;
	style = ST_LEFT;
	idc = -1;
	colorSelect[] = {0, 0.2, 0.4, 1};
	colorSelectBackground[] = {0, 0.2, 0.4, 0.1};
	colorText[] = {0.2, .2, 0.2, 1};
	colorBackground[] = {0.4, 0.4, 0.4, 0};
	font = FontHTML;
	sizeEx = 0.04;
	rowHeight = 0.025;
	
	autoScrollRewind = ;
	autoScrollSpeed = ;
	autoScrollDelay = ;
	maxHistoryDelay = ;
	class ScrollBar {
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\ca\ui\data\igui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\igui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\igui_arrow_top_ca.paa";
		border = "\ca\ui\data\igui_border_scroll_ca.paa";
  };
};

class RscPictureKeepAspect_Z {
	type = CT_STATIC;
	style = ST_PICTURE + ST_KEEP_ASPECT_RATIO;
	idc = -1;
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1};
	font = FontHTML;
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
};

class RscButton_Z {
idc = -1; 
type = CT_BUTTON; 
style = ST_LEFT; 
default = false; 
font = FontM; 
sizeEx = 0.03; 
colorText[] = { 0, 0, 0, 1 }; 
colorFocused[] = { 1, 0, 0, 1 }; // border color for focused state 
colorDisabled[] = { 0, 0, 1, 0.7 }; // text color for disabled state 
colorBackground[] = { 1, 1, 1, 0.8 }; 
colorBackgroundDisabled[] = { 1, 1, 1, 0.5 }; // background color for disabled state 
colorBackgroundActive[] = { 1, 1, 1, 1 }; // background color for active state 
offsetX = 0.003; offsetY = 0.003; 
offsetPressedX = 0.002; 
offsetPressedY = 0.002; 
colorShadow[] = { 0, 0, 0, 0.5 }; 
colorBorder[] = { 0, 0, 0, 1 }; 
borderSize = 0; 
soundEnter[] = { "", 0, 1 }; // no sound 
soundPush[] = { "buttonpushed.ogg", 0.1, 1 }; 
soundClick[] = { "", 0, 1 }; // no sound 
soundEscape[] = { "", 0, 1 }; // no sound 
};

class Z_Dialog {
 //... 
  idd = DLG_Z_IDD;
  movingEnable = 1; 
  controlsBackground[] = {BACKGROUND1,HEADER};
  class BACKGROUND1 : RscText_Z {
    colorBackground[] = {.6, .6, .6, .8};
    text = ;
  	x = 0.2;
  	y = 0.1;
  	w = 0.8;
  	h = 0.8;
  	moving = 1;
  };
  class BACKGROUND2 : RscText_Z {
    colorBackground[] = {.4, .4, .4, .8};
    text = ;
  	x = 1.0;
  	y = 0.1;
  	w = 0.8;
  	h = 0.8;
  	moving = 1;
  };
  class HEADER : RscText_Z {
    x = 0.2;
    y = 0.1;
    w = 0.8;
    h = 0.06;
		moving = 0;
    colorBackground[] = {.2, .2, .2, .8};
		colorText[] = {1, .5, 0, .9};
    sizeEx = 0.04;
    text = "Available objects";
  };
  controls[] = { VEHLIST,ZMANBTN,ZVEHBTN,ZSELECTBTN,ZTHINGBTN,ZCLOSEBTN };
  class VEHLIST : RscListBox_Z {
  	idc = DLG_Z_LIST;
  	x = 0.21;
  	y = 0.165;
  	w = 0.79;
  	h = 0.72;
		colorText[] = {1, .5, 0, .9};
		soundSelect[] = {"",0.1,1};
		onLBSelChanged = "hint str _this";
		moving = 1;
  };
  class ZMANBTN : RscButton_Z
  {
  	idc = DLG_Z_ZMANBTN;
  	x = 0.2;
  	y = 0;
  	w = 0.15;
  	h = 0.04;
		sizeEx = 0.04;
	 	text = "Men";
  	action = "Z_TYPE_SELECTED='men';";
  };
  class ZVEHBTN : RscButton_Z
  {
  	idc = DLG_Z_ZVEHBTN;
  	x = 0.4;
  	y = 0;
  	w = 0.15;
  	h = 0.04;
		sizeEx = 0.04;
	 	text = "Vehicles";
  	action = "Z_TYPE_SELECTED='vehicles';";
  };
  class ZTHINGBTN : RscButton_Z
  {
  	idc = DLG_Z_ZTHINGBTN;
  	x = 0.6;
  	y = 0;
  	w = 0.15;
  	h = 0.04;
		sizeEx = 0.04;
	 	text = "Things";
  	action = "Z_TYPE_SELECTED='';";
  };
  class ZSELECTBTN : RscButton_Z
  {
  	idc = DLG_Z_ZSELECTBTN;
  	x = 0.8;
  	y = 0;
  	w = 0.15;
  	h = 0.04;
		sizeEx = 0.04;
	 	text = "Select";
  	action = "Z_SELECTED=true;";
  };
  class ZCLOSEBTN : RscButton_Z
  {
  	idc = DLG_Z_CLOSEBTN;
  	x = 1.0;
  	y = 0;
  	w = 0.15;
  	h = 0.04;
		sizeEx = 0.04;
	 	text = "Close";
  	action = "closeDialog 0;";
  };
};
class Z_Dialog_selected {
 //... 
  idd = DLG_Z_IDDSEL;
  movingEnable = 1; 
  controlsBackground[] = {BACKGROUND1,HEADER};
  class BACKGROUND1 : RscText_Z {
    colorBackground[] = {.6, .6, .6, .8};
    text = ;
  	x = 0.2;
  	y = 0.1;
  	w = 0.8;
  	h = 0.8;
  	moving = 1;
  };
  class BACKGROUND2 : RscText_Z {
    colorBackground[] = {.4, .4, .4, .8};
    text = ;
  	x = 1.0;
  	y = 0.1;
  	w = 0.8;
  	h = 0.8;
  	moving = 1;
  };
  class HEADER : RscText_Z {
    x = 0.2;
    y = 0.1;
    w = 0.8;
    h = 0.06;
		moving = 0;
    colorBackground[] = {.2, .2, .2, .8};
		colorText[] = {1, .5, 0, .9};
    sizeEx = 0.04;
    text = "Selected objects";
  };
  controls[] = { SELLIST,ZDELBTN,ZGENBTN };
  class SELLIST : RscListBox_Z {
  	idc = DLG_Z_LISTSEL;
  	x = 0.21;
  	y = 0.165;
  	w = 0.79;
  	h = 0.72;
		colorText[] = {1, .5, 0, .9};
		soundSelect[] = {"",0.1,1};
		onLBSelChanged = "hint str _this";
		moving = 1;
  };
  class ZDELBTN : RscButton_Z
  {
  	idc = DLG_Z_ZDELBTN;
  	x = 0.2;
  	y = 0;
  	w = 0.15;
  	h = 0.04;
		sizeEx = 0.04;
	 	text = "DELETE";
  	action = "hint str _this;";
  };
  class ZGENBTN : RscButton_Z
  {
  	idc = DLG_Z_ZGENBTN;
  	x = 0.4;
  	y = 0;
  	w = 0.15;
  	h = 0.04;
		sizeEx = 0.04;
	 	text = "GENERATE";
  	action = "call z_generatesqf";
  };
};