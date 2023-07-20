#include <Izo.h>

class Sandbox : public Izo::Application
{
public:
	Sandbox()
	{
		IZO_INFO("Additional communicat from sandbox app");
	}

	~Sandbox()
	{

	}

};

Izo::Application* Izo::CreateApplication()
{
	return new Sandbox();
}