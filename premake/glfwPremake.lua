project "glfw"
	kind "StaticLib"
	language "C"
	staticruntime "off"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{SubmoduleDir.glfw}/include/GLFW/glfw3.h",
		"%{SubmoduleDir.glfw}/include/GLFW/glfw3native.h",
		"%{SubmoduleDir.glfw}/src/glfw_config.h",
		"%{SubmoduleDir.glfw}/src/context.c",
		"%{SubmoduleDir.glfw}/src/init.c",
		"%{SubmoduleDir.glfw}/src/input.c",
		"%{SubmoduleDir.glfw}/src/monitor.c",

		"%{SubmoduleDir.glfw}/src/null_init.c",
		"%{SubmoduleDir.glfw}/src/null_joystick.c",
		"%{SubmoduleDir.glfw}/src/null_monitor.c",
		"%{SubmoduleDir.glfw}/src/null_window.c",

		"%{SubmoduleDir.glfw}/src/platform.c",
		"%{SubmoduleDir.glfw}/src/vulkan.c",
		"%{SubmoduleDir.glfw}/src/window.c",
	}

	filter "system:windows"
		systemversion "latest"
		staticruntime "On"

		files
		{
			"%{SubmoduleDir.glfw}/src/win32_init.c",
			"%{SubmoduleDir.glfw}/src/win32_joystick.c",
			"%{SubmoduleDir.glfw}/src/win32_module.c",
			"%{SubmoduleDir.glfw}/src/win32_monitor.c",
			"%{SubmoduleDir.glfw}/src/win32_time.c",
			"%{SubmoduleDir.glfw}/src/win32_thread.c",
			"%{SubmoduleDir.glfw}/src/win32_window.c",
			"%{SubmoduleDir.glfw}/src/wgl_context.c",
			"%{SubmoduleDir.glfw}/src/egl_context.c",
			"%{SubmoduleDir.glfw}/src/osmesa_context.c"
		}

		defines 
		{ 
			"_GLFW_WIN32",
			"_CRT_SECURE_NO_WARNINGS"
		}

	filter { "system:windows", "configurations:Release"}
		buildoptions "/MT"

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