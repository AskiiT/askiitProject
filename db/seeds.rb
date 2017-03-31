
######################################################################
#####################Creacion de Temas################################
######################################################################

t=Topic.new
t.id=1
t.topic_name="Quimica"
t.topic_description="Pregunta sobre quimica"
t.save

t=Topic.new
t.id=2
t.topic_name="Computación e Informatica"
t.topic_description="Pregunta sobre Computación e Informatica"
t.save

t=Topic.new
t.id=3
t.topic_name="Matemática"
t.topic_description="Pregunta sobre Matemática"
t.save


t=Topic.new
t.id=4
t.topic_name="Física"
t.topic_description="Pregunta sobre Física"
t.save

t=Topic.new
t.id=5
t.topic_name="Electricidad y Electronica"
t.topic_description="Pregunta sobre Electricidad y Electronica"
t.save

t=Topic.new
t.id=6
t.topic_name="Ciencias Sociales"
t.topic_description="Pregunta sobre Ciencias Sociales"
t.save

t=Topic.new
t.id=7
t.topic_name="Artes Musicales"
t.topic_description="Pregunta sobre Artes Musicales"
t.save

t=Topic.new
t.id=8
t.topic_name="Artes Plásticas"
t.topic_description="Pregunta sobre Artes Plásticas"
t.save

t=Topic.new
t.id=9
t.topic_name="Lenguaje y Literatura"
t.topic_description="Pregunta sobre Lenguaje y Literatura"
t.save

t=Topic.new
t.id=10
t.topic_name="Biología"
t.topic_description="Pregunta sobre Biología"
t.save





######################################################################
##############Creacion de Usuarios(y Ranks)###########################
######################################################################



m=User.new
m.id=1
m.first_name="Juan Sebastián"
m.last_name="Martinez Beltrán"
m.username="juasmartinezbel"
m.email="juasmartinezbel@unal.edu.co"
m.date_created=Date.today
m.password="12345678987654321"
m.save


	r=Rank.new
	r.id=1
	r.user_id= 1
	r.clarity= 2123
	r.quickness= 3525
	r.efectiveness= 917
	r.save


	dr=DomainRank.new
	dr.id= 19001
	dr.user_id= 1
	dr.topic_id= 1
	dr.level= 3402
	dr.save

	dr=DomainRank.new
	dr.id= 19002
	dr.user_id= 1
	dr.topic_id= 2
	dr.level= 497
	dr.save

	dr=DomainRank.new
	dr.id= 19003
	dr.user_id= 1
	dr.topic_id= 3
	dr.level= 1715
	dr.save

	dr=DomainRank.new
	dr.id= 19004
	dr.user_id= 1
	dr.topic_id= 4
	dr.level= 2436
	dr.save

	dr=DomainRank.new
	dr.id= 19005
	dr.user_id= 1
	dr.topic_id= 5
	dr.level= 1324
	dr.save

	dr=DomainRank.new
	dr.id= 19006
	dr.user_id= 1
	dr.topic_id= 6
	dr.level= 4112
	dr.save

	dr=DomainRank.new
	dr.id= 19007
	dr.user_id= 1
	dr.topic_id= 7
	dr.level= 1270
	dr.save

	dr=DomainRank.new
	dr.id= 19008
	dr.user_id= 1
	dr.topic_id= 8
	dr.level= 1166
	dr.save

	dr=DomainRank.new
	dr.id= 19009
	dr.user_id= 1
	dr.topic_id= 9
	dr.level= 3756
	dr.save

	dr=DomainRank.new
	dr.id= 190010
	dr.user_id= 1
	dr.topic_id= 10
	dr.level= 2843
	dr.save


n=User.new
n.id=2
n.first_name="Juan Sebastián"
n.last_name="Vivero Jauregui"
n.username="jsviveroj"
n.email="jsviveroj@unal.edu.co"
n.date_created=Date.today
n.password="12345678987654321"
n.save


	r=Rank.new
	r.id=2
	r.user_id= 2
	r.clarity= 2194
	r.quickness= 89
	r.efectiveness= 4020
	r.save


	dr=DomainRank.new
	dr.id= 29001
	dr.user_id= 2
	dr.topic_id= 1
	dr.level= 4449
	dr.save

	dr=DomainRank.new
	dr.id= 29002
	dr.user_id= 2
	dr.topic_id= 2
	dr.level= 1643
	dr.save

	dr=DomainRank.new
	dr.id= 29003
	dr.user_id= 2
	dr.topic_id= 3
	dr.level= 108
	dr.save

	dr=DomainRank.new
	dr.id= 29004
	dr.user_id= 2
	dr.topic_id= 4
	dr.level= 900
	dr.save

	dr=DomainRank.new
	dr.id= 29005
	dr.user_id= 2
	dr.topic_id= 5
	dr.level= 1004
	dr.save

	dr=DomainRank.new
	dr.id= 29006
	dr.user_id= 2
	dr.topic_id= 6
	dr.level= 698
	dr.save

	dr=DomainRank.new
	dr.id= 29007
	dr.user_id= 2
	dr.topic_id= 7
	dr.level= 125
	dr.save

	dr=DomainRank.new
	dr.id= 29008
	dr.user_id= 2
	dr.topic_id= 8
	dr.level= 453
	dr.save

	dr=DomainRank.new
	dr.id= 29009
	dr.user_id= 2
	dr.topic_id= 9
	dr.level= 3859
	dr.save

	dr=DomainRank.new
	dr.id= 290010
	dr.user_id= 2
	dr.topic_id= 10
	dr.level= 4857
	dr.save



b=User.new
b.id=3
b.first_name="Luis Ernesto"
b.last_name="Gil Castellanos"
b.username="luegilca"
b.email="luegilca@unal.edu.co"
b.date_created=Date.today
b.password="12345678987654321"
b.save


	r=Rank.new
	r.id=3
	r.user_id= 3
	r.clarity= 2505
	r.quickness= 1940
	r.efectiveness= 5020
	r.save


	dr=DomainRank.new
	dr.id= 39001
	dr.user_id= 3
	dr.topic_id= 1
	dr.level= 3142
	dr.save

	dr=DomainRank.new
	dr.id= 39002
	dr.user_id= 3
	dr.topic_id= 2
	dr.level= 1534
	dr.save

	dr=DomainRank.new
	dr.id= 39003
	dr.user_id= 3
	dr.topic_id= 3
	dr.level= 1115
	dr.save

	dr=DomainRank.new
	dr.id= 39004
	dr.user_id= 3
	dr.topic_id= 4
	dr.level= 1766
	dr.save

	dr=DomainRank.new
	dr.id= 39005
	dr.user_id= 3
	dr.topic_id= 5
	dr.level= 4862
	dr.save

	dr=DomainRank.new
	dr.id= 39006
	dr.user_id= 3
	dr.topic_id= 6
	dr.level= 2505
	dr.save

	dr=DomainRank.new
	dr.id= 39007
	dr.user_id= 3
	dr.topic_id= 7
	dr.level= 3552
	dr.save

	dr=DomainRank.new
	dr.id= 39008
	dr.user_id= 3
	dr.topic_id= 8
	dr.level= 2884
	dr.save

	dr=DomainRank.new
	dr.id= 39009
	dr.user_id= 3
	dr.topic_id= 9
	dr.level= 3866
	dr.save

	dr=DomainRank.new
	dr.id= 390010
	dr.user_id= 3
	dr.topic_id= 10
	dr.level= 3349
	dr.save


b=User.new
b.id=4
b.first_name="David Julian"
b.last_name="Guzman Cardenas"
b.username="djguzmanc"
b.email="djguzmanc@unal.edu.co"
b.date_created=Date.today
b.password="12345678987654321"
b.save

	r=Rank.new
	r.id=4
	r.user_id= 4
	r.clarity= 608
	r.quickness= 2928
	r.efectiveness= 1558
	r.save


	dr=DomainRank.new
	dr.id= 49001
	dr.user_id= 4
	dr.topic_id= 1
	dr.level= 2503
	dr.save

	dr=DomainRank.new
	dr.id= 49002
	dr.user_id= 4
	dr.topic_id= 2
	dr.level= 978
	dr.save

	dr=DomainRank.new
	dr.id= 49003
	dr.user_id= 4
	dr.topic_id= 3
	dr.level= 2958
	dr.save

	dr=DomainRank.new
	dr.id= 49004
	dr.user_id= 4
	dr.topic_id= 4
	dr.level= 2467
	dr.save

	dr=DomainRank.new
	dr.id= 49005
	dr.user_id= 4
	dr.topic_id= 5
	dr.level= 2053
	dr.save

	dr=DomainRank.new
	dr.id= 49006
	dr.user_id= 4
	dr.topic_id= 6
	dr.level= 3650
	dr.save

	dr=DomainRank.new
	dr.id= 49007
	dr.user_id= 4
	dr.topic_id= 7
	dr.level= 4130
	dr.save

	dr=DomainRank.new
	dr.id= 49008
	dr.user_id= 4
	dr.topic_id= 8
	dr.level= 2698
	dr.save

	dr=DomainRank.new
	dr.id= 49009
	dr.user_id= 4
	dr.topic_id= 9
	dr.level= 284
	dr.save

	dr=DomainRank.new
	dr.id= 490010
	dr.user_id= 4
	dr.topic_id= 10
	dr.level= 299
	dr.save


b=User.new
b.id=5
b.first_name="Cristian Alexanther"
b.last_name="Rojas Cardenas"
b.username="crarojasca"
b.email="crarojasca@unal.edu.co"
b.date_created=Date.today
b.password="12345678987654321"
b.save

	r=Rank.new
	r.id=5
	r.user_id= 5
	r.clarity= 345
	r.quickness= 195
	r.efectiveness= 747
	r.save


	dr=DomainRank.new
	dr.id= 59001
	dr.user_id= 5
	dr.topic_id= 1
	dr.level= 3220
	dr.save

	dr=DomainRank.new
	dr.id= 59002
	dr.user_id= 5
	dr.topic_id= 2
	dr.level= 2751
	dr.save

	dr=DomainRank.new
	dr.id= 59003
	dr.user_id= 5
	dr.topic_id= 3
	dr.level= 1254
	dr.save

	dr=DomainRank.new
	dr.id= 59004
	dr.user_id= 5
	dr.topic_id= 4
	dr.level= 824
	dr.save

	dr=DomainRank.new
	dr.id= 59005
	dr.user_id= 5
	dr.topic_id= 5
	dr.level= 2833
	dr.save

	dr=DomainRank.new
	dr.id= 59006
	dr.user_id= 5
	dr.topic_id= 6
	dr.level= 1349
	dr.save

	dr=DomainRank.new
	dr.id= 59007
	dr.user_id= 5
	dr.topic_id= 7
	dr.level= 748
	dr.save

	dr=DomainRank.new
	dr.id= 59008
	dr.user_id= 5
	dr.topic_id= 8
	dr.level= 3069
	dr.save

	dr=DomainRank.new
	dr.id= 59009
	dr.user_id= 5
	dr.topic_id= 9
	dr.level= 2138
	dr.save

	dr=DomainRank.new
	dr.id= 590010
	dr.user_id= 5
	dr.topic_id= 10
	dr.level= 1097
	dr.save



b=User.new
b.id=6
b.first_name="Alejandra"
b.last_name="Drispe Brando"
b.username="aldrispbr"
b.email="aldrispbr@mail.com"
b.date_created=Date.today
b.password="12345678987654321"
b.save

	r=Rank.new
	r.id=6
	r.user_id= 6
	r.clarity= 1611
	r.quickness= 1128
	r.efectiveness= 4742
	r.save


	dr=DomainRank.new
	dr.id= 69001
	dr.user_id= 6
	dr.topic_id= 1
	dr.level= 2362
	dr.save

	dr=DomainRank.new
	dr.id= 69002
	dr.user_id= 6
	dr.topic_id= 2
	dr.level= 3423
	dr.save

	dr=DomainRank.new
	dr.id= 69003
	dr.user_id= 6
	dr.topic_id= 3
	dr.level= 3929
	dr.save

	dr=DomainRank.new
	dr.id= 69004
	dr.user_id= 6
	dr.topic_id= 4
	dr.level= 4654
	dr.save

	dr=DomainRank.new
	dr.id= 69005
	dr.user_id= 6
	dr.topic_id= 5
	dr.level= 2497
	dr.save

	dr=DomainRank.new
	dr.id= 69006
	dr.user_id= 6
	dr.topic_id= 6
	dr.level= 1184
	dr.save

	dr=DomainRank.new
	dr.id= 69007
	dr.user_id= 6
	dr.topic_id= 7
	dr.level= 3094
	dr.save

	dr=DomainRank.new
	dr.id= 69008
	dr.user_id= 6
	dr.topic_id= 8
	dr.level= 3138
	dr.save

	dr=DomainRank.new
	dr.id= 69009
	dr.user_id= 6
	dr.topic_id= 9
	dr.level= 4237
	dr.save

	dr=DomainRank.new
	dr.id= 690010
	dr.user_id= 6
	dr.topic_id= 10
	dr.level= 994
	dr.save

b=User.new
b.id=7
b.first_name="Miguel"
b.last_name="Charry Kanes"
b.username="mighchaes"
b.email="mighchaes@mail.com"
b.date_created=Date.today
b.password="12345678987654321"
b.save

	r=Rank.new
	r.id=7
	r.user_id= 7
	r.clarity= 3151
	r.quickness= 600
	r.efectiveness= 5010
	r.save


	dr=DomainRank.new
	dr.id= 79001
	dr.user_id= 7
	dr.topic_id= 1
	dr.level= 759
	dr.save

	dr=DomainRank.new
	dr.id= 79002
	dr.user_id= 7
	dr.topic_id= 2
	dr.level= 4354
	dr.save

	dr=DomainRank.new
	dr.id= 79003
	dr.user_id= 7
	dr.topic_id= 3
	dr.level= 4222
	dr.save

	dr=DomainRank.new
	dr.id= 79004
	dr.user_id= 7
	dr.topic_id= 4
	dr.level= 2653
	dr.save

	dr=DomainRank.new
	dr.id= 79005
	dr.user_id= 7
	dr.topic_id= 5
	dr.level= 498
	dr.save

	dr=DomainRank.new
	dr.id= 79006
	dr.user_id= 7
	dr.topic_id= 6
	dr.level= 807
	dr.save

	dr=DomainRank.new
	dr.id= 79007
	dr.user_id= 7
	dr.topic_id= 7
	dr.level= 596
	dr.save

	dr=DomainRank.new
	dr.id= 79008
	dr.user_id= 7
	dr.topic_id= 8
	dr.level= 4170
	dr.save

	dr=DomainRank.new
	dr.id= 79009
	dr.user_id= 7
	dr.topic_id= 9
	dr.level= 1695
	dr.save

	dr=DomainRank.new
	dr.id= 790010
	dr.user_id= 7
	dr.topic_id= 10
	dr.level= 168
	dr.save

b=User.new
b.id=8
b.first_name="Rafael"
b.last_name="Numero Cinco"
b.username="rafael5"
b.email="rafael5@mail.com"
b.date_created=Date.today
b.password="12345678987654321"
b.save

	r=Rank.new
	r.id=8
	r.user_id= 8
	r.clarity= 2917
	r.quickness= 3868
	r.efectiveness= 3321
	r.save


	dr=DomainRank.new
	dr.id= 89001
	dr.user_id= 8
	dr.topic_id= 1
	dr.level= 478
	dr.save

	dr=DomainRank.new
	dr.id= 89002
	dr.user_id= 8
	dr.topic_id= 2
	dr.level= 2694
	dr.save

	dr=DomainRank.new
	dr.id= 89003
	dr.user_id= 8
	dr.topic_id= 3
	dr.level= 4200
	dr.save

	dr=DomainRank.new
	dr.id= 89004
	dr.user_id= 8
	dr.topic_id= 4
	dr.level= 726
	dr.save

	dr=DomainRank.new
	dr.id= 89005
	dr.user_id= 8
	dr.topic_id= 5
	dr.level= 1166
	dr.save

	dr=DomainRank.new
	dr.id= 89006
	dr.user_id= 8
	dr.topic_id= 6
	dr.level= 4732
	dr.save

	dr=DomainRank.new
	dr.id= 89007
	dr.user_id= 8
	dr.topic_id= 7
	dr.level= 781
	dr.save

	dr=DomainRank.new
	dr.id= 89008
	dr.user_id= 8
	dr.topic_id= 8
	dr.level= 1570
	dr.save

	dr=DomainRank.new
	dr.id= 89009
	dr.user_id= 8
	dr.topic_id= 9
	dr.level= 678
	dr.save

	dr=DomainRank.new
	dr.id= 890010
	dr.user_id= 8
	dr.topic_id= 10
	dr.level= 3166
	dr.save

b=User.new
b.id=9
b.first_name="Sarah"
b.last_name="Mora Jian"
b.username="sarmoj"
b.email="sarmoj@mail.com"
b.date_created=Date.today
b.password="12345678987654321"
b.save

	r=Rank.new
	r.id=9
	r.user_id= 9
	r.clarity= 2045
	r.quickness= 4778
	r.efectiveness= 4588
	r.save


	dr=DomainRank.new
	dr.id= 99001
	dr.user_id= 9
	dr.topic_id= 1
	dr.level= 1750
	dr.save

	dr=DomainRank.new
	dr.id= 99002
	dr.user_id= 9
	dr.topic_id= 2
	dr.level= 1172
	dr.save

	dr=DomainRank.new
	dr.id= 99003
	dr.user_id= 9
	dr.topic_id= 3
	dr.level= 2994
	dr.save

	dr=DomainRank.new
	dr.id= 99004
	dr.user_id= 9
	dr.topic_id= 4
	dr.level= 1777
	dr.save

	dr=DomainRank.new
	dr.id= 99005
	dr.user_id= 9
	dr.topic_id= 5
	dr.level= 1554
	dr.save

	dr=DomainRank.new
	dr.id= 99006
	dr.user_id= 9
	dr.topic_id= 6
	dr.level= 562
	dr.save

	dr=DomainRank.new
	dr.id= 99007
	dr.user_id= 9
	dr.topic_id= 7
	dr.level= 1755
	dr.save

	dr=DomainRank.new
	dr.id= 99008
	dr.user_id= 9
	dr.topic_id= 8
	dr.level= 2108
	dr.save

	dr=DomainRank.new
	dr.id= 99009
	dr.user_id= 9
	dr.topic_id= 9
	dr.level= 1352
	dr.save

	dr=DomainRank.new
	dr.id= 990010
	dr.user_id= 9
	dr.topic_id= 10
	dr.level= 2532
	dr.save

b=User.new
b.id=10
b.first_name="Agatha"
b.last_name="Charry Kanes"
b.username="agcharrkan85"
b.email="agcharrkan85@mail.com"
b.date_created=Date.today
b.password="12345678987654321"
b.save

	r=Rank.new
	r.id=10
	r.user_id= 10
	r.clarity= 4476
	r.quickness= 4846
	r.efectiveness= 3198
	r.save


	dr=DomainRank.new
	dr.id= 109001
	dr.user_id= 10
	dr.topic_id= 1
	dr.level= 924
	dr.save

	dr=DomainRank.new
	dr.id= 109002
	dr.user_id= 10
	dr.topic_id= 2
	dr.level= 2704
	dr.save

	dr=DomainRank.new
	dr.id= 109003
	dr.user_id= 10
	dr.topic_id= 3
	dr.level= 1305
	dr.save

	dr=DomainRank.new
	dr.id= 109004
	dr.user_id= 10
	dr.topic_id= 4
	dr.level= 1533
	dr.save

	dr=DomainRank.new
	dr.id= 109005
	dr.user_id= 10
	dr.topic_id= 5
	dr.level= 2255
	dr.save

	dr=DomainRank.new
	dr.id= 109006
	dr.user_id= 10
	dr.topic_id= 6
	dr.level= 4473
	dr.save

	dr=DomainRank.new
	dr.id= 109007
	dr.user_id= 10
	dr.topic_id= 7
	dr.level= 1126
	dr.save

	dr=DomainRank.new
	dr.id= 109008
	dr.user_id= 10
	dr.topic_id= 8
	dr.level= 382
	dr.save

	dr=DomainRank.new
	dr.id= 109009
	dr.user_id= 10
	dr.topic_id= 9
	dr.level= 2450
	dr.save

	dr=DomainRank.new
	dr.id= 1090010
	dr.user_id= 10
	dr.topic_id= 10
	dr.level= 443
	dr.save

b=User.new
b.id=11
b.first_name="Gabriel"
b.last_name="No ASCII for it"
b.username="gabrielthefirst"
b.email="gabrielthefirst@mail.com"
b.date_created=Date.today
b.password="12345678987654321"
b.save

	r=Rank.new
	r.id=11
	r.user_id= 11
	r.clarity= 3836
	r.quickness= 1926
	r.efectiveness= 4846
	r.save


	dr=DomainRank.new
	dr.id= 119001
	dr.user_id= 11
	dr.topic_id= 1
	dr.level= 557
	dr.save

	dr=DomainRank.new
	dr.id= 119002
	dr.user_id= 11
	dr.topic_id= 2
	dr.level= 1339
	dr.save

	dr=DomainRank.new
	dr.id= 119003
	dr.user_id= 11
	dr.topic_id= 3
	dr.level= 2408
	dr.save

	dr=DomainRank.new
	dr.id= 119004
	dr.user_id= 11
	dr.topic_id= 4
	dr.level= 1015
	dr.save

	dr=DomainRank.new
	dr.id= 119005
	dr.user_id= 11
	dr.topic_id= 5
	dr.level= 3691
	dr.save

	dr=DomainRank.new
	dr.id= 119006
	dr.user_id= 11
	dr.topic_id= 6
	dr.level= 205
	dr.save

	dr=DomainRank.new
	dr.id= 119007
	dr.user_id= 11
	dr.topic_id= 7
	dr.level= 1280
	dr.save

	dr=DomainRank.new
	dr.id= 119008
	dr.user_id= 11
	dr.topic_id= 8
	dr.level= 518
	dr.save

	dr=DomainRank.new
	dr.id= 119009
	dr.user_id= 11
	dr.topic_id= 9
	dr.level= 3670
	dr.save

	dr=DomainRank.new
	dr.id= 1190010
	dr.user_id= 11
	dr.topic_id= 10
	dr.level= 4883
	dr.save

b=User.new
b.id=12
b.first_name="Alex"
b.last_name="García Beltrán"
b.username="alexgr"
b.email="alexgr@mail.com"
b.date_created=Date.today
b.password="12345678987654321"
b.save

	r=Rank.new
	r.id=12
	r.user_id= 12
	r.clarity= 992
	r.quickness= 2205
	r.efectiveness= 1510
	r.save


	dr=DomainRank.new
	dr.id= 129001
	dr.user_id= 12
	dr.topic_id= 1
	dr.level= 1412
	dr.save

	dr=DomainRank.new
	dr.id= 129002
	dr.user_id= 12
	dr.topic_id= 2
	dr.level= 538
	dr.save

	dr=DomainRank.new
	dr.id= 129003
	dr.user_id= 12
	dr.topic_id= 3
	dr.level= 1637
	dr.save

	dr=DomainRank.new
	dr.id= 129004
	dr.user_id= 12
	dr.topic_id= 4
	dr.level= 2475
	dr.save

	dr=DomainRank.new
	dr.id= 129005
	dr.user_id= 12
	dr.topic_id= 5
	dr.level= 4686
	dr.save

	dr=DomainRank.new
	dr.id= 129006
	dr.user_id= 12
	dr.topic_id= 6
	dr.level= 1737
	dr.save

	dr=DomainRank.new
	dr.id= 129007
	dr.user_id= 12
	dr.topic_id= 7
	dr.level= 928
	dr.save

	dr=DomainRank.new
	dr.id= 129008
	dr.user_id= 12
	dr.topic_id= 8
	dr.level= 3988
	dr.save

	dr=DomainRank.new
	dr.id= 129009
	dr.user_id= 12
	dr.topic_id= 9
	dr.level= 1502
	dr.save

	dr=DomainRank.new
	dr.id= 1290010
	dr.user_id= 12
	dr.topic_id= 10
	dr.level= 378
	dr.save


b=User.new
b.id=13
b.first_name="Xhander"
b.last_name="García Beltrán"
b.username="xhagr"
b.email="xhagr@mail.com"
b.date_created=Date.today
b.password="12345678987654321"
b.save

	r=Rank.new
	r.id=13
	r.user_id= 13
	r.clarity= 1114
	r.quickness= 1207
	r.efectiveness= 815
	r.save


	dr=DomainRank.new
	dr.id= 139001
	dr.user_id= 13
	dr.topic_id= 1
	dr.level= 2149
	dr.save

	dr=DomainRank.new
	dr.id= 139002
	dr.user_id= 13
	dr.topic_id= 2
	dr.level= 820
	dr.save

	dr=DomainRank.new
	dr.id= 139003
	dr.user_id= 13
	dr.topic_id= 3
	dr.level= 1737
	dr.save

	dr=DomainRank.new
	dr.id= 139004
	dr.user_id= 13
	dr.topic_id= 4
	dr.level= 280
	dr.save

	dr=DomainRank.new
	dr.id= 139005
	dr.user_id= 13
	dr.topic_id= 5
	dr.level= 4358
	dr.save

	dr=DomainRank.new
	dr.id= 139006
	dr.user_id= 13
	dr.topic_id= 6
	dr.level= 830
	dr.save

	dr=DomainRank.new
	dr.id= 139007
	dr.user_id= 13
	dr.topic_id= 7
	dr.level= 172
	dr.save

	dr=DomainRank.new
	dr.id= 139008
	dr.user_id= 13
	dr.topic_id= 8
	dr.level= 1363
	dr.save

	dr=DomainRank.new
	dr.id= 139009
	dr.user_id= 13
	dr.topic_id= 9
	dr.level= 2372
	dr.save

	dr=DomainRank.new
	dr.id= 1390010
	dr.user_id= 13
	dr.topic_id= 10
	dr.level= 2411
	dr.save











######################################################################
#####################Creacion de Seguidores###########################
######################################################################



#####Seguidores de 1#####

f=Follower.new
f.id=17002
f.followed_id=1
f.follower_id=2
f.save

f=Follower.new
f.id=17003
f.followed_id=1
f.follower_id=3
f.save

f=Follower.new
f.id=17004
f.followed_id=1
f.follower_id=4
f.save

f=Follower.new
f.id=17005
f.followed_id=1
f.follower_id=5
f.save

f=Follower.new
f.id=17006
f.followed_id=1
f.follower_id=6
f.save

#####Seguidores de 2#####

f=Follower.new
f.id=27001
f.followed_id=2
f.follower_id=1
f.save

f=Follower.new
f.id=27003
f.followed_id=2
f.follower_id=3
f.save

f=Follower.new
f.id=27004
f.followed_id=2
f.follower_id=4
f.save

f=Follower.new
f.id=27005
f.followed_id=2
f.follower_id=5
f.save


#####Seguidores de 3#####

f=Follower.new
f.id=37001
f.followed_id=3
f.follower_id=1
f.save

f=Follower.new
f.id=37002
f.followed_id=3
f.follower_id=2
f.save

f=Follower.new
f.id=37004
f.followed_id=3
f.follower_id=4
f.save

f=Follower.new
f.id=37005
f.followed_id=3
f.follower_id=5
f.save


#####Seguidores de 4#####

f=Follower.new
f.id=47001
f.followed_id=4
f.follower_id=1
f.save

f=Follower.new
f.id=47002
f.followed_id=4
f.follower_id=2
f.save

f=Follower.new
f.id=47003
f.followed_id=4
f.follower_id=3
f.save

f=Follower.new
f.id=47005
f.followed_id=4
f.follower_id=5
f.save

#####Seguidores de 5#####

f=Follower.new
f.id=57001
f.followed_id=5
f.follower_id=1
f.save

f=Follower.new
f.id=57002
f.followed_id=5
f.follower_id=2
f.save

f=Follower.new
f.id=57003
f.followed_id=5
f.follower_id=3
f.save

f=Follower.new
f.id=57004
f.followed_id=5
f.follower_id=4
f.save


#####Seguidores de 6#####
f=Follower.new
f.id=67001
f.followed_id=6
f.follower_id=1
f.save

f=Follower.new
f.id=670012
f.followed_id=6
f.follower_id=12
f.save

f=Follower.new
f.id=670013
f.followed_id=6
f.follower_id=13
f.save

#####Seguidores de 7#####
f=Follower.new
f.id=77006
f.followed_id=7
f.follower_id=6
f.save

f=Follower.new
f.id=77008
f.followed_id=7
f.follower_id=8
f.save

f=Follower.new
f.id=770010
f.followed_id=7
f.follower_id=10
f.save

#####Seguidores de 8#####

f=Follower.new
f.id=87001
f.followed_id=8
f.follower_id=6
f.save


f=Follower.new
f.id=870013
f.followed_id=8
f.follower_id=13
f.save

####Seguidores de 10####

f=Follower.new
f.id=107006
f.followed_id=10
f.follower_id=6
f.save


f=Follower.new
f.id=107007
f.followed_id=10
f.follower_id=7
f.save

f=Follower.new
f.id=107008
f.followed_id=10
f.follower_id=8
f.save


f=Follower.new
f.id=1070011
f.followed_id=10
f.follower_id=11
f.save







######################################################################
###########################Creacion de Tags###########################
######################################################################

#####Tags de Quimica#####
ta=Tag.new
ta.id=18001
ta.tag_name="Grasas"
ta.topic_id=1
ta.save

ta=Tag.new
ta.id=18002
ta.tag_name="Mezclas"
ta.topic_id=1
ta.save

ta=Tag.new
ta.id=18003
ta.tag_name="Fisicoquimica"
ta.topic_id=1
ta.save

ta=Tag.new
ta.id=18004
ta.tag_name="Laboratorio"
ta.topic_id=1
ta.save

ta=Tag.new
ta.id=18005
ta.tag_name="Elementos"
ta.topic_id=1
ta.save

#####Tags de Computacion#####

ta=Tag.new
ta.id=28001
ta.tag_name="Programacion Orientada a Objetos"
ta.topic_id=2
ta.save

ta=Tag.new
ta.id=28002
ta.tag_name="Elementos de Computadores"
ta.topic_id=2
ta.save

ta=Tag.new
ta.id=28003
ta.tag_name="Rails"
ta.topic_id=2
ta.save

ta=Tag.new
ta.id=28004
ta.tag_name="Javascript"
ta.topic_id=2
ta.save

ta=Tag.new
ta.id=28005
ta.tag_name="APIs"
ta.topic_id=2
ta.save

#####Tags de Matematica#####

ta=Tag.new
ta.id=38001
ta.tag_name="Derivadas"
ta.topic_id=3
ta.save

ta=Tag.new
ta.id=38002
ta.tag_name="Conjuntos"
ta.topic_id=3
ta.save

ta=Tag.new
ta.id=38003
ta.tag_name="Simplificacion"
ta.topic_id=3
ta.save

#####Tags de Fisica#####

ta=Tag.new
ta.id=48001
ta.tag_name="Gravedad"
ta.topic_id=4
ta.save

ta=Tag.new
ta.id=48002
ta.tag_name="Magnetismo"
ta.topic_id=4
ta.save

ta=Tag.new
ta.id=48003
ta.tag_name="Poleas"
ta.topic_id=4
ta.save

#####Tags de El&EL#####

ta=Tag.new
ta.id=58001
ta.tag_name="Circuitos"
ta.topic_id=5
ta.save

#####Tags de Ciencias Sociales#####
ta=Tag.new
ta.id=68001
ta.tag_name="Politica"
ta.topic_id=6
ta.save

ta=Tag.new
ta.id=68002
ta.tag_name="Sociología"
ta.topic_id=6
ta.save

###Tags de Artes Musicales###

ta=Tag.new
ta.id=78001
ta.tag_name="Intrumentos"
ta.topic_id=7
ta.save

ta=Tag.new
ta.id=78002
ta.tag_name="Musica Colombiana"
ta.topic_id=7
ta.save

###Tags de Lenguajes y Literatura###
ta=Tag.new
ta.id=98001
ta.tag_name="Semantica"
ta.topic_id=9
ta.save

ta=Tag.new
ta.id=98002
ta.tag_name="Literatura Colombiana"
ta.topic_id=9
ta.save

###Tags de Biología###
ta=Tag.new
ta.id=108001
ta.tag_name="Celulas"
ta.topic_id=10
ta.save

ta=Tag.new
ta.id=108002
ta.tag_name="Medicina"
ta.topic_id=10
ta.save






######################################################################
########################Creacion de Preguntas#########################
######################################################################
####Preguntas del usuario 1

q=Question.new
q.id=1001001
q.title="¿Cual es la mejor forma de mezclar estos elementos?"
q.body="Quiero mezclar Na y Cl"
q.difficulty=4
q.date_posted= Date.today
q.topic_id=1
q.user_id=1
q.save

	t=QuestionHasTag.new
	t.question_id=1001001
	t.tag_id=18002
	t.save

	t=QuestionHasTag.new
	t.question_id=1001001
	t.tag_id=18005
	t.save

		po=Postulate.new
		po.user_id=7
		po.question_id=1001001
		po.save

q=Question.new
q.id=1001002
q.title="¿Qué es una grasa trans?"
q.difficulty=3
q.date_posted= Date.today
q.topic_id=1
q.user_id=1
q.save

	t=QuestionHasTag.new
	t.question_id=1001002
	t.tag_id=18002
	t.save

	t=QuestionHasTag.new
	t.question_id=1001001
	t.tag_id=18005
	t.save
	
		po=Postulate.new
		po.user_id=2
		po.question_id=1001002
		po.save

		po=Postulate.new
		po.user_id=5
		po.question_id=1001002
		po.save
	
q=Question.new
q.id=1002001
q.title="¿Alguien me puede ayudar con la lógica de esto?"
q.body="No sé el resultado que da la siguiente suma logica"
q.difficulty=2
q.date_posted= Date.today
q.topic_id=2
q.user_id=1
q.save

	t=QuestionHasTag.new
	t.question_id=1002001
	t.tag_id=28002
	t.save

	
		po=Postulate.new
		po.user_id=2
		po.question_id=1002001
		po.save
	
		po=Postulate.new
		po.user_id=3
		po.question_id=1002001
		po.save
	
		po=Postulate.new
		po.user_id=4
		po.question_id=1002001
		po.save
	
		po=Postulate.new
		po.user_id=5
		po.question_id=1002001
		po.save

####Preguntas del usuario 2
	

q=Question.new
q.id=2001001
q.title="¿Cuales son los instrumentos necesarios para un problema de Fisicoquimica?"
q.difficulty=2
q.date_posted= Date.today
q.topic_id=1
q.user_id=2
q.save
	t=QuestionHasTag.new
	t.question_id=2001001
	t.tag_id=18003
	t.save

	t=QuestionHasTag.new
	t.question_id=2001001
	t.tag_id=18004
	t.save

		po=Postulate.new
		po.user_id=10
		po.question_id=2001001
		po.save

q=Question.new
q.id=2002001
q.title="¿Cómo puedo usar el API de Google Maps?"
q.difficulty=5
q.date_posted= Date.today
q.topic_id=2
q.user_id=2
q.save

	t=QuestionHasTag.new
	t.question_id=2002001
	t.tag_id=28005
	t.save

	t=QuestionHasTag.new
	t.question_id=2002001
	t.tag_id=28004
	t.save

		po=Postulate.new
		po.user_id=1
		po.question_id=2002001
		po.save


#####Preguntas del usuario 3#####
q=Question.new
q.id=3002001
q.title="¿Rails es un lenguaje Orientado a Objetos?"
q.difficulty=1
q.date_posted= Date.today
q.topic_id=2
q.user_id=3
q.save

	t=QuestionHasTag.new
	t.question_id=3002001
	t.tag_id=28001
	t.save

	t=QuestionHasTag.new
	t.question_id=3002001
	t.tag_id=28003
	t.save

#####Preguntas del usuario 4#####

q=Question.new
q.id=4002001
q.title="¿Rails es recomendable para programar por objetos?"
q.difficulty=1
q.date_posted= Date.today
q.topic_id=2
q.user_id=4
q.save

	t=QuestionHasTag.new
	t.question_id=4002001
	t.tag_id=28001
	t.save

	t=QuestionHasTag.new
	t.question_id=4002001
	t.tag_id=28003
	t.save

		po=Postulate.new
		po.user_id=6
		po.question_id=4002001
		po.save

#####Preguntas del usuario 5#####

q=Question.new
q.id=5003001
q.title="¿Cómo puedo hacer para derivar todos los elementos de un conjunto?"
q.difficulty=1
q.date_posted= Date.today
q.topic_id=3
q.user_id=5
q.save

	t=QuestionHasTag.new
	t.question_id=5003001
	t.tag_id=38001
	t.save

	t=QuestionHasTag.new
	t.question_id=5003001
	t.tag_id=38001
	t.save

		po=Postulate.new
		po.user_id=4
		po.question_id=5003001
		po.save


q=Question.new
q.id=5004001
q.title="¿Cómo afecta la gravedad a una polea?"
q.difficulty=2
q.date_posted= Date.today
q.topic_id=4
q.user_id=5
q.save

	t=QuestionHasTag.new
	t.question_id=5004001
	t.tag_id=48001
	t.save

	t=QuestionHasTag.new
	t.question_id=5004001
	t.tag_id=48001
	t.save

		po=Postulate.new
		po.user_id=2
		po.question_id=5004001
		po.save

		po=Postulate.new
		po.user_id=10
		po.question_id=5004001
		po.save

q=Question.new
q.id=5006001
q.title="¿Cómo afecta la situación de Venezuela a Colombia?"
q.difficulty=5
q.date_posted= Date.today
q.topic_id=6
q.user_id=5
q.save

	t=QuestionHasTag.new
	t.question_id=5006001
	t.tag_id=68001
	t.save


q=Question.new
q.id=5006002
q.title="Ayuda con planteamientos sociologicos actuales"
q.body="Resulta que necesito hacer un ensayo sobre los planteamientos sociologicos más importantes del pais actualmente. No sé donde empezar a buscar"
q.difficulty=6
q.date_posted= Date.today
q.topic_id=6
q.user_id=5
q.save

	t=QuestionHasTag.new
	t.question_id=5006002
	t.tag_id=68002
	t.save

q=Question.new
q.id=5007001
q.title="¿Qué artistas academicos fueron influyentes en Colombia?"
q.difficulty=3
q.date_posted= Date.today
q.topic_id=7
q.user_id=5
q.save

	t=QuestionHasTag.new
	t.question_id=5007001
	t.tag_id=78002
	t.save

		po=Postulate.new
		po.user_id=9
		po.question_id=5007001
		po.save

		po=Postulate.new
		po.user_id=13
		po.question_id=5007001
		po.save

#####Preguntas del usuario 6#####

q=Question.new
q.id=6009001
q.title="¿De qué forma sé que está planteada bien esta oración?"
q.difficulty=1
q.date_posted= Date.today
q.topic_id=9
q.user_id=6
q.save

	t=QuestionHasTag.new
	t.question_id=6009001
	t.tag_id=98001
	t.save

		po=Postulate.new
		po.user_id=12
		po.question_id=6009001
		po.save

		po=Postulate.new
		po.user_id=13
		po.question_id=6009001
		po.save

q=Question.new
q.id=6009002
q.title="¿Qué escritores fueron influyentes en Colombia?"
q.difficulty=3
q.date_posted= Date.today
q.topic_id=9
q.user_id=6
q.save

	t=QuestionHasTag.new
	t.question_id=6009002
	t.tag_id=98002
	t.save

		po=Postulate.new
		po.user_id=12
		po.question_id=6009002
		po.save

		po=Postulate.new
		po.user_id=13
		po.question_id=6009002
		po.save

#####Preguntas del usuario 7#####
q=Question.new
q.id=70010001
q.title="¿Cuanto tiempo tarda una celula en regenerarse?"
q.difficulty=10
q.date_posted= Date.today
q.topic_id=7
q.user_id=7
q.save

	t=QuestionHasTag.new
	t.question_id=70010001
	t.tag_id=108001
	t.save

		po=Postulate.new
		po.user_id=8
		po.question_id=70010001
		po.save

		po=Postulate.new
		po.user_id=10
		po.question_id=70010001
		po.save

		po=Postulate.new
		po.user_id=13
		po.question_id=70010001
		po.save
