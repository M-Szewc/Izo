#include "izopch.h"
#include "Application.h"

#include "Izo/Events/ApplicationEvent.h"
#include "Izo/Log.h"

namespace Izo {

	Application::Application()
	{

	}

	Application::~Application()
	{

	}

	void Application::Run()
	{
		WindowResizeEvent e(1280, 720);
		IZO_CORE_TRACE(e);

		while (true);
	}
}