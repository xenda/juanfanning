
atom_feed do |feed|
  feed.title("DigitalMuni Projects")
  feed.updated(@projects.first.updated_at)
  
  @projects.each do |post|
    feed.entry(post,:url=>project_url(post)) do |entry|
      entry.title(post.issuer)
      entry.content( post.description, :type=>'html')
      entry.author { post.issuer }
    end
  end
  
end
