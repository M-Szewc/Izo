#include <Izo.h>

class Sandbox : public Izo::Application
{
public:
	Sandbox()
	{

	}

	~Sandbox()
	{

	}

};

Izo::Application* Izo::CreateApplication()
{
	return new Sandbox();
}