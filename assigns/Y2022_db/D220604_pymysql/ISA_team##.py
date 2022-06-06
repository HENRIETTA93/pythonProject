import mysql.connector


# TODO: REPLACE THE VALUE OF VARIABLE team (EX. TEAM 1 --> team = 1)
team = 0


# Requirement1: create schema ( name: ISA_team12 )
def requirement1(host, user, password):
    cnx = mysql.connector.connect(host=host, user=user, password=password)
    cursor = cnx.cursor()
    cursor.execute('SET GLOBAL innodb_buffer_pool_size=2*1024*1024*1024;')

    # TODO: WRITE CODE HERE

    schema='ISA_team12'
    dropschema="drop database if exists "+schema
    cursor.execute(dropschema)
    sql="create database "+schema
    cursor.execute(sql)

    # TODO: WRITE CODE HERE
    cursor.close()


# Requierement2: create table
def requirement2(host, user, password):
    cnx = mysql.connector.connect(host=host, user=user, password=password)
    cursor = cnx.cursor()
    cursor.execute('SET GLOBAL innodb_buffer_pool_size=2*1024*1024*1024;')

    # TODO: WRITE CODE HERE
    schema = 'ISA_team12'
    use="use "+schema
    cursor.execute(use)



    create_attributes="""
    create table attributes (
    attribute_id int primary key,
    attribute_name varchar(50)
    )
    """
    cursor.execute(create_attributes)

    create_business="create table business(business_id int primary key ,	active varchar(20),	city varchar(30),	stat varchar(10),	stars decimal(5,1),	review_count varchar(10))"
    cursor.execute(create_business)


    create_business_attributes="""create table business_attributes(attribute_id int,	business_id int,	attribute_value varchar(30),
    primary key (attribute_id,business_id))"""
    cursor.execute(create_business_attributes)

    create_business_categories="""
    create table business_categories(business_id int,category_id int, primary key(business_id,category_id))
    """
    cursor.execute(create_business_categories)

    create_business_hours="""
    create table business_hours(
    business_id int,day_id int,opening_time varchar(10),closing_time varchar(10),
    primary key(business_id,day_id)
    )
    """
    cursor.execute(create_business_hours)


    create_categories="""
    create table categories(category_id int primary key,category_name varchar(50))
    """
    cursor.execute(create_categories)

    create_compliment="create table compliments(compliment_id int primary key, compliment_type varchar(30))"
    cursor.execute(create_compliment)

    create_days="create table days(day_id int primary key,day_of_wee varchar(20))"
    cursor.execute(create_days)

    create_elite="create table elite(user_id int,year_id int, primary key (user_id,year_id))"
    cursor.execute(create_elite)

    create_reviews="""create table reviews(
    review_id int primary key,
    business_id int,
    user_id int,
    review_stars int,
    review_votes_funny varchar(20),
    review_votes_useful varchar(20),
    review_votes_cool varchar(20),
    review_length varchar(20)
    )"""
    cursor.execute(create_reviews)


    create_tips="""
    create table tips(
    business_id int,user_id int,likes int,tip_length varchar(20),
    primary key (business_id,user_id)
    )
    """
    cursor.execute(create_tips)

    create_users="""
    create table users(
    user_id int primary key ,
    user_yelping_since_year int,
    user_average_stars int,
    user_votes_funny int,
    user_votes_useful int,
    user_votes_cool int,
    user_fans int
    )
    """
    cursor.execute(create_users)


    create_users_compliments="""
    create table users_compliments(
    compliment_id int,
    user_id int,
    number_of_compliments int,
    primary key (compliment_id,user_id)
    )
    """
    cursor.execute(create_users_compliments)

    create_years="""
    create table years(
    year_id int primary key ,
    actual_year int
    )
    """
    cursor.execute(create_years)

    # TODO: WRITE CODE HERE
    cursor.close()


# Requirement3: insert data
def requirement3(host, user, password, directory):
    cnx = mysql.connector.connect(host=host, user=user, password=password)
    cursor = cnx.cursor()
    cursor.execute('SET GLOBAL innodb_buffer_pool_size=2*1024*1024*1024;')

    # TODO: WRITE CODE HERE
    schema = 'ISA_team12'
    use="use "+schema
    cursor.execute(use)

    # read attributes.csv and insert into attributes table
    f_attr=open(directory+"/attributes.csv")
    attributes=f_attr.read()
    attributes=attributes.strip()
    insert_attributes="insert into attributes values ('{}','{}')"

    for attr in attributes.split('\n')[1:]:
        values=attr.split(',')
        cursor.execute(insert_attributes.format(values[0],values[1]))
    cursor.execute("commit")

    # read bussiness.csv and insert into business table
    f_buss=open(directory+"/business.csv",encoding='UTF-8')
    business=f_buss.read().strip()

    insert_business="insert into business values('{}','{}','{}','{}','{}','{}')"
    for attr in business.split('\n')[1:]:
        values=attr.split(',')
        cursor.execute(insert_business.format(values[0][1:-1],values[1][1:-1],values[2][1:-1],values[3][1:-1],values[4][1:-1],values[5][1:-1]))
    cursor.execute("commit")

    # read business_attributes.csv and insert into table
    f_buss_attrs=open(directory+"/business_attributes.csv",encoding='UTF-8')
    business_attrs=f_buss_attrs.read().strip()

    insert_business_attrs="insert into business_attributes values('{}','{}','{}')"
    for attr in business_attrs.split('\n')[1:]:
        values=attr.split(',')
        cursor.execute(insert_business_attrs.format(values[0][1:-1],values[1][1:-1],values[2][1:-1]))
    cursor.execute("commit")

    # read business_categories.csv and insert into table
    f_buss_cates=open(directory+"/business_categories.csv",encoding='UTF-8')
    business_cates=f_buss_cates.read().strip()

    insert_business_cates="insert into business_categories values('{}','{}')"
    for attr in business_cates.split('\n')[1:]:
        values=attr.split(',')
        cursor.execute(insert_business_cates.format(values[0][1:-1],values[1][1:-1]))
    cursor.execute("commit")


    # read business_hours.csv and insert into table
    f_buss_hours=open(directory+"/business_hours.csv",encoding='UTF-8')
    business_hours=f_buss_hours.read().strip()

    insert_business_hours="insert into business_hours values('{}','{}','{}','{}')"
    for attr in business_hours.split('\n')[1:]:
        values=attr.split(',')
        cursor.execute(insert_business_hours.format(values[0][1:-1],values[1][1:-1],values[2][1:-1],values[3][1:-1]))
    cursor.execute("commit")

    # read categories.csv and insert into table
    f_cates = open(directory + "/categories.csv", encoding='UTF-8')
    cates = f_cates.read().strip()

    insert_cates = "insert into categories values('{}','{}')"
    for attr in cates.split('\n')[1:]:
        values = attr.split(',')
        cursor.execute(insert_cates.format(values[0], values[1].replace("'","''")))
    cursor.execute("commit")



    # read compliments.csv and insert into table
    f_compliment = open(directory + "/compliments.csv", encoding='UTF-8')
    compliment = f_compliment.read().strip()

    insert_compliment = "insert into compliments values('{}','{}')"
    for attr in compliment.split('\n')[1:]:
        values = attr.split(',')
        cursor.execute(insert_compliment.format(values[0][1:-1], values[1][1:-1]))
    cursor.execute("commit")

    # read days.csv and insert into table
    f_days = open(directory + "/days.csv", encoding='UTF-8')
    days = f_days.read().strip()

    insert_days = "insert into days values('{}','{}')"
    for attr in days.split('\n')[1:]:
        values = attr.split(',')
        cursor.execute(insert_days.format(values[0][1:-1], values[1][1:-1]))
    cursor.execute("commit")

    # read elite.csv and insert into table
    f_elite = open(directory + "/elite.csv", encoding='UTF-8')
    elite = f_elite.read().strip()

    insert_elite = "insert into elite values('{}','{}')"
    for attr in elite.split('\n')[1:]:
        values = attr.split(',')
        cursor.execute(insert_elite.format(values[0][1:-1], values[1][1:-1]))
    cursor.execute("commit")



    # read reviews.csv and insert into table
    f_reviews = open(directory + "/reviews.csv", encoding='UTF-8')
    reviews = f_reviews.read().strip()

    insert_reviews = "insert into reviews values('{}','{}','{}','{}','{}','{}','{}','{}')"
    for attr in reviews.split('\n')[1:]:
        values = attr.split(',')
        cursor.execute(insert_reviews.format(values[0], values[1], values[2], values[3], values[4], values[5], values[6], values[7]))
    cursor.execute("commit")

    # read tips.csv and insert into table
    f_tips = open(directory + "/tips.csv", encoding='UTF-8')
    tips = f_tips.read().strip()

    insert_tips = "insert into tips values('{}','{}','{}','{}')"
    for attr in tips.split('\n')[1:]:
        values = attr.split(',')
        cursor.execute(insert_tips.format(values[0][1:-1], values[1][1:-1], values[2][1:-1], values[3][1:-1]))
    cursor.execute("commit")

    # read users.csv and insert into table
    f_users = open(directory + "/users.csv", encoding='UTF-8')
    users = f_users.read().strip()

    insert_users = "insert into users values('{}','{}','{}','{}','{}','{}','{}')"
    for attr in users.split('\n')[1:]:
        values = attr.split(',')
        cursor.execute(insert_users.format(values[0], values[1], values[2], values[3], values[4], values[5], values[6]))
    cursor.execute("commit")

    # read users_compliments.csv and insert into table
    f_users_compliments = open(directory + "/users_compliments.csv", encoding='UTF-8')
    users_compliments = f_users_compliments.read().strip()

    insert_users_compliments = "insert into users_compliments values('{}','{}','{}')"
    for attr in users_compliments.split('\n')[1:]:
        values = attr.split(',')
        cursor.execute(insert_users_compliments.format(values[0][1:-1], values[1][1:-1], values[2][1:-1]))
    cursor.execute("commit")

    # read years.csv and insert into table
    f_years = open(directory + "/years.csv", encoding='UTF-8')
    years= f_years.read().strip()

    insert_years = "insert into years values('{}','{}')"
    for attr in years.split('\n')[1:]:
        values = attr.split(',')
        cursor.execute(insert_years.format(values[0][1:-1], values[1][1:-1]))
    cursor.execute("commit")
    # TODO: WRITE CODE HERE
    cursor.close()


# Requirement4: add constraint (foreign key)
def requirement4(host, user, password):
    cnx = mysql.connector.connect(host=host, user=user, password=password)
    cursor = cnx.cursor()
    cursor.execute('SET GLOBAL innodb_buffer_pool_size=2*1024*1024*1024;')

    # TODO: WRITE CODE HERE
    schema = 'ISA_team12'
    use="use "+schema
    cursor.execute(use)

    fk_add="""
    alter table business_attributes 
    add constraint fk_bussattr_buss 
    foreign key(business_id) references business(business_id)"""
    cursor.execute(fk_add)

    fk_add = """
    alter table business_attributes 
    add constraint fk_bussattr_attr 
    foreign key(attribute_id) references attributes(attribute_id)"""
    cursor.execute(fk_add)



    fk_add="alter table business_categories add constraint fk_busscate_buss foreign key(business_id) references business(business_id)"
    cursor.execute(fk_add)
    fk_add = "alter table business_categories add constraint fk_busscate_cate foreign key(category_id) references categories(category_id)"
    cursor.execute(fk_add)

    fk_add = "alter table business_hours add constraint fk_busshour_buss foreign key(business_id) references business(business_id)"
    cursor.execute(fk_add)
    fk_add = "alter table business_hours add constraint fk_busshour_hour foreign key(day_id) references days(day_id)"
    cursor.execute(fk_add)


    fk_add = "alter table elite add constraint fk_elite_user foreign key(user_id) references users(user_id)"
    cursor.execute(fk_add)
    fk_add = "alter table elite add constraint fk_elite_year foreign key(year_id) references years(year_id)"
    cursor.execute(fk_add)


    fk_add = "alter table users_compliments add constraint fk_usercomp_user foreign key(user_id) references users(user_id)"
    cursor.execute(fk_add)
    fk_add = "alter table users_compliments add constraint fk_usercomp_comp foreign key(compliment_id) references compliments(compliment_id)"
    cursor.execute(fk_add)

    fk_add = "alter table tips add constraint fk_tips_user foreign key(user_id) references users(user_id)"
    cursor.execute(fk_add)
    fk_add = "alter table tips add constraint fk_tips_buss foreign key(business_id) references business(business_id)"

    fk_add = "alter table reviews add constraint fk_reviews_user foreign key(user_id) references users(user_id)"
    cursor.execute(fk_add)
    fk_add = "alter table reviews add constraint fk_reviews_buss foreign key(business_id) references business(business_id)"
    cursor.execute(fk_add)
    # TODO: WRITE CODE HERE
    cursor.close()

# Requirement5: add view
def requirement5(host, user, password):
    cnx = mysql.connector.connect(host=host, user=user, password=password)
    cursor = cnx.cursor()
    cursor.execute('SET GLOBAL innodb_buffer_pool_size=2*1024*1024*1024;')

    # TODO: WRITE CODE HERE
    schema = 'ISA_team12'
    use="use "+schema
    cursor.execute(use)

    create_view="""
    create view vw1
    as
    select u.user_id,u.user_fans, u.user_average_stars,u.user_votes_cool,u.user_votes_funny,
    u.user_votes_useful, c.compliment_type,uc.number_of_compliments
    from users u
    join users_compliments uc on u.user_id=uc.user_id
    join compliments c on uc.compliment_id=c.compliment_id;
    
    """
    cursor.execute(create_view)

    create_view = """
    create view vw2
    as
    select c.category_name, b.city, b.stat,r.review_stars, count(u.user_id) as user_num
    from business b
    join reviews r on b.business_id=r.business_id
    join users u on u.user_id=r.user_id
    join business_categories bc on bc.business_id=b.business_id
    join categories c on c.category_id=bc.category_id
    group by c.category_name, b.city, b.stat,r.review_stars
    order by c.category_name, b.city, b.stat,r.review_stars;

    """
    cursor.execute(create_view)

    # TODO: WRITE CODE HERE
    cursor.close()
# TODO: REPLACE THE VALUES OF FOLLOWING VARIABLES
host = 'localhost'
user = 'root'
password = '123456'
directory = 'E:\\dataset'

requirement1(host=host, user=user, password=password)
requirement2(host=host, user=user, password=password)
requirement3(host=host, user=user, password=password, directory=directory)
requirement4(host=host, user=user, password=password)
requirement5(host=host, user=user, password=password)