<?php

namespace SilexBoilerplate\Controllers;

use Silex\Application;

class Home
{
    /**
     * @var Application
     */
    private $app;

    /**
     * @param Application $app
     */
    public function __construct(Application $app)
    {
        $this->app = $app;
    }

    /**
     * @return string
     */
    public function getAction()
    {
        return $this->app['twig']->render(
            'home.twig',
            [
                'name' => 'World'
            ]
        );
    }
}
