<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of MainController
 *
 * @author Flipper
 */
class MainController extends AppController {
    
    public function index(){
        $this->set('message',__('Bienvenuto'));
    }
}
