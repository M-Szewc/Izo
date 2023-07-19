#pragma once

#ifdef IZO_PLATFORM_WINDOWS

extern Izo::Application* Izo::CreateApplication();

int main()
{
	Izo::Log::Init();
	IZO_CORE_WARN("Initialized Log!");
	int a = 5;
	IZO_INFO("IHello! Var={0}", a);

	auto app = Izo::CreateApplication();
	app->Run();
	delete app;
}

#endif