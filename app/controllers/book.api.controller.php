<?php
require_once './app/models/book_model.php';
require_once './app/views/json.view.php';

class BooksApiController {
    private $view;
    private $model;

    public function __construct() {
        $this->model = new BookModel();
        $this->view = new JSONView();
    }


    public function getAll($req) {
        // Obtiene el parámetro de ordenamiento y la dirección, si están presentes
        $orderBy = $req->query->orderBy ?? false;
        $direction = $req->query->direction ?? 'ASC'; // Dirección predeterminada es 'ASC'
    
        // Obtiene parámetros de filtrado si están presentes
        $filter = [];
        if (!empty($req->query->autor)) {
            $filter['autor'] = $req->query->autor;
        }
        if (!empty($req->query->genero)) {
            $filter['genero'] = $req->query->genero;
        }
        if (!empty($req->query->precio_min)) {
            $filter['precio_min'] = $req->query->precio_min;
        }
        if (!empty($req->query->precio_max)) {
            $filter['precio_max'] = $req->query->precio_max;
        }
    
        // Llama al modelo para obtener los libros con los filtros aplicados, ordenados por el campo y dirección especificados
        $books = $this->model->getBooks($orderBy, $direction, $filter);
    
        // Verifica si se obtuvieron libros
        if ($books) {
            // Si hay libros, responde con código 200 (OK) y los datos
            return $this->view->response($books, 200);
        } else {
            // Si no se encontraron libros, responde con código 404 (No encontrado) y mensaje de error
            return $this->view->response(['No se encontraron libros'], 404);
        }
    }
    


    // /api/libros/:id
    public function get($req, $res) {
        $id = $req->params->id;
        $book = $this->model->getBookById($id);

        if(!$book) {
            return $this->view->response("El libro con el id=$id no existe", 404);
        }

        return $this->view->response($book);
    }


    //api/libros/:id (DELETE)
    public function delete ($req, $res){
        $id = $req->params->id;

        $book = $this->model->getBookById($id);

        if(!$book) {
            return $this->view->response("El libro con el id=$id no existe", 404);
        }

        $this->model->deleteBook($id);
        $this->view->response("El libro con el id=$id se ha eliminado con exito", 200);
    }


    // Agregar un nuevo libro | api/libros (POST)
    public function insert($req, $res) {
        // valido los datos
        if(empty($req->body->titulo) || empty($req->body->ID_Editorial) ) {
            return $this->view->response('Faltan completar datos', 400);
        }
        //obtengo los datos
        $titulo = $req->body->titulo;
        $autor = $req->body->autor;
        $genero= $req->body->genero;
        $precio = $req->body->precio;
        $ID_Editorial = $req->body->ID_Editorial;
        $descripcion = $req->body->descripcion;

        //inserto los datos
        $id = $this->model->insertBook($titulo, $autor, $genero, $precio, $ID_Editorial, $descripcion);

        if ($id){
            $book = $this->model->getBookById($id);
            return $this->view->response($book, 201 );
        } else {
            return $this->view->response("Error al insertar libro", 500 );
        }
    }


    public function update($req, $res) {
        $id = $req->params->id;

        // verifico la existencia del libro
        $book = $this->model->getBookById($id);
        if (!$book){
            return $this->view->response("Error, el libro no existe", 500 );
        }

        //valido los datos
        if(empty($req->body->titulo) || empty($req->body->ID_Editorial) ) {
            return $this->view->response('Faltan completar datos', 400);
        }
        //obtengo los datos
        $titulo = $req->body->titulo;
        $autor = $req->body->autor;
        $genero= $req->body->genero;
        $precio = $req->body->precio;
        $ID_Editorial = $req->body->ID_Editorial;
        $descripcion = $req->body->descripcion;

        //actualiza el libro
        $this->model->updateBook($titulo, $autor, $genero, $precio, $ID_Editorial, $descripcion, $id);

        //obtengo el libro modificado y lo devuelvo en la respuesta 
        $book = $this->model->getBookById($id);
        $this->view->response($book, 200);
    }


}

