/*問題2-3の都道府県テーブルについて、次のような3つのデータを追加する SQL
文をそれぞれ作成してください。ただし、コード37のデータの追加では、SQL文中に列名を指定しない方法を採ってください。なお、表中で空欄となっている部分の値は指定しません。*/

-- 1
INSERT INTO 都道府県('コード','地域','都道府県名','面積')
 VALUES(26,'近畿','京都','4613');

--2 
INSERT INTO 都道府県
 VALUES(37,'四国','香川','高松','1876');

--3
INSERT INTO 都道府県('コード','都道府県名','県庁所在地')
 VALUES(40,'福岡','福岡');


-- 全問正解