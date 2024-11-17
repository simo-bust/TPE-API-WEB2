<?php
    require_once 'libs/router.php';
    require_once 'app/controllers/book.api.controller.php';
    
    $router = new Router();

    #                 endpoint        verbo      controller              metodo
    $router->addRoute('libros'      ,            'GET',     'BooksApiController',   'getAll');
    $router->addRoute('libros/:id'  ,            'GET',     'BooksApiController',   'get'   );
    $router->addRoute('libros/:id'  ,            'DELETE',  'BooksApiController',   'delete');
    $router->addRoute('libros'  ,                'POST',    'BooksApiController',   'insert');
    $router->addRoute('libros/:id'  ,            'PUT',     'BooksApiController',   'update');
    
    $router->route($_GET['resource'], $_SERVER['REQUEST_METHOD']);
