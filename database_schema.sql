CREATE DATABASE marketplace_db;
USE marketplace_db;
CREATE TABLE customers (
    customer_idcustomers INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(15) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Other', 'Prefer Not To Say'),
    account_status ENUM('Active', 'Inactive', 'Suspended') DEFAULT 'Active',
    email_verified BOOLEAN DEFAULT FALSE,
    phone_verified BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE sellers (
    seller_id INT AUTO_INCREMENT PRIMARY KEY,
    business_namemarketplace_db VARCHAR(100) NOT NULL,
    owner_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(15) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    gst_number VARCHAR(15) UNIQUE,
    seller_rating DECIMAL(3,2) DEFAULT 0.00,
    account_status ENUM('Pending','Active','Suspended') DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(200) NOT NULL,
    brand VARCHAR(100),
    description TEXT,
    model_number VARCHAR(100),
    weight DECIMAL(8,2),
    dimensions VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
                    ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE product_categories (
    product_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (product_id, category_id),
    FOREIGN KEY (product_id)
        REFERENCES products(product_id),
    FOREIGN KEY (category_id)
        REFERENCES categories(category_id)
);
CREATE TABLE seller_products (
    seller_product_id INT AUTO_INCREMENT PRIMARY KEY,
    seller_id INT NOT NULL,
    product_id INT NOT NULL,
    selling_price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0,
    discount_percentage DECIMAL(5,2) DEFAULT 0.00,
    seller_status ENUM(
        'Active',
        'Out of Stock',
        'Discontinued'
    ) DEFAULT 'Active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,
    CHECK (selling_price > 0),
    CHECK (stock_quantity >= 0),
    CHECK (discount_percentage >= 0 AND discount_percentage <= 100),
    FOREIGN KEY (seller_id)
        REFERENCES sellers(seller_id),
    FOREIGN KEY (product_id)
        REFERENCES products(product_id),
    UNIQUE (seller_id, product_id)
);
CREATE TABLE customer_addresses (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    address_type ENUM(
        'Home',
        'Office',
        'Hostel',
        'Other'
    ) DEFAULT 'Home',
    address_line1 VARCHAR(255) NOT NULL,
    address_line2 VARCHAR(255),
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    is_default BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);
CREATE TABLE seller_addresses (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    seller_id INT NOT NULL,
    address_type ENUM(
        'Business',
        'Warehouse',
        'Return',
        'Office',
        'Other'
    ) DEFAULT 'Business',
    address_line1 VARCHAR(255) NOT NULL,
    address_line2 VARCHAR(255),
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    is_default BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (seller_id)
        REFERENCES sellers(seller_id)
);
CREATE TABLE warehouses (
    warehouse_id INT AUTO_INCREMENT PRIMARY KEY,
    seller_id INT NOT NULL,
    warehouse_name VARCHAR(100) NOT NULL,
    address_line1 VARCHAR(255) NOT NULL,
    address_line2 VARCHAR(255),
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    warehouse_status ENUM(
        'Active',
        'Inactive'
    ) DEFAULT 'Active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (seller_id)
        REFERENCES sellers(seller_id)
);
CREATE TABLE inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    warehouse_id INT NOT NULL,
    seller_product_id INT NOT NULL,
    quantity_available INT NOT NULL DEFAULT 0,
    reorder_level INT DEFAULT 10,
    last_stock_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (warehouse_id)
        REFERENCES warehouses(warehouse_id),
    FOREIGN KEY (seller_product_id)
        REFERENCES seller_products(seller_product_id),
    UNIQUE (warehouse_id, seller_product_id),
    CHECK (quantity_available >= 0),
    CHECK (reorder_level >= 0)
);
CREATE TABLE cart (
    cart_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);
CREATE TABLE cart_items (
    cart_item_id INT AUTO_INCREMENT PRIMARY KEY,
    cart_id INT NOT NULL,
    seller_product_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cart_id)
        REFERENCES cart(cart_id),
    FOREIGN KEY (seller_product_id)
        REFERENCES seller_products(seller_product_id),
    UNIQUE (cart_id, seller_product_id),
    CHECK (quantity > 0)
);
CREATE TABLE wishlist (
    wishlist_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    seller_product_id INT NOT NULL,
    added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),
    FOREIGN KEY (seller_product_id)
        REFERENCES seller_products(seller_product_id),
    UNIQUE (customer_id, seller_product_id)
);
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    address_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(12,2) NOT NULL,
    order_status ENUM(
        'Pending',
        'Confirmed',
        'Packed',
        'Shipped',
        'Delivered',
        'Cancelled'
    ) DEFAULT 'Pending',
    payment_status ENUM(
        'Pending',
        'Paid',
        'Failed',
        'Refunded'
    ) DEFAULT 'Pending',
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),
    FOREIGN KEY (address_id)
        REFERENCES customer_addresses(address_id),
    CHECK (total_amount >= 0)
);
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    seller_product_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    price_at_purchase DECIMAL(10,2) NOT NULL,
    discount_at_purchase DECIMAL(5,2) DEFAULT 0.00,
    total_price DECIMAL(12,2) NOT NULL,
    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
    FOREIGN KEY (seller_product_id)
        REFERENCES seller_products(seller_product_id),
    CHECK (quantity > 0),
    CHECK (price_at_purchase >= 0),
    CHECK (discount_at_purchase >= 0
           AND discount_at_purchase <= 100),
    CHECK (total_price >= 0)
);
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL UNIQUE,
    payment_method ENUM(
        'UPI',
        'Credit Card',
        'Debit Card',
        'Net Banking',
        'Cash on Delivery',
        'Wallet'
    ) NOT NULL,
    payment_status ENUM(
        'Pending',
        'Successful',
        'Failed',
        'Refunded'
    ) DEFAULT 'Pending',
    transaction_id VARCHAR(100) UNIQUE,
    amount_paid DECIMAL(12,2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
    CHECK (amount_paid >= 0)
);
CREATE TABLE shipments (
    shipment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL UNIQUE,
    courier_name VARCHAR(100) NOT NULL,
    tracking_number VARCHAR(100) UNIQUE NOT NULL,
    shipment_status ENUM(
        'Pending',
        'Packed',
        'Shipped',
        'Out for Delivery',
        'Delivered',
        'Returned'
    ) DEFAULT 'Pending',
    shipped_date TIMESTAMP NULL,
    expected_delivery_date DATE,
    delivered_date TIMESTAMP NULL,
    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);
CREATE TABLE returns (
    return_id INT AUTO_INCREMENT PRIMARY KEY,
    order_item_id INT NOT NULL,
    return_reason ENUM(
        'Damaged',
        'Wrong Product',
        'Defective',
        'No Longer Needed',
        'Other'
    ) NOT NULL,
    return_status ENUM(
        'Requested',
        'Approved',
        'Rejected',
        'Picked Up',
        'Refunded'
    ) DEFAULT 'Requested',
    return_request_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    refund_amount DECIMAL(12,2) NOT NULL,
    FOREIGN KEY (order_item_id)
        REFERENCES order_items(order_item_id),
    CHECK (refund_amount >= 0)
);
CREATE TABLE reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_item_id INT NOT NULL UNIQUE,
    rating INT NOT NULL,
    review_title VARCHAR(150),
    review_text TEXT,
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),
    FOREIGN KEY (order_item_id)
        REFERENCES order_items(order_item_id),
    CHECK (rating >= 1 AND rating <= 5)
);
CREATE TABLE coupons (
    coupon_id INT AUTO_INCREMENT PRIMARY KEY,
    coupon_code VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(255),
    discount_type ENUM(
        'Percentage',
        'Fixed Amount'
    ) NOT NULL,
    discount_value DECIMAL(10,2) NOT NULL,
    minimum_order_amount DECIMAL(10,2) DEFAULT 0,
    maximum_discount DECIMAL(10,2),
    start_date DATE NOT NULL,
    expiry_date DATE NOT NULL,
    usage_limit INT DEFAULT 1,
    coupon_status ENUM(
        'Active',
        'Inactive',
        'Expired'
    ) DEFAULT 'Active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CHECK (discount_value >= 0),
    CHECK (minimum_order_amount >= 0),
    CHECK (maximum_discount >= 0),
    CHECK (usage_limit > 0)
);
CREATE TABLE login_history (
    login_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    login_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    logout_time TIMESTAMP NULL,
    ip_address VARCHAR(45),
    device_type ENUM(
        'Mobile',
        'Laptop',
        'Desktop',
        'Tablet'
    ),
    browser VARCHAR(100),
    login_status ENUM(
        'Successful',
        'Failed'
    ) DEFAULT 'Successful',
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);
CREATE TABLE price_history (
    price_history_id INT AUTO_INCREMENT PRIMARY KEY,
    seller_product_id INT NOT NULL,
    old_price DECIMAL(10,2) NOT NULL,
    new_price DECIMAL(10,2) NOT NULL,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (seller_product_id)
        REFERENCES seller_products(seller_product_id),
    CHECK (old_price >= 0),
    CHECK (new_price >= 0)
);
select * from customers;