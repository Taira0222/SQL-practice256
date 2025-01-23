/*
あるカフェの注文状況を記録している注文履歴テーブルがあります。
このテーブルについて、次のデータを取得するSQL文を作成してください

| 列名     | データ型    | 備考                                 | 
| -------- | ----------- | ------------------------------------ | 
| 日付     | DATE        |                                      | 
| 注文番号 | INTEGER     | 注文順に振られた連番(主キー)         | 
| 注文枝番 | INTEGER     | 注文ごとの明細番号(主キー)           | 
| 商品名   | VARCHAR(50) |                                      | 
| 分類     | CHAR(1)     | 1:ドリンク　2:フード　3:その他　     | 
| サイズ   | CHAR(1)     | S,M,L(ドリンクのみ)、X(ドリンク以外) | 
| 単価     | INTEGER     |                                      | 
| 数量     | INTEGER     |                                      | 
| 注文金額 | INTEGER     |                                      | 

*/

-- 1 注文順かつその明細順に、すべての注文データを取得する
SELECT *
FROM 注文履歴
ORDER BY 注文番号, 注文枝番;


-- 2 2024年1月に注文のあった商品名の一覧を商品名順に取得する
SELECT DISTINCT 商品名
FROM 注文履歴
WHERE 日付 BETWEEN '2024-01-01' AND '2024-01-31'
ORDER BY 商品名;

-- 3 ドリンクの商品について、注文番号、注文枝番、注文金額を取得する。ただし、注文金額の低い方から2～4番目に該当する注文だけを対象とする
SELECT 注文番号, 注文枝番, 注文金額
FROM 注文履歴
WHERE 分類 = '1'
ORDER BY 注文金額
OFFSET 1 ROWS
 FETCH NEXT 3 ROWS ONLY;


-- 4 その他の商品について、2つ以上同時に購入された商品を取得し、日付、商品名、単価、数量、注文金額を購入日順に表示する。ただし、同日に売り上げたものは、数量の多い順に表示する
SELECT 日付, 商品名, 単価, 数量
FROM 注文履歴
WHERE 分類 = 3 AND 数量 >= 2
ORDER BY 購入日, 数量 DESC;

-- ANSWER 分類がCHARのため数字だけど文字列として扱う必要あり
SELECT 日付,商品名,単価,数量,注文金額
FROM 注文履歴
WHERE 分類 = '3' AND 数量 >= 2
ORDER BY 日付, 数量 DESC;

-- 5 商品の分類ごとに、分類、商品名、サイズ、単価を1つの表として取得する。また、サイズはドリンクの商品についてのみ表示し、分類と商品名順に並べること。

-- ドリンク
SELECT 分類,商品名,サイズ,単価
FROM 注文履歴
WHERE 分類 = '1'
UNION

-- フード
SELECT 分類,商品名,NULL,単価
FROM 注文履歴
WHERE 分類 = '2'
UNION
-- その他
SELECT 分類,商品名,NULL,単価
FROM 注文履歴
WHERE 分類 = '3'
ORDER BY 分類, 商品名;