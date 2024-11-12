SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS product_category;
CREATE TABLE IF NOT EXISTS product_category (
    id int(11) NOT NULL AUTO_INCREMENT,
    category_name VARCHAR(255) NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS product;
CREATE TABLE IF NOT EXISTS product (
    id int(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) DEFAULT NULL,
    description VARCHAR(1255) DEFAULT NULL,
    unit_price DECIMAL(13,2) DEFAULT NULL,
    image_url VARCHAR(255) DEFAULT NULL,
    units_in_stock INT(11) DEFAULT NULL,
    category_id int(11) DEFAULT NULL,
    brand VARCHAR(255) DEFAULT NULL,
    date_created DATETIME(6) DEFAULT NULL,
    last_updated DATETIME(6) DEFAULT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_product_category FOREIGN KEY (category_id) REFERENCES product_category (id)
);

DROP TABLE IF EXISTS basket;
CREATE TABLE IF NOT EXISTS basket (
    id BIGINT(20) NOT NULL AUTO_INCREMENT,
    buyer_id VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS basket_item;
CREATE TABLE IF NOT EXISTS basket_item (
    id BIGINT(20) NOT NULL AUTO_INCREMENT,
    quantity INT(11) DEFAULT NULL,
    basket_id BIGINT(20) DEFAULT NULL,
    product_id int(11) DEFAULT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_basket_item_product FOREIGN KEY (product_id) REFERENCES product (id),
    CONSTRAINT fk_basket_item_basket FOREIGN KEY (basket_id) REFERENCES basket (id)
);


DROP TABLE if EXISTS authority;
CREATE TABLE IF NOT EXISTS authority (
    id INT(11) NOT NULL AUTO_INCREMENT,
    privilege VARCHAR(250) NOT NULL,
    PRIMARY KEY (id)
    );

DROP TABLE if EXISTS role;
CREATE TABLE IF NOT EXISTS role (
    id INT(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
    );

DROP TABLE if EXISTS role_authority;
CREATE TABLE IF NOT EXISTS role_authority (
    role_id INT(11) NOT NULL,
    authority_id INT(11) NOT NULL,
    PRIMARY KEY (role_id, authority_id),
    CONSTRAINT FK_role_authority_01 FOREIGN KEY (role_id) REFERENCES role (id) on delete no action on update no action,
    CONSTRAINT FK_role_authority_02 FOREIGN KEY (authority_id) REFERENCES authority (id) on delete no action on update no action
    );

DROP TABLE if EXISTS user;
CREATE TABLE IF NOT EXISTS user (
    id INT(11) NOT NULL AUTO_INCREMENT,
    user_id VARCHAR(50) NOT NULL,
    first_name VARCHAR(150) NOT NULL,
    last_name VARCHAR(150) NOT NULL,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(150) NOT NULL,
    email VARCHAR(250) NULL,
    profile_image_url VARCHAR(1250) NULL,
    last_login_date DATETIME NULL,
    last_login_date_display DATETIME NULL,
    join_date DATETIME NULL,
    is_active tinyint(1) NOT NULL,
    is_not_locked tinyint(1) NOT NULL,
    PRIMARY KEY (id)
);

DROP TABLE if EXISTS user_role;
CREATE TABLE IF NOT EXISTS user_role (
    user_id INT(11) NOT NULL,
    role_id INT(11) NOT NULL,
    PRIMARY KEY (user_id, role_id),
    CONSTRAINT FK_user_role_01 FOREIGN KEY (user_id) REFERENCES user (id) on delete no action on update no action,
    CONSTRAINT FK_user_role_02 FOREIGN KEY (role_id) REFERENCES role (id) on delete no action on update no action
);

DROP TABLE if EXISTS user_authority;
CREATE TABLE IF NOT EXISTS user_authority (
    user_id INT(11) NOT NULL,
    authority_id INT(11) NOT NULL,
    PRIMARY KEY (user_id, authority_id),
    CONSTRAINT FK_user_authority_01 FOREIGN KEY (user_id) REFERENCES user (id) on delete no action on update no action,
    CONSTRAINT FK_user_authority_02 FOREIGN KEY (authority_id) REFERENCES authority (id) on delete no action on update no action
);

DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders (
    id int(11) NOT NULL AUTO_INCREMENT,
    buyer_id VARCHAR(50) NOT NULL,

    shipping_address_fullname varchar(250) NOT NULL,
    shipping_address_line_1 varchar(250) NOT NULL,
    shipping_address_line_2 varchar(250) NOT NULL,
    shipping_address_city varchar(250) NOT NULL,
    shipping_address_state varchar(250) NOT NULL,
    shipping_address_zip varchar(250) NOT NULL,
    shipping_address_country varchar(250) NOT NULL,

    order_date datetime NOT NULL,
    order_status varchar(20) NOT NULL,
    order_payment_method varchar(20) NOT NULL,

    subtotal DECIMAL(13,2) NOT NULL,
    delivery_fee DECIMAL(13,2) NOT NULL,
    total DECIMAL(13,2) NOT NULL,

    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS order_item;
CREATE TABLE IF NOT EXISTS order_item (
    id int(11) NOT NULL AUTO_INCREMENT,
    order_id int(11) NOT NULL,
    product_item_id int(11) NOT NULL,
    product_item_name varchar(250) NOT NULL,
    product_item_image_url varchar(250) NOT NULL,
    product_item_unit_price DECIMAL(13,2) NOT NULL,
    quantity int(11) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT order_detail_order_fk FOREIGN KEY (order_id) REFERENCES orders (id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

SET FOREIGN_KEY_CHECKS=1;
