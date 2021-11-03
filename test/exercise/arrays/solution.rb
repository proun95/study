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

      def search(_array, _query)
        0
      end
    end
  end
end
