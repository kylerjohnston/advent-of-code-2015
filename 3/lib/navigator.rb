class Navigator
  attr_reader :directions, :santa_path, :robot_path

  # @param dir [String] directions, raw string from input file
  def initialize(dir)
    @directions = dir.split('')
    @santa_path, @robot_path = split_paths
  end

  private

  def split_paths
    path1 = []
    path2 = []

    directions.each_with_index do |x, i|
      if i.zero? || i.even?
        path1 << x.dup
      else
        path2 << x.dup
      end
    end
    [path1, path2]
  end
end
