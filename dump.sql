CREATE TABLE menu_items (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    is_available BOOLEAN NOT NULL,
    category VARCHAR(255) NOT NULL,
    image VARCHAR(255)
);

ALTER TABLE menu_items ADD COLUMN ts tsvector
    GENERATED ALWAYS AS (to_tsvector('english', name || description)) STORED;

CREATE INDEX ts_idx ON menu_items USING GIN (ts);

-- Create a new table to store tags
CREATE TABLE tags (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

-- Create a new table to store the many-to-many relationship between menu items and tags
CREATE TABLE menu_items_tags (
    menu_item_id INTEGER REFERENCES menu_items(id),
    tag_id INTEGER REFERENCES tags(id),
    PRIMARY KEY (menu_item_id, tag_id)
);
INSERT INTO menu_items (name, description, price, is_available, category, image) VALUES 
('Ergonomic Granite Ball', 'Incidunt necessitatibus numquam dolore repudiandae non omnis.', 182, true, 'Electronics', 'https://loremflickr.com/300/300/food'),
('Modern Frozen Tuna', 'Neque velit quaerat adipisci odit.', 334, true, 'Automotive', 'https://loremflickr.com/300/300/food'),
('Luxurious Frozen Salad', 'Ut quaerat in.', 984, false, 'Shoes', 'https://loremflickr.com/300/300/food'),
('Awesome Fresh Computer', 'Et fuga distinctio cupiditate ratione assumenda.', 695, false, 'Movies', 'https://loremflickr.com/300/300/food'),
('Unbranded Plastic Shoes', 'Vel quidem officia rerum voluptatem ea.', 815, true, 'Sports', 'https://loremflickr.com/300/300/food'),
('Ergonomic Bronze Bike', 'Repellat commodi iure consectetur id id a.', 443, true, 'Books', 'https://loremflickr.com/300/300/food'),
('Refined Fresh Bacon', 'Ratione autem ipsam quisquam esse incidunt dolorem.', 251, false, 'Outdoors', 'https://loremflickr.com/300/300/food'),
('Refined Plastic Pizza', 'Soluta assumenda pariatur corrupti nobis facere facere perspiciatis.', 349, true, 'Health', 'https://loremflickr.com/300/300/food'),
('Incredible Granite Fish', 'Sapiente quasi ratione distinctio nulla minima sint.', 613, true, 'Movies', 'https://loremflickr.com/300/300/food'),
('Awesome Cotton Soap', 'A tempore autem tempora aliquid voluptas numquam nostrum ratione.', 974, true, 'Music', 'https://loremflickr.com/300/300/food'),
('Handmade Wooden Salad', 'Enim aut reiciendis assumenda.', 462, false, 'Home', 'https://loremflickr.com/300/300/food'),
('Intelligent Bronze Bike', 'Fugiat doloremque quisquam recusandae quod porro officiis voluptates amet.', 977, true, 'Automotive', 'https://loremflickr.com/300/300/food'),
('Licensed Concrete Bike', 'Occaecati culpa esse molestiae id dicta eligendi.', 650, true, 'Toys', 'https://loremflickr.com/300/300/food'),
('Modern Concrete Pizza', 'Ipsam quaerat ipsum deserunt facere hic voluptas provident sint.', 112, false, 'Home', 'https://loremflickr.com/300/300/food'),
('Practical Bronze Shoes', 'Nisi architecto blanditiis fugit iure perferendis consequatur consectetur sunt.', 957, false, 'Garden', 'https://loremflickr.com/300/300/food'),
('Licensed Fresh Bacon', 'Quasi blanditiis optio alias cupiditate.', 840, true, 'Grocery', 'https://loremflickr.com/300/300/food'),
('Intelligent Granite Bacon', 'Dignissimos pariatur suscipit dolor atque voluptas.', 352, false, 'Movies', 'https://loremflickr.com/300/300/food'),
('Electronic Cotton Keyboard', 'Quaerat laboriosam repellendus doloremque tempore consectetur aliquam quibusdam eum officia.', 365, false, 'Movies', 'https://loremflickr.com/300/300/food'),
('Handcrafted Bronze Ball', 'Quae unde quaerat.', 522, false, 'Beauty', 'https://loremflickr.com/300/300/food'),
('Oriental Rubber Mouse', 'Ipsa reprehenderit facere rerum consequatur quam adipisci laudantium corporis.', 438, true, 'Clothing', 'https://loremflickr.com/300/300/food');
INSERT INTO tags (name) VALUES ('reflecting') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Ergonomic Granite Ball'), (SELECT id FROM tags WHERE name = 'reflecting'));
INSERT INTO tags (name) VALUES ('crazy') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Ergonomic Granite Ball'), (SELECT id FROM tags WHERE name = 'crazy'));
INSERT INTO tags (name) VALUES ('incomparable') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Ergonomic Granite Ball'), (SELECT id FROM tags WHERE name = 'incomparable'));
INSERT INTO tags (name) VALUES ('muffled') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Ergonomic Granite Ball'), (SELECT id FROM tags WHERE name = 'muffled'));
INSERT INTO tags (name) VALUES ('spectacular') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Ergonomic Granite Ball'), (SELECT id FROM tags WHERE name = 'spectacular'));
INSERT INTO tags (name) VALUES ('powerful') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Ergonomic Granite Ball'), (SELECT id FROM tags WHERE name = 'powerful'));
INSERT INTO tags (name) VALUES ('rich') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Ergonomic Granite Ball'), (SELECT id FROM tags WHERE name = 'rich'));
INSERT INTO tags (name) VALUES ('youthful') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Ergonomic Granite Ball'), (SELECT id FROM tags WHERE name = 'youthful'));
INSERT INTO tags (name) VALUES ('faraway') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Ergonomic Granite Ball'), (SELECT id FROM tags WHERE name = 'faraway'));
INSERT INTO tags (name) VALUES ('multicolored') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Modern Frozen Tuna'), (SELECT id FROM tags WHERE name = 'multicolored'));
INSERT INTO tags (name) VALUES ('glorious') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Modern Frozen Tuna'), (SELECT id FROM tags WHERE name = 'glorious'));
INSERT INTO tags (name) VALUES ('coarse') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Modern Frozen Tuna'), (SELECT id FROM tags WHERE name = 'coarse'));
INSERT INTO tags (name) VALUES ('ruddy') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Modern Frozen Tuna'), (SELECT id FROM tags WHERE name = 'ruddy'));
INSERT INTO tags (name) VALUES ('muted') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Modern Frozen Tuna'), (SELECT id FROM tags WHERE name = 'muted'));
INSERT INTO tags (name) VALUES ('spotless') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Luxurious Frozen Salad'), (SELECT id FROM tags WHERE name = 'spotless'));
INSERT INTO tags (name) VALUES ('hearty') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Luxurious Frozen Salad'), (SELECT id FROM tags WHERE name = 'hearty'));
INSERT INTO tags (name) VALUES ('yawning') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Luxurious Frozen Salad'), (SELECT id FROM tags WHERE name = 'yawning'));
INSERT INTO tags (name) VALUES ('thorny') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Luxurious Frozen Salad'), (SELECT id FROM tags WHERE name = 'thorny'));
INSERT INTO tags (name) VALUES ('scornful') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Luxurious Frozen Salad'), (SELECT id FROM tags WHERE name = 'scornful'));
INSERT INTO tags (name) VALUES ('lighthearted') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Luxurious Frozen Salad'), (SELECT id FROM tags WHERE name = 'lighthearted'));
INSERT INTO tags (name) VALUES ('lonely') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Luxurious Frozen Salad'), (SELECT id FROM tags WHERE name = 'lonely'));
INSERT INTO tags (name) VALUES ('neglected') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Luxurious Frozen Salad'), (SELECT id FROM tags WHERE name = 'neglected'));
INSERT INTO tags (name) VALUES ('impressionable') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Awesome Fresh Computer'), (SELECT id FROM tags WHERE name = 'impressionable'));
INSERT INTO tags (name) VALUES ('spirited') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Unbranded Plastic Shoes'), (SELECT id FROM tags WHERE name = 'spirited'));
INSERT INTO tags (name) VALUES ('scratchy') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Unbranded Plastic Shoes'), (SELECT id FROM tags WHERE name = 'scratchy'));
INSERT INTO tags (name) VALUES ('favorable') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Unbranded Plastic Shoes'), (SELECT id FROM tags WHERE name = 'favorable'));
INSERT INTO tags (name) VALUES ('polite') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Unbranded Plastic Shoes'), (SELECT id FROM tags WHERE name = 'polite'));
INSERT INTO tags (name) VALUES ('husky') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Unbranded Plastic Shoes'), (SELECT id FROM tags WHERE name = 'husky'));
INSERT INTO tags (name) VALUES ('bewitched') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Ergonomic Bronze Bike'), (SELECT id FROM tags WHERE name = 'bewitched'));
INSERT INTO tags (name) VALUES ('sour') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Ergonomic Bronze Bike'), (SELECT id FROM tags WHERE name = 'sour'));
INSERT INTO tags (name) VALUES ('sympathetic') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Ergonomic Bronze Bike'), (SELECT id FROM tags WHERE name = 'sympathetic'));
INSERT INTO tags (name) VALUES ('proud') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Refined Fresh Bacon'), (SELECT id FROM tags WHERE name = 'proud'));
INSERT INTO tags (name) VALUES ('easy-going') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Refined Fresh Bacon'), (SELECT id FROM tags WHERE name = 'easy-going'));
INSERT INTO tags (name) VALUES ('everlasting') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Refined Fresh Bacon'), (SELECT id FROM tags WHERE name = 'everlasting'));
INSERT INTO tags (name) VALUES ('glistening') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Refined Fresh Bacon'), (SELECT id FROM tags WHERE name = 'glistening'));
INSERT INTO tags (name) VALUES ('whopping') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Refined Fresh Bacon'), (SELECT id FROM tags WHERE name = 'whopping'));
INSERT INTO tags (name) VALUES ('dizzy') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Refined Fresh Bacon'), (SELECT id FROM tags WHERE name = 'dizzy'));
INSERT INTO tags (name) VALUES ('vague') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Refined Fresh Bacon'), (SELECT id FROM tags WHERE name = 'vague'));
INSERT INTO tags (name) VALUES ('impractical') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Refined Fresh Bacon'), (SELECT id FROM tags WHERE name = 'impractical'));
INSERT INTO tags (name) VALUES ('flippant') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Refined Fresh Bacon'), (SELECT id FROM tags WHERE name = 'flippant'));
INSERT INTO tags (name) VALUES ('sad') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Refined Plastic Pizza'), (SELECT id FROM tags WHERE name = 'sad'));
INSERT INTO tags (name) VALUES ('elated') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Refined Plastic Pizza'), (SELECT id FROM tags WHERE name = 'elated'));
INSERT INTO tags (name) VALUES ('misguided') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Refined Plastic Pizza'), (SELECT id FROM tags WHERE name = 'misguided'));
INSERT INTO tags (name) VALUES ('venerated') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Refined Plastic Pizza'), (SELECT id FROM tags WHERE name = 'venerated'));
INSERT INTO tags (name) VALUES ('proper') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Refined Plastic Pizza'), (SELECT id FROM tags WHERE name = 'proper'));
INSERT INTO tags (name) VALUES ('icy') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Refined Plastic Pizza'), (SELECT id FROM tags WHERE name = 'icy'));
INSERT INTO tags (name) VALUES ('utter') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Refined Plastic Pizza'), (SELECT id FROM tags WHERE name = 'utter'));
INSERT INTO tags (name) VALUES ('trivial') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Incredible Granite Fish'), (SELECT id FROM tags WHERE name = 'trivial'));
INSERT INTO tags (name) VALUES ('knowledgeable') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Incredible Granite Fish'), (SELECT id FROM tags WHERE name = 'knowledgeable'));
INSERT INTO tags (name) VALUES ('bogus') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Incredible Granite Fish'), (SELECT id FROM tags WHERE name = 'bogus'));
INSERT INTO tags (name) VALUES ('every') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Incredible Granite Fish'), (SELECT id FROM tags WHERE name = 'every'));
INSERT INTO tags (name) VALUES ('deadly') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Incredible Granite Fish'), (SELECT id FROM tags WHERE name = 'deadly'));
INSERT INTO tags (name) VALUES ('odd') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Incredible Granite Fish'), (SELECT id FROM tags WHERE name = 'odd'));
INSERT INTO tags (name) VALUES ('parched') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Incredible Granite Fish'), (SELECT id FROM tags WHERE name = 'parched'));
INSERT INTO tags (name) VALUES ('descriptive') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Incredible Granite Fish'), (SELECT id FROM tags WHERE name = 'descriptive'));
INSERT INTO tags (name) VALUES ('fearful') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Awesome Cotton Soap'), (SELECT id FROM tags WHERE name = 'fearful'));
INSERT INTO tags (name) VALUES ('juicy') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Awesome Cotton Soap'), (SELECT id FROM tags WHERE name = 'juicy'));
INSERT INTO tags (name) VALUES ('chilly') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Handmade Wooden Salad'), (SELECT id FROM tags WHERE name = 'chilly'));
INSERT INTO tags (name) VALUES ('bouncy') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Handmade Wooden Salad'), (SELECT id FROM tags WHERE name = 'bouncy'));
INSERT INTO tags (name) VALUES ('plastic') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Handmade Wooden Salad'), (SELECT id FROM tags WHERE name = 'plastic'));
INSERT INTO tags (name) VALUES ('growing') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Handmade Wooden Salad'), (SELECT id FROM tags WHERE name = 'growing'));
INSERT INTO tags (name) VALUES ('likely') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Handmade Wooden Salad'), (SELECT id FROM tags WHERE name = 'likely'));
INSERT INTO tags (name) VALUES ('legitimate') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Intelligent Bronze Bike'), (SELECT id FROM tags WHERE name = 'legitimate'));
INSERT INTO tags (name) VALUES ('hard') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Intelligent Bronze Bike'), (SELECT id FROM tags WHERE name = 'hard'));
INSERT INTO tags (name) VALUES ('overdue') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Intelligent Bronze Bike'), (SELECT id FROM tags WHERE name = 'overdue'));
INSERT INTO tags (name) VALUES ('each') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Intelligent Bronze Bike'), (SELECT id FROM tags WHERE name = 'each'));
INSERT INTO tags (name) VALUES ('stained') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Intelligent Bronze Bike'), (SELECT id FROM tags WHERE name = 'stained'));
INSERT INTO tags (name) VALUES ('slippery') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Intelligent Bronze Bike'), (SELECT id FROM tags WHERE name = 'slippery'));
INSERT INTO tags (name) VALUES ('angry') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Intelligent Bronze Bike'), (SELECT id FROM tags WHERE name = 'angry'));
INSERT INTO tags (name) VALUES ('united') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Intelligent Bronze Bike'), (SELECT id FROM tags WHERE name = 'united'));
INSERT INTO tags (name) VALUES ('awful') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Intelligent Bronze Bike'), (SELECT id FROM tags WHERE name = 'awful'));
INSERT INTO tags (name) VALUES ('forthright') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Licensed Concrete Bike'), (SELECT id FROM tags WHERE name = 'forthright'));
INSERT INTO tags (name) VALUES ('normal') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Licensed Concrete Bike'), (SELECT id FROM tags WHERE name = 'normal'));
INSERT INTO tags (name) VALUES ('dead') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Licensed Concrete Bike'), (SELECT id FROM tags WHERE name = 'dead'));
INSERT INTO tags (name) VALUES ('yellow') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Licensed Concrete Bike'), (SELECT id FROM tags WHERE name = 'yellow'));
INSERT INTO tags (name) VALUES ('disguised') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Licensed Concrete Bike'), (SELECT id FROM tags WHERE name = 'disguised'));
INSERT INTO tags (name) VALUES ('deadly') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Licensed Concrete Bike'), (SELECT id FROM tags WHERE name = 'deadly'));
INSERT INTO tags (name) VALUES ('puny') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Licensed Concrete Bike'), (SELECT id FROM tags WHERE name = 'puny'));
INSERT INTO tags (name) VALUES ('careful') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Licensed Concrete Bike'), (SELECT id FROM tags WHERE name = 'careful'));
INSERT INTO tags (name) VALUES ('attached') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Licensed Concrete Bike'), (SELECT id FROM tags WHERE name = 'attached'));
INSERT INTO tags (name) VALUES ('juvenile') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Modern Concrete Pizza'), (SELECT id FROM tags WHERE name = 'juvenile'));
INSERT INTO tags (name) VALUES ('tall') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Modern Concrete Pizza'), (SELECT id FROM tags WHERE name = 'tall'));
INSERT INTO tags (name) VALUES ('cheery') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Modern Concrete Pizza'), (SELECT id FROM tags WHERE name = 'cheery'));
INSERT INTO tags (name) VALUES ('fake') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Modern Concrete Pizza'), (SELECT id FROM tags WHERE name = 'fake'));
INSERT INTO tags (name) VALUES ('lanky') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Practical Bronze Shoes'), (SELECT id FROM tags WHERE name = 'lanky'));
INSERT INTO tags (name) VALUES ('big-hearted') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Practical Bronze Shoes'), (SELECT id FROM tags WHERE name = 'big-hearted'));
INSERT INTO tags (name) VALUES ('flickering') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Practical Bronze Shoes'), (SELECT id FROM tags WHERE name = 'flickering'));
INSERT INTO tags (name) VALUES ('improbable') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Practical Bronze Shoes'), (SELECT id FROM tags WHERE name = 'improbable'));
INSERT INTO tags (name) VALUES ('fearful') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Practical Bronze Shoes'), (SELECT id FROM tags WHERE name = 'fearful'));
INSERT INTO tags (name) VALUES ('cheerful') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Practical Bronze Shoes'), (SELECT id FROM tags WHERE name = 'cheerful'));
INSERT INTO tags (name) VALUES ('wide-eyed') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Practical Bronze Shoes'), (SELECT id FROM tags WHERE name = 'wide-eyed'));
INSERT INTO tags (name) VALUES ('nice') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Practical Bronze Shoes'), (SELECT id FROM tags WHERE name = 'nice'));
INSERT INTO tags (name) VALUES ('thrifty') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Licensed Fresh Bacon'), (SELECT id FROM tags WHERE name = 'thrifty'));
INSERT INTO tags (name) VALUES ('secondary') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Licensed Fresh Bacon'), (SELECT id FROM tags WHERE name = 'secondary'));
INSERT INTO tags (name) VALUES ('occasional') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Intelligent Granite Bacon'), (SELECT id FROM tags WHERE name = 'occasional'));
INSERT INTO tags (name) VALUES ('scarce') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Intelligent Granite Bacon'), (SELECT id FROM tags WHERE name = 'scarce'));
INSERT INTO tags (name) VALUES ('avaricious') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Intelligent Granite Bacon'), (SELECT id FROM tags WHERE name = 'avaricious'));
INSERT INTO tags (name) VALUES ('ultimate') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Intelligent Granite Bacon'), (SELECT id FROM tags WHERE name = 'ultimate'));
INSERT INTO tags (name) VALUES ('weak') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Intelligent Granite Bacon'), (SELECT id FROM tags WHERE name = 'weak'));
INSERT INTO tags (name) VALUES ('creepy') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Intelligent Granite Bacon'), (SELECT id FROM tags WHERE name = 'creepy'));
INSERT INTO tags (name) VALUES ('euphoric') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Electronic Cotton Keyboard'), (SELECT id FROM tags WHERE name = 'euphoric'));
INSERT INTO tags (name) VALUES ('anxious') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Electronic Cotton Keyboard'), (SELECT id FROM tags WHERE name = 'anxious'));
INSERT INTO tags (name) VALUES ('expensive') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Electronic Cotton Keyboard'), (SELECT id FROM tags WHERE name = 'expensive'));
INSERT INTO tags (name) VALUES ('poor') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Electronic Cotton Keyboard'), (SELECT id FROM tags WHERE name = 'poor'));
INSERT INTO tags (name) VALUES ('stingy') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Electronic Cotton Keyboard'), (SELECT id FROM tags WHERE name = 'stingy'));
INSERT INTO tags (name) VALUES ('frightening') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Electronic Cotton Keyboard'), (SELECT id FROM tags WHERE name = 'frightening'));
INSERT INTO tags (name) VALUES ('growling') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Handcrafted Bronze Ball'), (SELECT id FROM tags WHERE name = 'growling'));
INSERT INTO tags (name) VALUES ('insecure') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Handcrafted Bronze Ball'), (SELECT id FROM tags WHERE name = 'insecure'));
INSERT INTO tags (name) VALUES ('pleased') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Handcrafted Bronze Ball'), (SELECT id FROM tags WHERE name = 'pleased'));
INSERT INTO tags (name) VALUES ('straight') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Oriental Rubber Mouse'), (SELECT id FROM tags WHERE name = 'straight'));
INSERT INTO tags (name) VALUES ('puzzling') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Oriental Rubber Mouse'), (SELECT id FROM tags WHERE name = 'puzzling'));