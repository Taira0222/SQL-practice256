/*
ある都市の1年間の毎月の気象データを記録した気象観測テーブルがあります。
このテーブルについて、次にあげるテーブルを取得するSQL文を作成してください

気象観測テーブルの定義
| 列名     | データ型 | 備考                       | 
| -------- | -------- | -------------------------- | 
| 月       | INTEGER  | 1～12のいずれかの値        | 
| 降水量   | INTEGER  | 観測データがない場合はNULL | 
| 最高気温 | INTEGER  | 観測データがない場合はNULL | 
| 最低気温 | INTEGER  | 観測データがない場合はNULL | 
| 湿度     | INTEGER  | 観測データがない場合はNULL | 

*/

-- 1 6月のデータ
SELECT *
FROM 気象観測
WHERE 月 = 6;

-- 2 6月以外のデータ
SELECT *
FROM 気象観測
WHERE 月 <> 6;

-- 3 降水量が100未満のデータ
SELECT *
FROM 気象観測
WHERE 降水量 < 100;

-- 4 降水量が200より多いデータ
SELECT *
FROM 気象観測
WHERE 降水量 > 200;

-- 5 最高気温が30以上のデータ
SELECT *
FROM 気象観測
WHERE 最高気温 >= 30;

-- 6 最低気温が0以下のデータ
SELECT *
FROM 気象観測
WHERE 最低気温 <= 0;

-- 7 3月、5月、7月のデータ
SELECT *
FROM 気象観測
WHERE 月 in(3,5,7);

-- 8 3月、5月、7月以外のデータ
SELECT *
FROM 気象観測
WHERE 月 NOT in(3,5,7);

-- 9 降水量が100以下で、湿度が50より低いデータ
SELECT *
FROM 気象観測
WHERE 降水量 <= 100 AND 湿度 < 50;

-- 10 最低気温が5未満か、最高気温が35より高いデータ
SELECT *
FROM 気象観測
WHERE 最低気温 < 5 OR 最高気温 > 35;

-- 11 湿度が60～79の範囲にあるデータ
SELECT *
FROM 気象観測
WHERE 湿度 BETWEEN 60 AND 79;

-- 12 観測データのない例つのある月のデータ
SELECT *
FROM 気象観測
WHERE 降水量 IS NULL OR
 最高気温 IS NULL OR 
 最低気温 IS NULL OR
 湿度 IS NULL ;


-- 全問正解