#pragma once

#include "Core.h"

namespace Izo {

	class IZO_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};

	// defined by client
	Application* CreateApplication();

}

