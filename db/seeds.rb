# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
Customer.create(email: 'hoge@example.com', first_name: '山田', last_name: '花子', first_name_kana: 'ヤマダ', last_name_kana: 'ハナコ', postal_code:'1500041', address: '東京都渋谷区神南町１丁目１９ー１１パークスクエア２４', phone_number: '0368694700', customer_status: '有効', deleted_at: '', password: 'password', encrypted_password: 'password')
Customer.create(email: 'bbb@test.jp', first_name: '松尾', last_name: '毅雄', first_name_kana: 'マツオ', last_name_kana: 'タカオ', postal_code:'2830035', address: '千葉県東金市粟生飛地1-6', phone_number: '0453453593', customer_status: '有効', deleted_at: '', password: 'password', encrypted_password: 'password')
Customer.create(email: 'ccc@test.jp', first_name: '越智', last_name: '穂乃香', first_name_kana: 'オチ', last_name_kana: 'ホノカ', postal_code:'2701442', address: '千葉県柏市染井入新田 2-20-17', phone_number: '0436127203', customer_status: '有効', deleted_at: '', password: 'password', encrypted_password: 'password')
Customer.create(email: 'ddd@test.jp', first_name: '宮下', last_name: '寧音', first_name_kana: 'ミヤシタ', last_name_kana: 'シズネ', postal_code:'6320032', address: '奈良県天理市杣之内町 2-16-7', phone_number: '0746556343', customer_status: '有効', deleted_at: '', password: 'password', encrypted_password: 'password')
Customer.create(email: 'eee@test.jp', first_name: '棚橋', last_name: '遥菜', first_name_kana: 'タナハシ', last_name_kana: 'ハルナ', postal_code:'8595102', address: '長崎県平戸市大久保町 3-7-18	レジデンス大久保町402', phone_number: '0950236846', customer_status: '退会済', deleted_at: '', password: 'password', encrypted_password: 'password')

Genre.create(genre_name: 'man', genre_status: 0 )
Genre.create(genre_name: 'cake', genre_status: 0 )

Product.create(product_name: '劇団ひとり', genre_id: 1, explanation: 'かわしましょうごです。', nontax: 1000, sales_status: 0 )
Product.create(product_name: 'smile', genre_id: 2, explanation: 'チョコケーキです。', nontax: 500, sales_status: 0 )

