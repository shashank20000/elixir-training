defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create deck makes 15 cards" do
    deck_length = length(Cards.create_deck())
    assert deck_length == 12
  end

  test "shuffle a deck randomises" do
    deck = Cards.create_deck()
    refute deck == Cards.shuffle(deck)
  end
end
