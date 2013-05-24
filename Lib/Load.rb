def load_components
	files = [
		# Loading code from System Section
		"System/Audio",
		"System/Extensions",
		"System/Overwrites",
		"System/Loads",
		"System/Saves",
		"System/Globs",
		"System/Timer",
		"System/Notes",
		"System/Input",
		"System/MouseController",
		
		# Loading Bitmap Extensions
		"Bitmap Extensions/Circle",
		"Bitmap Extensions/CheckBox",
		
		# Loading Fields
		"Fields/TextInput",
		
		# Loading Test-Code
		"Tests",
		
		# Loading Windows
		"Windows/Window_Base",
		"Windows/Window_MenuBar",
		"Windows/Window_LeftSec",
		"Windows/Window_MusicBox",
		"Windows/Window_Context",
		
		# Loading Scenes
		"Scenes/Scene_Welcome",
		"Scenes/Scene_Main",
		"Scenes/Scene_ChangeLanguage",
		"Scenes/Scene_Options",
		"Scenes/Scene_ReadSkinFiles",
		"Scenes/Scene_Setup",
		
		# Loading context sensitive scenes
		"Context Scenes/Context_Base",
		"Context Scenes/Context_Welcome",
		"Context Scenes/Context_Options",
		
		# Loading Externals
		"Externals/ExternalCalls",
		
		# Loading Graphics Test Engine
		"TestEngine",
		
		# Loading Exceptions and Exception Handling
		"Exceptions/Exceptions",
		"Exceptions/Settings",
		"Exceptions/Scene_Fail",
		"Exceptions/Error_Scenes",
		"Exceptions/Excp_Log",
		"Exceptions/Interpreter8",
		"Exceptions/GameArrayMockups",
		
		# Loading Global Elements (Such as Variables or Functions)
		"Globs/ThreadPointer",
		"Globs/InitValues",
		"Globs/GlobFuncs",
		"Globs/Threads"
	]
	
	# Catch the running application path
	running_from = File.expand_path(File.dirname(__FILE__))
	
	# Load each named file
	files.each { |file|
		# Build full file name
		f_name = running_from + "/Lib/" + file + ".rb"
		
		# Require and load the current named file
		require(f_name)
	}
end