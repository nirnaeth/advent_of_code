require "pry"
class Card
  attr_reader :rows

  def initialize(values)
    @rows = values
    @columns = values.transpose
    @bingo = false
    @row_length = rows.first.size
    @column_length = columns.first.size
  end

  def mark(number)
    new_values = []

    rows.each do |row|
      index = row.index(number)

      row[index] = -1 if index
      new_values << row

      @bingo = true if row.sum == -row_length
    end

    rows = new_values
    columns = rows.transpose

    columns.each do |column|
      @bingo = true if column.sum == -column_length
    end
  end

  def bingo?
    bingo
  end

  def sum
    @sum = [].tap do |row_sums|
      rows.each do |row|
        row.delete(-1)
        row_sums << row.sum
      end
    end
    .sum
  end

  private
    attr_reader :bingo
    attr_reader :columns
    attr_reader :row_length
    attr_reader :column_length
end