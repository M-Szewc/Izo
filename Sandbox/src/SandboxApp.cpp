#include <Izo.h>

class ExampleLayer : public Izo::Layer
{
public:
	ExampleLayer()
		:Layer("Example") {}

	void OnUpdate() override
	{
		IZO_INFO("ExampleLayer::Update");
	}

	void OnEvent(Izo::Event& event) override
	{
		IZO_TRACE("{0}", event);
	}
};

class Sandbox : public Izo::Application
{
public:
	Sandbox()
	{
		IZO_INFO("Additional communicat from sandbox app");
		PushLayer(new ExampleLayer());
	}

	~Sandbox()
	{

	}

};

Izo::Application* Izo::CreateApplication()
{
	return new Sandbox();
}