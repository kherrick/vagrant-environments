<?php

namespace SilexBoilerplate\Module;

use PHPUnit_Framework_TestCase;

class ClassNameTest extends PHPUnit_Framework_TestCase
{
    /**
     * @return null
     */
    public function testMethod()
    {
        $testClass = new ClassName();
        $testReturn = $testClass->method();

        $this->assertEquals($testReturn, 'foo');
    }
}
