class FlagNATO {
	idd = 1000;
	duration = 1000000;
	fadeIn = 0;
	fadeOut = 0;
	onLoad = uiNamespace setVariable ["FlagNATO", _this select 0];
	onUnLoad = uiNamespace setVariable ["FlagNATO", nil];
	class controls {
		class FlagNATOControl {
			idc = 1000;
			type = 0;
			style = 2096; // 48 (no border picture) + 2048 (original aspect ratio)
			x = (safeZoneX + safeZoneW) * 0.97;
			y = safeZoneY + safeZoneH * 0.2;
			w = safeZoneH * 0.03;
			h = safeZoneW * 0.03;
			font = "Default";
			sizeEx = 0.04;
			colorBackground[] = {0,0,0,1};
			colorText[] = {0.7,0.7,0.7,1};
			text = "images\nato.paa";
		};
	};
};
class TextNATO {
	idd = 1001;
	duration = 1000000;
	fadeIn = 0;
	fadeOut = 0;
	onLoad = uiNamespace setVariable ["TextNATO",_this select 0];
	onUnLoad = uiNamespace setVariable ["TextNATO", nil];
	class controls {
		class TextNATOControl {
			idc = 1001;
			type = 0;
			style = 2; // 0 (singleline box) + 2 (centred)
			x = (safeZoneX + safeZoneW) * 0.97;
			y = safeZoneY + safeZoneH * 0.2;
			w = safeZoneH * 0.03;
			h = safeZoneW * 0.03;
			font = "Default";
			shadow = 1;
			sizeEx = 0.04;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			text = "0";
		};
	};
};
class FlagCSAT {
	idd = 1002;
	duration = 1000000;
	fadeIn = 0;
	fadeOut = 0;
	onLoad = uiNamespace setVariable ["FlagCSAT", _this select 0];
	onUnLoad = uiNamespace setVariable ["FlagCSAT", nil];
	class controls {
		class FlagCSATControl {
			idc = 1002;
			type = 0;
			style = 2096; // 48 (no border picture) + 2048 (original aspect ratio)
			x = (safeZoneX + safeZoneW) * 0.97;
			y = safeZoneY + safeZoneH * 0.2 + safeZoneW * 0.033;
			w = safeZoneH * 0.03;
			h = safeZoneW * 0.03;
			font = "Default";
			sizeEx = 0.04;
			colorBackground[] = {0,0,0,1};
			colorText[] = {0.7,0.7,0.7,1};
			text = "images\csat.paa";
		};
	};
};
class TextCSAT {
	idd = 1003;
	duration = 1000000;
	fadeIn = 0;
	fadeOut = 0;
	onLoad = uiNamespace setVariable ["TextCSAT", _this select 0];
	onUnLoad = uiNamespace setVariable ["TextCSAT", nil];
	class controls {
		class TextCSATControl {
			idc = 1003;
			type = 0;
			style = 2; // 0 (singleline box) + 2 (centred)
			x = (safeZoneX + safeZoneW) * 0.97;
			y = safeZoneY + safeZoneH * 0.2 + safeZoneW * 0.033;
			w = safeZoneH * 0.03;
			h = safeZoneW * 0.03;
			font = "Default";
			shadow = 1;
			sizeEx = 0.04;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			text = "0";
		};
	};
};
class FlagAAF {
	idd = 1004;
	duration = 1000000;
	fadeIn = 0;
	fadeOut = 0;
	onLoad = uiNamespace setVariable ["FlagAAF", _this select 0];
	onUnLoad = uiNamespace setVariable ["FlagAAF", nil];
	class controls {
		class FlagAAFControl {
			idc = 1004;
			type = 0;
			style = 2096; // 48 (no border picture) + 2048 (original aspect ratio)
			x = (safeZoneX + safeZoneW) * 0.97;
			y = safeZoneY + safeZoneH * 0.2 + safeZoneW * 0.066;
			w = safeZoneH * 0.03;
			h = safeZoneW * 0.03;
			font = "Default";
			sizeEx = 0.04;
			colorBackground[] = {0,0,0,1};
			colorText[] = {0.7,0.7,0.7,1};
			text = "images\AAF.paa";
		};
	};
};
class TextAAF {
	idd = 1005;
	duration = 1000000;
	fadeIn = 0;
	fadeOut = 0;
	onLoad = uiNamespace setVariable ["TextAAF", _this select 0];
	onUnLoad = uiNamespace setVariable ["TextAAF", nil];
	class controls {
		class TextAAFControl {
			idc = 1005;
			type = 0;
			style = 2; // 0 (singleline box) + 2 (centred)
			x = (safeZoneX + safeZoneW) * 0.97;
			y = safeZoneY + safeZoneH * 0.2 + safeZoneW * 0.066;
			w = safeZoneH * 0.03;
			h = safeZoneW * 0.03;
			font = "Default";
			shadow = 1;
			sizeEx = 0.04;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			text = "0";
		};
	};
};
class Timer {
	idd = 1006;
	duration = 1000000;
	fadeIn = 0;
	fadeOut = 0;
	onLoad = uiNamespace setVariable ["Timer", _this select 0];
	onUnLoad = uiNamespace setVariable ["Timer", nil];
	class controls {
		class TimerControl {
			idc = 1006;
			type = 0;
			style = 2096; // 48 (no border picture) + 2048 (original aspect ratio)
			x = (safeZoneX + safeZoneW) * 0.97;
			y = safeZoneY + safeZoneH * 0.2 + safeZoneW * 0.099;
			w = safeZoneH * 0.03;
			h = safeZoneW * 0.03;
			font = "Default";
			sizeEx = 0.04;
			colorBackground[] = {0,0,0,1};
			colorText[] = {0.3,0.3,0.3,1};
			text = "images\timer.paa";
		};
	};
};
class TextTimer {
	idd = 1007;
	duration = 1000000;
	fadeIn = 0;
	fadeOut = 0;
	onLoad = uiNamespace setVariable ["TextTimer", _this select 0];
	onUnLoad = uiNamespace setVariable ["TextTimer", nil];
	class controls {
		class TextTimerControl {
			idc = 1007;
			type = 0;
			style = 2; // 0 (singleline box) + 2 (centred)
			x = (safeZoneX + safeZoneW) * 0.97;
			y = safeZoneY + safeZoneH * 0.2 + safeZoneW * 0.099;
			w = safeZoneH * 0.03;
			h = safeZoneW * 0.03;
			font = "Default";
			shadow = 1;
			sizeEx = 0.04;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			text = "0:00";
		};
	};
};