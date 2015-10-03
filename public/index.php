<?php

require_once __DIR__ . '/../vendor/autoload.php';

use Silex\Application;
use Silex\Provider\TwigServiceProvider;
use SilexBoilerplate\Controllers\ControllerProvider;

$app = new Application();

$app->register(new TwigServiceProvider(), [ 'twig.path' => __DIR__ . '/../views']);
$app->mount('/', new ControllerProvider());
$app->run();
