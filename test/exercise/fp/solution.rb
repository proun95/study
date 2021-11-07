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
        film_rating = array.select { |film| is_correct_film(film) }.each_with_object({ rating_sum: 0.0, films_count: 0 }) do |film, acc|
          acc[:rating_sum] += film['rating_kinopoisk'].to_f
          acc[:films_count] += 1
        end

        film_rating[:rating_sum] / film_rating[:films_count]
      end

      def chars_count(films, threshold)
        films.select { |film| !film['rating_kinopoisk'].nil? && film['rating_kinopoisk'].to_f >= threshold }.reduce(0) do |i_common_count, film|
          i_common_count += film['name'].split('').reduce(0) do |i_film_count, name_letter|
            i_film_count += 1 if name_letter == 'и'
            i_film_count
          end

          i_common_count
        end
      end
    end
  end
end
