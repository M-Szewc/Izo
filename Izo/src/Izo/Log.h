#pragma once

#include "Core.h"
#include "spdlog/spdlog.h"
#include "spdlog/fmt/ostr.h"

namespace Izo {

	class IZO_API Log
	{
	public:
		static void Init();

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }

	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;

	};
}

// Core log macros
#define IZO_CORE_TRACE(...)     ::Izo::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define IZO_CORE_INFO(...)      ::Izo::Log::GetCoreLogger()->info(__VA_ARGS__)
#define IZO_CORE_WARN(...)      ::Izo::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define IZO_CORE_ERROR(...)     ::Izo::Log::GetCoreLogger()->error(__VA_ARGS__)
#define IZO_CORE_FATAL(...)     ::Izo::Log::GetCoreLogger()->fatal(__VA_ARGS__)

// Client log macros
#define IZO_TRACE(...)          ::Izo::Log::GetClientLogger()->trace(__VA_ARGS__)
#define IZO_INFO(...)           ::Izo::Log::GetClientLogger()->info(__VA_ARGS__)
#define IZO_WARN(...)           ::Izo::Log::GetClientLogger()->warn(__VA_ARGS__)
#define IZO_ERROR(...)          ::Izo::Log::GetClientLogger()->error(__VA_ARGS__)
#define IZO_FATAL(...)          ::Izo::Log::GetClientLogger()->fatal(__VA_ARGS__)