#!/usr/bin/env ruby

require 'kalari/arena'

class NumberGuesser
  def call env
    
  end

  class Player
    
  end
end

arena = Kalari::Arena.new(NumberGuesser.new)
arena.enter NumberGuesser::Player.new
arena.begin
