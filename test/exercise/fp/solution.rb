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
        film_rating = array.each_with_object({ rating_sum: 0.0, films_count: 0 }) do |film, acc|
          if is_correct_film(film)
            acc[:rating_sum] += film['rating_kinopoisk'].to_f
            acc[:films_count] += 1
          end
        end

        film_rating[:rating_sum] / film_rating[:films_count]
      end

      def chars_count(_films, _threshold)
        0
      end
    end
  end
end
