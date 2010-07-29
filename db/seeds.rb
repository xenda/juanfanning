# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
admin = Admin.create :name => "Administrator", :email=>"user@domain.org", :password=>"12345678", :password_confirmation=>"12345678", :role => "admin"

%w(About Services Contact FAQ).each do |t|
  
  Page.create :title => t, :slug => t.parameterize, :content => "<p>A trim puruloid disbind nenta wag radiographically par, dearly, disconsideration casualties parapherna, em arm, weathermen, ya, rut emu prat. Bit, axon acrisia uses incoherences, peat, verticillaster camases, smut net, toyman sextain gulf, subsyndication. Dumb, roc whiz gurgeon, bows beshow. Syntasis imperf, trica, do. Ye, barkevikite, nowhither, dis campiness sny whirl fobs peronnei anglaise tones, a ruck, a dorms, ow tchai deener. Unabsorbed a of ha yucca em dicot, agend bit, ablate monkeyfied freet, coo. Toled busy ski yore, um reveled sciomachy assagai, bore hers ingrately.</p>", :status => "published", :user_id => admin.id, :published_at => Date.today
  
end


#  title        :string(255)     default("Untitled"), not null
#  content      :text
#  slug         :string(255)
#  published_at :string(255)
#  status       :string(255)     default("unpublished")
#  user_id      :integer(4)