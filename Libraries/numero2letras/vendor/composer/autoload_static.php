<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInitc5fdcac44db3f31b84a59a1a158e47a6
{
    public static $prefixLengthsPsr4 = array (
        'L' => 
        array (
            'Luecano\\NumeroALetras\\' => 22,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Luecano\\NumeroALetras\\' => 
        array (
            0 => __DIR__ . '/..' . '/luecano/numero-a-letras/src',
        ),
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInitc5fdcac44db3f31b84a59a1a158e47a6::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInitc5fdcac44db3f31b84a59a1a158e47a6::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInitc5fdcac44db3f31b84a59a1a158e47a6::$classMap;

        }, null, ClassLoader::class);
    }
}
