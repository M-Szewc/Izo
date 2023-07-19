#pragma once

#ifdef IZO_PLATFORM_WINDOWS

extern Izo::Application* Izo::CreateApplication();

int main()
{
	printf("Izo engine started");

	auto app = Izo::CreateApplication();
	app->Run();
	delete app;
}

#endif