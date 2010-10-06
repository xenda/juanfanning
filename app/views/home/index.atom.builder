
atom_feed do |feed|
  feed.title("DigitalMuni Projects")
  feed.updated(@projects.try(:first).try(:updated_at))
  
  @projects.each do |post|
    feed.entry(post,:url=>access_member_project_url(post)) do |entry|
      entry.title(post.issuer)
      entry.content( strip_tags(post.description), :type=>'html')
      entry.author { post.issuer }
    end
  end
  
end
