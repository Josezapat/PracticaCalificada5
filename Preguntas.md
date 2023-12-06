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

3- 

***

4-

***

5-

***

6-

***

7-

***
