workspace "Izo"
	architecture "x64"

	configurations 
	{
		"Debug",
		"Release",
		"Dist"
	}

	startproject "Sandbox"

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
SubmoduleDir = {}
SubmoduleDir["glfw"] = "%{wks.location}/Izo/vendor/glfw"
SubmoduleDir["glad"] = "%{wks.location}/Izo/vendor/glad"

include "premake/glfwPremake.lua"
include "premake/gladPremake.lua"

project "Izo"
	location "Izo"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "izopch.h"
	pchsource "Izo/src/izopch.cpp"

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{SubmoduleDir.glfw}/include",
		"%{SubmoduleDir.glad}/include"
	}

	links
	{
		"glfw",
		"glad",
		"opengl32.lib"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "Off"
		systemversion "latest"

		defines
		{
			"IZO_PLATFORM_WINDOWS",
			"IZO_BUILD_DLL",
			"GLFW_INCLUDE_NONE"
		}

		postbuildcommands
		{
			("{MKDIR} ../bin/" .. outputdir .. "/Sandbox"),
			("{COPYFILE} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox/")
		}

	filter "configurations:Debug"
		defines "IZO_DEBUG"
		symbols "On"
		runtime "Debug"

	filter "configurations:Release"
		defines "IZO_RELEASE"
		optimize "On"
		runtime "Release"

	filter "configurations:Dist"
		defines "IZO_DIST"
		optimize "On"
		runtime "Release"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"Izo/vendor/spdlog/include",
		"Izo/src"
	}

	links
	{
		"Izo"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "Off"
		systemversion "latest"

		defines
		{
			"IZO_PLATFORM_WINDOWS"
		}

	filter "configurations:Debug"
		defines "IZO_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "IZO_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "IZO_DIST"
		optimize "On"