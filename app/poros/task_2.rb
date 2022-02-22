class Task2
  def group_by_owners(files)
    return nil
  end

  # for hash `{'Input.txt' => 'Randy', 'Code.py' => 'Stan', 'Output.txt' => 'Randy'}`
  # the group_by owners function should return
  # `{'Randy' => ['Input.txt', 'Output.txt'), 'Stan' => ['Code.py']}`
  def test_1
    files = {
      'Input.txt' => 'Randy',
      'Code.py' => 'Stan',
      'Output.txt' => 'Randy'
    }
    puts group_by_owners(files)
  end
end
