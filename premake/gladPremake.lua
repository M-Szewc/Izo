project "glad"
	kind "StaticLib"
	language "C"
	staticruntime "off"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{SubmoduleDir.glad}/include/glad/glad.h",
		"%{SubmoduleDir.glad}/include/KHR/khrplatform.h",
		"%{SubmoduleDir.glad}/src/glad.c"
	}

	includedirs
	{
		"%{SubmoduleDir.glad}/include"
	}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "speed"

    filter "configurations:Dist"
		runtime "Release"
		optimize "speed"
        symbols "off"