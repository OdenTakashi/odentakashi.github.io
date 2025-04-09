TITLE = ARGV[0]
NEXT_POST_NUMBER_INCREMENT = 1
FILENUMBER = Dir.each_child('_posts').map { |f| f[/post(\d+)/, 1]&.to_i }.compact.max + NEXT_POST_NUMBER_INCREMENT
CREATED_DATE = Time.now.utc.strftime("%Y-%m-%d %H:%M")
TODAY = Time.now.utc.strftime("%Y-%m-%d")
FILENAME = "_posts/#{TODAY}-post#{FILENUMBER}.md"

if File.exist?(FILENAME)
  puts "#{FILENAME} already exists."
  return
end

File.open(FILENAME, "w") do |f|
  f.puts <<~EOS
    ---
    layout: post
    title: "#{TITLE}"
    image: https://odentakashi.github.io/public/images/mini_annotaterb_schematic.png
    date: #{CREATED_DATE}
    ---
  EOS
end
