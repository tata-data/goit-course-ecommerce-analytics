-- 1. Свторення таблиць

-- користувачі
create table users (
    user_id text primary key
);

-- замовлення
create table orders (
    order_id        text primary key,
    user_id         text not null,
    order_date      text,
    payment_method  text,
    delivery_status text,
    device          text,
    country         text,
    foreign key (user_id) references users(user_id)
);

-- товари
create table products (
    product_id text primary key,
    category   text
);

-- позиції в замовленнях
create table order_items (
    order_id   text,
    product_id text,
    quantity   integer,
    discount   real,
    price      real,
    total      real,
    primary key (order_id, product_id),
    foreign key (order_id)   references orders(order_id),
    foreign key (product_id) references products(product_id)
);


-- 2. Наповнення з сирої таблиці ecommerce_dataset (та, що умовтована з CSV)

-- users
insert into users (user_id)
select distinct user_id
from ecommerce_dataset;

-- orders
insert into orders (order_id, user_id, order_date,
                    payment_method, delivery_status,
                    device, country)
select distinct
       order_id,
       user_id,
       order_date,
       payment_method,
       delivery_status,
       device,
       country
from ecommerce_dataset;

-- products
insert into products (product_id, category)
select distinct
       product_id,
       category
from ecommerce_dataset;

-- order_items
insert into order_items (order_id, product_id,
                         quantity, discount,
                         price, total)
select
       order_id,
       product_id,
       quantity,
       discount,
       price,
       total
from ecommerce_dataset;
