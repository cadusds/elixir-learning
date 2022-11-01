defmodule ExMon2.GameTest do

  use ExUnit.Case
  alias ExMon2.{Game,Player}

  describe "start/2" do
    test "starts the game state" do
      player = Player.build("cadu",:chute,:soco,:cura)
      computer = Player.build("Robozão",:chute,:soco,:cura)

      assert {:ok, _pid} = Game.start(computer,player)
    end
  end
end
