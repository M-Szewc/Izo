#pragma once

#include "Core.h"
#include "Events/Event.h"
#include "Izo/Events/ApplicationEvent.h"

#include "Window.h"

namespace Izo {

	class IZO_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();

		void OnEvent(Event& e);
	private:
		bool OnWindowClose(WindowCloseEvent& e);

		std::unique_ptr<Window> m_Window;
		bool m_Running = false;
	};

	// defined by client
	Application* CreateApplication();

}

