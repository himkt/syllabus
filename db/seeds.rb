# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

s = Roo::Excelx.new('vendor/kdb.xlsx')

s.each_with_index do |arr, index|
  next if index <= 3
  record = []
  arr.each_with_index do |item, _|
    next if index == 2 || index == 14
    if item != nil
      item = "#{item.to_s.gsub(/\n/, '')}"
    end
    record.push(item)
  end

  Subject.create({
    :kcode=>items[0].sub(/\.0$/,''),
    :kname=>items[1],
    :unit=>items[2],
    :grade=>items[3],
    :semester=>items[4],
    :time=>items[5],
    :location=>items[6],
    :lecturer=>items[7],
    :summary=>items[8],
    :note=>items[9],
    :credit=>items[10],
    :condition=>items[11],
    :alternative=>items[12]
  })
end
