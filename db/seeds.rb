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

User.create(user_name: 'E', password: 'x', level: 0, birthday: '1992-03-15', real_name: 'Mu Du', address: '5323 S.Ellis', email: 'MuDu@cs.uchicago.edu', gender: 'Male')
User.create(user_name: 'Shadow Fiend', password: 'y', level: 0, birthday: '1991-06-16', real_name: 'Jiaming Dong', address: '6027 S.Ingleside Ave', email: 'jiamingd@uchicago.edu', gender: 'Male')
User.create(user_name: 'God Liang', password: 'z', level: 1, birthday: '1990-11-16', real_name: 'Junchi Liang', address: '5304 Dorchester', email: 'jcliang@uchicago.edu', gender: 'Female')

Forum.create(forum_name: 'Academy', description: 'A forum allowing you to post acadamy-related questions and discussions', admin_id: 3)
Forum.create(forum_name: 'Job Board', description: 'New Jobs will be posted here.', admin_id: 2)
Forum.create(forum_name: 'Job Boar12d', description: 'New Jobs will be posted here.', admin_id: 2)
Forum.create(forum_name: 'Job Boar123d', description: 'New Jobs will be posted here.', admin_id: 2)
Forum.create(forum_name: 'Job Board2', description: 'New Jobs will be posted here.', admin_id: 2)
Forum.create(forum_name: 'Job Board3', description: 'New Jobs will be posted here.', admin_id: 2)
Forum.create(forum_name: 'Job Board4', description: 'New Jobs will be posted here.', admin_id: 2)
Forum.create(forum_name: 'Job Board5', description: 'New Jobs will be posted here.', admin_id: 2)
Forum.create(forum_name: 'Job Board6', description: 'New Jobs will be posted here.', admin_id: 2)
Forum.create(forum_name: 'Job Board7', description: 'New Jobs will be posted here.', admin_id: 2)
Forum.create(forum_name: 'Job Board88', description: 'New Jobs will be posted here.', admin_id: 2)
Forum.create(forum_name: 'Job Board8', description: 'New Jobs will be posted here.', admin_id: 2)
Forum.create(forum_name: 'Job Board9', description: 'New Jobs will be posted here.', admin_id: 2)
Forum.create(forum_name: 'Job Board00', description: 'New Jobs will be posted here.', admin_id: 2)


Post.create(forum_id: 1, title: 'Monday Office Hours', content: 'I hope everyone is having a great start to the week.', date: '2015-03-04 10:20:00', top: false, important: true, poster_id: 3)
Post.create(forum_id: 1, title: 'Looking for teammates', content: 'Hi, I am still looking for a teammate on final project.
	If you need a teammmate, please contact me. Thanks', date: '2015-03-04 10:30:22', top: false, important: false, poster_id: 1)
Post.create(forum_id: 2, title: 'A new job for software engineering', content: 'Here is a new job posted. xxxxxxxx', date: '2015-04-03 04:30:22', top: true, important: false, poster_id: 2)

Comment.create(post_id: 1, date: '2015-05-04 09:10:11', content: 'Great! That\'s wonderful!!!', commenter_id: 2)
Comment.create(post_id: 2, date: '2015-05-04 08:10:11', content: 'I\'d like to be your teammate', commenter_id: 2)
Comment.create(post_id: 2, date: '2015-05-04 08:20:11', content: 'It\'s too late but thanks all the ways', commenter_id: 1)

Follow.create(follower_id: 1, leader_id: 2)
Follow.create(follower_id: 2, leader_id: 3)

Like.create(user_id: 1, post_id: 1)
Like.create(user_id: 1, post_id: 2)
Like.create(user_id: 2, post_id: 3)
Like.create(user_id: 3, post_id: 1)


Watch.create(user_id: 3, forum_id: 1)
Watch.create(user_id: 3, forum_id: 2)
Watch.create(user_id: 2, forum_id: 2)
Watch.create(user_id: 1, forum_id: 2)