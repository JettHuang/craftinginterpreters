-- premake5.lua project solution script

cfg_systemversion = "latest" -- "10.0.17763.0"   -- To use the latest version of the SDK available

-- solution
workspace "clox_solution"
    configurations { "Debug", "Release" }
    platforms { "Win32", "Win64" }

    location "../build"
    defines { "_CRT_SECURE_NO_WARNINGS" }
    systemversion(cfg_systemversion)
	
    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"
        targetsuffix("_d")

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"    

    filter "platforms:Win32"
        architecture "x32"

    filter "platforms:Win64"
        architecture "x64"

    filter {}

    targetdir("../build/bin")  
    objdir("../build/obj/%{prj.name}/%{cfg.buildcfg}")
	debugdir ("..");
	
-- project clox
project "clox"
    language "C"
    kind "ConsoleApp"

	debugargs { "" }
	
    files {
		"../c/*.h",
		"../c/*.c"
    }
	