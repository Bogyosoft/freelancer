create table items(item_id serial PRIMARY KEY,
           properties varchar,
            destination integer,
            status varchar,
            fk_source integer);
create table jobs(job_id serial PRIMARY KEY,
           fk_item varchar,
            fk_user varchar);
create table sources(source_id serial PRIMARY KEY,
           location integer,
            fk_owner integer);
create table users(user_id serial PRIMARY KEY,
           username varchar,
            password varchar,
            role varchar,
            score integer);
