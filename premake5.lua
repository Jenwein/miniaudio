-- premake5.lua for Miniaudio library
project "miniaudio"
    kind "StaticLib"
    language "C"
    staticruntime "on"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files {
        "miniaudio.h",
        "miniaudio_impl.c"
    }

    	includedirs
	    {
		    "include",
		    "src"
	    }

    flags { "NoPCH" }
    filter "system:windows"
        systemversion "latest"
        links { "ole32.lib" }


    filter "configurations:Debug"
        runtime "Debug"
        symbols "off"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
  	
    filter "configurations:Dist"
		    runtime "Release"
		    optimize "on"
        symbols "off"
