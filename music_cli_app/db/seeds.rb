Artist.destroy_all
Album.destroy_all
Question.destroy_all
# ARTISTS #
metallica = Artist.create(name: "Metallica")
iron_maiden = Artist.create(name: "Iron Maiden")
deep_purple = Artist.create(name: "Deep Purple")
dream_theater = Artist.create(name: "Dream Theater")
nirvana = Artist.create(name: "Nirvana")
soundgarden = Artist.create(name: "Soundgarden")
pantera = Artist.create(name: "Pantera")
led_zeppelin = Artist.create(name: "Led Zeppelin")
pink_floyd = Artist.create(name: "Pink Floyd")
korn = Artist.create(name: "Korn")
deftones = Artist.create(name: "Deftones")

# ALBUMS #
back_to_black = Album.create(title: "Back to Black", artist: metallica)
black_album = Album.create(title: "Black Album", artist: metallica)
master_of_puppets = Album.create(title: "Master of Puppets", artist: metallica)
kill_em_all = Album.create(title: "Kill 'Em All", artist: metallica)
fear_of_the_dark = Album.create(title: "Fear of the Dark", artist: iron_maiden)
the_number_of_the_beast = Album.create(title: "The Number of the Beast", artist: iron_maiden)
brave_new_world = Album.create(title: "Brave New World'", artist: iron_maiden)
burn = Album.create(title: "Burn", artist: deep_purple)
perfect_stanger = Album.create(title: "Perfect Stanger", artist: deep_purple)
made_in_japan = Album.create(title: "Made in Japan", artist: deep_purple)
images_and_words = Album.create(title:"Images and Words", artist: dream_theater)
awake = Album.create(title: "Awake", artist: dream_theater)
six_degrees = Album.create(title:"Six Degrees of Inner Turbolence", artist: dream_theater)
in_rock = Album.create(title: "In Rock", artist: dream_theater)
in_utero = Album.create(title: "In Utero", artist: nirvana)
bleach = Album.create(title: "Bleach", artist: nirvana)
nevermind = Album.create(title: "Nevermind", artist: nirvana)
superunknown = Album.create(title: "Superunknown", artist: soundgarden)
kind_animal = Album.create(title: "King Animal", artist: soundgarden)
down_on_the_upside = Album.create(title: "Down on the Upside", artist: soundgarden)
far_beyond_driven = Album.create(title: "Far Beyond the Upside", artist: pantera)
power_metal = Album.create(title: "Power Metal", artist: pantera)
cowboys_from_hell = Album.create(title: "Cowboys from Hell", artist: pantera)
wish_you_were_here = Album.create(title: "Wish You Were Here", artist: pink_floyd)
animals = Album.create(title: "Animals", artist: pink_floyd)
pulse = Album.create(title: "Pulse", artist: pink_floyd)
the_wall = Album.create(title: "The Wall", artist: pink_floyd)
follow_the_leader = Album.create(title: "Follow the Leader", artist: korn)
issues = Album.create(title: "Issues", artist: korn)
untouchables = Album.create(title: "Untouchables", artist: korn)
white_pony = Album.create(title: "White Pony", artist: deftones)
around_the_fur = Album.create(title: "Around the Fur", artist: deftones)
diamond_eyes = Album.create(title: "Diamond Eyes", artist: deftones)


# ALBUM_ID
album_ids = Album.all.map {|album| album.id}
album_ids.map { |id| Question.create(album_id: id) }
