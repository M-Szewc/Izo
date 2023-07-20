#pragma once

#include "Core.h"
#include "Events/Event.h"

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

