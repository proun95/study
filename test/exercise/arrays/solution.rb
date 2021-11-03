module Exercise
  module Arrays
    class << self
      def get_max(array, max = array[0])
        head, *tail = array
        if array == []
          return max
        elsif head > max
          max = head
        end

        get_max(tail, max)
      end

      def replace_with_value(array, value)
        head, *tail = array
        head = value if head.positive?
        return head if tail == []

        [head, *replace_with_value(tail, value)]
      end

      def replace(array)
        max = get_max(array)
        replace_with_value(array, max)
      end

      def search(array, query, base = 0)
        length = array.length
        middle = length / 2
        return base + middle if array[middle] == query
        return -1 if length <= 1 && array[0] != query

        if array[middle] > query
          search(array[0..middle - 1], query, base)
        else
          search(array[middle..length], query, base + middle)
        end
      end
    end
  end
end
