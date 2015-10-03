<?php

namespace SilexBoilerplate\Controllers;

use Silex\Application;
use Silex\ControllerProviderInterface;

class ControllerProvider implements ControllerProviderInterface
{
    /**
     * @param  Application $app
     * @return ControllerCollection
     */
    public function connect(Application $app)
    {
        $controllers = $app['controllers_factory'];

        $controllers->get('/', function (Application $app) {
            $homeController = new Home($app);
            $response = $homeController->getAction();

            return $response;
        });

        return $controllers;
    }
}
