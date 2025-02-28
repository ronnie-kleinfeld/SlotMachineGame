package com.gotchaslots.common.data.lobby.pages
{
	import com.gotchaslots.slots.data.lobby.lobbyMachine.base.SlotsBaseLobbyMachineData;
	import com.gotchaslots.common.utils.dataType.BaseIDData;
	
	public class PageData extends BaseIDData
	{
		// members
		private var _description:String;
		private var _machines:Vector.<SlotsBaseLobbyMachineData>;
		
		// properties
		public function get Description():String
		{
			return _description;
		}
		public function get LobbyMachines():Vector.<SlotsBaseLobbyMachineData>
		{
			return _machines;
		}
		
		// class
		public function PageData(description:String)
		{
			super(-1);
			
			_description = description;
			
			_machines = new Vector.<SlotsBaseLobbyMachineData>();
		}
		
		// methods
		public function AddLobbyMachine(lobbyMachine:SlotsBaseLobbyMachineData):void
		{
			_machines.push(lobbyMachine);
			if (_machines.length > 4)
			{
				throw new Error("There are more than 4 LobbyMachine in Page " + _description);
			}
		}
	}
}