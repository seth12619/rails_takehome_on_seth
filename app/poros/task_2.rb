class Task2

  # Implement a group_by_owners function that:
  # - Accepts a hash containing the file owner name for each file name.
  # - Returns a hash containing an array of file names for each owner name, in any order.

  def group_by_owners(files)
    result = {}
    names = []
    files.each do |file|
      names << file[1]
    end
    names = names.uniq
    
    names.each do |name|
      filtered_files = files.select { |file_name, owner| owner == name }
      name_filter = []
      filtered_files.each do |file|
        name_filter << file[0]
      end
      
      result[name] = name_filter
    end
    
    return result
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