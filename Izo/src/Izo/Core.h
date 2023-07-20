#pragma once

#ifdef IZO_PLATFORM_WINDOWS
	#ifdef IZO_BUILD_DLL
		#define IZO_API __declspec(dllexport)
	#else	
		#define IZO_API __declspec(dllimport)
	#endif
#else
	#error Izo only supports Windows!
#endif

#define BIT(x) (1 << x)