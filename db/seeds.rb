# db/seeds.rb
# rails db:seed
blogs = [
  { name: "zenn" },
  { name: "Qiita" },
  { name: "ハテナBlog" }
]

blogs.each do |blog|
  Blog.create!(blog)
end
