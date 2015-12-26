defmodule BinTree do
  @moduledoc """
  A node in a binary tree.

  `value` is the value of a node.
  `left` is the left subtree (nil if no subtree).
  `right` is the right subtree (nil if no subtree).
  """
  @type t :: %BinTree{ value: any, left: BinTree.t | nil, right: BinTree.t | nil }
  defstruct value: nil, left: nil, right: nil
end

defmodule Zipper do
  @type trail :: { :left,  Zipper.t}
               | { :right, Zipper.t}
               | { :top }

  @type t :: %Zipper{ focus: BT.t, trail: trail }
  defstruct focus: nil, trail: nil

  @doc """
  Get a zipper focused on the root node.
  """
  @spec from_tree(BT.t) :: Z.t
  def from_tree(bt) do
    %Zipper{focus: bt, trail: :top}
  end

  @doc """
  Get the complete tree from a zipper.
  """
  @spec to_tree(Z.t) :: BT.t
  def to_tree(z) do
    case z.trail do
      :top -> z.focus
      {_, father} -> to_tree(father)
    end
  end

  @doc """
  Get the value of the focus node.
  """
  @spec value(Z.t) :: any
  def value(z) do
    z.focus.value
  end

  @doc """
  Get the left child of the focus node, if any.
  """
  @spec left(Z.t) :: Z.t | nil
  def left(z) do
    case z.focus.left do
      l when not is_nil(l) -> %Zipper{focus: l, trail: {:left, z}}
      nil -> nil
    end
  end
  
  @doc """
  Get the right child of the focus node, if any.
  """
  @spec right(Z.t) :: Z.t | nil
  def right(z) do
    case z.focus.right do
      r when not is_nil(r) -> %Zipper{focus: r, trail: {:right, z}}
      nil -> nil
    end
  end

  @doc """
  Get the parent of the focus node, if any.
  """
  @spec up(Z.t) :: Z.t
  def up(z) do
    case z.trail do
      :top -> z
      {_, father} -> father
    end
  end

  @doc """
  Set the value of the focus node.
  """
  @spec set_value(Z.t, any) :: Z.t
  def set_value(z, v) do
    replace_with(z, %{z.focus | value: v})
  end
  
  @doc """
  Replace the left child tree of the focus node. 
  """
  @spec set_left(Z.t, BT.t) :: Z.t
  def set_left(z, l) do
    replace_with(z, %{z.focus | left: l})
  end
  
  @doc """
  Replace the right child tree of the focus node. 
  """
  @spec set_right(Z.t, BT.t) :: Z.t
  def set_right(z, r) do
    replace_with(z, %{z.focus | right: r})
  end

  defp replace_with(z, bt) do
    case z.trail do
      :top -> %Zipper{focus: bt, trail: :top}
      {:left, _} -> z |> up |> set_left(bt) |> left
      {:right, _} -> z |> up |> set_right(bt) |> right
    end
  end
end
