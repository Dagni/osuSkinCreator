def load_components
	files = [
		# Redirect the stdout to a debug console
		"/System/StdOuTRedirect",
	
		# Loading Windows
		"\\Windows/",
		"Window_Base",
		"Window_Context",
		
		# Loading code from System Section
		"\\System/",
		"Extensions",
		"Globs",
		"Audio",
		"Overwrites",
		"Loads",
		"Saves",
		"Notes",
		"Skinnables",
		"Input",
		"MouseController",
		"Initialization",
		"ThreadPointer",
		"Threads",
		
		# Loading Bitmap Extensions
		"\\Bitmap Extensions/",
		"Circle",
		"CheckBox",
		
		# Loading Fields
		"\\Fields/",
		"TextInput",
		"UpDown",
		"Browse",
		"Label",
		"HelpPopup",
		
		# Loading Scenes
		"\\Scenes/",
		"Scene_Welcome",
		"Scene_Options",
		"Scene_ReadSkinFiles",
		"Scene_Setup",
		"Scene_SetOsuDir",
		"Scene_Skins",
		"Scene_PlugIns",
		"Scene_PlugIn",
		
		# Loading context sensitive scenes
		"\\Contexts/",
		"Context_Base",
		"Context_Options",
		"Context_PlugIns",
		
		# Loading SkinCreating referented files
		"\\SkinCreating/",
		"Context_StartUp",
		"Context_LoadSkin",
		"SkinPreview",
		"SkinHelper",
		"SkinContainer",
		
		# Loading Interfacing
		"\\Interfacing/",
		"Handlers",
		
		# Loading Exceptions and Exception Handling
		"\\Exceptions/",
		"Exceptions",
		"Settings",
		"Scene_Fail",
		"Error_Scenes",
		"Excp_Log",
		"Interpreter8",
		"GameArrayMockups",
		
		# Loading the PlugIn System
		"\\PlugIns/",
		"Loader",
		
		# Loading some test code files
		"\\Testing/",
		"Tests",
		"TestEngine"
	]
	
	# Catch the running application path
	$running_from = File.expand_path(File.dirname(__FILE__))
	
	base_dir = ""
	# Load each named file
	files.each { |file|
		# Build full file name
		if file =~ /^\\/
			base_dir = file 
			next
		end
		
		f_name = $running_from + "/Lib" + base_dir + file + ".rb"
		
		# Require and load the current named file
		require(f_name)
		
		puts "load /Lib#{base_dir}#{file}.rb"
	}
end