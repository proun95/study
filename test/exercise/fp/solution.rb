module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def is_correct_film(film)
        !film['country'].nil? && film['country'].include?(',') && !film['rating_kinopoisk'].nil? && film['rating_kinopoisk'].to_f > 0 ? true : false
      end

      def rating(array)
        film_raiting = array.each_with_object({ raiting_sum: 0.0, count: 0 }) do |film, acc|
          if is_correct_film(film)
            acc[:raiting_sum] += film['rating_kinopoisk'].to_f
            acc[:count] += 1
          end
        end

        film_raiting[:raiting_sum] / film_raiting[:count]
      end

      def chars_count(_films, _threshold)
        0
      end
    end
  end
end
