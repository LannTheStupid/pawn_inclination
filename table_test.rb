require 'text-table'

array = [
    ['S', '+', '!M!', 'C'],
    [2, 43, 456, -123]
]

puts array.to_table(:first_row_is_head => false)

table = Text::Table.new
table.head = ['S', '+', '!M!', 'C']
table.rows << [2, 43, 456, -123]
table.align_row 2, :right

puts table
