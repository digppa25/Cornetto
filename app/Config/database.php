<?php
class DATABASE_CONFIG {

	public $default = array(
		'datasource' => 'Database/Mysql',
		'persistent' => false,
		'host' => 'localhost',
		'login' => 'master',
		'password' => 'm4$t3r',
		'database' => 'CornettoDB',
		'prefix' => '',
		'encoding' => 'utf8'
	);

	public $test = array(
		'datasource' => 'Database/Mysql',
		'persistent' => false,
		'host' => 'localhost',
		'login' => 'master',
		'password' => 'm4$t3r',
		'database' => 'CornettoDBtest',
		'prefix' => '',
		'encoding' => 'utf8'
	);
}
