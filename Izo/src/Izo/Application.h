#pragma once

#include "Core.h"

#include "Window.h"

#include "Izo/LayerStack.h"
#include "Events/Event.h"
#include "Izo/Events/ApplicationEvent.h"


namespace Izo {

	class IZO_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();

		void OnEvent(Event& e);

		void PushLayer(Layer* layer);
		void PushOverLay(Layer* layer);
	private:
		bool OnWindowClose(WindowCloseEvent& e);

		std::unique_ptr<Window> m_Window;
		bool m_Running = false;
		LayerStack m_LayerStack;
	};

	// defined by client
	Application* CreateApplication();

}

