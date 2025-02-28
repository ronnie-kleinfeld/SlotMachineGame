package com.gotchaslots.common.utils.debug
{
	import com.gotchaslots.common.ui.common.components.SpriteEx;
	
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.system.System;
	import flash.text.AntiAliasType;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.utils.getTimer;
	
	public class PerformanceMonitor extends SpriteEx
	{
		// members
		private var _xml:XML;
		private var _fps:int;
		private var _ms:uint;
		private var _lastTimeCheck:uint;
		private var _maxMemory:Number;
		private var _fpss:Vector.<Number>;
		private var _childrenCount:int;
		
		private var _textField:TextField;
		
		// class
		public function PerformanceMonitor():void
		{
			_maxMemory = 0;
			_fpss = new Vector.<Number>();
			
			_xml =
				<xml>
					<sectionTitle>FPS MONITOR</sectionTitle>
					<sectionLabel>FPS: </sectionLabel>
					<framesPerSecond>-</framesPerSecond>
					<sectionLabel>Minute average: </sectionLabel>
					<averageFPS>-</averageFPS>
					<sectionLabel>ms per frame: </sectionLabel>
					<msFrame>-</msFrame>
					<sectionTitle>MEMORY MONITOR</sectionTitle>
					<sectionLabel>Direct: </sectionLabel>
					<directMemory>-</directMemory>
					<sectionLabel>Max direct: </sectionLabel>
					<directMemoryMax>-</directMemoryMax>
					<sectionLabel>Total: </sectionLabel>
					<veryTotalMemory>-</veryTotalMemory>
					<sectionLabel>Garbage: </sectionLabel>
					<garbageMemory>-</garbageMemory>
					<sectionTitle>STAGE MONITOR</sectionTitle>
					<sectionLabel>Width: </sectionLabel>
					<widthPx>-</widthPx>
					<sectionLabel>Height: </sectionLabel>
					<heightPx>-</heightPx>
					<sectionLabel>Children: </sectionLabel>
					<nChildren>-</nChildren>
				</xml>;
			
			
			var style:StyleSheet = new StyleSheet();
			style.setStyle("xml", {fontSize:"9px", fontFamily:"arial"});
			style.setStyle("sectionTitle", {color:"#FFAA00"});
			style.setStyle("sectionLabel", {color:"#CCCCCC", display:"inline"});
			style.setStyle("framesPerSecond", {color:"#FFFFFF"});
			style.setStyle("msFrame", {color:"#FFFFFF"});
			style.setStyle("averageFPS", {color:"#FFFFFF"});
			style.setStyle("directMemory", {color:"#FFFFFF"});
			style.setStyle("veryTotalMemory", {color:"#FFFFFF"});
			style.setStyle("garbageMemory", {color:"#FFFFFF"});
			style.setStyle("directMemoryMax", {color:"#FFFFFF"});
			style.setStyle("widthPx", {color:"#FFFFFF"});
			style.setStyle("heightPx", {color:"#FFFFFF"});
			style.setStyle("nChildren", {color:"#FFFFFF"});
			
			_textField = new TextField();
			_textField.alpha = 0.8;
			_textField.autoSize = TextFieldAutoSize.LEFT;
			_textField.styleSheet = style;
			_textField.condenseWhite = true;
			_textField.antiAliasType = AntiAliasType.ADVANCED;
			_textField.selectable = false;
			_textField.mouseEnabled = false;
			_textField.background = true;
			_textField.backgroundColor = 0x000000;
			addChild(_textField);
			addEventListener(Event.ENTER_FRAME, OnUpdate);
			
			this.mouseChildren = false;
			this.mouseEnabled = false;
		}
		
		protected function OnClick(event:MouseEvent):void
		{
			visible = false;
		}
		
		// methods
		private function CountDisplayList(container:DisplayObjectContainer):void
		{
			_childrenCount += container.numChildren;
			for (var i:uint = 0; i < container.numChildren; i++)
			{
				if (container.getChildAt(i) is DisplayObjectContainer)
				{
					CountDisplayList(DisplayObjectContainer(container.getChildAt(i)));
				}
			}
		}
		
		// events
		private function OnUpdate(event:Event):void
		{
			var timer:int = getTimer();
			
			if (timer - 1000 > _lastTimeCheck)
			{
				var vectorLength:int = _fpss.push(_fps);
				if (vectorLength > 60)
				{
					_fpss.shift();
				}
				
				var vectorAverage:Number = 0;
				for (var i:Number = 0; i < _fpss.length; i++)
				{
					vectorAverage += _fpss[i];
				}
				
				vectorAverage = vectorAverage / _fpss.length;
				_xml.averageFPS = Math.round(vectorAverage);
				var directMemory:Number = System.totalMemory;
				_maxMemory = Math.max(directMemory, _maxMemory);
				_xml.directMemory = (directMemory / 1048576).toFixed(0);
				_xml.directMemoryMax = (_maxMemory / 1048576).toFixed(0);
				_xml.veryTotalMemory = (System.privateMemory / 1048576).toFixed(0);
				_xml.garbageMemory = (System.freeMemory / 1048576).toFixed(0);
				_xml.framesPerSecond = _fps + " / " + stage.frameRate;
				_xml.widthPx = stage.width + " / " + stage.stageWidth;
				_xml.heightPx = stage.height.toFixed(0) + " / " + stage.stageHeight.toFixed(0);
				_childrenCount = 0;
				CountDisplayList(stage);
				_xml.nChildren = _childrenCount;
				_fps = 0;
				_lastTimeCheck = timer;
			}
			
			_fps++;
			_xml.msFrame = (timer - _ms);
			_ms = timer;
			_textField.htmlText = _xml;
		}
	}
}