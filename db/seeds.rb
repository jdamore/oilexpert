# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


User.create({ :id => 1, :name => 'jean.damore', :email => 'jean.damore@hotmail.com', :salt => '1000', :hashed_password => '77a0d943cdbace52716a9ef9fae12e45e2788d39' })
User.create({ :id => 2, :name => 'test.test', :email => 'test.test@test.com', :salt => '1000', :hashed_password => '77a0d943cdbace52716a9ef9fae12e45e2788d39' })

Group.create([ {:id => 1, :name => 'Reservoir Engineering'}, {:id => 2, :name => 'Geology'}, {:id => 3, :name => 'Drilling'} ])

UserGroup.create([ {:user_id => 1, :group_id => 1}, {:user_id => 1, :group_id => 2} ])
UserGroup.create([ {:user_id => 2, :group_id => 2}, {:user_id => 2, :group_id => 3} ])

Discussion.create({:id => 1, :user_id => 1, :group_id => 1, :created => '11/12/2007 12:00', :title => 'What a Lovely Day', :details => 'Really to hot for me!'})
Discussion.create({:id => 2, :user_id => 1, :group_id => 1, :created => '07/01/2009 14:12', :title => 'Another Story', :details => 'Once upon a time...'})
Discussion.create({:id => 3, :user_id => 2, :group_id => 1, :created => '30/03/2010 13:10', :title => 'Stuck in the Muck', :details => "I hope I'll manage to get out."})
Discussion.create({:id => 4, :user_id => 2, :group_id => 2, :created => '17/07/2011 09:24', :title => 'Rider In the Storm', :details => "Have you seen the trailers?"})
Discussion.create({:id => 5, :user_id => 2, :group_id => 2, :created => '12/09/2010 08:54', :title => 'Another Whiskey Bar', :details => "Not drunk yet but will soon come"})
Discussion.create({:id => 6, :user_id => 2, :group_id => 3, :created => '02/06/2011 11:32', :title => 'The Last One', :details => "Woosh, finished just in time."})