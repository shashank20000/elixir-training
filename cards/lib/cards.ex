defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling Decks
  """

  @doc """
  Returns a list of playing Cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three"]
    suits = ["Spades", "Heart", "Daimond", "Clubs"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Checks Given Card

  ## Examples

      iex> deck = Cards.create_deck()
      iex> Cards.contains?(deck, "Ace of Spades")
      true
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Divides deck based on hand_size
  The `hand_size` is the number in the hand

  ## Examples

      iex> deck = Cards.create_deck()
      iex> {hand, deck} = Cards.deal(deck, 2)
      iex> hand
      ["Ace of Spades", "Two of Spades"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, file_name) do
    binary = :erlang.term_to_binary(deck)
    File.write(file_name, binary)
  end

  def load(file_name) do
    case File.read(file_name) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "The file does not exist"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end
end
