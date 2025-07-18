#include <iostream>
#include "crow.h"

int main(int argc, char *argv[])
{
    crow::SimpleApp app;
    crow::mustache::set_base("templates");

    CROW_ROUTE(app, "/health")([]()
                               { return "Notes API is up and running..."; });

    CROW_ROUTE(app, "/")([]()
                         {
        auto page = crow::mustache::load_text("index.html");
        return page; });

    app.port(18080).multithreaded().run();
}