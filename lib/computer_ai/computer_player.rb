module TicTacToe
    class CPUPlayer < Player
        def initialize(input)
            @color = input.fetch(:color)
            @name = "Zarathustra"
        end
    end
end