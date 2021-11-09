module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def is_correct_film(film)
        has_more_than_two_contries = !film['country'].nil? && film['country'].include?(',')
        has_rating = !film['rating_kinopoisk'].nil? && film['rating_kinopoisk'].to_f > 0

        has_more_than_two_contries && has_rating
      end

      def rating(array)
        correct_films = array.select { |film| is_correct_film(film) }
        rating_sum = correct_films.reduce(0) { |sum, film| sum + film['rating_kinopoisk'].to_f }

        rating_sum / correct_films.length
      end

      def chars_count(films, threshold)
        correct_films = films.select { |film| !film['rating_kinopoisk'].nil? && film['rating_kinopoisk'].to_f >= threshold }
        correct_films_names = correct_films.map { |film| film['name'] }

        correct_films_names.join('').count('и')
      end
    end
  end
end
