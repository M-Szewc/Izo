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

project "Izo"
	location "Izo"
	kind "SharedLib"
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
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"IZO_PLATFORM_WINDOWS",
			"IZO_BUILD_DLL"
		}

		postbuildcommands
		{
			("{MKDIR} ../bin/" .. outputdir .. "/Sandbox"),
			("{COPYFILE} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox/")
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
		staticruntime "On"
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