package com.gotchaslots.common.utils.xServices.nativeDialogs
{
	import com.gotchaslots.common.utils.xServices.nativeDialogs.confirmationDialog.ConfirmationDialogHandler;
	import com.gotchaslots.common.utils.xServices.nativeDialogs.credentialsDialog.CredentialsDialogHandler;
	import com.gotchaslots.common.utils.xServices.nativeDialogs.inputDialog.InputDialogHandler;
	import com.gotchaslots.common.utils.xServices.nativeDialogs.pickerDialog.PickerDialogHandler;
	import com.gotchaslots.common.utils.xServices.nativeDialogs.yesNoDialog.YesNoDialogHandler;

	public class NativeDialogsHandler
	{
		// members
		private var _confirmationDialog:ConfirmationDialogHandler;
		private var _credentialsDialog:CredentialsDialogHandler;
		private var _inputDialog:InputDialogHandler;
		private var _pickerDialog:PickerDialogHandler;
		private var _yesNoDialog:YesNoDialogHandler;
		
		// properties
		public function get ConfirmationDialog():ConfirmationDialogHandler
		{
			return _confirmationDialog;
		}
		public function get CredentialsDialog():CredentialsDialogHandler
		{
			return _credentialsDialog;
		}
		public function get InputDialog():InputDialogHandler
		{
			return _inputDialog;
		}
		public function get PickerDialog():PickerDialogHandler
		{
			return _pickerDialog;
		}
		public function get YesNoDialog():YesNoDialogHandler
		{
			return _yesNoDialog;
		}
		
		// class
		public function NativeDialogsHandler()
		{
			_confirmationDialog = new ConfirmationDialogHandler();
			_credentialsDialog = new CredentialsDialogHandler();
			_inputDialog = new InputDialogHandler();
			_pickerDialog = new PickerDialogHandler();
			_yesNoDialog = new YesNoDialogHandler();
		}
	}
}