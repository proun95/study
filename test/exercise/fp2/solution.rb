module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&func)
        return if empty?

        head, *tail = self
        func.call(head)
        MyArray.new(tail).my_each(&func)
        self
      end

      # Написать свою функцию my_map
      def my_map(&func)
        func_for_reduce = ->(acc, element) { acc << func.call(element) }
        my_reduce(MyArray.new, &func_for_reduce)
      end

      # Написать свою функцию my_compact
      def my_compact
        acc = []
        func = ->(element) { acc << element unless element.nil? }
        my_each(&func)
        MyArray.new(acc)
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &func)
        head, *tail = self
        return MyArray.new(tail).my_reduce(head, &func) if acc.nil?
        return func.call(acc, head) if tail.empty?

        MyArray.new(tail).my_reduce(func.call(acc, head), &func)
      end
    end
  end
end
