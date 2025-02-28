package com.gotchaslots.slots.data.lobby.lobbyMachine
{
	import com.gotchaslots.slots.assets.machines.airplane.AirplaneEmbed;
	import com.gotchaslots.slots.assets.machines.animals.AnimalsEmbed;
	import com.gotchaslots.slots.assets.machines.avatar.AvatarEmbed;
	import com.gotchaslots.slots.assets.machines.beach.BeachEmbed;
	import com.gotchaslots.slots.assets.machines.cars.CarsEmbed;
	import com.gotchaslots.slots.assets.machines.cheese.CheeseEmbed;
	import com.gotchaslots.slots.assets.machines.chef.ChefEmbed;
	import com.gotchaslots.slots.assets.machines.chinese.ChineseEmbed;
	import com.gotchaslots.slots.assets.machines.christmas.ChristmasEmbed;
	import com.gotchaslots.slots.assets.machines.classic.ClassicEmbed;
	import com.gotchaslots.slots.assets.machines.comingSoon.ComingSoonEmbed;
	import com.gotchaslots.slots.assets.machines.cosmetic.CosmeticEmbed;
	import com.gotchaslots.slots.assets.machines.diving.DivingEmbed;
	import com.gotchaslots.slots.assets.machines.easter.EasterEmbed;
	import com.gotchaslots.slots.assets.machines.flags.FlagsEmbed;
	import com.gotchaslots.slots.assets.machines.halloween.HalloweenEmbed;
	import com.gotchaslots.slots.assets.machines.medical.MedicalEmbed;
	import com.gotchaslots.slots.assets.machines.meow.MeowEmbed;
	import com.gotchaslots.slots.assets.machines.sports.SportsEmbed;
	import com.gotchaslots.slots.assets.machines.tourism.TourismEmbed;
	import com.gotchaslots.slots.assets.machines.valentines.ValentinesEmbed;
	import com.gotchaslots.slots.assets.machines.weather.WeatherEmbed;
	import com.gotchaslots.slots.data.machine.symbol.NormalSymbolData;
	import com.gotchaslots.slots.data.machine.symbol.base.BaseSymbolData;
	
	public class LobbyMachineNormalSymbolsData
	{
		public static function ComingSoonNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		{
			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
			symbols.push(new NormalSymbolData(symbols.length, ComingSoonEmbed.Preview, factor, 5, 4, 3, 2));
			return symbols;
		}
		public static function AirplaneNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		{
			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
			symbols.push(new NormalSymbolData(symbols.length, AirplaneEmbed.Symbol_01, factor, 7, 3, 3, 0));
			symbols.push(new NormalSymbolData(symbols.length, AirplaneEmbed.Symbol_02, factor, 26, 11, 7, 3));
			symbols.push(new NormalSymbolData(symbols.length, AirplaneEmbed.Symbol_03, factor, 23, 14, 5, 5));
			symbols.push(new NormalSymbolData(symbols.length, AirplaneEmbed.Symbol_04, factor, 44, 16, 16, 8));
			symbols.push(new NormalSymbolData(symbols.length, AirplaneEmbed.Symbol_05, factor, 36, 36, 15, 13));
			symbols.push(new NormalSymbolData(symbols.length, AirplaneEmbed.Symbol_06, factor, 46, 22, 22, 17));
			symbols.push(new NormalSymbolData(symbols.length, AirplaneEmbed.Symbol_07, factor, 157, 64, 29, 19));
			symbols.push(new NormalSymbolData(symbols.length, AirplaneEmbed.Symbol_08, factor, 282, 128, 53, 27));
			symbols.push(new NormalSymbolData(symbols.length, AirplaneEmbed.Symbol_09, factor, 150, 112, 73, 32));
			symbols.push(new NormalSymbolData(symbols.length, AirplaneEmbed.Symbol_10, factor, 159, 74, 59, 38));
			symbols.push(new NormalSymbolData(symbols.length, AirplaneEmbed.Symbol_11, factor, 244, 123, 104, 67));
			return symbols;
		}
		public static function AnimalsNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		{
			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
			symbols.push(new NormalSymbolData(symbols.length, AnimalsEmbed.Symbol_01, factor, 10, 6, 3, 0));
			symbols.push(new NormalSymbolData(symbols.length, AnimalsEmbed.Symbol_02, factor, 5, 4, 3, 0));
			symbols.push(new NormalSymbolData(symbols.length, AnimalsEmbed.Symbol_03, factor, 10, 8, 5, 3));
			symbols.push(new NormalSymbolData(symbols.length, AnimalsEmbed.Symbol_04, factor, 53, 21, 9, 4));
			symbols.push(new NormalSymbolData(symbols.length, AnimalsEmbed.Symbol_05, factor, 62, 29, 11, 6));
			symbols.push(new NormalSymbolData(symbols.length, AnimalsEmbed.Symbol_06, factor, 36, 24, 15, 8));
			symbols.push(new NormalSymbolData(symbols.length, AnimalsEmbed.Symbol_07, factor, 75, 31, 13, 9));
			symbols.push(new NormalSymbolData(symbols.length, AnimalsEmbed.Symbol_08, factor, 62, 38, 28, 16));
			symbols.push(new NormalSymbolData(symbols.length, AnimalsEmbed.Symbol_09, factor, 83, 48, 34, 22));
			return symbols;
		}
		public static function AvatarNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		{
			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
			symbols.push(new NormalSymbolData(symbols.length, AvatarEmbed.Symbol_01, factor, 21, 11, 5, 0));
			symbols.push(new NormalSymbolData(symbols.length, AvatarEmbed.Symbol_02, factor, 17, 10, 8, 5));
			symbols.push(new NormalSymbolData(symbols.length, AvatarEmbed.Symbol_03, factor, 61, 29, 17, 7));
			symbols.push(new NormalSymbolData(symbols.length, AvatarEmbed.Symbol_04, factor, 65, 36, 14, 10));
			symbols.push(new NormalSymbolData(symbols.length, AvatarEmbed.Symbol_05, factor, 166, 82, 34, 17));
			symbols.push(new NormalSymbolData(symbols.length, AvatarEmbed.Symbol_06, factor, 112, 77, 43, 24));
			symbols.push(new NormalSymbolData(symbols.length, AvatarEmbed.Symbol_07, factor, 72, 60, 47, 27));
			symbols.push(new NormalSymbolData(symbols.length, AvatarEmbed.Symbol_08, factor, 304, 143, 75, 33));
			symbols.push(new NormalSymbolData(symbols.length, AvatarEmbed.Symbol_09, factor, 214, 171, 119, 61));
			symbols.push(new NormalSymbolData(symbols.length, AvatarEmbed.Symbol_10, factor, 325, 214, 173, 85));
			return symbols;
		}
		public static function BeachNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		{
			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
			symbols.push(new NormalSymbolData(symbols.length, BeachEmbed.Symbol_01, factor, 12, 4, 4, 0));
			symbols.push(new NormalSymbolData(symbols.length, BeachEmbed.Symbol_02, factor, 15, 6, 4, 0));
			symbols.push(new NormalSymbolData(symbols.length, BeachEmbed.Symbol_03, factor, 18, 18, 8, 4));
			symbols.push(new NormalSymbolData(symbols.length, BeachEmbed.Symbol_04, factor, 59, 26, 16, 6));
			symbols.push(new NormalSymbolData(symbols.length, BeachEmbed.Symbol_05, factor, 35, 15, 7, 6));
			symbols.push(new NormalSymbolData(symbols.length, BeachEmbed.Symbol_06, factor, 56, 24, 15, 10));
			symbols.push(new NormalSymbolData(symbols.length, BeachEmbed.Symbol_07, factor, 93, 46, 32, 15));
			symbols.push(new NormalSymbolData(symbols.length, BeachEmbed.Symbol_08, factor, 51, 28, 24, 21));
			symbols.push(new NormalSymbolData(symbols.length, BeachEmbed.Symbol_09, factor, 148, 64, 43, 28));
			symbols.push(new NormalSymbolData(symbols.length, BeachEmbed.Symbol_10, factor, 185, 138, 104, 42));
			return symbols;
		}
		//		public static function BigAppleNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		//		{
		//			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
		//			symbols.push(new NormalSymbolData(symbols.length, BigAppleEmbed.Symbol_01, factor, 15, 8, 4, 0));
		//			symbols.push(new NormalSymbolData(symbols.length, BigAppleEmbed.Symbol_02, factor, 17, 9, 4, 0));
		//			symbols.push(new NormalSymbolData(symbols.length, BigAppleEmbed.Symbol_03, factor, 11, 6, 4, 4));
		//			symbols.push(new NormalSymbolData(symbols.length, BigAppleEmbed.Symbol_04, factor, 44, 20, 10, 4));
		//			symbols.push(new NormalSymbolData(symbols.length, BigAppleEmbed.Symbol_05, factor, 16, 16, 10, 7));
		//			symbols.push(new NormalSymbolData(symbols.length, BigAppleEmbed.Symbol_06, factor, 24, 23, 18, 9));
		//			symbols.push(new NormalSymbolData(symbols.length, BigAppleEmbed.Symbol_07, factor, 65, 39, 25, 11));
		//			symbols.push(new NormalSymbolData(symbols.length, BigAppleEmbed.Symbol_08, factor, 77, 38, 21, 11));
		//			symbols.push(new NormalSymbolData(symbols.length, BigAppleEmbed.Symbol_09, factor, 40, 35, 17, 11));
		//			return symbols;
		//		}
		//		public static function BugsyNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		//		{
		//			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
		//			symbols.push(new NormalSymbolData(symbols.length, BugsyEmbed.Symbol_01, factor, 12, 5, 3, 0));
		//			symbols.push(new NormalSymbolData(symbols.length, BugsyEmbed.Symbol_02, factor, 16, 12, 5, 3));
		//			symbols.push(new NormalSymbolData(symbols.length, BugsyEmbed.Symbol_03, factor, 9, 9, 7, 3));
		//			symbols.push(new NormalSymbolData(symbols.length, BugsyEmbed.Symbol_04, factor, 12, 6, 6, 5));
		//			symbols.push(new NormalSymbolData(symbols.length, BugsyEmbed.Symbol_05, factor, 41, 17, 9, 6));
		//			symbols.push(new NormalSymbolData(symbols.length, BugsyEmbed.Symbol_06, factor, 33, 29, 13, 9));
		//			symbols.push(new NormalSymbolData(symbols.length, BugsyEmbed.Symbol_07, factor, 49, 41, 28, 12));
		//			symbols.push(new NormalSymbolData(symbols.length, BugsyEmbed.Symbol_08, factor, 114, 52, 20, 13));
		//			symbols.push(new NormalSymbolData(symbols.length, BugsyEmbed.Symbol_09, factor, 31, 23, 17, 15));
		//			symbols.push(new NormalSymbolData(symbols.length, BugsyEmbed.Symbol_10, factor, 137, 54, 43, 24));
		//			symbols.push(new NormalSymbolData(symbols.length, BugsyEmbed.Symbol_11, factor, 100, 75, 33, 27));
		//			return symbols;
		//		}
		public static function CarsNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		{
			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
			symbols.push(new NormalSymbolData(symbols.length, CarsEmbed.Symbol_01, factor, 12, 4, 4, 0));
			symbols.push(new NormalSymbolData(symbols.length, CarsEmbed.Symbol_02, factor, 15, 6, 4, 0));
			symbols.push(new NormalSymbolData(symbols.length, CarsEmbed.Symbol_03, factor, 18, 18, 8, 4));
			symbols.push(new NormalSymbolData(symbols.length, CarsEmbed.Symbol_04, factor, 59, 26, 16, 6));
			symbols.push(new NormalSymbolData(symbols.length, CarsEmbed.Symbol_05, factor, 35, 15, 7, 6));
			symbols.push(new NormalSymbolData(symbols.length, CarsEmbed.Symbol_06, factor, 56, 24, 15, 10));
			symbols.push(new NormalSymbolData(symbols.length, CarsEmbed.Symbol_07, factor, 93, 46, 32, 15));
			symbols.push(new NormalSymbolData(symbols.length, CarsEmbed.Symbol_08, factor, 51, 28, 24, 21));
			symbols.push(new NormalSymbolData(symbols.length, CarsEmbed.Symbol_09, factor, 148, 64, 43, 28));
			symbols.push(new NormalSymbolData(symbols.length, CarsEmbed.Symbol_10, factor, 185, 138, 104, 42));
			return symbols;
		}
		public static function CheeseNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		{
			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
			symbols.push(new NormalSymbolData(symbols.length, CheeseEmbed.Symbol_01, factor, 17, 7, 3, 0));
			symbols.push(new NormalSymbolData(symbols.length, CheeseEmbed.Symbol_02, factor, 11, 5, 3, 0));
			symbols.push(new NormalSymbolData(symbols.length, CheeseEmbed.Symbol_03, factor, 11, 5, 3, 3));
			symbols.push(new NormalSymbolData(symbols.length, CheeseEmbed.Symbol_04, factor, 25, 13, 5, 4));
			symbols.push(new NormalSymbolData(symbols.length, CheeseEmbed.Symbol_05, factor, 74, 30, 14, 7));
			symbols.push(new NormalSymbolData(symbols.length, CheeseEmbed.Symbol_06, factor, 65, 28, 23, 10));
			symbols.push(new NormalSymbolData(symbols.length, CheeseEmbed.Symbol_07, factor, 82, 32, 18, 12));
			symbols.push(new NormalSymbolData(symbols.length, CheeseEmbed.Symbol_08, factor, 151, 69, 35, 15));
			symbols.push(new NormalSymbolData(symbols.length, CheeseEmbed.Symbol_09, factor, 79, 34, 29, 20));
			return symbols;
		}
		public static function ChefNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		{
			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
			symbols.push(new NormalSymbolData(symbols.length, ChefEmbed.Symbol_01, factor, 22, 10, 4, 0));
			symbols.push(new NormalSymbolData(symbols.length, ChefEmbed.Symbol_02, factor, 13, 6, 4, 0));
			symbols.push(new NormalSymbolData(symbols.length, ChefEmbed.Symbol_03, factor, 13, 9, 4, 4));
			symbols.push(new NormalSymbolData(symbols.length, ChefEmbed.Symbol_04, factor, 29, 15, 7, 4));
			symbols.push(new NormalSymbolData(symbols.length, ChefEmbed.Symbol_05, factor, 20, 10, 4, 4));
			symbols.push(new NormalSymbolData(symbols.length, ChefEmbed.Symbol_06, factor, 60, 33, 15, 7));
			symbols.push(new NormalSymbolData(symbols.length, ChefEmbed.Symbol_07, factor, 50, 31, 18, 12));
			symbols.push(new NormalSymbolData(symbols.length, ChefEmbed.Symbol_08, factor, 158, 73, 33, 14));
			symbols.push(new NormalSymbolData(symbols.length, ChefEmbed.Symbol_09, factor, 108, 73, 59, 22));
			symbols.push(new NormalSymbolData(symbols.length, ChefEmbed.Symbol_10, factor, 200, 87, 43, 30));
			symbols.push(new NormalSymbolData(symbols.length, ChefEmbed.Symbol_11, factor, 131, 89, 66, 43));
			symbols.push(new NormalSymbolData(symbols.length, ChefEmbed.Symbol_12, factor, 149, 140, 76, 46));
			return symbols;
		}
		public static function ChineseNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		{
			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
			symbols.push(new NormalSymbolData(symbols.length, ChineseEmbed.Symbol_01, factor, 12, 8, 4, 0));
			symbols.push(new NormalSymbolData(symbols.length, ChineseEmbed.Symbol_02, factor, 9, 7, 4, 0));
			symbols.push(new NormalSymbolData(symbols.length, ChineseEmbed.Symbol_03, factor, 27, 11, 7, 4));
			symbols.push(new NormalSymbolData(symbols.length, ChineseEmbed.Symbol_04, factor, 18, 10, 6, 4));
			symbols.push(new NormalSymbolData(symbols.length, ChineseEmbed.Symbol_05, factor, 21, 11, 9, 7));
			symbols.push(new NormalSymbolData(symbols.length, ChineseEmbed.Symbol_06, factor, 21, 18, 14, 10));
			symbols.push(new NormalSymbolData(symbols.length, ChineseEmbed.Symbol_07, factor, 176, 79, 31, 15));
			symbols.push(new NormalSymbolData(symbols.length, ChineseEmbed.Symbol_08, factor, 117, 73, 28, 22));
			return symbols;
		}
		public static function ChristmasNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		{
			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
			symbols.push(new NormalSymbolData(symbols.length, ChristmasEmbed.Symbol_01, factor, 7, 5, 3, 0));
			symbols.push(new NormalSymbolData(symbols.length, ChristmasEmbed.Symbol_02, factor, 18, 10, 5, 3));
			symbols.push(new NormalSymbolData(symbols.length, ChristmasEmbed.Symbol_03, factor, 38, 18, 9, 3));
			symbols.push(new NormalSymbolData(symbols.length, ChristmasEmbed.Symbol_04, factor, 31, 22, 11, 5));
			symbols.push(new NormalSymbolData(symbols.length, ChristmasEmbed.Symbol_05, factor, 53, 20, 16, 6));
			symbols.push(new NormalSymbolData(symbols.length, ChristmasEmbed.Symbol_06, factor, 26, 14, 12, 7));
			symbols.push(new NormalSymbolData(symbols.length, ChristmasEmbed.Symbol_07, factor, 63, 37, 19, 12));
			symbols.push(new NormalSymbolData(symbols.length, ChristmasEmbed.Symbol_08, factor, 103, 58, 28, 17));
			symbols.push(new NormalSymbolData(symbols.length, ChristmasEmbed.Symbol_09, factor, 136, 68, 47, 26));
			symbols.push(new NormalSymbolData(symbols.length, ChristmasEmbed.Symbol_10, factor, 144, 68, 35, 27));
			symbols.push(new NormalSymbolData(symbols.length, ChristmasEmbed.Symbol_11, factor, 180, 78, 54, 27));
			return symbols;
		}
		public static function ClassicNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		{
			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
			symbols.push(new NormalSymbolData(symbols.length, ClassicEmbed.Symbol_01, factor, 22, 11, 5, 0));
			symbols.push(new NormalSymbolData(symbols.length, ClassicEmbed.Symbol_02, factor, 16, 10, 5, 0));
			symbols.push(new NormalSymbolData(symbols.length, ClassicEmbed.Symbol_03, factor, 23, 20, 10, 5));
			symbols.push(new NormalSymbolData(symbols.length, ClassicEmbed.Symbol_04, factor, 31, 21, 8, 5));
			symbols.push(new NormalSymbolData(symbols.length, ClassicEmbed.Symbol_05, factor, 32, 25, 10, 8));
			symbols.push(new NormalSymbolData(symbols.length, ClassicEmbed.Symbol_06, factor, 42, 24, 13, 11));
			symbols.push(new NormalSymbolData(symbols.length, ClassicEmbed.Symbol_07, factor, 57, 23, 13, 12));
			symbols.push(new NormalSymbolData(symbols.length, ClassicEmbed.Symbol_08, factor, 145, 97, 55, 21));
			symbols.push(new NormalSymbolData(symbols.length, ClassicEmbed.Symbol_09, factor, 150, 85, 54, 30));
			symbols.push(new NormalSymbolData(symbols.length, ClassicEmbed.Symbol_10, factor, 152, 109, 66, 41));
			return symbols;
		}
		public static function CosmeticNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		{
			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
			symbols.push(new NormalSymbolData(symbols.length, CosmeticEmbed.Symbol_01, factor, 14, 7, 3, 0));
			symbols.push(new NormalSymbolData(symbols.length, CosmeticEmbed.Symbol_02, factor, 9, 6, 3, 0));
			symbols.push(new NormalSymbolData(symbols.length, CosmeticEmbed.Symbol_03, factor, 13, 8, 7, 3));
			symbols.push(new NormalSymbolData(symbols.length, CosmeticEmbed.Symbol_04, factor, 20, 12, 7, 3));
			symbols.push(new NormalSymbolData(symbols.length, CosmeticEmbed.Symbol_05, factor, 18, 13, 11, 4));
			symbols.push(new NormalSymbolData(symbols.length, CosmeticEmbed.Symbol_06, factor, 54, 41, 17, 8));
			symbols.push(new NormalSymbolData(symbols.length, CosmeticEmbed.Symbol_07, factor, 75, 29, 13, 9));
			symbols.push(new NormalSymbolData(symbols.length, CosmeticEmbed.Symbol_08, factor, 127, 51, 23, 13));
			symbols.push(new NormalSymbolData(symbols.length, CosmeticEmbed.Symbol_09, factor, 101, 48, 20, 15));
			symbols.push(new NormalSymbolData(symbols.length, CosmeticEmbed.Symbol_10, factor, 132, 71, 29, 19));
			return symbols;
		}
		//		public static function CroupierNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		//		{
		//			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
		//			symbols.push(new NormalSymbolData(symbols.length, CroupierEmbed.Symbol_01, factor, 11, 5, 5, 0));
		//			symbols.push(new NormalSymbolData(symbols.length, CroupierEmbed.Symbol_02, factor, 13, 7, 6, 5));
		//			symbols.push(new NormalSymbolData(symbols.length, CroupierEmbed.Symbol_03, factor, 49, 35, 14, 6));
		//			symbols.push(new NormalSymbolData(symbols.length, CroupierEmbed.Symbol_04, factor, 29, 25, 14, 8));
		//			symbols.push(new NormalSymbolData(symbols.length, CroupierEmbed.Symbol_05, factor, 52, 25, 17, 14));
		//			symbols.push(new NormalSymbolData(symbols.length, CroupierEmbed.Symbol_06, factor, 51, 51, 23, 14));
		//			symbols.push(new NormalSymbolData(symbols.length, CroupierEmbed.Symbol_07, factor, 96, 39, 31, 23));
		//			symbols.push(new NormalSymbolData(symbols.length, CroupierEmbed.Symbol_08, factor, 125, 88, 41, 29));
		//			symbols.push(new NormalSymbolData(symbols.length, CroupierEmbed.Symbol_09, factor, 141, 87, 58, 33));
		//			return symbols;
		//		}
		public static function DivingNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		{
			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
			symbols.push(new NormalSymbolData(symbols.length, DivingEmbed.Symbol_01, factor, 7, 6, 3, 0));
			symbols.push(new NormalSymbolData(symbols.length, DivingEmbed.Symbol_02, factor, 13, 9, 6, 3));
			symbols.push(new NormalSymbolData(symbols.length, DivingEmbed.Symbol_03, factor, 11, 6, 4, 3));
			symbols.push(new NormalSymbolData(symbols.length, DivingEmbed.Symbol_04, factor, 22, 16, 7, 3));
			symbols.push(new NormalSymbolData(symbols.length, DivingEmbed.Symbol_05, factor, 40, 30, 11, 5));
			symbols.push(new NormalSymbolData(symbols.length, DivingEmbed.Symbol_06, factor, 22, 13, 10, 7));
			symbols.push(new NormalSymbolData(symbols.length, DivingEmbed.Symbol_07, factor, 51, 41, 21, 12));
			symbols.push(new NormalSymbolData(symbols.length, DivingEmbed.Symbol_08, factor, 233, 96, 40, 16));
			symbols.push(new NormalSymbolData(symbols.length, DivingEmbed.Symbol_09, factor, 242, 127, 69, 27));
			symbols.push(new NormalSymbolData(symbols.length, DivingEmbed.Symbol_10, factor, 285, 162, 68, 45));
			return symbols;
		}
		public static function EasterNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		{
			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
			symbols.push(new NormalSymbolData(symbols.length, EasterEmbed.Symbol_01, factor, 13, 12, 5, 0));
			symbols.push(new NormalSymbolData(symbols.length, EasterEmbed.Symbol_02, factor, 22, 15, 7, 5));
			symbols.push(new NormalSymbolData(symbols.length, EasterEmbed.Symbol_03, factor, 25, 10, 10, 5));
			symbols.push(new NormalSymbolData(symbols.length, EasterEmbed.Symbol_04, factor, 29, 23, 20, 8));
			symbols.push(new NormalSymbolData(symbols.length, EasterEmbed.Symbol_05, factor, 54, 37, 32, 12));
			symbols.push(new NormalSymbolData(symbols.length, EasterEmbed.Symbol_06, factor, 83, 58, 24, 20));
			symbols.push(new NormalSymbolData(symbols.length, EasterEmbed.Symbol_07, factor, 228, 98, 45, 25));
			return symbols;
		}
		public static function FlagsNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		{
			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
			symbols.push(new NormalSymbolData(symbols.length, FlagsEmbed.Symbol_01, factor, 6, 5, 5, 0));
			symbols.push(new NormalSymbolData(symbols.length, FlagsEmbed.Symbol_02, factor, 28, 16, 6, 5));
			symbols.push(new NormalSymbolData(symbols.length, FlagsEmbed.Symbol_03, factor, 28, 21, 10, 7));
			symbols.push(new NormalSymbolData(symbols.length, FlagsEmbed.Symbol_04, factor, 83, 45, 21, 11));
			symbols.push(new NormalSymbolData(symbols.length, FlagsEmbed.Symbol_05, factor, 135, 77, 41, 16));
			symbols.push(new NormalSymbolData(symbols.length, FlagsEmbed.Symbol_06, factor, 51, 41, 18, 18));
			symbols.push(new NormalSymbolData(symbols.length, FlagsEmbed.Symbol_07, factor, 137, 89, 39, 22));
			symbols.push(new NormalSymbolData(symbols.length, FlagsEmbed.Symbol_08, factor, 105, 92, 67, 31));
			symbols.push(new NormalSymbolData(symbols.length, FlagsEmbed.Symbol_09, factor, 198, 97, 73, 55));
			return symbols;
		}
		//		public static function FoodNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		//		{
		//			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
		//			symbols.push(new NormalSymbolData(symbols.length, FoodEmbed.Symbol_01, factor, 12, 5, 4, 0));
		//			symbols.push(new NormalSymbolData(symbols.length, FoodEmbed.Symbol_02, factor, 20, 15, 6, 4));
		//			symbols.push(new NormalSymbolData(symbols.length, FoodEmbed.Symbol_03, factor, 26, 14, 8, 5));
		//			symbols.push(new NormalSymbolData(symbols.length, FoodEmbed.Symbol_04, factor, 37, 19, 10, 6));
		//			symbols.push(new NormalSymbolData(symbols.length, FoodEmbed.Symbol_05, factor, 107, 43, 19, 8));
		//			symbols.push(new NormalSymbolData(symbols.length, FoodEmbed.Symbol_06, factor, 74, 48, 24, 14));
		//			symbols.push(new NormalSymbolData(symbols.length, FoodEmbed.Symbol_07, factor, 65, 35, 26, 16));
		//			symbols.push(new NormalSymbolData(symbols.length, FoodEmbed.Symbol_08, factor, 111, 61, 35, 24));
		//			symbols.push(new NormalSymbolData(symbols.length, FoodEmbed.Symbol_09, factor, 169, 113, 88, 41));
		//			symbols.push(new NormalSymbolData(symbols.length, FoodEmbed.Symbol_10, factor, 421, 221, 142, 59));
		//			symbols.push(new NormalSymbolData(symbols.length, FoodEmbed.Symbol_11, factor, 844, 388, 198, 103));
		//			return symbols;
		//		}
		//		public static function FruitsNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		//		{
		//			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
		//			symbols.push(new NormalSymbolData(symbols.length, FruitsEmbed.Symbol_01, factor, 8, 6, 3, 0));
		//			symbols.push(new NormalSymbolData(symbols.length, FruitsEmbed.Symbol_02, factor, 19, 7, 3, 0));
		//			symbols.push(new NormalSymbolData(symbols.length, FruitsEmbed.Symbol_03, factor, 7, 4, 3, 3));
		//			symbols.push(new NormalSymbolData(symbols.length, FruitsEmbed.Symbol_04, factor, 23, 10, 5, 3));
		//			symbols.push(new NormalSymbolData(symbols.length, FruitsEmbed.Symbol_05, factor, 16, 9, 4, 4));
		//			symbols.push(new NormalSymbolData(symbols.length, FruitsEmbed.Symbol_06, factor, 34, 23, 13, 5));
		//			symbols.push(new NormalSymbolData(symbols.length, FruitsEmbed.Symbol_07, factor, 31, 27, 13, 6));
		//			symbols.push(new NormalSymbolData(symbols.length, FruitsEmbed.Symbol_08, factor, 60, 37, 28, 11));
		//			symbols.push(new NormalSymbolData(symbols.length, FruitsEmbed.Symbol_09, factor, 62, 35, 21, 18));
		//			symbols.push(new NormalSymbolData(symbols.length, FruitsEmbed.Symbol_10, factor, 129, 49, 25, 21));
		//			symbols.push(new NormalSymbolData(symbols.length, FruitsEmbed.Symbol_11, factor, 140, 105, 57, 36));
		//			return symbols;
		//		}
		//		public static function GoldenNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		//		{
		//			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
		//			symbols.push(new NormalSymbolData(symbols.length, GoldenEmbed.Symbol_01, factor, 13, 5, 3, 0));
		//			symbols.push(new NormalSymbolData(symbols.length, GoldenEmbed.Symbol_02, factor, 19, 8, 3, 3));
		//			symbols.push(new NormalSymbolData(symbols.length, GoldenEmbed.Symbol_03, factor, 40, 17, 8, 4));
		//			symbols.push(new NormalSymbolData(symbols.length, GoldenEmbed.Symbol_04, factor, 27, 12, 7, 7));
		//			symbols.push(new NormalSymbolData(symbols.length, GoldenEmbed.Symbol_05, factor, 69, 29, 11, 8));
		//			symbols.push(new NormalSymbolData(symbols.length, GoldenEmbed.Symbol_06, factor, 26, 17, 10, 9));
		//			symbols.push(new NormalSymbolData(symbols.length, GoldenEmbed.Symbol_07, factor, 77, 66, 33, 13));
		//			symbols.push(new NormalSymbolData(symbols.length, GoldenEmbed.Symbol_08, factor, 77, 56, 43, 16));
		//			symbols.push(new NormalSymbolData(symbols.length, GoldenEmbed.Symbol_09, factor, 127, 73, 48, 29));
		//			return symbols;
		//		}
		public static function HalloweenNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		{
			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
			symbols.push(new NormalSymbolData(symbols.length, HalloweenEmbed.Symbol_01, factor, 10, 6, 5, 0));
			symbols.push(new NormalSymbolData(symbols.length, HalloweenEmbed.Symbol_02, factor, 20, 9, 5, 0));
			symbols.push(new NormalSymbolData(symbols.length, HalloweenEmbed.Symbol_03, factor, 12, 5, 5, 5));
			symbols.push(new NormalSymbolData(symbols.length, HalloweenEmbed.Symbol_04, factor, 41, 21, 11, 7));
			symbols.push(new NormalSymbolData(symbols.length, HalloweenEmbed.Symbol_05, factor, 26, 16, 8, 7));
			symbols.push(new NormalSymbolData(symbols.length, HalloweenEmbed.Symbol_06, factor, 29, 20, 8, 8));
			symbols.push(new NormalSymbolData(symbols.length, HalloweenEmbed.Symbol_07, factor, 94, 40, 16, 8));
			symbols.push(new NormalSymbolData(symbols.length, HalloweenEmbed.Symbol_08, factor, 146, 58, 28, 13));
			symbols.push(new NormalSymbolData(symbols.length, HalloweenEmbed.Symbol_09, factor, 108, 42, 16, 15));
			symbols.push(new NormalSymbolData(symbols.length, HalloweenEmbed.Symbol_10, factor, 135, 53, 42, 18));
			symbols.push(new NormalSymbolData(symbols.length, HalloweenEmbed.Symbol_11, factor, 243, 136, 58, 22));
			symbols.push(new NormalSymbolData(symbols.length, HalloweenEmbed.Symbol_12, factor, 246, 111, 79, 36));
			return symbols;
		}
		//		public static function KitchenNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		//		{
		//			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
		//			symbols.push(new NormalSymbolData(symbols.length, KitchenEmbed.Symbol_01, factor, 13, 8, 5, 0));
		//			symbols.push(new NormalSymbolData(symbols.length, KitchenEmbed.Symbol_02, factor, 14, 6, 5, 0));
		//			symbols.push(new NormalSymbolData(symbols.length, KitchenEmbed.Symbol_03, factor, 38, 28, 12, 5));
		//			symbols.push(new NormalSymbolData(symbols.length, KitchenEmbed.Symbol_04, factor, 92, 37, 14, 6));
		//			symbols.push(new NormalSymbolData(symbols.length, KitchenEmbed.Symbol_05, factor, 22, 21, 11, 8));
		//			symbols.push(new NormalSymbolData(symbols.length, KitchenEmbed.Symbol_06, factor, 56, 24, 12, 12));
		//			symbols.push(new NormalSymbolData(symbols.length, KitchenEmbed.Symbol_07, factor, 233, 111, 50, 21));
		//			symbols.push(new NormalSymbolData(symbols.length, KitchenEmbed.Symbol_08, factor, 83, 71, 39, 36));
		//			symbols.push(new NormalSymbolData(symbols.length, KitchenEmbed.Symbol_09, factor, 103, 64, 63, 45));
		//			symbols.push(new NormalSymbolData(symbols.length, KitchenEmbed.Symbol_10, factor, 395, 172, 108, 81));
		//			return symbols;
		//		}
		//		public static function LegoNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		//		{
		//			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
		//			symbols.push(new NormalSymbolData(symbols.length, LegoEmbed.Symbol_01, factor, 10, 7, 4, 0));
		//			symbols.push(new NormalSymbolData(symbols.length, LegoEmbed.Symbol_02, factor, 15, 14, 9, 4));
		//			symbols.push(new NormalSymbolData(symbols.length, LegoEmbed.Symbol_03, factor, 41, 17, 8, 5));
		//			symbols.push(new NormalSymbolData(symbols.length, LegoEmbed.Symbol_04, factor, 67, 26, 16, 9));
		//			symbols.push(new NormalSymbolData(symbols.length, LegoEmbed.Symbol_05, factor, 83, 32, 22, 16));
		//			symbols.push(new NormalSymbolData(symbols.length, LegoEmbed.Symbol_06, factor, 161, 86, 62, 23));
		//			symbols.push(new NormalSymbolData(symbols.length, LegoEmbed.Symbol_07, factor, 188, 137, 64, 29));
		//			symbols.push(new NormalSymbolData(symbols.length, LegoEmbed.Symbol_08, factor, 183, 122, 51, 32));
		//			symbols.push(new NormalSymbolData(symbols.length, LegoEmbed.Symbol_09, factor, 217, 115, 46, 38));
		//			return symbols;
		//		}
		//		public static function MacauNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		//		{
		//			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
		//			symbols.push(new NormalSymbolData(symbols.length, MacauEmbed.Symbol_01, factor, 13, 9, 4, 0));
		//			symbols.push(new NormalSymbolData(symbols.length, MacauEmbed.Symbol_02, factor, 12, 10, 5, 4));
		//			symbols.push(new NormalSymbolData(symbols.length, MacauEmbed.Symbol_03, factor, 45, 31, 15, 6));
		//			symbols.push(new NormalSymbolData(symbols.length, MacauEmbed.Symbol_04, factor, 22, 15, 12, 7));
		//			symbols.push(new NormalSymbolData(symbols.length, MacauEmbed.Symbol_05, factor, 38, 20, 12, 10));
		//			symbols.push(new NormalSymbolData(symbols.length, MacauEmbed.Symbol_06, factor, 60, 37, 18, 15));
		//			symbols.push(new NormalSymbolData(symbols.length, MacauEmbed.Symbol_07, factor, 55, 30, 25, 22));
		//			symbols.push(new NormalSymbolData(symbols.length, MacauEmbed.Symbol_08, factor, 255, 184, 74, 34));
		//			return symbols;
		//		}
		public static function MedicalNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		{
			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
			symbols.push(new NormalSymbolData(symbols.length, MedicalEmbed.Symbol_01, factor, 24, 9, 4, 0));
			symbols.push(new NormalSymbolData(symbols.length, MedicalEmbed.Symbol_02, factor, 47, 18, 7, 4));
			symbols.push(new NormalSymbolData(symbols.length, MedicalEmbed.Symbol_03, factor, 27, 23, 15, 6));
			symbols.push(new NormalSymbolData(symbols.length, MedicalEmbed.Symbol_04, factor, 145, 59, 23, 9));
			symbols.push(new NormalSymbolData(symbols.length, MedicalEmbed.Symbol_05, factor, 204, 87, 42, 16));
			symbols.push(new NormalSymbolData(symbols.length, MedicalEmbed.Symbol_06, factor, 77, 33, 27, 17));
			symbols.push(new NormalSymbolData(symbols.length, MedicalEmbed.Symbol_07, factor, 95, 71, 31, 18));
			symbols.push(new NormalSymbolData(symbols.length, MedicalEmbed.Symbol_08, factor, 283, 118, 59, 32));
			symbols.push(new NormalSymbolData(symbols.length, MedicalEmbed.Symbol_09, factor, 343, 161, 116, 45));
			symbols.push(new NormalSymbolData(symbols.length, MedicalEmbed.Symbol_10, factor, 668, 306, 128, 59));
			return symbols;
		}
		public static function MeowNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		{
			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
			symbols.push(new NormalSymbolData(symbols.length, MeowEmbed.Symbol_01, factor, 20, 11, 5, 0));
			symbols.push(new NormalSymbolData(symbols.length, MeowEmbed.Symbol_02, factor, 17, 16, 11, 5));
			symbols.push(new NormalSymbolData(symbols.length, MeowEmbed.Symbol_03, factor, 97, 46, 18, 7));
			symbols.push(new NormalSymbolData(symbols.length, MeowEmbed.Symbol_04, factor, 44, 20, 18, 8));
			symbols.push(new NormalSymbolData(symbols.length, MeowEmbed.Symbol_05, factor, 46, 23, 20, 12));
			symbols.push(new NormalSymbolData(symbols.length, MeowEmbed.Symbol_06, factor, 242, 108, 46, 20));
			symbols.push(new NormalSymbolData(symbols.length, MeowEmbed.Symbol_07, factor, 196, 141, 77, 37));
			symbols.push(new NormalSymbolData(symbols.length, MeowEmbed.Symbol_08, factor, 281, 113, 86, 52));
			symbols.push(new NormalSymbolData(symbols.length, MeowEmbed.Symbol_09, factor, 279, 276, 114, 80));
			symbols.push(new NormalSymbolData(symbols.length, MeowEmbed.Symbol_10, factor, 300, 296, 134, 90));
			return symbols;
		}
		//		public static function MonsterNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		//		{
		//			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
		//			symbols.push(new NormalSymbolData(symbols.length, MonsterEmbed.Symbol_01, factor, 5, 5, 3, 0));
		//			symbols.push(new NormalSymbolData(symbols.length, MonsterEmbed.Symbol_02, factor, 18, 10, 4, 3));
		//			symbols.push(new NormalSymbolData(symbols.length, MonsterEmbed.Symbol_03, factor, 20, 8, 5, 4));
		//			symbols.push(new NormalSymbolData(symbols.length, MonsterEmbed.Symbol_04, factor, 16, 14, 8, 4));
		//			symbols.push(new NormalSymbolData(symbols.length, MonsterEmbed.Symbol_05, factor, 20, 18, 14, 6));
		//			symbols.push(new NormalSymbolData(symbols.length, MonsterEmbed.Symbol_06, factor, 30, 15, 15, 8));
		//			symbols.push(new NormalSymbolData(symbols.length, MonsterEmbed.Symbol_07, factor, 69, 32, 25, 13));
		//			symbols.push(new NormalSymbolData(symbols.length, MonsterEmbed.Symbol_08, factor, 106, 43, 27, 21));
		//			symbols.push(new NormalSymbolData(symbols.length, MonsterEmbed.Symbol_09, factor, 144, 92, 44, 28));
		//			return symbols;
		//		}
		//		public static function ParkNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		//		{
		//			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
		//			symbols.push(new NormalSymbolData(symbols.length, ParkEmbed.Symbol_01, factor, 10, 4, 4, 0));
		//			symbols.push(new NormalSymbolData(symbols.length, ParkEmbed.Symbol_02, factor, 18, 9, 7, 4));
		//			symbols.push(new NormalSymbolData(symbols.length, ParkEmbed.Symbol_03, factor, 23, 9, 9, 6));
		//			symbols.push(new NormalSymbolData(symbols.length, ParkEmbed.Symbol_04, factor, 51, 19, 12, 7));
		//			symbols.push(new NormalSymbolData(symbols.length, ParkEmbed.Symbol_05, factor, 70, 44, 17, 9));
		//			symbols.push(new NormalSymbolData(symbols.length, ParkEmbed.Symbol_06, factor, 100, 42, 22, 14));
		//			symbols.push(new NormalSymbolData(symbols.length, ParkEmbed.Symbol_07, factor, 100, 52, 39, 20));
		//			symbols.push(new NormalSymbolData(symbols.length, ParkEmbed.Symbol_08, factor, 235, 100, 43, 20));
		//			symbols.push(new NormalSymbolData(symbols.length, ParkEmbed.Symbol_09, factor, 387, 162, 77, 31));
		//			return symbols;
		//		}
		//		public static function PartyNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		//		{
		//			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
		//			symbols.push(new NormalSymbolData(symbols.length, PartyEmbed.Symbol_01, factor, 18, 7, 3, 0));
		//			symbols.push(new NormalSymbolData(symbols.length, PartyEmbed.Symbol_02, factor, 6, 3, 3, 0));
		//			symbols.push(new NormalSymbolData(symbols.length, PartyEmbed.Symbol_03, factor, 10, 8, 5, 3));
		//			symbols.push(new NormalSymbolData(symbols.length, PartyEmbed.Symbol_04, factor, 20, 9, 8, 3));
		//			symbols.push(new NormalSymbolData(symbols.length, PartyEmbed.Symbol_05, factor, 13, 10, 4, 3));
		//			symbols.push(new NormalSymbolData(symbols.length, PartyEmbed.Symbol_06, factor, 28, 18, 8, 4));
		//			symbols.push(new NormalSymbolData(symbols.length, PartyEmbed.Symbol_07, factor, 34, 14, 9, 5));
		//			symbols.push(new NormalSymbolData(symbols.length, PartyEmbed.Symbol_08, factor, 28, 15, 10, 6));
		//			symbols.push(new NormalSymbolData(symbols.length, PartyEmbed.Symbol_09, factor, 96, 40, 17, 11));
		//			symbols.push(new NormalSymbolData(symbols.length, PartyEmbed.Symbol_10, factor, 98, 64, 25, 16));
		//			return symbols;
		//		}
		//		public static function RecycleNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		//		{
		//			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
		//			symbols.push(new NormalSymbolData(symbols.length, RecycleEmbed.Symbol_01, factor, 14, 7, 4, 0));
		//			symbols.push(new NormalSymbolData(symbols.length, RecycleEmbed.Symbol_02, factor, 24, 15, 7, 4));
		//			symbols.push(new NormalSymbolData(symbols.length, RecycleEmbed.Symbol_03, factor, 59, 28, 11, 6));
		//			symbols.push(new NormalSymbolData(symbols.length, RecycleEmbed.Symbol_04, factor, 30, 25, 11, 6));
		//			symbols.push(new NormalSymbolData(symbols.length, RecycleEmbed.Symbol_05, factor, 34, 17, 16, 8));
		//			symbols.push(new NormalSymbolData(symbols.length, RecycleEmbed.Symbol_06, factor, 76, 60, 27, 12));
		//			symbols.push(new NormalSymbolData(symbols.length, RecycleEmbed.Symbol_07, factor, 195, 84, 33, 15));
		//			symbols.push(new NormalSymbolData(symbols.length, RecycleEmbed.Symbol_08, factor, 84, 44, 29, 23));
		//			symbols.push(new NormalSymbolData(symbols.length, RecycleEmbed.Symbol_09, factor, 232, 146, 69, 38));
		//			return symbols;
		//		}
		//		public static function SchoolNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		//		{
		//			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
		//			symbols.push(new NormalSymbolData(symbols.length, SchoolEmbed.Symbol_01, factor, 8, 4, 3, 0));
		//			symbols.push(new NormalSymbolData(symbols.length, SchoolEmbed.Symbol_02, factor, 11, 6, 3, 0));
		//			symbols.push(new NormalSymbolData(symbols.length, SchoolEmbed.Symbol_03, factor, 24, 10, 7, 3));
		//			symbols.push(new NormalSymbolData(symbols.length, SchoolEmbed.Symbol_04, factor, 21, 19, 7, 4));
		//			symbols.push(new NormalSymbolData(symbols.length, SchoolEmbed.Symbol_05, factor, 13, 9, 6, 5));
		//			symbols.push(new NormalSymbolData(symbols.length, SchoolEmbed.Symbol_06, factor, 36, 16, 13, 8));
		//			symbols.push(new NormalSymbolData(symbols.length, SchoolEmbed.Symbol_07, factor, 37, 32, 22, 14));
		//			symbols.push(new NormalSymbolData(symbols.length, SchoolEmbed.Symbol_08, factor, 89, 84, 42, 18));
		//			symbols.push(new NormalSymbolData(symbols.length, SchoolEmbed.Symbol_09, factor, 163, 104, 59, 31));
		//			return symbols;
		//		}
		//		public static function SmileyNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		//		{
		//			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
		//			symbols.push(new NormalSymbolData(symbols.length, SmileyEmbed.Symbol_01, factor, 13, 10, 5, 0));
		//			symbols.push(new NormalSymbolData(symbols.length, SmileyEmbed.Symbol_02, factor, 15, 6, 5, 0));
		//			symbols.push(new NormalSymbolData(symbols.length, SmileyEmbed.Symbol_03, factor, 38, 17, 7, 5));
		//			symbols.push(new NormalSymbolData(symbols.length, SmileyEmbed.Symbol_04, factor, 68, 27, 21, 8));
		//			symbols.push(new NormalSymbolData(symbols.length, SmileyEmbed.Symbol_05, factor, 143, 73, 30, 14));
		//			symbols.push(new NormalSymbolData(symbols.length, SmileyEmbed.Symbol_06, factor, 169, 66, 26, 15));
		//			symbols.push(new NormalSymbolData(symbols.length, SmileyEmbed.Symbol_07, factor, 166, 72, 52, 27));
		//			symbols.push(new NormalSymbolData(symbols.length, SmileyEmbed.Symbol_08, factor, 238, 100, 65, 37));
		//			symbols.push(new NormalSymbolData(symbols.length, SmileyEmbed.Symbol_09, factor, 284, 193, 134, 60));
		//			return symbols;
		//		}
		//		public static function SmurfNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		//		{
		//			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
		//			symbols.push(new NormalSymbolData(symbols.length, SmurfEmbed.Symbol_01, factor, 9, 9, 3, 0));
		//			symbols.push(new NormalSymbolData(symbols.length, SmurfEmbed.Symbol_02, factor, 6, 4, 3, 0));
		//			symbols.push(new NormalSymbolData(symbols.length, SmurfEmbed.Symbol_03, factor, 20, 10, 4, 3));
		//			symbols.push(new NormalSymbolData(symbols.length, SmurfEmbed.Symbol_04, factor, 74, 23, 6, 4));
		//			symbols.push(new NormalSymbolData(symbols.length, SmurfEmbed.Symbol_05, factor, 94, 35, 8, 4));
		//			symbols.push(new NormalSymbolData(symbols.length, SmurfEmbed.Symbol_06, factor, 209, 125, 31, 7));
		//			symbols.push(new NormalSymbolData(symbols.length, SmurfEmbed.Symbol_07, factor, 62, 24, 22, 12));
		//			symbols.push(new NormalSymbolData(symbols.length, SmurfEmbed.Symbol_08, factor, 622, 195, 52, 19));
		//			symbols.push(new NormalSymbolData(symbols.length, SmurfEmbed.Symbol_09, factor, 1076, 254, 91, 23));
		//			return symbols;
		//		}
		//		public static function SodomNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		//		{
		//			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
		//			symbols.push(new NormalSymbolData(symbols.length, SodomEmbed.Symbol_01, factor, 11, 5, 3, 0));
		//			symbols.push(new NormalSymbolData(symbols.length, SodomEmbed.Symbol_02, factor, 25, 10, 5, 3));
		//			symbols.push(new NormalSymbolData(symbols.length, SodomEmbed.Symbol_03, factor, 18, 14, 6, 4));
		//			symbols.push(new NormalSymbolData(symbols.length, SodomEmbed.Symbol_04, factor, 34, 19, 7, 5));
		//			symbols.push(new NormalSymbolData(symbols.length, SodomEmbed.Symbol_05, factor, 26, 11, 9, 5));
		//			symbols.push(new NormalSymbolData(symbols.length, SodomEmbed.Symbol_06, factor, 72, 36, 17, 9));
		//			symbols.push(new NormalSymbolData(symbols.length, SodomEmbed.Symbol_07, factor, 79, 38, 25, 9));
		//			symbols.push(new NormalSymbolData(symbols.length, SodomEmbed.Symbol_08, factor, 147, 73, 28, 14));
		//			symbols.push(new NormalSymbolData(symbols.length, SodomEmbed.Symbol_09, factor, 204, 115, 61, 24));
		//			return symbols;
		//		}
		//		public static function SpaceNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		//		{
		//			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
		//			symbols.push(new NormalSymbolData(symbols.length, SpaceEmbed.Symbol_01, factor, 13, 6, 4, 0));
		//			symbols.push(new NormalSymbolData(symbols.length, SpaceEmbed.Symbol_02, factor, 22, 10, 6, 4));
		//			symbols.push(new NormalSymbolData(symbols.length, SpaceEmbed.Symbol_03, factor, 65, 33, 13, 5));
		//			symbols.push(new NormalSymbolData(symbols.length, SpaceEmbed.Symbol_04, factor, 50, 21, 10, 8));
		//			symbols.push(new NormalSymbolData(symbols.length, SpaceEmbed.Symbol_05, factor, 134, 73, 30, 11));
		//			symbols.push(new NormalSymbolData(symbols.length, SpaceEmbed.Symbol_06, factor, 68, 31, 29, 17));
		//			symbols.push(new NormalSymbolData(symbols.length, SpaceEmbed.Symbol_07, factor, 86, 44, 22, 21));
		//			symbols.push(new NormalSymbolData(symbols.length, SpaceEmbed.Symbol_08, factor, 162, 84, 60, 31));
		//			symbols.push(new NormalSymbolData(symbols.length, SpaceEmbed.Symbol_09, factor, 370, 283, 142, 55));
		//			return symbols;
		//		}
		public static function SportsNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		{
			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
			symbols.push(new NormalSymbolData(symbols.length, SportsEmbed.Symbol_01, factor, 14, 7, 4, 0));
			symbols.push(new NormalSymbolData(symbols.length, SportsEmbed.Symbol_02, factor, 13, 8, 4, 0));
			symbols.push(new NormalSymbolData(symbols.length, SportsEmbed.Symbol_03, factor, 26, 14, 9, 4));
			symbols.push(new NormalSymbolData(symbols.length, SportsEmbed.Symbol_04, factor, 27, 14, 7, 6));
			symbols.push(new NormalSymbolData(symbols.length, SportsEmbed.Symbol_05, factor, 28, 13, 11, 9));
			symbols.push(new NormalSymbolData(symbols.length, SportsEmbed.Symbol_06, factor, 108, 60, 31, 12));
			symbols.push(new NormalSymbolData(symbols.length, SportsEmbed.Symbol_07, factor, 137, 54, 22, 13));
			symbols.push(new NormalSymbolData(symbols.length, SportsEmbed.Symbol_08, factor, 71, 29, 25, 18));
			symbols.push(new NormalSymbolData(symbols.length, SportsEmbed.Symbol_09, factor, 125, 58, 33, 25));
			return symbols;
		}
		//		public static function SuperHeroNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		//		{
		//			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
		//			symbols.push(new NormalSymbolData(symbols.length, SuperHeroEmbed.Symbol_01, factor, 12, 5, 4, 0));
		//			symbols.push(new NormalSymbolData(symbols.length, SuperHeroEmbed.Symbol_02, factor, 8, 8, 4, 0));
		//			symbols.push(new NormalSymbolData(symbols.length, SuperHeroEmbed.Symbol_03, factor, 30, 12, 8, 4));
		//			symbols.push(new NormalSymbolData(symbols.length, SuperHeroEmbed.Symbol_04, factor, 62, 25, 13, 6));
		//			symbols.push(new NormalSymbolData(symbols.length, SuperHeroEmbed.Symbol_05, factor, 70, 29, 19, 9));
		//			symbols.push(new NormalSymbolData(symbols.length, SuperHeroEmbed.Symbol_06, factor, 26, 14, 13, 13));
		//			symbols.push(new NormalSymbolData(symbols.length, SuperHeroEmbed.Symbol_07, factor, 169, 75, 42, 18));
		//			symbols.push(new NormalSymbolData(symbols.length, SuperHeroEmbed.Symbol_08, factor, 196, 82, 37, 22));
		//			return symbols;
		//		}
		//		public static function SushiNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		//		{
		//			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
		//			symbols.push(new NormalSymbolData(symbols.length, SushiEmbed.Symbol_01, factor, 9, 5, 3, 0));
		//			symbols.push(new NormalSymbolData(symbols.length, SushiEmbed.Symbol_02, factor, 12, 5, 3, 0));
		//			symbols.push(new NormalSymbolData(symbols.length, SushiEmbed.Symbol_03, factor, 24, 10, 7, 3));
		//			symbols.push(new NormalSymbolData(symbols.length, SushiEmbed.Symbol_04, factor, 40, 17, 9, 5));
		//			symbols.push(new NormalSymbolData(symbols.length, SushiEmbed.Symbol_05, factor, 13, 12, 9, 6));
		//			symbols.push(new NormalSymbolData(symbols.length, SushiEmbed.Symbol_06, factor, 35, 17, 8, 6));
		//			symbols.push(new NormalSymbolData(symbols.length, SushiEmbed.Symbol_07, factor, 33, 20, 17, 11));
		//			symbols.push(new NormalSymbolData(symbols.length, SushiEmbed.Symbol_08, factor, 139, 96, 39, 18));
		//			symbols.push(new NormalSymbolData(symbols.length, SushiEmbed.Symbol_09, factor, 154, 99, 52, 25));
		//			return symbols;
		//		}
		//		public static function ThanksGivingNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		//		{
		//			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
		//			symbols.push(new NormalSymbolData(symbols.length, ThanksGivingEmbed.Symbol_01, factor, 16, 6, 3, 0));
		//			symbols.push(new NormalSymbolData(symbols.length, ThanksGivingEmbed.Symbol_02, factor, 9, 4, 3, 3));
		//			symbols.push(new NormalSymbolData(symbols.length, ThanksGivingEmbed.Symbol_03, factor, 37, 29, 12, 5));
		//			symbols.push(new NormalSymbolData(symbols.length, ThanksGivingEmbed.Symbol_04, factor, 27, 18, 8, 7));
		//			symbols.push(new NormalSymbolData(symbols.length, ThanksGivingEmbed.Symbol_05, factor, 40, 25, 10, 8));
		//			symbols.push(new NormalSymbolData(symbols.length, ThanksGivingEmbed.Symbol_06, factor, 39, 29, 19, 10));
		//			symbols.push(new NormalSymbolData(symbols.length, ThanksGivingEmbed.Symbol_07, factor, 54, 44, 21, 15));
		//			symbols.push(new NormalSymbolData(symbols.length, ThanksGivingEmbed.Symbol_08, factor, 76, 47, 41, 17));
		//			symbols.push(new NormalSymbolData(symbols.length, ThanksGivingEmbed.Symbol_09, factor, 196, 80, 41, 20));
		//			return symbols;
		//		}
		public static function TourismNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		{
			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
			symbols.push(new NormalSymbolData(symbols.length, TourismEmbed.Symbol_01, factor, 9, 5, 3, 0));
			symbols.push(new NormalSymbolData(symbols.length, TourismEmbed.Symbol_02, factor, 17, 9, 6, 3));
			symbols.push(new NormalSymbolData(symbols.length, TourismEmbed.Symbol_03, factor, 26, 13, 7, 4));
			symbols.push(new NormalSymbolData(symbols.length, TourismEmbed.Symbol_04, factor, 40, 23, 12, 8));
			symbols.push(new NormalSymbolData(symbols.length, TourismEmbed.Symbol_05, factor, 106, 41, 19, 14));
			symbols.push(new NormalSymbolData(symbols.length, TourismEmbed.Symbol_06, factor, 110, 53, 30, 15));
			symbols.push(new NormalSymbolData(symbols.length, TourismEmbed.Symbol_07, factor, 41, 30, 26, 23));
			symbols.push(new NormalSymbolData(symbols.length, TourismEmbed.Symbol_08, factor, 230, 113, 45, 28));
			symbols.push(new NormalSymbolData(symbols.length, TourismEmbed.Symbol_09, factor, 332, 157, 62, 31));
			return symbols;
		}
		public static function ValentinesNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		{
			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
			symbols.push(new NormalSymbolData(symbols.length, ValentinesEmbed.Symbol_01, factor, 10, 9, 5, 0));
			symbols.push(new NormalSymbolData(symbols.length, ValentinesEmbed.Symbol_02, factor, 42, 22, 9, 5));
			symbols.push(new NormalSymbolData(symbols.length, ValentinesEmbed.Symbol_03, factor, 39, 18, 7, 5));
			symbols.push(new NormalSymbolData(symbols.length, ValentinesEmbed.Symbol_04, factor, 16, 10, 8, 7));
			symbols.push(new NormalSymbolData(symbols.length, ValentinesEmbed.Symbol_05, factor, 64, 26, 18, 10));
			symbols.push(new NormalSymbolData(symbols.length, ValentinesEmbed.Symbol_06, factor, 50, 27, 17, 16));
			symbols.push(new NormalSymbolData(symbols.length, ValentinesEmbed.Symbol_07, factor, 121, 58, 55, 23));
			symbols.push(new NormalSymbolData(symbols.length, ValentinesEmbed.Symbol_08, factor, 206, 122, 72, 32));
			return symbols;
		}
		//		public static function VegasNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		//		{
		//			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
		//			symbols.push(new NormalSymbolData(symbols.length, VegasEmbed.Symbol_01, factor, 9, 4, 3, 0));
		//			symbols.push(new NormalSymbolData(symbols.length, VegasEmbed.Symbol_02, factor, 6, 6, 3, 0));
		//			symbols.push(new NormalSymbolData(symbols.length, VegasEmbed.Symbol_03, factor, 10, 6, 5, 3));
		//			symbols.push(new NormalSymbolData(symbols.length, VegasEmbed.Symbol_04, factor, 39, 24, 10, 4));
		//			symbols.push(new NormalSymbolData(symbols.length, VegasEmbed.Symbol_05, factor, 19, 11, 8, 5));
		//			symbols.push(new NormalSymbolData(symbols.length, VegasEmbed.Symbol_06, factor, 62, 31, 12, 5));
		//			symbols.push(new NormalSymbolData(symbols.length, VegasEmbed.Symbol_07, factor, 19, 17, 10, 7));
		//			symbols.push(new NormalSymbolData(symbols.length, VegasEmbed.Symbol_08, factor, 34, 24, 16, 9));
		//			symbols.push(new NormalSymbolData(symbols.length, VegasEmbed.Symbol_09, factor, 77, 49, 28, 13));
		//			symbols.push(new NormalSymbolData(symbols.length, VegasEmbed.Symbol_10, factor, 66, 26, 14, 13));
		//			symbols.push(new NormalSymbolData(symbols.length, VegasEmbed.Symbol_11, factor, 239, 137, 56, 23));
		//			symbols.push(new NormalSymbolData(symbols.length, VegasEmbed.Symbol_12, factor, 275, 161, 63, 37));
		//			return symbols;
		//		}
		public static function WeatherNormalSymbols(factor:Number):Vector.<BaseSymbolData>
		{
			var symbols:Vector.<BaseSymbolData> = new Vector.<BaseSymbolData>();
			symbols.push(new NormalSymbolData(symbols.length, WeatherEmbed.Symbol_01, factor, 15, 7, 3, 0));
			symbols.push(new NormalSymbolData(symbols.length, WeatherEmbed.Symbol_02, factor, 9, 6, 3, 0));
			symbols.push(new NormalSymbolData(symbols.length, WeatherEmbed.Symbol_03, factor, 9, 5, 4, 3));
			symbols.push(new NormalSymbolData(symbols.length, WeatherEmbed.Symbol_04, factor, 24, 21, 11, 5));
			symbols.push(new NormalSymbolData(symbols.length, WeatherEmbed.Symbol_05, factor, 37, 31, 12, 5));
			symbols.push(new NormalSymbolData(symbols.length, WeatherEmbed.Symbol_06, factor, 47, 29, 15, 8));
			symbols.push(new NormalSymbolData(symbols.length, WeatherEmbed.Symbol_07, factor, 26, 21, 17, 9));
			symbols.push(new NormalSymbolData(symbols.length, WeatherEmbed.Symbol_08, factor, 133, 58, 28, 12));
			return symbols;
		}
	}
}