require "csv"

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i 

if memo_type == 1
  puts "拡張子を除いたファイルを入力してください"
  file_name = gets.chomp

  puts "メモしたい内容を記入してください"
  puts "完了したらCtrl + Dをおします"
  memo_content = readlines

  CSV.open("#{file_name}.csv", "w") do |csv|
    csv << memo_content
  end

elsif memo_type == 2
  puts "編集するメモのファイル名を入力してください"
  file_name = gets.chomp

  if File.exist?("#{file_name}.csv")
    CSV.foreach("#{file_name}.csv") do |row|
      puts row.join
    end

    puts "追加する内容を入力してください"
    puts "完了したらCtrl + Dをおします"
    memo_content = readlines

    CSV.open("#{file_name}.csv", "a") do |csv|
      csv << memo_content
    end
    puts "メモが編集されました"

  else
    puts "指定されたファイルは存在しません"
  end

else
  puts "1か2を入力してください"
end
