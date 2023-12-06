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
