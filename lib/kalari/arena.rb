module Kalari
  class Arena
    attr_reader :discipline

    def initialize discipline
      @discipline = discipline
      @players = []
    end

    def begin
      @discipline.call environment
    end

    def enter player
      @players << player
    end

    def environment
      Environment.from_hash(
        players: @players
      )
    end

    class Environment < Struct.new(:players)
      def self.from_hash hsh
        new(*hsh.values_at(*members))
      end
    end
  end
end
