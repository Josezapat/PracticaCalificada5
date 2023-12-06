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
  // Asegúrate de que este código se ejecute después de que la página se haya cargado
  document.addEventListener("DOMContentLoaded", function () {
    // Obtén todas las casillas de verificación por su selector
    const checkboxes = document.querySelectorAll('input[type="checkbox"]');

    // Agrega un event listener a cada casilla de verificación
    checkboxes.forEach(function (checkbox) {
      checkbox.addEventListener('change', function () {
        // Obtén la clasificación de la casilla de verificación actual
        const rating = checkbox.id.replace('rating-', '');

        // Obtén todas las películas con la clasificación correspondiente
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
Estas definiciones de pasos simulan la creación de la película "Inception" con 5 revisiones y un puntaje promedio de 3.5. Asegúrate de adaptar estos pasos a la lógica específica de tu aplicación y a las herramientas que estás utilizando para las pruebas de aceptación automatizadas (BDD).
***

5-

***

6-

***

7-

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
