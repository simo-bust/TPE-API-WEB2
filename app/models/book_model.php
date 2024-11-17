<?php
require_once './libs/config.php';

class BookModel {
    private $db;

    public function __construct() {
        $this->db = new PDO(
            "mysql:host=".MYSQL_HOST . 
            ";dbname=".MYSQL_DB.";charset=utf8",
            MYSQL_USER, MYSQL_PASS);
        $this->deploy();
    }

    private function deploy() {
        $query = $this->db->query('SHOW TABLES');
        $tables = $query->fetchAll();
        if(count($tables) == 0) {
            $sql ="
            CREATE TABLE `editorial` (
                `ID_Editorial` int(11) NOT NULL,
                `nombre` varchar(50) NOT NULL,
                `pais` varchar(50) NOT NULL
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

            CREATE TABLE `libro` (
                `ID_Libro` int(11) NOT NULL, 
                `titulo` varchar(100) NOT NULL,
                `autor` varchar(50) NOT NULL,
                `genero` varchar(50) NOT NULL,
                `precio` int(11) NOT NULL,
                `descripcion` text NOT NULL,
                `ID_Editorial` int(11) NOT NULL
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
            ";
            $this->db->query($sql);
        }
    }
    
    // Obtiene todos los libros con un switch para determinar el campo de ordenamiento
    public function getBooks($orderBy = false, $direction = 'ASC', $filters = []) {
        $sql = 'SELECT * FROM libro';
    
        // Aplicar filtros
        if (!empty($filters)) {
            $whereClauses = [];
            if (!empty($filters['autor'])) {
                $whereClauses[] = 'autor LIKE :autor';
            }
            if (!empty($filters['genero'])) {
                $whereClauses[] = 'genero LIKE :genero';
            }
            if (!empty($filters['precio_min'])) {
                $whereClauses[] = 'precio >= :precio_min';
            }
            if (!empty($filters['precio_max'])) {
                $whereClauses[] = 'precio <= :precio_max';
            }
    
            if (count($whereClauses) > 0) {
                $sql .= ' WHERE ' . implode(' AND ', $whereClauses);
            }
        }
    
        // Agregar ordenamiento
        switch ($orderBy) {
            case 'titulo':
                $sql .= ' ORDER BY titulo';
                break;
            case 'autor':
                $sql .= ' ORDER BY autor';
                break;
            case 'precio':
                $sql .= ' ORDER BY precio';
                break;
            default:
                $sql .= ' ORDER BY ID_Libro'; // Orden predeterminado
                break;
        }
        
        // Agregar dirección de ordenamiento
        $sql .= ' ' . $direction;
    
        // Preparar y ejecutar la consulta
        $query = $this->db->prepare($sql);
    
        // Vincular parámetros de filtro
        if (!empty($filters['autor'])) {
            $query->bindValue(':autor', '%' . $filters['autor'] . '%');
        }
        if (!empty($filters['genero'])) {
            $query->bindValue(':genero', '%' . $filters['genero'] . '%');
        }
        if (!empty($filters['precio_min'])) {
            $query->bindValue(':precio_min', $filters['precio_min']);
        }
        if (!empty($filters['precio_max'])) {
            $query->bindValue(':precio_max', $filters['precio_max']);
        }
    
        $query->execute();
    
        // Retorna los libros en un arreglo de objetos
        return $query->fetchAll(PDO::FETCH_OBJ);
    }
    


    public function getBookById($id) {
        $query = $this->db->prepare('SELECT * FROM libro WHERE ID_Libro = ?');
        $query->execute([$id]);
        
        return $query->fetch(PDO::FETCH_OBJ);
    }

    public function getBooksByEditorial($id_editorial) {
        $query = $this->db->prepare('SELECT libro.*, editorial.nombre AS editorial_nombre
                                    FROM libro
                                    JOIN editorial ON libro.ID_Editorial = editorial.ID_Editorial
                                    WHERE libro.ID_Editorial = ?');
        $query->execute([$id_editorial]);
    
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    public function deleteBook($id) {
        $query = $this->db->prepare('DELETE FROM libro WHERE ID_Libro = ?');
        $query->execute([$id]);
    }

    public function insertBook($titulo, $autor, $genero, $precio, $ID_Editorial, $descripcion) {
        $query = $this->db->prepare('INSERT INTO libro (titulo, autor, genero, precio, ID_Editorial, descripcion) VALUES (?, ?, ?, ?, ?, ?)');
        $query->execute([$titulo, $autor, $genero, $precio, $ID_Editorial, $descripcion]);

        $id = $this->db->lastInsertId();
    
        return $id;
    }

    public function updateBook($titulo, $autor, $genero, $precio, $ID_Editorial, $descripcion, $id) {
        $query = $this->db->prepare("UPDATE libro SET titulo = ?, autor = ?, genero = ?, precio = ?, ID_Editorial = ?, descripcion = ? WHERE ID_Libro = ?");
        $query->execute([$titulo, $autor, $genero, $precio, $ID_Editorial, $descripcion, $id]);
    }
}

