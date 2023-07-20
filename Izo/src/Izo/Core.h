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

#ifdef IZO_ENABLE_ASSERTS
	#define IZO_ASSERT(x, ...) { if(!(x)) {IZO_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak();}}
	#define IZO_CORE_ASSERT(x, ...) { if(!(x)) {IZO_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak();}}
#else
	#define IZO_ASSERT(x, ...)
	#define IZO_CORE_ASSERT(x, ...)
#endif

#define BIT(x) (1 << x)