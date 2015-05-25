# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Comment.delete_all
Post.delete_all
Follow.delete_all
Forum.delete_all
User.delete_all
Like.delete_all
Watch.delete_all

User.create(user_name: 'E', password: 'x', level: 0, birthday: '1992-03-15', real_name: 'Mu Du', address: '5323 S.Ellis', email: 'MuDu@cs.uchicago.edu', gender: 'Male', avatar: "http://thewowstyle.com/wp-content/uploads/2015/04/Cartoon.jpg")
User.create(user_name: 'Shadow Fiend', password: 'y', level: 0, birthday: '1991-06-16', real_name: 'Jiaming Dong', address: '6027 S.Ingleside Ave', email: 'jiamingd@uchicago.edu', gender: 'Male', avatar: "http://media1.santabanta.com/full1/Miscellaneous/Cartoon%20Characters/cartoon-characters-26v.jpg")
User.create(user_name: 'God Liang', password: 'z', level: 1, birthday: '1990-11-16', real_name: 'Junchi Liang', address: '5304 Dorchester', email: 'jcliang@uchicago.edu', gender: 'Female', avatar: "http://www.abouttopten.com/wp-content/uploads/2012/12/Aug-cartoon.jpg")

Forum.create(forum_name: 'Academy', description: 'A forum allowing you to post acadamy-related questions and discussions', admin_id: User.find_by(user_name: 'E').id)
Forum.create(forum_name: 'Job Board', description: 'New Jobs will be posted here.', admin_id: User.find_by(user_name: 'Shadow Fiend').id)
Forum.create(forum_name: 'Job Boar12d', description: 'New Jobs will be posted here.', admin_id: User.find_by(user_name: 'Shadow Fiend').id)
Forum.create(forum_name: 'Job Boar123d', description: 'New Jobs will be posted here.', admin_id: User.find_by(user_name: 'Shadow Fiend').id)
Forum.create(forum_name: 'Job Board2', description: 'New Jobs will be posted here.', admin_id: User.find_by(user_name: 'Shadow Fiend').id)
Forum.create(forum_name: 'Job Board3', description: 'New Jobs will be posted here.', admin_id: User.find_by(user_name: 'Shadow Fiend').id)
Forum.create(forum_name: 'Job Board4', description: 'New Jobs will be posted here.', admin_id: User.find_by(user_name: 'Shadow Fiend').id)
Forum.create(forum_name: 'Job Board5', description: 'New Jobs will be posted here.', admin_id: User.find_by(user_name: 'Shadow Fiend').id)
Forum.create(forum_name: 'Job Board6', description: 'New Jobs will be posted here.', admin_id: User.find_by(user_name: 'Shadow Fiend').id)
Forum.create(forum_name: 'Job Board7', description: 'New Jobs will be posted here.', admin_id: User.find_by(user_name: 'Shadow Fiend').id)
Forum.create(forum_name: 'Job Board88', description: 'New Jobs will be posted here.', admin_id: User.find_by(user_name: 'Shadow Fiend').id)
Forum.create(forum_name: 'Job Board8', description: 'New Jobs will be posted here.', admin_id: User.find_by(user_name: 'Shadow Fiend').id)
Forum.create(forum_name: 'Job Board9', description: 'New Jobs will be posted here.', admin_id: User.find_by(user_name: 'Shadow Fiend').id)
Forum.create(forum_name: 'Job Board00', description: 'New Jobs will be posted here.', admin_id: User.find_by(user_name: 'Shadow Fiend').id)


Post.create(forum_id: Forum.all.pluck("id")[0].to_i, title: 'Monday Office Hours', content: 'I hope everyone is having a great start to the week.', date: '2015-03-04 10:20:00', top: false, important: true, poster_id: User.all.pluck("id")[2].to_i)
Post.create(forum_id: Forum.all.pluck("id")[0].to_i, title: 'Looking for teammates', content: 'Hi, I am still looking for a teammate on final project.
	If you need a teammmate, please contact me. Thanks', date: '2015-03-04 10:30:22', top: false, important: false, poster_id: User.all.pluck("id")[0].to_i)
Post.create(forum_id: Forum.all.pluck("id")[1].to_i, title: 'A new job for software engineering', content: 'Here is a new job posted. xxxxxxxx', date: '2015-04-03 04:30:22', top: true, important: false, poster_id: User.all.pluck("id")[1].to_i)

Comment.create(post_id: Post.all.pluck("id")[0].to_i, date: '2015-05-04 09:10:11', content: 'Great! That\'s wonderful!!!', commenter_id: User.all.pluck("id")[1].to_i)
Comment.create(post_id: Post.all.pluck("id")[1].to_i, date: '2015-05-04 08:10:11', content: 'I\'d like to be your teammate', commenter_id: User.all.pluck("id")[1].to_i)
Comment.create(post_id: Post.all.pluck("id")[1].to_i, date: '2015-05-04 08:20:11', content: 'It\'s too late but thanks all the ways', commenter_id: User.all.pluck("id")[0].to_i)

Follow.create(follower_id: User.find_by(user_name: 'E').id, leader_id: User.find_by(user_name: 'Shadow Fiend').id)
Follow.create(follower_id: User.find_by(user_name: 'Shadow Fiend').id, leader_id: User.find_by(user_name: 'God Liang').id)

Like.create(user_id: User.find_by(user_name: 'E').id, post_id: Post.all.pluck("id")[0].to_i)
Like.create(user_id: User.find_by(user_name: 'Shadow Fiend').id, post_id: Post.all.pluck("id")[1].to_i)
Like.create(user_id: User.find_by(user_name: 'Shadow Fiend').id, post_id: Post.all.pluck("id")[2].to_i)
Like.create(user_id: User.find_by(user_name: 'God Liang').id, post_id: Post.all.pluck("id")[0].to_i)


Watch.create(user_id: User.find_by(user_name: 'God Liang').id, forum_id: Forum.find_by(forum_name: 'Academy').id)
Watch.create(user_id: User.find_by(user_name: 'Shadow Fiend').id, forum_id: Forum.find_by(forum_name: 'Job Board').id)
Watch.create(user_id: User.find_by(user_name: 'God Liang').id, forum_id: Forum.find_by(forum_name: 'Job Board').id)
Watch.create(user_id: User.find_by(user_name: 'E').id, forum_id: Forum.find_by(forum_name: 'Job Board').id)