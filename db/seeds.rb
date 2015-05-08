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

Forum.create(forum_name: 'Academy', description: 'A forum allowing you to post acadamy-related questions and discussions', admin_user:'God Liang')
Forum.create(forum_name: 'Job Board', description: 'New Jobs will be posted here.', admin_user:'Karin')

User.create(user_name: 'Shadow Fiend', password: 'abc123!', level: 0, birthday: '1991-06-16', real_name: 'Jiaming Dong', address: '6027 S.Ingleside Ave', email: 'jiamingd@uchicago.edu', gender: 'Male')
User.create(user_name: 'Karin', password: 'def456#', level: 0, birthday: '1980-06-16', real_name: 'Karin', address: '5555 Young Memorial Building', email: 'karin@cs.uchicago.edu', gender: 'Female')
User.create(user_name: 'God Liang', password: 'ghi789@', level: 1, birthday: '1990-11-16', real_name: 'Junchi Liang', address: '5304 Dorchester', email: 'jcliang@uchicago.edu', gender: 'Unknown')

Post.create(forum_name: 'Academy', title: 'Monday Office Hours', content: 'I hope everyone is having a great start to the week.', date: '2015-03-04 10:20:00', top: false, important: true, poster: 'God Liang')
Post.create(forum_name: 'Academy', title: 'Looking for teammates', content: 'Hi, I am still looking for a teammate on final project.
	If you need a teammmate, please contact me. Thanks', date: '2015-03-04 10:30:22', top: false, important: false, poster: 'Shadow Fiend')
Post.create(forum_name: 'Job Board', title: 'A new job for software engineering', content: 'Here is a new job posted. xxxxxxxx', date: '2015-04-03 04:30:22', top: true, important: false, poster: 'Karin')

Comment.create(post_id: 1, date: '2015-05-04 09:10:11', content: 'Great! That\'s wonderful!!!', commenter: 'Karin')
Comment.create(post_id: 2, date: '2015-05-04 08:10:11', content: 'I\'d like to be your teammate', commenter: 'Karin')
Comment.create(post_id: 2, date: '2015-05-04 08:20:11', content: 'Reply to Karin: It\'s too late but thanks all the ways', commenter: 'Shadow Fiend')

Follow.create(follower_name: 'Shadow Fiend', leader_name: 'Karin')
Follow.create(follower_name: 'Karin', leader_name: 'Shadow Fiend')