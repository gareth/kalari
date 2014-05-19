require 'minitest/spec'
require 'minitest/autorun'
require 'mocha/mini_test'

require 'kalari/arena'


describe Kalari::Arena do
  let(:game) { lambda { pass } }

  it "accepts a (callable) object as the discipline" do
    arena = Kalari::Arena.new(game)
    assert_equal game, arena.discipline
  end

  it "doesn't call the discipline" do
    failgame = lambda { flunk }

    arena = Kalari::Arena.new(failgame)
  end

  describe "#begin" do
    it "calls the discipline" do
      game = mock('callable')
      game.expects(:call)

      arena = Kalari::Arena.new(game)
      arena.begin
    end

    it "exposes an environment object" do
      game = -> env {
        env.wont_be_nil
      }

      arena = Kalari::Arena.new(game)
      arena.begin
    end
  end

  describe "#enter" do
    let(:player) { mock('player') }
    let(:player2) { mock('player') }

    it "accepts a player object which is exposed through the game environment" do
      arena = Kalari::Arena.new -> env {
        env.players.must_equal [player]
      }

      arena.enter player
      arena.begin
    end

    it "stacks multiple entrants" do
      arena = Kalari::Arena.new -> env {
        env.players.must_equal [player, player2]
      }

      arena.enter player
      arena.enter player2
      arena.begin
    end
  end

end
