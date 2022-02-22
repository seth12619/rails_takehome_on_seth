class Task1
  def unique_names(names1, names2)
    return nil
  end

  # should print array of Ava, Emma, Olivia, Sophia in any order
  def test_1
    names1 = ["Ava", "Emma", "Olivia"]
    names2 = ["Olivia", "Sophia", "Emma"]
    puts unique_names(names1, names2)
  end

  # should print array of Ava, Emma, Olivia, Sophia in any order
  def test_2
    names1 = ["Ava", ["Olivia", "Emma"]]
    names2 = ["Sophia", "Emma"]
    puts unique_names(names1, names2)
  end
end
