<?php

namespace Laravelium\Sitemap\Test;

use Laravelium\Sitemap\Sitemap;
use Orchestra\Testbench\TestCase as TestCase;
use Laravelium\Sitemap\SitemapServiceProvider;

class SitemapTest extends TestCase
{
    protected $sitemap;
    protected $sp;
    protected $itemSeeder = [];


    public function setUp()
    {
        parent::setUp();

        $config = [
            'sitemap.use_cache'       => false,
            'sitemap.cache_key'       => 'Laravel.Sitemap.',
            'sitemap.cache_duration'  => 3600,
            'sitemap.testing'         => true,
            'sitemap.styles_location' => '/styles/',
        ];

        config($config);

        $this->sitemap = $this->app->make(Sitemap::class);
    }

    public function testMisc()
    {
        // test object initialization
        $this->assertInstanceOf(Sitemap::class, $this->sitemap);

        // test custom methods
        $this->assertEquals([SitemapServiceProvider::class], $this->getPackageProviders($this->sitemap));
        $this->assertEquals(['Sitemap'=>Sitemap::class], $this->getPackageAliases($this->sitemap));

        // test SitemapServiceProvider (fixes coverage of the class!)
        $this->sp = new SitemapServiceProvider($this->sitemap);
        $this->assertEquals(['sitemap', Sitemap::class], $this->sp->provides());
    }

    public function testSitemapAttributes()
    {
        $this->sitemap->model->setLink('TestLink');
        $this->sitemap->model->setTitle('TestTitle');
        $this->sitemap->model->setUseCache(true);
        $this->sitemap->model->setCacheKey('lv-sitemap');
        $this->sitemap->model->setCacheDuration(72000);
        $this->sitemap->model->setEscaping(false);
        $this->sitemap->model->setUseLimitSize(true);
        $this->sitemap->model->setMaxSize(10000);
        $this->sitemap->model->setUseStyles(false);
        $this->sitemap->model->setSloc('https://static.foobar.tld/xsl-styles/');

        $this->assertEquals('TestLink', $this->sitemap->model->getLink());
        $this->assertEquals('TestTitle', $this->sitemap->model->getTitle());
        $this->assertEquals(true, $this->sitemap->model->getUseCache());
        $this->assertEquals('lv-sitemap', $this->sitemap->model->getCacheKey());
        $this->assertEquals(72000, $this->sitemap->model->getCacheDuration());
        $this->assertEquals(false, $this->sitemap->model->getEscaping());
        $this->assertEquals(true, $this->sitemap->model->getUseLimitSize());
        $this->assertEquals(10000, $this->sitemap->model->getMaxSize());
        $this->assertEquals(true, $this->sitemap->model->testing);
        $this->assertEquals(false, $this->sitemap->model->getUseStyles());
        $this->assertEquals('https://static.foobar.tld/xsl-styles/', $this->sitemap->model->getSloc());
    }


}
