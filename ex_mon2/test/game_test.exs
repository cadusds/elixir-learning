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


  describe "info/0" do
    test "returns the current game state" do
      player = Player.build("cadu",:chute,:soco,:cura)
      Player.build("Robozão",:chute,:soco,:cura)
      |> Game.start(player)

      expected_response = %{
        computer: %Player{
          life: 100,
          moves: %{
            move_avg: :soco,
            move_heal: :cura,
            move_random: :chute
          },
          name: "Robozão"
        },
        player: %Player{
          life: 100,
          moves: %{
            move_avg: :soco,
            move_heal: :cura,
            move_random: :chute
          },
          name: "cadu"
        },
        status: :started,
        turn: :player
      }
      assert Game.info() == expected_response

    end
  end
end
