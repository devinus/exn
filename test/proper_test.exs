Code.require_file "../test_helper.exs", __FILE__

defmodule ExnTest.Properties do
  use Proper.Properties

  property "encoded data, decoded back is the same data" do
    forall x in term, do: Exn.decode(Exn.encode(x)) == x
  end
end

defmodule ExnTest do
  use ExUnit.Case
  use Proper.Properties

  test "module" do
    assert Proper.module(ExnTest.Properties, numtests: 1000) == []
  end
end