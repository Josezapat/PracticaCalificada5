José Daniel Zapata Ancco / 20202230A


Preguntas:  En este conjunto de preguntas tus respuestas deben ir de acuerdo a las actividades correspondientes, no se puntúa sino hay evidencia del uso de los scripts desarrollados y solo presentas respuestas sin evidencia de lo desarrollado a lo largo del curso. (7 puntos)

***

-1 Utilizaremos nuestro archivo `movies_controller.rb` de nuestro repositorio de la Práctica calificada N°3 https://github.com/Josezapat/PC3-DesarrollodeSoftware/blob/master/app/controllers/movies_controller.rb para modificar el método show de esta forma:

```ruby
  def show
    # Se utiliza el método set_movie para obtener la película por su ID
    if @movie.nil?
      flash[:notice] = 'La película que estás buscando no existe.'
      redirect_to action: 'index'
    else
      # Si la película existe, el código original del método show continúa aquí
    end
  end
```

En el método show, se verifica si la película es nil (no existe). En ese caso, se establece un mensaje flash indicando que la película no existe y se redirige al usuario a la vista index.

Si la película existe, el código original del método show (lo que haces con la película existente) y continuará ejecutándose.

***

-2 Utilizaremos nuestro archivo movies_controller de la tarea de Rails_Avanzado 
 Añadamos el filtro `before_action`
 
```ruby
class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :set_ratings, only: [:index, :show]

  def show
    if @movie.nil?
      flash[:notice] = 'La película que estás buscando no existe.'
      redirect_to action: 'index'
    else
      # Si la película existe, el código original del método show continúa aquí
      # Por ejemplo, puedes seguir utilizando @movie en tu código
    end
  end

#mismo código
...
...
#mismo código

  private

  def set_movie
    @movie = Movie.find_by(id: params[:id])
  end
```

El filtro before_action :set_movie, only: [:show, :edit, :update, :destroy] al controlador es para llamar al método set_movie antes de ejecutar las acciones show, edit, update, y destroy.

En el método show, se verifica si la película es nil. Si es nil, se establece un mensaje flash y se redirige al usuario a la vista index. Si la película existe, el código original del método show continúa ejecutándose.

Se colocó la funcionalidad en su propio método en lugar de referenciar directamente request.env['omniauth.auth'] para mejorar la legibilidad, facilitar el mantenimiento, permitir la reutilización del código y seguir principios de diseño estables.

***

3- Modificaremos nuestros archivos index.html.erb de neustra PC3 https://github.com/Josezapat/PC3-DesarrollodeSoftware/tree/master/app/views/movies

```html
<!-- Agrega las casillas de verificación con las clasificaciones de películas -->
<input type="checkbox" id="rating-G" checked> G
<input type="checkbox" id="rating-PG" checked> PG
<!-- Agrega más casillas de verificación según las clasificaciones -->

<!-- Lista de películas -->
<ul id="movieList">
  <li data-rating="G">Película con clasificación G</li>
  <li data-rating="PG">Película con clasificación PG</li>
  <!-- Agrega más elementos li según las clasificaciones de tus películas -->
</ul>

<script>
 
  document.addEventListener("DOMContentLoaded", function () {
    // Se obtiene todas las casillas de verificación por su selector
    const checkboxes = document.querySelectorAll('input[type="checkbox"]');

    // Agrega un event listener a cada casilla de verificación
    checkboxes.forEach(function (checkbox) {
      checkbox.addEventListener('change', function () {
        // Obtén la clasificación de la casilla de verificación actual
        const rating = checkbox.id.replace('rating-', '');

        // Obtiene todas las películas con la clasificación correspondiente
        const movies = document.querySelectorAll(`li[data-rating="${rating}"]`);

        // Muestra u oculta las películas según si la casilla está marcada o no
        movies.forEach(function (movie) {
          movie.style.display = checkbox.checked ? 'block' : 'none';
        });
      });
    });
  });
</script>
```

En este ejemplo, cada casilla de verificación tiene un identificador único basado en su clasificación. Cuando una casilla de verificación se desmarca, se ocultan las películas que tienen la clasificación correspondiente. 

***

4-Para el archivo steps.rb

```cucumber

Given(/^the movie "(.*?)" exists$/) do |movie_title|
  # Lógica para crear una película con el título proporcionado

  Movie.create(title: movie_title)
end

Given(/^it has (\d+) reviews$/) do |review_count|
  # Lógica para asignar un número específico de revisiones a la película

  movie = Movie.last
  review_count.to_i.times do
    movie.reviews.create
  end
end

Given(/^its average review score is (\d+\.\d+)$/) do |average_score|
  # Lógica para asignar un puntaje promedio específico a la película

  movie = Movie.last
  movie.reviews.each { |review| review.update(score: average_score.to_f / movie.reviews.count) }
end
```
Estas definiciones de pasos simulan la creación de la película "Inception" con 5 revisiones y un puntaje promedio de 3.5. 
***

5-
Supongamos que tenemos este pseudocodigo:
Escenario: Agregar una nueva película con calificación y fecha de estreno
  Dado que estoy en la página de creación de películas
  Cuando relleno el formulario con la calificación "5" y la fecha de estreno "2023-01-01"
  Y hago clic en el botón "Guardar"
  Entonces debería ver la información de la película en la página de detalles

Ahora, ajustemos este escenario para utilizar un formulario en blanco:
Escenario: Agregar una nueva película mediante un formulario en blanco
  Dado que estoy en la página de creación de películas
  Cuando relleno el formulario en blanco
  Y hago clic en el botón "Guardar"
  Entonces debería ver la información de la película en la página de detalles

Creamos el archivo step_definitions:

```ruby
# features/step_definitions/movie_steps.rb

Dado(/^que estoy en la página de creación de películas$/) do
  # Lógica para navegar a la página de creación de películas
end

Cuando(/^relleno el formulario en blanco$/) do
  # Lógica para rellenar el formulario en blanco

end

Y(/^hago clic en el botón "Guardar"$/) do
  # Lógica para hacer clic en el botón de guardar
end

Entonces(/^debería ver la información de la película en la página de detalles$/) do
  # Lógica para verificar que la información de la película se muestra en la página de detalles
end
```
***

6-

***

7-

Basándose en el fichero de especificaciones, las instancias de F1 deberían responder a los siguientes métodos para pasar las pruebas:

be_a_pain_in_the_butt: Este método se utiliza para verificar si la instancia de F1 es “a pain in the butt”.
be_awesome: Este método se utiliza para verificar si la instancia de F1 es “awesome”.
be_nil: Este método se utiliza para verificar si la instancia de F1 es nil. En este caso, la prueba espera que la instancia de F1 no sea nil.
== "": Este método se utiliza para verificar si la instancia de F1 es igual a la cadena vacía “”. En este caso, la prueba espera que la instancia de F1 no sea igual a “”.

El código está escrito en Ruby y está destinado a ser utilizado como definiciones de pasos en pruebas de comportamiento (BDD) utilizando la biblioteca de pruebas Cucumber, junto con Capybara para las pruebas de interfaz web.

***

Pregunta:   Utilizando historias de usuario y Cucumber (8 puntos)
Utilizaremos nuestro repositorio de la PC3: https://github.com/Josezapat/PC3-DesarrollodeSoftware
Ejecutamos los comandos:
bundle install --without production 

![image](https://github.com/Josezapat/PracticaCalificada5/assets/90808325/f53e1c31-b06c-442f-997f-3fb5fa789087)

bin/rake db:setup 

![image](https://github.com/Josezapat/PracticaCalificada5/assets/90808325/9de679bd-e4d6-40f1-91bf-53a869953804)

Nos lleva al navegador y nos aparece la lista que contiene películas:

![image](https://github.com/Josezapat/PracticaCalificada5/assets/90808325/7cf2ec0c-970c-4b11-bc33-26ce1b4ba6da)

Antes de continuar verifica que tu aplicación esté configurada correctamente y sin errores:

bundle exec cucumber

 Resuelve cada una de las preguntas:

 1- 
Completa el escenario restrict to movies with PG or R ratings en filter_movie_list.feature.

En el archivo filter_movie_list.feature, completamos el escenario de la siguiente manera:
 ```cucumber
 Scenario: restrict to movies with PG or R ratings
  Given I am on the RottenPotatoes home page
  When I check the "PG" checkbox
  And I check the "R" checkbox
  And I press "Refresh Page"
  Then I should see only movies with ratings: PG, R
  And I should not see movies with other ratings
```
 ***
 2- 
En el archivo web_steps.rb, agregamos la siguiente definición de paso:
 ```ruby
 Given(/^I check the following ratings: (.+)$/) do |ratings|
  ratings.split(', ').each do |rating|
    step "I check the \"#{rating}\" checkbox"
  end
end
```
 ***
 3- En tu archivo movie_steps.rb, puedes agregar la siguiente definición de paso:

 ```ruby
 Then(/^I should see the following movies$/) do |table|
  # Obtén todas las filas de la tabla HTML que contiene la lista de películas
  rows = page.all('table#movies tbody tr')

  # Verifica que el número de filas coincida con el número de filas en la tabla del paso
  expect(rows.count).to eq(table.hashes.count)

  # Verifica que cada película de la tabla del paso esté presente en la lista de películas
  table.hashes.each do |movie|
    expect(page).to have_content(movie['Movie Title'])
    expect(page).to have_content(movie['Rating'])
    expect(page).to have_content(movie['Release Date'])
  end
end
```

 ***
 4-En tu archivo movie_steps.rb, puedes completar la definición de paso de la siguiente manera:
 ```ruby
 Then(/^I should see all the movies$/) do
  # Obtenemos todas las filas de la tabla HTML 
  rows = page.all('table#movies tbody tr')

  # Verificamos que el número de filas coincida con el número total de películas en la base de datos
  expect(rows.count).to eq(Movie.count)
end
```
 ***

 5-Completamos el escenario all ratings selected en filter_movie_list.feature utilizando las nuevas definiciones de pasos:
 ```cucumber
 Scenario: all ratings selected
  Given I am on the RottenPotatoes home page
  When I check the following ratings: G, PG, R
  And I press "Refresh Page"
  Then I should see all the movies
```
 ***


 6- a,b y c
 
 Para crear una definición de paso que pruebe si una película aparece antes que otra en la lista de salida, podemos hacer uso de Capybara y sus métodos de búsqueda en la página. Entonces vamos a agregar al archivo movie_steps.rb:
 
 ```ruby
 Then(/^I should see "(.*?)" before "(.*?)"$/) do |movie1, movie2|
  # Encuentra los índices de las películas en la lista de salida
  index_movie1 = page.body.index(movie1)
  index_movie2 = page.body.index(movie2)

  # Esto verifica que la primera película aparezca antes que la segunda
  expect(index_movie1).to be < index_movie2
end
```

page.body devuelve el cuerpo HTML de la página como si fuera una cadena gigante.
Se utiliza index para obtener los índices de aparición de cada película en la cadena HTML.

***

7- Esta definición de paso utiliza la propiedad page.body de Capybara para obtener el cuerpo HTML de la página como una cadena de texto. Luego, se utiliza el método index para obtener los índices de aparición de dos películas específicas en esa cadena HTML.

La línea expect(index_movie1).to be < index_movie2 establece una expectativa de que el índice de la primera película (index_movie1) debe ser menor que el índice de la segunda película (index_movie2). Es decir  verifica que la primera película aparece antes que la segunda en la cadena HTML.

Podemos concluir que la definición de paso y la expectativa se utilizan para verificar el orden relativo de dos elementos en el cuerpo HTML de la página, en este caso, para verificar que la primera película aparece antes que la segunda.

***
Pregunta (5 puntos) : Para el siguiente ejercicio utiliza la lista de proyectos Rails de código abierto en Open Source Rails: https://github.com/gramantin/awesome-rails#open-source-rails-apps 

1. Describiré algunos Patrones de Diseño ya que en el contexto de proyectos Rails de código abierto, algunos patrones de diseño comunes podrían ser:

MVC (Model-View-Controller): Este patrón es ampliamente utilizado en aplicaciones Rails. El modelo maneja la lógica de negocio y los datos, la vista maneja la presentación y el controlador maneja la interacción del usuario y actúa como intermediario entre el modelo y la vista.

Observer: Podría ser aplicado para manejar eventos asíncronos. Un ejemplo sería notificar a los objetos interesados (observadores) cuando un modelo cambia su estado.

Decorator: Sirve para agregar comportamientos adicionales a objetos sin modificar su estructura. En Rails, esto podría ser útil para extender funcionalidades de modelos o vistas de manera dinámica.

etc 

***

2. Paradigma de Diseño:
Para un sistema simple que responde a una historia de usuario concreta, el paradigma de diseño adecuado podría ser el Diseño Orientado a Objetos (DOO). Rails sigue este paradigma, y su estructura MVC es un ejemplo de cómo se pueden organizar los objetos para una fácil mantenibilidad y escalabilidad.

***

4. Arquitectura Software:
La elección de la arquitectura depende de la complejidad de la historia de usuario. Para un sistema simple, la arquitectura monolítica podría ser apropiada. En este enfoque, todo el código se encuentra en un solo lugar, facilitando la implementación y la depuración. sobretodo en el Proyecto Rails es común y puede ser eficiente para aplicaciones de tamaño moderado.


