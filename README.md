# API RESTful para la Gestión de Libros

Bienvenido a la **API RESTful para la gestión de libros**, diseñada para facilitar la manipulación de datos de libros a través de endpoints que permiten realizar operaciones CRUD (Crear, Leer, Actualizar y Eliminar) sobre los libros.

## Alumnos: Bustamante Simon y Valentino Sabbattini.

### Ejemplos de endpoints: 
```http 
https://localhost/tpe2-parte3/api/libros/
```

## Requerimientos Funcionales Mínimos

### 1. **La API Rest debe ser RESTful** 
   La estructura de las rutas sigue los principios REST, utilizando los métodos adecuados (GET, POST, PUT, DELETE) para manejar las operaciones sobre los libros.

### 2. **Servicio para listar todos los libros (GET)**
   - **Endpoint**: `GET /api/libros`
   - **Descripción**: Devuelve un listado completo de todos los libros en formato JSON.

### 3. **Servicio para obtener un libro por su ID (GET)**
   - **Endpoint**: `GET /api/libros/:id`
   - **Descripción**: Devuelve los detalles de un libro específico, incluyendo autor, título, precio, género, etc., dado su ID.

### 4. **Servicio para agregar un nuevo libro (POST)**
   - **Endpoint**: `POST /api/libros`
   - **Descripción**: Permite agregar un nuevo libro. Se deben enviar todos los detalles del libro en el cuerpo de la solicitud (excepto el `id`, ya que es autoincremental).

### 5. **Servicio para modificar un libro existente (PUT)**
   - **Endpoint**: `PUT /api/libros/:id`
   - **Descripción**: Permite actualizar los detalles de un libro especificado por su `id`. No es necesario enviar todos los atributos, solo aquellos que se desean modificar.

### 6. **Códigos de Error Adecuados**
   - **200 OK**: La solicitud se ha completado con éxito.
   - **201 Created**: El libro ha sido creado correctamente.
   - **400 Bad Request**: Datos incompletos o incorrectos.
   - **404 Not Found**: El libro no se encuentra en la base de datos.

## Requerimientos Funcionales Optativos

### 1. **Paginación (no implementado)**
   Actualmente, la API no soporta la paginación de la lista de libros.

### 2. **Filtrado de libros (GET)**
   - **Endpoint**: `GET /api/libros?filtro=campo&valor=valor`
   - **Descripción**: Puedes filtrar los libros por autor, género o precio, proporcionando el campo y el valor como parámetros de la consulta.
   - **Ejemplo de uso**:
     ```http
     GET /api/libros?autor=Brandon Sanderson
     ```

### 3. **Ordenamiento de libros (GET)**
   - **Endpoint**: `GET /api/libros?orderBy=campo&direction=asc|desc`
   - **Descripción**: Permite ordenar los libros por cualquier campo (como `autor`, `titulo`, `precio`, etc.) de forma ascendente o descendente.
   - **Ejemplo de uso**:
     ```http
     GET /api/libros?orderBy=titulo&direction=asc
     ```

### 4. **Autenticación con Token (no implementado)**
   Actualmente, la API no implementa autenticación basada en tokens para las operaciones POST y PUT.
## Ejemplos de Uso

### 1. **Listar todos los libros**
   - **Método**: `GET`
   - **Endpoint**: `/api/libros`
   - **Respuesta**:
     ```json
     [
       {
          "ID_Libro": "1",
          "titulo": "Juego de tronos",
          "autor": "George R.R. Martin",
          "genero": "Fantasia",
          "precio": "30000",
          "descripcion": "En el legendario mundo de los Siete Reinos, donde el verano puede durar décadas y el invierno toda una vida, y donde rastros de una magia inmemorial surgen de los rincones más sombríos, la tierra del norte, Invernalia, está resguardada por un colosal muro de hielo que detiene a fuerzas oscuras y sobrenaturales. En este majestuoso escenario, lord Stark y su familia se encuentran en el centro de un conflicto que desatará todas las pasiones: la traición y la lealtad, la compasión y la sed de venganza, el amor y el poder, la lujuria y el incesto, todo ello para ganar la más mortal de las batallas: el trono de hierro, una poderosa trampa que atrapará a los personajes… y al lector.",
          "imagen": "",
          "ID_Editorial": "1"
       },
       {
          "ID_Libro": "2",
          "titulo": "Fullmetal alchemist",
          "autor": " Hiromu Arakawa",
          "genero": "Aventura",
          "precio": "6000",
          "descripcion": "Los hermanos Edward y Alphonse Elric viven en un mundo donde la magia y la alquimia existen y se pueden practicar. Después de la muerte de su madre, juntos tratarán de resucitarla a través de la alquimia. Pero algo sale mal y Edward pierde un brazo y una pierna, y el espíritu de Alphonse acaba relegado en una vieja armadura.\r\n\r\nPara poder recuperar sus cuerpos deciden apuntarse al ejército de Amestris, en la división de alquimistas, para así poder seguir investigando sobre “la piedra filosofal” que puede devolverlos a la normalidad. Lo que no esperaban descubrir es que detrás de la piedra filosofal hay toda una conspiración escondida para destruir el mundo entero tal y como lo conocemos…",
          "imagen": "",
          "ID_Editorial": "2"
       }
     ]
     ```

### 2. **Obtener un libro por su ID**
   - **Método**: `GET`
   - **Endpoint**: `/api/libros/1`
   - **Respuesta**:
     ```json
     {
          "ID_Libro": "1",
          "titulo": "Juego de tronos",
          "autor": "George R.R. Martin",
          "genero": "Fantasia",
          "precio": "30000",
          "descripcion": "En el legendario mundo de los Siete Reinos, donde el verano puede durar décadas y el invierno toda una vida, y donde rastros de una magia inmemorial surgen de los rincones más sombríos, la tierra del norte, Invernalia, está resguardada por un colosal muro de hielo que detiene a fuerzas oscuras y sobrenaturales. En este majestuoso escenario, lord Stark y su familia se encuentran en el centro de un conflicto que desatará todas las pasiones: la traición y la lealtad, la compasión y la sed de venganza, el amor y el poder, la lujuria y el incesto, todo ello para ganar la más mortal de las batallas: el trono de hierro, una poderosa trampa que atrapará a los personajes… y al lector.",
          "imagen": "",
          "ID_Editorial": "1"
     }
     ```

### 3. **Agregar un nuevo libro**
   - **Método**: `POST`
   - **Endpoint**: `/api/libros`
   - **Cuerpo de la solicitud**:
     ```json
     {
        "titulo": "Nacidos de la bruma SAGA COMPLETA",
        "autor": "Brandon Sanderson",
        "genero": "Fantasia",
        "precio": "100000",
        "descripcion": "",
        "ID_Editorial": "4"
     }
     ```
   - **Respuesta**:
     ```json
      {
        "ID_Libro": "43",
        "titulo": "Nacidos de la bruma SAGA COMPLETA",
        "autor": "Brandon Sanderson",
        "genero": "Fantasia",
        "precio": "100000",
        "descripcion": "",
        "imagen": "",
        "ID_Editorial": "4"
      }
     ```

### 4. **Actualizar un libro**
   - **Método**: `PUT`
   - **Endpoint**: `/api/libros/3`
   - **Cuerpo de la solicitud**:
     ```json
     {
       "precio": 17.99
     }
     ```
   - **Respuesta**:
     ```json
     {
       "id": 3,
       "titulo": "1984",
       "autor": "George Orwell",
       "precio": 17.99,
       "genero": "Distopía"
     }
     ```

### 5. **Eliminar un libro**
   - **Método**: `DELETE`
   - **Endpoint**: `/api/libros/3`
   - **Respuesta**:
     ```json
     {
       "mensaje": "Libro eliminado con éxito"
     }
     ```

## Notas

- La API **no soporta actualmente autenticación basada en tokens**. Sin embargo, esta funcionalidad puede ser añadida en el futuro para mejorar la seguridad en las operaciones de modificación.
  
- **La paginación no está implementada**. No obstante, se puede agregar en futuras versiones del proyecto.
