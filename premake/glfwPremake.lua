project "glfw"
	kind "StaticLib"
	language "C"
	staticruntime "off"
	warnings "off"

	targetdir ("../bin/" .. outputdir .. "/%{prj.name}")
	objdir ("../bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"../%{SubmoduleDir.glfw}/include/GLFW/glfw3.h",
		"../%{SubmoduleDir.glfw}/include/GLFW/glfw3native.h",
		"../%{SubmoduleDir.glfw}/src/glfw_config.h",
		"../%{SubmoduleDir.glfw}/src/context.c",
		"../%{SubmoduleDir.glfw}/src/init.c",
		"../%{SubmoduleDir.glfw}/src/input.c",
		"../%{SubmoduleDir.glfw}/src/monitor.c",

		"../%{SubmoduleDir.glfw}/src/null_init.c",
		"../%{SubmoduleDir.glfw}/src/null_joystick.c",
		"../%{SubmoduleDir.glfw}/src/null_monitor.c",
		"../%{SubmoduleDir.glfw}/src/null_window.c",

		"../%{SubmoduleDir.glfw}/src/platform.c",
		"../%{SubmoduleDir.glfw}/src/vulkan.c",
		"../%{SubmoduleDir.glfw}/src/window.c",
	}

	filter "system:linux"
		pic "On"

		systemversion "latest"
		
		files
		{
			"../%{SubmoduleDir.glfw}/src/x11_init.c",
			"../%{SubmoduleDir.glfw}/src/x11_monitor.c",
			"../%{SubmoduleDir.glfw}/src/x11_window.c",
			"../%{SubmoduleDir.glfw}/src/xkb_unicode.c",
			"../%{SubmoduleDir.glfw}/src/posix_module.c",
			"../%{SubmoduleDir.glfw}/src/posix_time.c",
			"../%{SubmoduleDir.glfw}/src/posix_thread.c",
			"../%{SubmoduleDir.glfw}/src/posix_module.c",
			"../%{SubmoduleDir.glfw}/src/glx_context.c",
			"../%{SubmoduleDir.glfw}/src/egl_context.c",
			"../%{SubmoduleDir.glfw}/src/osmesa_context.c",
			"../%{SubmoduleDir.glfw}/src/linux_joystick.c"
		}

		defines
		{
			"_GLFW_X11"
		}

	filter "system:macosx"
		pic "On"

		files
		{
			"../%{SubmoduleDir.glfw}/src/cocoa_init.m",
			"../%{SubmoduleDir.glfw}/src/cocoa_monitor.m",
			"../%{SubmoduleDir.glfw}/src/cocoa_window.m",
			"../%{SubmoduleDir.glfw}/src/cocoa_joystick.m",
			"../%{SubmoduleDir.glfw}/src/cocoa_time.c",
			"../%{SubmoduleDir.glfw}/src/nsgl_context.m",
			"../%{SubmoduleDir.glfw}/src/posix_thread.c",
			"../%{SubmoduleDir.glfw}/src/posix_module.c",
			"../%{SubmoduleDir.glfw}/src/osmesa_context.c",
			"../%{SubmoduleDir.glfw}/src/egl_context.c"
		}

		defines
		{
			"_GLFW_COCOA"
		}

	filter "system:windows"
		systemversion "latest"
		staticruntime "On"

		files
		{
			"../%{SubmoduleDir.glfw}/src/win32_init.c",
			"../%{SubmoduleDir.glfw}/src/win32_joystick.c",
			"../%{SubmoduleDir.glfw}/src/win32_module.c",
			"../%{SubmoduleDir.glfw}/src/win32_monitor.c",
			"../%{SubmoduleDir.glfw}/src/win32_time.c",
			"../%{SubmoduleDir.glfw}/src/win32_thread.c",
			"../%{SubmoduleDir.glfw}/src/win32_window.c",
			"../%{SubmoduleDir.glfw}/src/wgl_context.c",
			"../%{SubmoduleDir.glfw}/src/egl_context.c",
			"../%{SubmoduleDir.glfw}/src/osmesa_context.c"
		}

		defines 
		{ 
			"_GLFW_WIN32",
			"_CRT_SECURE_NO_WARNINGS"
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